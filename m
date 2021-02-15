Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED531BF7B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:37:24 +0100 (CET)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgsF-0005wQ-Cb
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgqM-00053o-FT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:35:26 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgqK-0001se-1n
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:35:26 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z7so4008826plk.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tzdQkjHsJ7QDgA6sO8G1cRaPHZTfbzgzxOhu96Q+NSo=;
 b=Egk7PIi7UIliEHGgrN4+NdA4OcPATFfT6FWYiNIiRDCxLa1iQWVs2l6VUfu1KgHTK/
 knBbYbaIE4sayKHehBTH4I3+wFbzNWceRdjXTgazzk8QvxmaAx3HiKXJcu7zcvd67aQv
 GwgYUqDILnConmCMECukf66wYSMEuseGZ8e3Jninamvz+reQOnpdBgySrYAeG8o1yXAT
 iQCJ0UyLsRLsI5yMhakXR8qsRusY68n8NkUjwT5JsMNZlaFe/U7dZvzbZuOdOMOxedJ+
 umfSRlm0VYtReT1OHE8NzF8t4YBf36tPPFGVNqSWbQSpXmFcGixTP+ii0si+cTERrHum
 OymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tzdQkjHsJ7QDgA6sO8G1cRaPHZTfbzgzxOhu96Q+NSo=;
 b=qCzGDcBSWzz3RLm+G5od+KW6n3FLHjn4kg9CM/xoF/mqJrhY6fMZ/wom+K1S4jeSG9
 4D+WQL+2ocTi9pBxxBaYVee1ZylpiZgqjXIUFEIR//jEThNmXT68E7VY9ji1eUPtDIe9
 Bxs4smLC9xtv7aGGONUcYMgyzbUmhWr44FudNyyH1bxg+EF8yqVR1TocHItcMcxBQBu6
 XCcqPtIwMbjKS0y8IUHBNWTDw+z1rcM4OYVMKLDj7ISHGE/1JUqQKuRcZzSwpJDi+l8n
 1h/zHypVyeJnjUfx0rjtE+3i/sdmUrL/bsmK2oTvWA0a1rzv3Fw2H74YgvOrXWXJgNaL
 a+Yw==
X-Gm-Message-State: AOAM532cEKU0R32hZlyRqbBWSFMIzZ5JQD+xGpahSvXwX9NQL4h+dGsX
 cmRsji8Md3Ywch1BL45hwpAKSQ==
X-Google-Smtp-Source: ABdhPJx5jpUP5Vlty4840KqvyKWtTuYf+ty1obpc7NMwIMxPqvZHwsOrtU4KdfTLnqxfiZhkysFB1A==
X-Received: by 2002:a17:902:561:b029:e3:e69:ba16 with SMTP id
 88-20020a1709020561b02900e30e69ba16mr15945595plf.14.1613406921888; 
 Mon, 15 Feb 2021 08:35:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 143sm18765786pfw.3.2021.02.15.08.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:35:21 -0800 (PST)
Subject: Re: [RFC PATCH 15/42] target/mips/tx79: Introduce PAND/POR/PXOR/PNOR
 opcodes (parallel logic)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fda589ca-8316-f4a9-8b55-a14ca774388f@linaro.org>
Date: Mon, 15 Feb 2021 08:35:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +    /* Lower halve */

"half".  Lots of repetitions across the patch set.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

