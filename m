Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DC340A33
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:28:52 +0100 (CET)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvVz-0000rf-Af
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMvBs-0004ly-K1
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMvBn-0004C1-8b
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ornCyuusPGweq02Ev3UcilLrZWKIs1KSGDSE4gu6QiQ=;
 b=SQBM6Y9gN14pC2DhYMTXjyohvXKqsIbnkdNLDHtq6e7LZNLeUmhXPiTesBdqZc9EG5x9Wv
 NrFTL8Ee5kchDROdqaCCLzGJ+ZHBRMkjD64/05XgGNbCmqVou/67Ao1C6joKZILHRxFdx5
 PBPz0/Xt2XSz2BmLh0MuNMzO04vkrpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-SUyG6-fbNka_F9r4LF2XpQ-1; Thu, 18 Mar 2021 12:07:56 -0400
X-MC-Unique: SUyG6-fbNka_F9r4LF2XpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABFA2107B785;
 Thu, 18 Mar 2021 16:07:54 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-176.ams2.redhat.com
 [10.36.115.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F0CE19D9F;
 Thu, 18 Mar 2021 16:07:52 +0000 (UTC)
Subject: Re: KVM_MEM_READONLY slot flag not working properly
To: Lorenzo Susini <susinilorenzo1@gmail.com>, qemu-devel@nongnu.org
References: <CAHFRQs1GuB+8tw+SDK11LOLXF4H6z+6+ZbQMTABXNK3gj7vffA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f05ce059-0802-404f-e2df-f8a7ddfc43c5@redhat.com>
Date: Thu, 18 Mar 2021 17:07:52 +0100
MIME-Version: 1.0
In-Reply-To: <CAHFRQs1GuB+8tw+SDK11LOLXF4H6z+6+ZbQMTABXNK3gj7vffA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/18/21 12:28, Lorenzo Susini wrote:
> Hello,
> 
> Have some of you successfully used the KVM_MEM_READONLY slot flag?

I think the operation of the pflash device is based on that, yes.

One related commit is 235e8982ad39 ("kvm: support using KVM_MEM_READONLY
flag for regions", 2013-05-29).

So in pflash, there are memory_region_rom_device_set_romd() calls.

When the argument is false (readonly=false, rom_device=true,
*romd_mode=false*), the KVM memory slot is removed completely
(kvm_set_phys_mem()), and all accesses trap to QEMU (work as MMIO).

When the argument is true (readonly=false, rom_device=true,
*romd_mode=true*), a read-only memory slot is used, read/exec doesn't
trap, writes do (kvm_mem_flags(), memory_region_is_romd()).

I've copied Paolo, Vitaly, Peter and Phil.

Thanks
Laszlo

> 
> I'm working on a project and I'm trying to protect the guest's IDT by using
> KVM, modifying kvm-all.c.
> I'm able to correctly locate the IDT in the host by reading IDTR with
> KVM_GET_SREGS,
> translating it with KVM_TRANSLATE and, by using the KVMSlot struct, I'm
> able to find the corresponding
> host virtual address. I've double checked the addresses with the Qemu
> Monitor (gpa2hva and gva2gpa) and they
> are correct.
> 
> Then, I decided to split the slot where the IDT currently lives into three
> separate ones, setting the IDT in its own private slot and making it
> read-only with KVM_MEM_READONLY:
> 
> INITIAL SLOT ===> PRE IDT SLOT |  IDT SLOT (KVM_MEM_READONLY)  |  POST IDT
> SLOT.
> 
> By doing this, the VM continues its execution normally. Also, I'm not
> moving memory in the host when
> reassigning slots, so I'm just changing the sizes and the addresses when
> doing kvm_set_userspace_memory_region,
> there's no need to move data anywhere else in my opinion, and this is
> confirmed by the fact that VM, after doing so, behaves normally.
> 
> However, when I try to register a new interrupt handler (for instance for
> the edu device, just to try it out), it works perfectly,
> meaning that the IDT is not really read-only. Do you have any idea why? Any
> suggestions on how to solve the problem?
> Of course I've also checked KVM_CAP_READONLY_MEM, no problem with that.
> 
> Anyway, is this the right place to post?
> 
> Thank you,
> Lorenzo
> 


