Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95A57D068
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:56:44 +0200 (CEST)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYXb-00015z-A4
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oEYUE-00050J-5v
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oEYU6-0005zc-Hf
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658418781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9Gr/xLPA3UpCIhasuYlmf5Lpml6E3tDbA9cQ5VBFXI=;
 b=NVub+OFeI2eg/b5Y8DovJg0b4+BXWhdqhW0jAxn7nxlwTelgmbml1Qpp9A2GdR1IcOP8nV
 2RVcuSiDqRGHJniE6G2H8T+KotnU+7ms4PIaKx7MLVxBsl14/Umjd2yVNlkoXnMcstIghT
 1ot1kJ/J1k05yFAWlhWFadol2pAtvWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-euG-bPILNcWIUfTzfaw7CA-1; Thu, 21 Jul 2022 11:51:15 -0400
X-MC-Unique: euG-bPILNcWIUfTzfaw7CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A235E811E7A;
 Thu, 21 Jul 2022 15:51:13 +0000 (UTC)
Received: from starship (unknown [10.40.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D4612166B29;
 Thu, 21 Jul 2022 15:51:11 +0000 (UTC)
Message-ID: <8ac992205e740722160f770821a49278bfa12b0a.camel@redhat.com>
Subject: Re: Guest reboot issues since QEMU 6.0 and Linux 5.11
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>, kvm@vger.kernel.org, 
 qemu-devel@nongnu.org
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>, Mira Limbeck
 <m.limbeck@proxmox.com>
Date: Thu, 21 Jul 2022 18:51:10 +0300
In-Reply-To: <eb0e0c7e-5b6f-a573-43f6-bd58be243d6b@proxmox.com>
References: <eb0e0c7e-5b6f-a573-43f6-bd58be243d6b@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Thu, 2022-07-21 at 14:49 +0200, Fabian Ebner wrote:
> Hi,
> since about half a year ago, we're getting user reports about guest
> reboot issues with KVM/QEMU[0].
> 
> The most common scenario is a Windows Server VM (2012R2/2016/2019,
> UEFI/OVMF and SeaBIOS) getting stuck during the screen with the Windows
> logo and the spinning circles after a reboot was triggered from within
> the guest. Quitting the kvm process and booting with a fresh instance
> works. The issue seems to become more likely, the longer the kvm
> instance runs.
> 
> We did not get such reports while we were providing Linux 5.4 and QEMU
> 5.2.0, but we do with Linux 5.11/5.13/5.15 and QEMU 6.x.
> 
> I'm just wondering if anybody has seen this issue before or might have a
> hunch what it's about? Any tips on what to look out for when debugging
> are also greatly appreciated!
> 
> We do have debug access to a user's test VM and the VM state was saved
> before a problematic reboot, but I can't modify the host system there.
> AFAICT QEMU just executes guest code as usual, but I'm really not sure
> what to look out for.
> 
> That VM has CPU type host, and a colleague did have a similar enough CPU
> to load the VM state, but for him, the reboot went through normally. On
> the user's system, it triggers consistently after loading the VM state
> and rebooting.
> 
> So unfortunately, we didn't manage to reproduce the issue locally yet.
> With two other images provided by users, we ran into a boot loop, where
> QEMU resets the CPUs and does a few KVM_RUNs before the exit reason is
> KVM_EXIT_SHUTDOWN (which to my understanding indicates a triple fa
> ult)
> and then it repeats. It's not clear if the issues are related.


Does the guest have HyperV enabled in it (that is nested virtualization?)

Intel or AMD?

Does the VM uses secure boot / SMM?

Best regards,
	Maxim Levitsky

> 
> There are also a few reports about non-Windows VMs, mostly Ubuntu 20.04
> with UEFI/OVMF, but again, it's not clear if the issues are related.
> 
> [0]: https://forum.proxmox.com/threads/100744/
> (the forum thread is a bit chaotic unfortunately).
> 
> Best Regards,
> Fabi
> 
> 



