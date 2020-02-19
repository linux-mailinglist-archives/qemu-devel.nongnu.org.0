Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A0164708
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 15:33:28 +0100 (CET)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4QPn-0008Py-Or
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 09:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1j4QP7-0007yd-IP
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 09:32:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1j4QP6-00031R-D0
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 09:32:45 -0500
Received: from mail.ispras.ru ([83.149.199.45]:43012)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1j4QP6-0002th-5u
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 09:32:44 -0500
Received: from mail.ispras.ru (localhost [127.0.0.1])
 by mail.ispras.ru (Postfix) with ESMTPSA id 0A4EDC010D;
 Wed, 19 Feb 2020 17:32:40 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Feb 2020 17:32:40 +0300
From: dovgaluk <dovgaluk@ispras.ru>
To: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com
Subject: Race condition in overlayed qcow2?
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <2fb9fb4840d5aa92a716487f83ceb36c@ispras.ru>
X-Sender: dovgaluk@ispras.ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 83.149.199.45
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

I encountered a problem with record/replay of QEMU execution and figured 
out the following, when
QEMU is started with one virtual disk connected to the qcow2 image with 
applied 'snapshot' option.

The patch d710cf575ad5fb3ab329204620de45bfe50caa53 "block/qcow2: 
introduce parallel subrequest handling in read and write"
introduces some kind of race condition, which causes difference in the 
data read from the disk.

I detected this by adding the following code, which logs IO operation 
checksum. And this checksum may be different in different runs of the 
same recorded execution.

logging in blk_aio_complete function:
         qemu_log("%"PRId64": blk_aio_complete\n", 
replay_get_current_icount());
         QEMUIOVector *qiov = acb->rwco.iobuf;
         if (qiov && qiov->iov) {
             size_t i, j;
             uint64_t sum = 0;
             int count = 0;
             for (i = 0 ; i < qiov->niov ; ++i) {
                 for (j = 0 ; j < qiov->iov[i].iov_len ; ++j) {
                     sum += ((uint8_t*)qiov->iov[i].iov_base)[j];
                     ++count;
                 }
             }
             qemu_log("--- iobuf offset %"PRIx64" len %x sum: 
%"PRIx64"\n", acb->rwco.offset, count, sum);
         }

I tried to get rid of aio task by patching qcow2_co_preadv_part:
ret = qcow2_co_preadv_task(bs, ret, cluster_offset, offset, cur_bytes, 
qiov, qiov_offset);

That change fixed a bug, but I have no idea what to debug next to figure 
out the exact reason of the failure.

Do you have any ideas or hints?

Pavel Dovgalyuk

