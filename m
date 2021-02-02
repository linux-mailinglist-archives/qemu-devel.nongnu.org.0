Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DAB30C2EC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:06:06 +0100 (CET)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xFl-00053Q-2N
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wvb-0006sb-CI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:45:17 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:32778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wvX-0002el-9w
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:45:15 -0500
Received: by mail-ej1-x62b.google.com with SMTP id sa23so14058703ejb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ux7fESW5o68aCePXDhmrK924f9rMeSiBCfKhjuTUdoU=;
 b=S5ldwGPOzvEiqHpEJOLvVFZdwMrNSVYUI3MFP/kS4BChNdP6KewAc7CI0Gjv2itJhd
 +w0uECZs5E0A+DUIk5cniISlMue9EO3xOZ6go9obAHOiicm48AJTzOQoj50TeIa7/RLb
 EMfWkqErWZ0wrMVeWOCPcRSBGzr+4x01kCtSuZ+xwI3JLF39X92fDPlTM14RcxjFKs6G
 UIbk4v7k9WFmR3rr31aO4mcWLF/C0iOxenCnb8etNOc6/X026fQPPa2eXWDsEMJu2bJG
 5EXYWNQTxlp8/5O7bFpr6p3AQarEQBH/GbtXCNp1Al/gISrscTNh96PRNPRgHyEnxYs6
 ZadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ux7fESW5o68aCePXDhmrK924f9rMeSiBCfKhjuTUdoU=;
 b=gHLDAtcOOk73EvsaFcg4So6IoleF5ul53iw/pCgm8JGcbbyYk3boMZ/2YkW+6Uf09Y
 J6C4Qd3fXEn0Yk3kLzKt67CoWSPWw1e2y4132yoz30KclEA78SGqXwk386VszbSIy3+D
 O8TiRBKpM3cE0kmJnVtgao9pZqvMLldgtl5pcffdV9FehEOYKxE6H0smx3hgGJaZ83ns
 kVbR5agfT98CD+6GhBYf+bWVGtSiMt2ulNnH2/wMIY72c/+xMpptpKqJB+NetefZTALy
 WmEBie8xN3wv+IoTB5GnjIlV4tgo9cOaZKdK5sq+wkDaN+4ko0I2VpKpPOtVlp0Eei6D
 bBNw==
X-Gm-Message-State: AOAM530sUdF2bSFBUV3H92+xOEaepjUodIElXAZQ/fivwqyHkhE7wuvV
 5S03CZaOsNYr5ky/6frCNlQANP7STyrAZhna7yHL+Q==
X-Google-Smtp-Source: ABdhPJwN+abj7wRD6rSecRkxXnTI6E4SdF4/KDptH/rJzTXgjCoLU6cKrpiJXVEN/UjSA3qgPDfBHoRBswDyrMBvu+E=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr22779869ejc.482.1612277109856; 
 Tue, 02 Feb 2021 06:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-19-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:44:58 +0000
Message-ID: <CAFEAcA8KiJYKKApBT77r2XhnBJ9vqenJ-KTtwqfz+5E9bK-OyA@mail.gmail.com>
Subject: Re: [PATCH v4 18/23] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A proper syndrome is required to fill in the proper si_code.
> Use page_get_flags to determine permission vs translation for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

