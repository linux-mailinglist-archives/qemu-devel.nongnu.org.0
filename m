Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888534A240
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:58:24 +0100 (CET)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPgQJ-0006sR-Ft
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPgP9-0006SN-01
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPgP6-0004V2-W0
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616741827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7eixj8cgf1LzQLAsngam+rcR3rPCPEFQot2zkmTVog=;
 b=c/aO2Kn8Mi3Yl9INSHBge6wDOS6C94LZUz0ddln65LW2+abbf3D4VaXqFNm+gMys59nRNp
 y5wI80/+kdOumb+TijufGQQ5Im5vTF8MdEIR5qfCzHY9/nzBerkQSaiSPZUFBTm2CwmjNb
 GNOibYALr7xziRyHQZ6ogX8AR8WX98Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Y3rjf1AtMsqSK_g9NPWJtg-1; Fri, 26 Mar 2021 02:57:05 -0400
X-MC-Unique: Y3rjf1AtMsqSK_g9NPWJtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6270D87A82A;
 Fri, 26 Mar 2021 06:57:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 518F3891C4;
 Fri, 26 Mar 2021 06:57:00 +0000 (UTC)
Subject: Re: [PATCH] hw/usb/hcd-ehci-sysbus: Free USBPacket on instance
 finalize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323183701.281152-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <14233309-94c9-40e8-0983-dae12d5db4f9@redhat.com>
Date: Fri, 26 Mar 2021 07:56:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323183701.281152-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 19.37, Philippe Mathieu-Daudé wrote:
> When building with --enable-sanitizers we get:
> 
>    Direct leak of 32 byte(s) in 2 object(s) allocated from:
>        #0 0x5618479ec7cf in malloc (qemu-system-aarch64+0x233b7cf)
>        #1 0x7f675745f958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>        #2 0x561847f02ca2 in usb_packet_init hw/usb/core.c:531:5
>        #3 0x561848df4df4 in usb_ehci_init hw/usb/hcd-ehci.c:2575:5
>        #4 0x561847c119ac in ehci_sysbus_init hw/usb/hcd-ehci-sysbus.c:73:5
>        #5 0x56184a5bdab8 in object_init_with_type qom/object.c:375:9
>        #6 0x56184a5bd955 in object_init_with_type qom/object.c:371:9
>        #7 0x56184a5a2bda in object_initialize_with_type qom/object.c:517:5
>        #8 0x56184a5a24d5 in object_initialize qom/object.c:536:5
>        #9 0x56184a5a2f6c in object_initialize_child_with_propsv qom/object.c:566:5
>        #10 0x56184a5a2e60 in object_initialize_child_with_props qom/object.c:549:10
>        #11 0x56184a5a3a1e in object_initialize_child_internal qom/object.c:603:5
>        #12 0x561849542d18 in npcm7xx_init hw/arm/npcm7xx.c:427:5
> 
> Similarly to commit d710e1e7bd3 ("usb: ehci: fix memory leak in
> ehci"), fix by calling usb_ehci_finalize() to free the USBPacket.
> 
> Fixes: 7341ea075c0
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/usb/hcd-ehci-sysbus.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> index e3758db1b18..a12e2188489 100644
> --- a/hw/usb/hcd-ehci-sysbus.c
> +++ b/hw/usb/hcd-ehci-sysbus.c
> @@ -74,6 +74,14 @@ static void ehci_sysbus_init(Object *obj)
>       sysbus_init_mmio(d, &s->mem);
>   }
>   
> +static void ehci_sysbus_finalize(Object *obj)
> +{
> +    EHCISysBusState *i = SYS_BUS_EHCI(obj);
> +    EHCIState *s = &i->ehci;
> +
> +    usb_ehci_finalize(s);
> +}
> +
>   static void ehci_sysbus_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -94,6 +102,7 @@ static const TypeInfo ehci_type_info = {
>       .parent        = TYPE_SYS_BUS_DEVICE,
>       .instance_size = sizeof(EHCISysBusState),
>       .instance_init = ehci_sysbus_init,
> +    .instance_finalize = ehci_sysbus_finalize,
>       .abstract      = true,
>       .class_init    = ehci_sysbus_class_init,
>       .class_size    = sizeof(SysBusEHCIClass),
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


