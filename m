Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED437760D
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 11:39:47 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lffuc-0006sO-8z
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 05:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsg-0004Te-46
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffse-00027h-IC
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m9so13538577wrx.3
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jGUa9rgPwLiUF8aK8ioVNcW7/HGWWW0RrzEP7b9xSik=;
 b=mmFblxHa0++f2mdHSCzdI0tUVMK1POxGjDMhVXF7uT0KRPOXdnRDMsHgWFY+MqJdWE
 w+v9tHWsjoPHGXAWmu9bECiYNobQg8zcnPwJgmr0VeTKmVYP6/mJbUJxGO4aFnbmkF46
 v/97pWQBUkYAaDgBU+s5FWy7HYwWlJkKOv2V0aMRkxD0ffrqPk6jQ2pH+zhDai2Mu5CH
 SXahZlmKkpCZaRtcGcVdtOx5rdvsYgB2HJyV5O2ZLhyVl4NnXnfjeM0Z+X3yNu5xyOsV
 w3jOZiAnrfGWSFBtV0j+itsRV3+jo4oEgraOziIpPjkqtP5FLF4GWA5AdXjw4u6/B161
 w4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jGUa9rgPwLiUF8aK8ioVNcW7/HGWWW0RrzEP7b9xSik=;
 b=ro7LpZMOmxSRRKAoZPakj+6Cn1Tjk056IxufEmb+DnAxd9CU8ZIUbE+HyBoaFfSXpg
 Y70q2qC+LkVv4+5QBLct/qwZtsrafdqZEK849XNW0EeaipYSoQLQLlO9W5g/m7aah7Oz
 6Tt1aLjWMuzDwcnBA43yKyuh6Qmn/YU7jrxy3AQPIyl9w0LpddHhd/AP47xCzjoKqs0F
 2YboUPunfZ9OGkDv/16/uDCFX/9NryXtZej0LBzjxJWg9IWh/HIdm9J6TNL3QitDlLmq
 X3/xmKIXJqNBy4nwkelVr398nBOJl5kTkg3RXo2h0bg86vfosrurjf+CEC2EHmfrVFR+
 GISQ==
X-Gm-Message-State: AOAM530aTIfXILZaogg8JuZwPl8G38Zxw+HsvdZTelvZ+pMeGDz1fTQT
 wWeezJdaJoMJMBYNA32XDiI=
X-Google-Smtp-Source: ABdhPJyhuCTZyvhlMnxXxhZScvlS1AyP2yC9lzPQ0Lu6r8EQtsWzZMPK7ZEe+0KnRvodhokYr/sojw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr23185312wrn.180.1620553062554; 
 Sun, 09 May 2021 02:37:42 -0700 (PDT)
Received: from [192.168.43.238] (45.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.45])
 by smtp.gmail.com with ESMTPSA id n10sm18049710wrw.37.2021.05.09.02.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 02:37:42 -0700 (PDT)
Subject: Re: [PATCH 07/72] softfloat: Inline float_raise
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ebec11c4-74c2-541c-2d8c-83faa306c5b8@amsat.org>
Date: Sun, 9 May 2021 10:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 3:46 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat.h        |  5 ++++-
>  fpu/softfloat-specialize.c.inc | 12 ------------
>  2 files changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

