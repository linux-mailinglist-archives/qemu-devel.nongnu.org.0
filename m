Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391131D734F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 10:56:43 +0200 (CEST)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jabZi-0007Sv-A1
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 04:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabYp-0006Xt-4d
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:55:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54938
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabYn-0003Ac-2a
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589792144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFvyflhV6bpCowSjCbqLoHw0FEGhnsCKNyWzSBxTZkA=;
 b=eCyA70Gw2JalJ19ICR7KFZpxMnaPxgQpphb/2t1Twp96d+flxHBPfDFNLN8DSfs8b5WjaQ
 gitAM9v+yeLhGHfsb4AIWf1PWvrP/42BsqtmtlXAH2P10hxNyx6502JOF1054md7PcpFny
 PHSP3EsZteW7RIccosdhWlxSrT8vYVY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-fzJL2_NLPRqMOs0YzG_GMQ-1; Mon, 18 May 2020 04:55:42 -0400
X-MC-Unique: fzJL2_NLPRqMOs0YzG_GMQ-1
Received: by mail-wr1-f69.google.com with SMTP id p8so5343454wrj.5
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 01:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AFvyflhV6bpCowSjCbqLoHw0FEGhnsCKNyWzSBxTZkA=;
 b=D4mXZ0+B8/WHr8uRlK8qEUiYyishgoEpdpOYLS0Jj1mEX8b22t8SK7FH4NX72NAzyS
 gATu+f9fzsT5FgGnOu1jRi0o5ZUTCr590n8y3sG78GzenupO4tmtiXW8pc+UaNj8T6C0
 G/ZWRLcPyixvgx50lf0x0e4tw18gbjNcK5JsgKfl458hHpt+jtOUA4YCDTMqUoIOWxPG
 pswp70GA/ZUesWND1QDSwXZiw1wPFmVN43f03Nmk8TNqrfA5C4yc0ioKRgGLGTlGvlzn
 GBAvm5QdNCM9tX7nSMSFrAzj1/dt5uJhdpR6lItWDGgcZp5luKbh6XflKQP4RS6mRocA
 EXBQ==
X-Gm-Message-State: AOAM533Hyu+VpDnTCpjk56v52JDUEqNBOfQAotddauRKy+IztkBvjAL/
 uaB0NYDe0HvJ9caxx+7vnnvrVFkjRhizVH+CF5gPZkIyBboqFimCDUwclz+pmsMn2NSmjPqV4Zb
 huH17UUS013fQR1Q=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr18492858wrt.322.1589792141531; 
 Mon, 18 May 2020 01:55:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnQDLdvjtwNbWxIbk157pv08nb7bDi4efvM7Gj6c14OuhcbQ+3bzZCBCkTfX/VySZ6KXv1NA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr18492836wrt.322.1589792141369; 
 Mon, 18 May 2020 01:55:41 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id j2sm15406958wrp.47.2020.05.18.01.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 01:55:40 -0700 (PDT)
Subject: Re: [PATCH 15/24] macio: Fix macio-bus to be a subtype of System bus
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c73943be-2bae-6c49-2ba9-0bb8cb74a464@redhat.com>
Date: Mon, 18 May 2020 10:55:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-16-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/20 7:03 AM, Markus Armbruster wrote:
> The devices we plug into the macio-bus are all sysbus devices
> (DeviceClass member bus_type is TYPE_SYSTEM_BUS), but macio-bus does
> not derive from TYPE_SYSTEM_BUS.  Fix that.
> 
> "info qtree" now shows the devices' mmio ranges, as it should
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/misc/macio/macio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index ebc96cc8f6..53a9fd5696 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -492,7 +492,7 @@ static void macio_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo macio_bus_info = {
>       .name = TYPE_MACIO_BUS,
> -    .parent = TYPE_BUS,
> +    .parent = TYPE_SYSTEM_BUS,
>       .instance_size = sizeof(MacIOBusState),
>   };
>   
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


