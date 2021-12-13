Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D9472A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:35:32 +0100 (CET)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwig7-0001OP-2G
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:35:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwiea-0000jT-Tk
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwieW-0006t0-QT
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639391631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=axb9uJJLg4pbt1dLzmtSNI6rFThfOEHOIUlTTl0MZuY=;
 b=PZW20/eYWP3U3T5BH4vGkDmzfpcd3/Ma3sqA4X5Zj2Z732eOqMPdF4DcogxFMHXwjfyZoX
 oIE3uhK4l3gQ/Q5qL8suNIFG0pFGExDo0zX6JIBw+z0M4zfWvTZAdco8FJgnZi2nQdldXO
 OGSghEXXElUG4VBTXW66tzlqsUzBFcg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-L5IbZq7nPPyPMXbBGXOdKw-1; Mon, 13 Dec 2021 05:33:50 -0500
X-MC-Unique: L5IbZq7nPPyPMXbBGXOdKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso11369796wme.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=axb9uJJLg4pbt1dLzmtSNI6rFThfOEHOIUlTTl0MZuY=;
 b=dfL7VvbkzzxI3RXU7DbPkeuNsg5sbmNG/mNrOD3g7yIg/qKhzr5cCfdqscXxneOaqe
 2gL1V17cmkfjlYu2Z6f8bdB+FFacQlWx9kQmE8pHeAu8Ee/sbNtzDOTKBWg9pWz861v0
 DMdcAyKP1MrymQmoTIY3p5OIGHk0gWsOolct4956yeHwfRChQuotHpIBz7C9ZqqLfSab
 +7PfAmIDOV+k2OwVptVmN0cyUK8ZN4ZF7KpqMO5d3WkPOmkd8dolXsDeBy8/TXhVudNY
 9ZcDKCXLCaBKoExlqDiXqKqMbcnYcEdkizmVz3pKI5E3pRk1zAy13XtG+gkN/7S9R0lI
 MWKQ==
X-Gm-Message-State: AOAM530PLNL0WiaCx5xdJEykh/+bXp+45c0f3CgWvJNHR7y5k5HY8Fkr
 S+G+Sour6ptXuG4oU/2l5JFbHeo4pC8pZlqMukp9jziarkpKkBmnhnWYd14Sfn6UT9WcDNO3R8+
 vqtXYn/44uoNa174=
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr35649437wme.93.1639391628555; 
 Mon, 13 Dec 2021 02:33:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRrJ3s3YlpzYTcl+tfxL2PSLhq4aukL4ts44pj8EsnZQRFkWY/loAenJy/k5A/XAulTHg5QA==
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr35649409wme.93.1639391628287; 
 Mon, 13 Dec 2021 02:33:48 -0800 (PST)
Received: from redhat.com ([2.55.148.125])
 by smtp.gmail.com with ESMTPSA id f7sm12687884wri.74.2021.12.13.02.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 02:33:46 -0800 (PST)
Date: Mon, 13 Dec 2021 05:33:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Fwd: QEMU | READ memory access in /hw/acpi/pcihp.c (#770)
Message-ID: <20211213031626-mutt-send-email-mst@kernel.org>
References: <issue_98895819@gitlab.com>
 <37127769-a8d3-9d5f-5bfe-c0a0a8b9d3e2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <37127769-a8d3-9d5f-5bfe-c0a0a8b9d3e2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 08:43:55AM +0100, Thomas Huth wrote:
> 
>  Hi Michael, hi Igor,
> 
> just FYI, a crash has been reported in the ACPI code ...
> by the way, do you have a gitlab account, so you could be put on CC: for
> such bugs there, too?
> 
>  Regards,
>   Thomas
> 
> 
> -------- Forwarded Message --------
> Subject: 	QEMU | READ memory access in /hw/acpi/pcihp.c (#770)
> Date: 	Sun, 12 Dec 2021 15:03:50 +0000
> From: 	LucasLeeNDS (@LucasLeeNDS) <gitlab@mg.gitlab.com>
> Reply-To: 	QEMU / QEMU
> <incoming+b01bab3884ecadb087cf49724e7b33aa@incoming.gitlab.com>
> To: 	thuth@redhat.com
> 
> 
> 
> GitLab
> 
> LucasLeeNDS <https://gitlab.com/LucasLeeNDS> created an issue: #770
> <https://gitlab.com/qemu-project/qemu/-/issues/770>
> 
> Hello qemu team, An invalid pointer initialization issue was found in
> /hw/acpi/pcihp.c:470:9 of QEMU in versions 6.2.0-rc2.
> 
> *Reproducer*
> 
> |cat << EOF | ./qemu-system-i386 \ -M pc -nodefaults -netdev user,id=user0
> -device virtio-net,netdev=user0 \ -qtest stdio outl 0xcf8 0x80000b00 inw
> 0xcfc outl 0xcf8 0x80000b04 inw 0xcfc outl 0xcf8 0x80000b04 outw 0xcfc 0x7
> outl 0xcf8 0x80000b04 inw 0xcfc outl 0xcf8 0x80000000 inw 0xcfc outl 0xcf8
> 0x80000004 inw 0xcfc outl 0xcf8 0x80000004 outw 0xcfc 0x7 outl 0xcf8
> 0x80000004 inw 0xcfc outl 0xcf8 0x80000800 inw 0xcfc outl 0xcf8 0x80000804
> inw 0xcfc outl 0xcf8 0x80000804 outw 0xcfc 0x7 outl 0xcf8 0x80000804 inw
> 0xcfc outl 0xcf8 0x80000900 inw 0xcfc outl 0xcf8 0x80000920 outl 0xcfc
> 0xffffffff outl 0xcf8 0x80000920 inl 0xcfc outl 0xcf8 0x80000920 outl 0xcfc
> 0xc001 outl 0xcf8 0x80000904 inw 0xcfc outl 0xcf8 0x80000904 outw 0xcfc 0x7
> outl 0xcf8 0x80000904 inw 0xcfc outl 0xcf8 0x80001000 inw 0xcfc outl 0xcf8
> 0x80001010 outl 0xcfc 0xffffffff outl 0xcf8 0x80001010 inl 0xcfc outl 0xcf8
> 0x80001010 outl 0xcfc 0xc021 outl 0xcf8 0x80001014 outl 0xcfc 0xffffffff
> outl 0xcf8 0x80001014 inl 0xcfc outl 0xcf8 0x80001014 outl 0xcfc 0xe0000000
> outl 0xcf8 0x80001020 outl 0xcfc 0xffffffff outl 0xcf8 0x80001020 inl 0xcfc
> outl 0xcf8 0x80001020 outl 0xcfc 0xe0004000 outl 0xcf8 0x80001004 inw 0xcfc
> outl 0xcf8 0x80001004 outw 0xcfc 0x7 outl 0xcf8 0x80001004 inw 0xcfc
> clock_step outl 0xae10 0x15 outl 0xae10 0x585a5564 outl 0xae10 0x15 outl
> 0xcf8 0x80000b06 outl 0xcfc 0xdd58fb5a outl 0xae14 0x64296572 clock_step
> outl 0xae10 0x15 outl 0xae10 0x585a5564 outl 0xae10 0x15 outl 0xcf8
> 0x80000b06 outl 0xcfc 0xdd58fb5a outl 0xae14 0x64296572 EOF|
> 
> *Stack-Trace*
> 
> |AddressSanitizer:DEADLYSIGNAL
> =================================================================
> ==4191==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000050 (pc
> 0x564df8697958 bp 0x7ffe620c13f0 sp 0x7ffe620c12a0 T0) ==4191==The signal is
> caused by a READ memory access. ==4191==Hint: address points to the zero
> page. #0 0x564df8697958 in pci_write
> /home/test/Desktop/qemu-6.2.0-rc2/build/../hw/acpi/pcihp.c:470:9 #1
> 0x564df941eb3c in memory_region_write_accessor

So it's this line:

        QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {

in pci_write

probably because we supplied an invalid selector so bus is NULL?

Just checking that should do the job I think ...
Igor, what do you think?

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 30405b5113..a5e182dd3a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
         }
 
         bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
+        if (!bus) {
+            break;
+        }
         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
             Object *o = OBJECT(kid->child);
             PCIDevice *dev = PCI_DEVICE(o);


