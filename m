Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7952E31AC
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:27:08 +0100 (CET)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXwp-0003NO-EG
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXv3-0002gd-VX
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:25:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXv2-0001kU-AE
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:25:17 -0500
Received: by mail-wr1-x436.google.com with SMTP id m5so8318592wrx.9
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0oPIZa+9IVeFUalBkpseeLUBMcDiPl32LlZHgM7G8Ek=;
 b=KNGZ3QoKM5UXDE35f41nS3YEjaO3zFBxbrmdyGpQIyAukW5+/UU0gviwlshnofT5Zr
 BCb6eKsjnibWUZOI+BVbrNgO7O3TwHlJZa4nyLbhcKudf73RbZFN1QLhNlsICDONV50Y
 TXzvBXmZtBbK7bipLEWStIU7nDnFAoRVChM9+ADoiVDt80N6lxAjgTWMKlPBvzE7xDfQ
 Uv8xXbLZpbcKDa3HyPZCHXNvWQWt4MrSzESzB+BQe9R0wxFnWeA9BZDBhPUM3RwcNOwh
 FTSCpbfqDgJ1/BN1xX2KH7MiHDnM+e+d295FIYMBZjNkEkgCasck2Tpo5GVrZ8p2/0sR
 cvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0oPIZa+9IVeFUalBkpseeLUBMcDiPl32LlZHgM7G8Ek=;
 b=FHHDYFI9MrjeNXhFq6GPVnTEvWoR7Cs877PXh3TgKVtB9bDiWMRhx8F5ZTcEB8TNzR
 z1D3UrUP8VqAoevQ2hwRhUlZp03biEI26PrKOu+cuFNYcUBZVJNy1JPVyP2vWfVDghSf
 kBLUETXlQzGlywJxB5vEfODhLJALperOOr3zwdSJqAk1Rwhuayi2dS1jOP0+n8bUUXb7
 uKd63UvdRTVaNGuqK5SovWW9UQuEcqylw6KIgLKDcYRbm7i1hOPmU+CTwdoXDwt+rQWJ
 S225t7+cUPDByvhncljfdbKmlOOBGFuy34QDyc3aZVNZZxNnA90fnSFZ0u4WLI/iLrBe
 TO0g==
X-Gm-Message-State: AOAM531w4Bbi/9BdPdyYflxdl7rNvm8/ktrgMoip/5ehjuXC+ZLGHEwh
 YoQPmL1u14dxIdQNFUrjxZI=
X-Google-Smtp-Source: ABdhPJxr25pYAn24cGoa0JX/r1XpARkhMZ8EKYgSGNoRWNeWay6biQzqlxS67G+dRTpK6SNLhxaiLw==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr47319236wrt.15.1609082714331; 
 Sun, 27 Dec 2020 07:25:14 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id u10sm14921632wmd.43.2020.12.27.07.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:25:13 -0800 (PST)
Subject: Re: [PATCH 03/16] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK
 into TCGReg
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201225201956.692861-1-richard.henderson@linaro.org>
 <20201225201956.692861-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2b3cf05e-2b32-a927-4e21-3e80e6c38ebd@amsat.org>
Date: Sun, 27 Dec 2020 16:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201225201956.692861-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/20 9:19 PM, Richard Henderson wrote:
> They are rightly values in the same enumeration.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.h | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

