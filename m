Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B936B472F59
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:31:41 +0100 (CET)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmMd-0008TJ-JI
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:31:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mwmJr-0006xS-FC
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:28:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mwmJm-0005MP-BA
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639405718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eah4wlKH05d8CB8dtzdnGOYLsUQS+SvMifTc89FAwIM=;
 b=KNMVasHAs+/cepcgbWOIPLdMF3WOBxSQd76chW2nnlcXmsDodHCRlokPFDt5B6UGfYsjEW
 Q3wwxvxxKo7aViRyhLox9SrzevmfUMV4Wp3+CcOuhuqkauwL8LWqg/MklRIL8DewYu4a1w
 cANjV75USrqJp5nA+f6EKve+/7PNCKM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-iacymkB1Oz-ewZ0rPjkPlA-1; Mon, 13 Dec 2021 09:28:37 -0500
X-MC-Unique: iacymkB1Oz-ewZ0rPjkPlA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so3924079wrb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eah4wlKH05d8CB8dtzdnGOYLsUQS+SvMifTc89FAwIM=;
 b=v6UKJ8aqDqc2WqGggIL4yUJZIq8tvVOllB5D5jtgVsSa7RuqDoMqUuntDI0tmPpmSG
 ewXguuDVNNqkH2SX8MCKW5Kaa/karwPaJCqnW2l/H+QFIgUVneQxj3hv/lNfrnlNbpZ9
 K/teu+y86phPTzbrbD9e2cPB9mFA6/64ZydXaF4g4Wyp7s3bp18+HzYsp/6h/OasfYc9
 La4Bt17H1s6jqC1fhNdGmqE4w1fNlAcjfHlp+5KHE48KOH7qP/cXszoqj2n/9sR8i6nS
 XithOWFkAWbeXah9vGfq1+zlewTnQ/w0XzRodTq0rbpFZwJqXBInhcpaSMnprHR3XtgD
 IZpA==
X-Gm-Message-State: AOAM530FxrjQznFiA0fAgqTGnR7k8+/Ikifop7ljxAN6DleXjERE+MS4
 gUGD9LxpqvShyjuz5hnXdyacq+yxbPrhFnR1C4AUfP+cyF3XfFkVxtUX0VKLwkhVGdgu8DObjb2
 X7QtUTg6D2X1kSQw=
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr38954424wmj.91.1639405715543; 
 Mon, 13 Dec 2021 06:28:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTy1YiAwecIbjcskmIfwk5TfbOn88DdkOjP13lyPt9pgM+gFTnMxudp0UWDSlZBmHOFXaDIA==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr38954385wmj.91.1639405715249; 
 Mon, 13 Dec 2021 06:28:35 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p6sm10830136wru.41.2021.12.13.06.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:28:32 -0800 (PST)
Date: Mon, 13 Dec 2021 15:28:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: QEMU | READ memory access in /hw/acpi/pcihp.c (#770)
Message-ID: <20211213152829.0eb92752@redhat.com>
In-Reply-To: <20211213031626-mutt-send-email-mst@kernel.org>
References: <issue_98895819@gitlab.com>
 <37127769-a8d3-9d5f-5bfe-c0a0a8b9d3e2@redhat.com>
 <20211213031626-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Dec 2021 05:33:43 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Dec 13, 2021 at 08:43:55AM +0100, Thomas Huth wrote:
> > 
> >  Hi Michael, hi Igor,
> > 
> > just FYI, a crash has been reported in the ACPI code ...
> > by the way, do you have a gitlab account, so you could be put on CC: for
> > such bugs there, too?
> > 
> >  Regards,
> >   Thomas
> > 
> > 
> > -------- Forwarded Message --------
> > Subject: 	QEMU | READ memory access in /hw/acpi/pcihp.c (#770)
> > Date: 	Sun, 12 Dec 2021 15:03:50 +0000
> > From: 	LucasLeeNDS (@LucasLeeNDS) <gitlab@mg.gitlab.com>
> > Reply-To: 	QEMU / QEMU
> > <incoming+b01bab3884ecadb087cf49724e7b33aa@incoming.gitlab.com>
> > To: 	thuth@redhat.com
> > 
> > 
> > 
> > GitLab
> > 
> > LucasLeeNDS <https://gitlab.com/LucasLeeNDS> created an issue: #770
> > <https://gitlab.com/qemu-project/qemu/-/issues/770>
> > 
> > Hello qemu team, An invalid pointer initialization issue was found in
> > /hw/acpi/pcihp.c:470:9 of QEMU in versions 6.2.0-rc2.
> > 
> > *Reproducer*
> > 
> > |cat << EOF | ./qemu-system-i386 \ -M pc -nodefaults -netdev user,id=user0
> > -device virtio-net,netdev=user0 \ -qtest stdio outl 0xcf8 0x80000b00 inw
> > 0xcfc outl 0xcf8 0x80000b04 inw 0xcfc outl 0xcf8 0x80000b04 outw 0xcfc 0x7
> > outl 0xcf8 0x80000b04 inw 0xcfc outl 0xcf8 0x80000000 inw 0xcfc outl 0xcf8
> > 0x80000004 inw 0xcfc outl 0xcf8 0x80000004 outw 0xcfc 0x7 outl 0xcf8
> > 0x80000004 inw 0xcfc outl 0xcf8 0x80000800 inw 0xcfc outl 0xcf8 0x80000804
> > inw 0xcfc outl 0xcf8 0x80000804 outw 0xcfc 0x7 outl 0xcf8 0x80000804 inw
> > 0xcfc outl 0xcf8 0x80000900 inw 0xcfc outl 0xcf8 0x80000920 outl 0xcfc
> > 0xffffffff outl 0xcf8 0x80000920 inl 0xcfc outl 0xcf8 0x80000920 outl 0xcfc
> > 0xc001 outl 0xcf8 0x80000904 inw 0xcfc outl 0xcf8 0x80000904 outw 0xcfc 0x7
> > outl 0xcf8 0x80000904 inw 0xcfc outl 0xcf8 0x80001000 inw 0xcfc outl 0xcf8
> > 0x80001010 outl 0xcfc 0xffffffff outl 0xcf8 0x80001010 inl 0xcfc outl 0xcf8
> > 0x80001010 outl 0xcfc 0xc021 outl 0xcf8 0x80001014 outl 0xcfc 0xffffffff
> > outl 0xcf8 0x80001014 inl 0xcfc outl 0xcf8 0x80001014 outl 0xcfc 0xe0000000
> > outl 0xcf8 0x80001020 outl 0xcfc 0xffffffff outl 0xcf8 0x80001020 inl 0xcfc
> > outl 0xcf8 0x80001020 outl 0xcfc 0xe0004000 outl 0xcf8 0x80001004 inw 0xcfc
> > outl 0xcf8 0x80001004 outw 0xcfc 0x7 outl 0xcf8 0x80001004 inw 0xcfc
> > clock_step outl 0xae10 0x15 outl 0xae10 0x585a5564 outl 0xae10 0x15 outl
> > 0xcf8 0x80000b06 outl 0xcfc 0xdd58fb5a outl 0xae14 0x64296572 clock_step
> > outl 0xae10 0x15 outl 0xae10 0x585a5564 outl 0xae10 0x15 outl 0xcf8
> > 0x80000b06 outl 0xcfc 0xdd58fb5a outl 0xae14 0x64296572 EOF|
> > 
> > *Stack-Trace*
> > 
> > |AddressSanitizer:DEADLYSIGNAL
> > =================================================================
> > ==4191==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000050 (pc
> > 0x564df8697958 bp 0x7ffe620c13f0 sp 0x7ffe620c12a0 T0) ==4191==The signal is
> > caused by a READ memory access. ==4191==Hint: address points to the zero
> > page. #0 0x564df8697958 in pci_write
> > /home/test/Desktop/qemu-6.2.0-rc2/build/../hw/acpi/pcihp.c:470:9 #1
> > 0x564df941eb3c in memory_region_write_accessor  
> 
> So it's this line:
> 
>         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
> 
> in pci_write
> 
> probably because we supplied an invalid selector so bus is NULL?
> 
> Just checking that should do the job I think ...
> Igor, what do you think?

It should fix the issue, would you like to send a formal patch?

(as for impact, it should not case issue in normal use-case,
max possible harm would be crashing qemu/VM if user has write
rights to pcihp IO window (typically restricted to superuser),
that's what test case/reproducer was doing)

> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 30405b5113..a5e182dd3a 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
>          }
>  
>          bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
> +        if (!bus) {
> +            break;
> +        }
>          QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
>              Object *o = OBJECT(kid->child);
>              PCIDevice *dev = PCI_DEVICE(o);




