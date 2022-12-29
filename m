Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFFC658B28
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApO5-00032b-NY; Thu, 29 Dec 2022 04:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApO3-0002za-Mw
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:39:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApO2-0008Hn-4C
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672306781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLrSyW4GFKTa0mXhrCGPDRMbnUHuWvkW952Agkm3Tzc=;
 b=D4o1w0oz8YFHzHDTj2xbxDtRHPpNhaAmQZeU249YOqvo+65nOBdrUvlSDLyYK6xm3AXTCK
 8uPbApY9IBXT8YplgG1f9KhIBAIZLTtGrXnNbO0bIO/fBZmyDnsSWHrBleluKVCWQD7y3P
 zViFRYQwDVebxiDkunwnexlPTkuhsDc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-hnY1X-PgP12YCEtnqh_8KA-1; Thu, 29 Dec 2022 04:39:39 -0500
X-MC-Unique: hnY1X-PgP12YCEtnqh_8KA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso2910921wmb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eLrSyW4GFKTa0mXhrCGPDRMbnUHuWvkW952Agkm3Tzc=;
 b=CFD1vnhjzWug+15J5FMCcoD9msvjdD4e0gyhdQL69Uxz2hfj3PBfXxJYICWX6v67nZ
 PizOo/gWD+eC/3ZqnSmVK+zVJGr4lGmzmAOnqwFb5yDxJmb8aoWUZt6Tv6LdzHKh8qgq
 MjC8SoNuSEJ7sE5UbJw2LWw6T/ed8PiDVrUd13vWKAQ99ugZwslSFS1hWbgFbKjcTCfP
 C7JkuyHIax/6Lz/qu5ybfmtLVaRHO93yYmnTgO7pag9blPYt+xgv9ADMPBViFfNeiVC1
 8J4UTj4TQZw/Tfl00XtABzR9BEC163cwN8x75HvbGYdC612/s+jyDPzDo/2f7zMy9Djr
 pnBA==
X-Gm-Message-State: AFqh2kqGjefhOaNT1ZJIocUGGVr/GlpC7hgHyUpKHBj3NoZXUF4MRZnB
 O6WxNTp7evRA/yMtc3uFsjsdoOsxXjKm6GrctkBWLNm1az9zkups9N+wggvQJ4VHGHsjrfTkTVQ
 0GePQWzHIMbw0XBs=
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id
 s5-20020a05600c384500b003d1caf13f56mr23133204wmr.9.1672306778491; 
 Thu, 29 Dec 2022 01:39:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCYoi81wdQETZUd3omh9WkScNqV9dnNy0wao/IRPDpZc/Sm3PeawVWX2Y3lWTRSII2JIu2qA==
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id
 s5-20020a05600c384500b003d1caf13f56mr23133193wmr.9.1672306778263; 
 Thu, 29 Dec 2022 01:39:38 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003c6f3f6675bsm31345830wmq.26.2022.12.29.01.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:39:37 -0800 (PST)
Message-ID: <332eb109-d6f2-d124-35a5-7418fb1c93a7@redhat.com>
Date: Thu, 29 Dec 2022 10:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/11] audio: remove unused #define AUDIO_STRINGIFY
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-4-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221218171539.11193-4-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
> Remove the unused #define AUDIO_STRINGIFY. It was last used before
> commit 470bcabd8f ("audio: Replace AUDIO_FUNC with __func__").
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_int.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index e87ce014a0..4632cdf9cc 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -294,9 +294,6 @@ static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t len)
>   #define ldebug(fmt, ...) (void)0
>   #endif
>   
> -#define AUDIO_STRINGIFY_(n) #n
> -#define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
> -
>   typedef struct AudiodevListEntry {
>       Audiodev *dev;
>       QSIMPLEQ_ENTRY(AudiodevListEntry) next;

Reviewed-by: Thomas Huth <thuth@redhat.com>


