Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4C3581BB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:28:21 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSpg-0003jn-7o
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUSoo-0003JZ-Su
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUSom-0001pO-5t
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617881243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTSbadPx+wfP7E6gZAs7P+DSY5WGq0chXgXICGSCSPQ=;
 b=SGD6wo7ynEisDjVH5LF3U8Q4mQ1LxmV+K29wizvLJNZTPWD4P3qnEgkMmWLWf0GUvNv01F
 T0H4yxHvZ5EAFXn/3O2CAs9Aw+izEXHLAxPK8+tvhJsjzCgEI1q+CMOcDX7omjUcLTfozv
 q+/bP/f7zBjbDxF1zzpcahagTbyBnJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-9LtzH-hdMU-5x2SADGGf4Q-1; Thu, 08 Apr 2021 07:27:20 -0400
X-MC-Unique: 9LtzH-hdMU-5x2SADGGf4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AE6A1095348;
 Thu,  8 Apr 2021 11:27:05 +0000 (UTC)
Received: from work-vm (ovpn-115-38.ams2.redhat.com [10.36.115.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1715D5D9CC;
 Thu,  8 Apr 2021 11:27:03 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:27:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yuchen <yu.chen@h3c.com>, pbonzini@redhat.com, mst@redhat.com
Subject: Re: [Qemu-devel][bug] qemu crash when migrate vm and vm's disks
Message-ID: <YG7ohYazszYMnb7k@work-vm>
References: <9cd6ccabceff42f9afbaed917f77c9b2@h3c.com>
MIME-Version: 1.0
In-Reply-To: <9cd6ccabceff42f9afbaed917f77c9b2@h3c.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yuchen (yu.chen@h3c.com) wrote:
> When migrate vm and vm’s disks target host qemu crash due to an invalid free.
> 
> #0  object_unref (obj=0x1000) at /qemu-2.12/rpmbuild/BUILD/qemu-2.12/qom/object.c:920
> #1  0x0000560434d79e79 in memory_region_unref (mr=<optimized out>)
>     at /qemu-2.12/rpmbuild/BUILD/qemu-2.12/memory.c:1730
> #2  flatview_destroy (view=0x560439653880) at /qemu-2.12/rpmbuild/BUILD/qemu-2.12/memory.c:292
> #3  0x000056043514dfbe in call_rcu_thread (opaque=<optimized out>)
>     at /qemu-2.12/rpmbuild/BUILD/qemu-2.12/util/rcu.c:284
> #4  0x00007fbc2b36fe25 in start_thread () from /lib64/libpthread.so.0
> #5  0x00007fbc2b099bad in clone () from /lib64/libc.so.6
> 
> test base qemu-2.12.0，but use lastest qemu(v6.0.0-rc2) also reproduce.

Interesting.

> As follow patch can resolve this problem:
> https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg02272.html

That's a pci/rcu change; ccing Paolo and Micahel.

> Steps to reproduce:
> (1) Create VM (virsh define)
> (2) Add 64 virtio scsi disks

Is that hot adding the disks later, or are they included in the VM at
creation?
Can you provide a libvirt XML example?

> (3) migrate vm and vm’disks

What do you mean by 'and vm disks' - are you doing a block migration?

Dave

> -------------------------------------------------------------------------------------------------------------------------------------
> 本邮件及其附件含有新华三集团的保密信息，仅限于发送给上面地址中列出
> 的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、
> 或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本
> 邮件！
> This e-mail and its attachments contain confidential information from New H3C, which is
> intended only for the person or entity whose address is listed above. Any use of the
> information contained herein in any way (including, but not limited to, total or partial
> disclosure, reproduction, or dissemination) by persons other than the intended
> recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender
> by phone or email immediately and delete it!
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


