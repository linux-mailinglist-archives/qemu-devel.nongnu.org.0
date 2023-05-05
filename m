Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C16F83AD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:17:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvIo-0006QQ-El; Fri, 05 May 2023 09:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIi-0006HC-B5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:16:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIf-0005lF-PV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:16:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so3403557a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292600; x=1685884600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
 b=jceiXtC5uwpydNJDbKvI5FG4jH2GcSbc3SERS71I0VHqvnqazh3vhcpxMryShCVDk8
 0hFiwdy8oYPNfi8GTKFjEuvnU3l+MJMpUE/V+0eQJlHDZUzVjJJ5llJnU8whfDfkMU4p
 aVXn7aa525pmbf606qwYZHSyiSmHmPCnAduvr1RJcrJ/SOJM1bJVCLkO2IjXK18sGaEs
 LKZuXcgacfwq/Q85GMYBTVbBgjMXgsI6yNnv46xKeRKequif3Cck7pOP7H6F9YfEKpn/
 lYogIfpUWnNt08t3tZEfw3I8bZmIav1O8ik6i+zFnBFGqMnRq9jEybDS6BQUqx5M/Fha
 gUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292600; x=1685884600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1vFp9YexGQv6Hthy7qpqHyudwVk2TkB8SlsWsijBqf8=;
 b=VoFarBe6PSeOaf/jX03EMc7sgLWwQxjyJ7bNMWp5FHGbgdup8bH4OBD6I7JyrLkoCl
 dFcyqyn3bGFXJ5806tCgaHC4xa5dDbAKx+bkzXwWwbEJyIzcT9ZXFbnuychRPg1ULxOG
 PRwW3VtLKvK4ReGWDEj90rGmGzBQ1D7YNwRq91LaH21vVR2n0CR+E5nfeuIPir5ESSJP
 nLdFZDavHe5vxgXsiBSGFsN8iMeNEf3t9PVtmV1K+iDXE63Y+zIBfrbJpiQ4ltRmuA6O
 ezCStp2a8JQdkxbTKalej4d35c3pE4YjTzi4C0wdOvk18c74oq3ocibpB6GsWJr52ZJA
 h5Xg==
X-Gm-Message-State: AC+VfDw3mJVdhUJoTmNw8F0g3SscC5gw7ctWrYJtBuoDRA7aCSiNqkhd
 sy2Jd1L7kWnBX2vqLOYAGdla0/UkPURh5MxmUCXTHw==
X-Google-Smtp-Source: ACHHUZ6mFq89IMzyOG3OjocXJM0D8qOq1hmloEhQTLZIp1kT5HCT64hygkCaH+dvmK2NFDoPJg/wx8fZxgSQXAmGuig=
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id
 h25-20020a50ed99000000b0050bd30cc595mr1415260edr.7.1683292600161; Fri, 05 May
 2023 06:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-47-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:16:29 +0100
Message-ID: <CAFEAcA_29qccyY+K1esRjy7Y8o2YOSaJsHzcnvZoxr=K32w2QA@mail.gmail.com>
Subject: Re: [PATCH v4 46/57] tcg/loongarch64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

