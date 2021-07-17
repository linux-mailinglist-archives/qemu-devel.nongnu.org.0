Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB73CC299
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:19:44 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hQ7-0002QU-Qy
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hLE-0002Xr-BH
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:14:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hLC-0001qy-SW
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:14:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n4so7285602wms.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PMpZM0mfWsORUxHfVVLggl4qWNGqD4HRrnMMAiFJHvU=;
 b=gr8rtmvJkAuTKXvU5/ViDQDHy4AyYsH2yh9wJv28h19g3FSF8f6FPQCWGxHe7Wx0GH
 Bz0TLT3GMlTsRzfxTP8ifO4mAi1b8g+VXazNxolqjLvR1Jgz5LBgU7BWn2iuUaHK3hnN
 HJIeab8JzpdzoOz3CiL5ShvF3KT0hJMq0Lo6Dzv3dbUg8FMl+5AK14cyMSqroL3LIvV3
 pO4Geysfh7bP8OcWMY0lP/aZvr0Kvr3sO9J4W/TJfWlahefOV4s74Ddr6L2noJ1J0Fjf
 HRp24/GiRq7vI7zdp7/D+Pter2QS2wViVF/gisxjbYSVZrBDlZV93VFCt1XI6/8D5W0I
 nxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PMpZM0mfWsORUxHfVVLggl4qWNGqD4HRrnMMAiFJHvU=;
 b=oVERD/oPoh3HR9uocFELMvB3jfaNvgKYsvuXTIcirAWteN+g+vBTLmFce39PUZZOoz
 t10k9AylijbZf4cagNYZfKY+tjDS0zy9Ld7+Llb2pEE0AxMU1bmn0KS3Iz2pmlmDl1Ie
 r3Ge55hD+ZvOriMKKsTPh1fUtycjktuRePtznVRc7mYRnmbqtgXZ3Oqe426VfIY/cI/I
 BJ/zHPUePxev5MJl+3QUmMcZ459arCwEWWwjKioWkiNb0wC6uYX9/naT8g+4J5TNa8Pv
 /ksn790/MhniOk/Jp/EnLJnBpLsykKvzf4lMknALKsjy7sQDd7T2HAjqmMoQTeNZe2Mr
 HUWQ==
X-Gm-Message-State: AOAM531Vwg00GZu4EilG1OGv+E5rhT55s/lZBi96u+hZPI1HH0Hfsz2l
 wBwOhRS6KQZ0swzvIDGUfX8=
X-Google-Smtp-Source: ABdhPJyiHmM+pUwcPXRX/tq5Z0km9jcHnJSTd4ALrkBZLitpsb5o0knki7Qe46GddggjKJZ6yRXEfg==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr21528448wmo.91.1626516877453; 
 Sat, 17 Jul 2021 03:14:37 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id a9sm13002248wrv.37.2021.07.17.03.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 03:14:36 -0700 (PDT)
Subject: Re: [PATCH v2 10/11] trace: Fold mem-internal.h into mem.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
 <20210717014121.1784956-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <55a7d206-b9a9-f1a4-bf29-6a1754625651@amsat.org>
Date: Sat, 17 Jul 2021 12:14:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717014121.1784956-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:41 AM, Richard Henderson wrote:
> Since the last thing that mem.h does is include mem-internal.h,
> the symbols are not actually private.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  trace/mem-internal.h | 50 --------------------------------------------
>  trace/mem.h          | 50 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 39 insertions(+), 61 deletions(-)
>  delete mode 100644 trace/mem-internal.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

