Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1F2ED5BB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:36:15 +0100 (CET)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZCo-0000T0-H5
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7V-0004hN-L4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:30:47 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7O-00089E-PX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:30:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id j16so8579704edr.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvTLsZ5nw5HzzJA/lwxTKgry2kh/Z8ZHZttFBx5Yi7c=;
 b=afHUr8ppTPjfOOlbK4w6KkBhLfKrA+a1zHcKBuUdH+l8IYeonZyRWWxnx8MPuoq4FW
 1Jjp9AbJ58wJMvXO2tfpDmffNyiwnF7z25at65Xf+AkfybLB/dVZD8el0KeX+ABxPHdj
 WUedb54kTjCauGUCWsFu/G2vh6Vbq+aZrMBfnIZBTVSE3X3h0AgWPD1wE+VetVA2a1aW
 I0Eiutxqs09DUk6TwkiZvFTTwVYHNJa0ricPfyLmtMEQzf/UwzjzE9BXfFAadV25+cMG
 beLuFOoH8vH4s330DRm850Hh8Iidl34oN0eClqvP2qVMY220wiEt+s56Iuw1oIqGpivU
 OmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvTLsZ5nw5HzzJA/lwxTKgry2kh/Z8ZHZttFBx5Yi7c=;
 b=qeDUyFLh2Oo1gRzq/Pcp2MzfbALbBBGZvs0rV3VkTZzfOGgRWb+k7uGLuefpeQLqr1
 r+goCpf8GHPlSKUelITd3M6u677SgEmzpQrCcolykXA4+SpWYD4IiliZX92epUEQqrb1
 /3tv6bAOP3TsqFIXsugVx9Zv8l4zLbJlCCNHA8gxr90xXm/C3j9ErDkeHO3C3Zi57v3D
 QhUdNt6aEAijBljq0jXkMpcfWJ2GCJAb9K4TR/h9qifzVXW9AqT53qW75zOqp8gj6var
 x4Gmb+vuL3F6ijTkSxPIJIufAATfsx/pSx46E1x67jYH1ByMShO+e5su/1csMgzNTLtq
 nqUA==
X-Gm-Message-State: AOAM531609e1uoQpcIU3/94sW5k+/yeiMJppv/IOIUwPK0XhutQghD3y
 FMionLh96ENATljLulvivccuchoV1h4SEgBxDoDsgw==
X-Google-Smtp-Source: ABdhPJxHyd/Rwqqw2V6IwXI041W4IMar7PQOMBOuUu+i2rjKb4p5KlslH4wSCzK8Pm0wziqczOZ6iPGG/1ai0vYmNUk=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2511354eds.146.1610040634479; 
 Thu, 07 Jan 2021 09:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-18-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:30:23 +0000
Message-ID: <CAFEAcA8Hj0_hdjXy6ZM_So3Yn08VJ-DBgG1BmSQfKRny0vPCDw@mail.gmail.com>
Subject: Re: [PATCH v2 17/24] target/arm: Use finalize_memop for aa64 gpr
 load/store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In the case of gpr load, merge the size and is_signed arguments;
> otherwise, simply convert size to memop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

