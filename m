Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974E3AE907
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:27:46 +0200 (CEST)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJ1k-0007mm-Qd
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvIzl-0006cZ-3T
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:25:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvIzj-00009t-MT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:25:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so3263580wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=abHeefuRYzGe5rhNPkXXqN8VunAiszXNF0VIdKYWiqE=;
 b=H6XrS6pjAUPK4JnnsU1UBuoWTBQszVVdanpaG4/mSK4rinTiS/lezTRQTXkD48i17X
 T75wDoAYFss2XzSdyd/Bm5n4mLSO7Vq2cQ7wsS68A2GPQVnq5Dwl55qv994clvuB9ePI
 RWe1aUz9k+51WPlUhcsniFwk02+PHvNB5gkItAOlOMMtLehIX+LekQGSVRRJLj7SQwf/
 m4QflqWzwkryafMTYON52Wm/OX28HkSNMDF/lIGtJZvAn3vRzeDA9BYyjC/PNfDa62q8
 1YssPXxQ3XQI4zqjNxmUoNqCyGsJY6eyVzGd7y6X5l8Y2lwRmumwDEDDqfrIHHLgqcua
 b9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=abHeefuRYzGe5rhNPkXXqN8VunAiszXNF0VIdKYWiqE=;
 b=kJm60bc7A+GEtmBH1i4doWC58PtEMNIAJpTc51FmEEcFlyNe0fVk7tn43+9Zl9BBLa
 Fr1zdLXA9tKj0T+YuonPgRXn9LZtLotrtaMFStLbvT0MgSswggLGBxiiKXv33p4F7l4l
 ryylyHACsDclOGe0odEnCfgmYUgILyuLv6sUKw/WmapC0SHHdjcGtfoRFk4+25yK3OdB
 sfen0s5gl/vIKweMv1rSpa8WimLAi82+29qfmTZm3Vcd3Bt4ppwZf464tC5/LXS3oT16
 6vMB+GXVvCuPQVrZZYELJc6FeJAoUlyGt1l05e5jrzSUPIHGQZJOlJS72HtG1+jFSt/I
 6C2A==
X-Gm-Message-State: AOAM531XYGyi+ZFiFYbxhiXnFIXInfAibaQZwb7iQbemvxVR3mKH9Ohj
 DY3aGWVGUz3WC0BnBi5O0NoDp/IU9hk=
X-Google-Smtp-Source: ABdhPJz1AYDZ7K1LIESTvP0T5Uby1CHhglZmS6Evr2x8P9Gk5KOQprpMx9wvpY4g71oRAagTXHgbww==
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr17497347wmc.122.1624278337772; 
 Mon, 21 Jun 2021 05:25:37 -0700 (PDT)
Received: from [192.168.43.238] (47.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.47])
 by smtp.gmail.com with ESMTPSA id y13sm1902889wmj.18.2021.06.21.05.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 05:25:37 -0700 (PDT)
Subject: Re: [PATCH 14/26] target/mips: Fix missing else in gen_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89c6701e-e907-1653-fd1e-125d12068a49@amsat.org>
Date: Mon, 21 Jun 2021 14:25:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621013439.1791385-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 3:34 AM, Richard Henderson wrote:
> Do not emit dead code for the singlestep_enabled case,
> after having exited the TB with a debug exception.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

