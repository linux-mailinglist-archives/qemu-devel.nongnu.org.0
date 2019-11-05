Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB109EFA8C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 11:12:02 +0100 (CET)
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRvof-0000ja-Hs
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 05:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1iRvnv-0000Gh-Id
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 05:11:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1iRvnu-00082Q-FI
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 05:11:15 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:2057)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1iRvnu-00080d-7I
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 05:11:14 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A639C45C23
 for <qemu-devel@nongnu.org>; Tue,  5 Nov 2019 11:02:46 +0100 (CET)
Date: Tue, 5 Nov 2019 11:02:44 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1767781109.66.1572948164492@webmail.proxmox.com>
Subject: backup_calculate_cluster_size does not consider source
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev15
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example: Backup from ceph disk (rbd_cache=false) to local disk:

backup_calculate_cluster_size returns 64K (correct for my local .raw image)

Then the backup job starts to read 64K blocks from ceph.

But ceph always reads 4M block, so this is incredibly slow and produces
way too much network traffic.

Why does backup_calculate_cluster_size does not consider the block size from
the source disk? 

cluster_size = MAX(block_size_source, block_size_target)


