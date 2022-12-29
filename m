Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A5658B24
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:39:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApNg-0002IB-71; Thu, 29 Dec 2022 04:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApNb-0002Fa-IW
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApNa-0008Fo-43
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672306753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdPtqvszs9506RrjFrPESD1xDG/LFSDvRq1XxksdChc=;
 b=CdqS4gL5EANC5o57gu20LGGHUknSG/ZYPueAT9H9tnNCV89CRI34h7Q0kzHCRp+NEQFCYU
 OySed1ky4pLTP8zvZprkiW+2zb541F3mb/TOaCgFAs0eiwwOYWFSwZOV2Tw5HNuBElfCzS
 Ww03aZ8xA4qrGSdf1/cf5popu5YxWm4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-1IMxQvyWPfS4cTM-c4pe2Q-1; Thu, 29 Dec 2022 04:39:11 -0500
X-MC-Unique: 1IMxQvyWPfS4cTM-c4pe2Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay32-20020a05600c1e2000b003d9730391b5so6949802wmb.5
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JdPtqvszs9506RrjFrPESD1xDG/LFSDvRq1XxksdChc=;
 b=01VT5VLiFjUwJY3MELCmhHzAI8USu8Dxe+UzYBIwQsYskidNizvARBmCYcAzagWwGW
 hhG0bz9lwWOqVWACx7GuQGQXdntYcIrxTF5sH20Ua1xlBtX5Rm3vU85GqAEXQCn7RvwR
 PHQ4khyZrs0bljSlpl2oGJQ7kUOavxpi69VKKXlDusdibS1abO8ZpEd7EwEmM1lMBej+
 me8CZ3BG5gVlNFQ0OVl8XxOsv46pH16rEGdc4hJis66cUU+8bPrvdV8cf8rMMDNYUm2V
 2QDoCrvNdgEyHxWyHIlkAWK77CvEPJNUnPPs1v08paFWp9sk5EUa6IBYgaHpQ+EwE3zE
 8P0A==
X-Gm-Message-State: AFqh2kpp31mi9A/dbrSIChsxJQa1NPaA8if8asY7DIYzpwKmKRO+osED
 I6tjT2uFku/LEAwg9RlrKHAj5H2y2+5DNBabS/FNPkSbSl4FSR8FErWM3wuYBPd2zmV2nSrsPjb
 8mpvpXqLGD6oP3Ew=
X-Received: by 2002:a05:600c:1d16:b0:3d1:fe93:f1d3 with SMTP id
 l22-20020a05600c1d1600b003d1fe93f1d3mr20202602wms.36.1672306750401; 
 Thu, 29 Dec 2022 01:39:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu4PPyulnzxIZnpiDlUKZeU5en7jq6q/AcsGnBwgoSvyliVcpC3FQabjmS5AzyyVMhsgS+j3A==
X-Received: by 2002:a05:600c:1d16:b0:3d1:fe93:f1d3 with SMTP id
 l22-20020a05600c1d1600b003d1fe93f1d3mr20202592wms.36.1672306750198; 
 Thu, 29 Dec 2022 01:39:10 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b003d974076f13sm19948860wms.3.2022.12.29.01.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:39:09 -0800 (PST)
Message-ID: <59bcd9ac-2e2e-03c3-8dee-38d33e423917@redhat.com>
Date: Thu, 29 Dec 2022 10:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/11] audio: rename hardware store to backend
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-3-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221218171539.11193-3-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/2022 18.15, Volker Rümelin wrote:
> Use a consistent friendly name for the HWVoiceOut and HWVoiceIn
> structures.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_template.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index ee320a2e3f..ac744d3484 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -509,8 +509,8 @@ SW *glue (AUD_open_, TYPE) (
>           HW *hw = sw->hw;
>   
>           if (!hw) {
> -            dolog ("Internal logic error voice `%s' has no hardware store\n",
> -                   SW_NAME (sw));
> +            dolog("Internal logic error: voice `%s' has no backend\n",
> +                  SW_NAME(sw));
>               goto fail;
>           }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


