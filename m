Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F5338994
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:04:37 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeeq-0000aw-Kc
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKebf-0006cW-Ia
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKebc-00025I-1z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XMr7EWcJOMGW0lwQeimgABKynb5ShMS698It173Lx4=;
 b=EmY3SLCBC7qQ6TtxL6EHLMJiqh5Hp2jHBlfSVEA4XlQyNavdDLyT4m3nkCK6gOi3AuNH3j
 BmMrhHzg3LX5NqELaWftj3zkDe5VSVjc3FuSjno1OvaUJd94q9z6OypdnVK3HqE8Y+7dnp
 j8Mb0bmLdxQV5FazTpPBFY3wKzhwhdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-zEcpVF5bNz6k7hagl_l7Jw-1; Fri, 12 Mar 2021 05:01:13 -0500
X-MC-Unique: zEcpVF5bNz6k7hagl_l7Jw-1
Received: by mail-wm1-f69.google.com with SMTP id y9so1910988wma.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5XMr7EWcJOMGW0lwQeimgABKynb5ShMS698It173Lx4=;
 b=kqHoprqYiLTuCQKmuYvV02lFoBM48I+1BqvBGTX9XTsLYz6Kpr2bFn/Pt4A9YMpgd1
 gufGFL+SROMugcTtGvkYkNDV/a+MfEyuW3cUaGtlc1zB6vKq8Ka5OpX8x2R9TBcweRms
 6SZ8Ef3jDCrAuqqO8YCH9IlKOkLAGc3GmBppiVDYWgwe4u1qc72EdvNS7lzVXLolJZQj
 HG4jJO9WWU9A2CYOtE3Ior6ISksQC+zhk/MAZ6BNgr+0rORuYfkNYv7Y09roqyqEuGfR
 WxCBSkA/+iBLuzY54adXw2CZ9qzJtkm+3CAqCZWbWDG9gjPYfCqKtej1S6xTr1xSILVx
 7DhA==
X-Gm-Message-State: AOAM5320nlLwt0VLaJlj/WeY8Xi6sV/DtLkJRjtyBnhFWGTwoH1Y2F8l
 5RMP/Iql6PI64tLzFLdiOi8KO36OY2JVBalLCJNbkBFPpktzt0iuch+8HU3wlp2GEcOELmeIt+V
 oxSUY9y9FecPTDsE1hq1P7+PCP2VwzIfBkoAEQZE2aOaabt3kF5pPFQdeCjvcuPhj
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr13163706wrn.255.1615543272047; 
 Fri, 12 Mar 2021 02:01:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1G1WTmV1p+vwJtyEuaA141NnI1Ery3NAzDsekNFkHtjA9/NVAzvYE39ozTkDSGINzoa5ULg==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr13163689wrn.255.1615543271916; 
 Fri, 12 Mar 2021 02:01:11 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s3sm7191887wrt.93.2021.03.12.02.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:01:11 -0800 (PST)
Subject: Re: [PATCH] usb/storage: clear csw on reset
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210312094954.796799-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <120ee673-b1e8-44ea-eb7a-e98d017a3aec@redhat.com>
Date: Fri, 12 Mar 2021 11:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312094954.796799-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 10:49 AM, Gerd Hoffmann wrote:
> Stale data in csw (specifically residue) can confuse the state machine
> and allows the guest trigger an assert().  So clear csw on reset to
> avoid this happening in case the guest resets the device in the middle
> of a request.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1523811
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/dev-storage.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
> index a5f76fc00120..fd4ea818115c 100644
> --- a/hw/usb/dev-storage.c
> +++ b/hw/usb/dev-storage.c
> @@ -352,6 +352,7 @@ static void usb_msd_handle_reset(USBDevice *dev)
>          usb_msd_packet_complete(s);
>      }
>  
> +    memset(&s->csw, 0, sizeof(s->csw));

easy-peasy...

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      s->mode = USB_MSDM_CBW;
>  }


