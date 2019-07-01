Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162334008
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 09:24:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY3oP-00067e-Nq
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 03:24:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hY3ig-00027f-2Z
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hY3av-0000Kq-Gj
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:10:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:34984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hY3au-0008TL-FE
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:10:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2019 00:10:46 -0700
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.173])
	([10.239.196.173])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
	04 Jun 2019 00:10:45 -0700
To: "Michael S. Tsirkin (level 24/vhost) (qemu.patchwork.ozlabs)"
	<mst@redhat.com>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <449c062f-373c-b310-ccc6-f14c702c8f19@linux.intel.com>
Date: Tue, 4 Jun 2019 15:10:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [QUESTION] How to reduce network latency to improve
 netperf TCP_RR drastically?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael，

At https://www.linux-kvm.org/page/NetworkingTodo, there is an entry for 
network latency saying:

---
reduce networking latency:
  allow handling short packets from softirq or VCPU context
  Plan:
    We are going through the scheduler 3 times
    (could be up to 5 if softirqd is involved)
    Consider RX: host irq -> io thread -> VCPU thread ->
    guest irq -> guest thread.
    This adds a lot of latency.
    We can cut it by some 1.5x if we do a bit of work
    either in the VCPU or softirq context.
  Testing: netperf TCP RR - should be improved drastically
           netperf TCP STREAM guest to host - no regression
  Contact: MST
---

I am trying to make some contributions to improving netperf TCP_RR.
Could you please share more ideas or plans or implemental details to 
make it happen?

Thanks,
Like Xu

