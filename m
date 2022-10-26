Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDB60E0D8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 14:38:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onfdp-00012X-7V; Wed, 26 Oct 2022 08:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onfdm-00011i-E1
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 08:36:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onfdj-0005QU-Me
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 08:36:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o4so17861981wrq.6
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qS2y2JZu7dNV6hSrMOcBx5s6/+5Bl5l6p+CSVw4nOY=;
 b=CXez/eqi2yHwJO6SX2NM+pRS61LQMP5N28I8WRb1oxNx1sF6aIUB7p+PhyUgy3QQZi
 k5SJWBSsZUR3dtcNbgMcKG4cOsoNeUM8MzPPTfUtvyr2UbL8GOrnwhCMnZ48O+hqlI99
 +EmisgO8hkSLSV3+PNpPsoQKB4e8Ue/Y8ssni8Xb1J8kUUml75s7GUjChtMgfDn1Ywer
 uIUJqPhlDGkAUYBd7KRCETmsEbnQLgn8W++UY9hWYwXeVGwbndtxrJF5VXqPkgvjM3Sh
 twODFNWNsGLzPUoxfXv9bDfhhqvvcpDhGTax07wTikz9FGy9PlCp8HUXuYFuHrpYCLOn
 1IlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2qS2y2JZu7dNV6hSrMOcBx5s6/+5Bl5l6p+CSVw4nOY=;
 b=lizbFN5z8WgPxzMi7EvFMD59CxsjEWxvZmegFrVMZuQFNwnS0RVF3LulUycVMXDJnQ
 nLmlXAoVWHhD9G+w+bRyu/jF8QiLK+d9joXbNF8ldmRtChIpSNLaGgCB8mQvV/g5IsbZ
 NYHGvJ1deOpKQq1Wel3zAjSWdL7U4+ZwaXlRgjSTHsXaBOJw4rH/w9o5TgHfzSkntVCM
 Q6IBoASh2uXV7KyMMhKuSmCbF7jJAT8+CcFLLErKj0umttB/M99kQW5BIIcwCIq87A2O
 ELwXW0DPUwPDjNXWMq8mRGLWl20kjOIji+DeVcoiMDdWcZp4E3iH+nXkjhaH4VWptpyS
 q05g==
X-Gm-Message-State: ACrzQf0T5ofFtHmEiAWFfUOYeN4/5i2gEVRcMttrfoojmgXKkjllwKNC
 UiE7QdmTMYt1QY8vKsNnoHObEQ==
X-Google-Smtp-Source: AMsMyM78PT7c6a3Q9sd+4GpEAJU1YxAWE1XKPGRj96+F2xJgyOD2xW70qrYaPLmzhB3PpiHgAbuv7Q==
X-Received: by 2002:adf:f98a:0:b0:236:677c:2407 with SMTP id
 f10-20020adff98a000000b00236677c2407mr13571524wrr.578.1666787765615; 
 Wed, 26 Oct 2022 05:36:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adf9b91000000b0022e55f40bc7sm5303943wrc.82.2022.10.26.05.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 05:36:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94BFE1FFB7;
 Wed, 26 Oct 2022 13:36:04 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-22-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 21/24] accel/tcg: Move page_{get, set}_flags to user-exec.c
Date: Wed, 26 Oct 2022 13:35:59 +0100
In-reply-to: <20221006031113.1139454-22-richard.henderson@linaro.org>
Message-ID: <87pmee4v9n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> This page tracking implementation is specific to user-only,
> since the system softmmu version is in cputlb.c.  Move it
> out of translate-all.c to user-exec.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

