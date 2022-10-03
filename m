Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5614D5F310D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:20:26 +0200 (CEST)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLMv-0001Dz-6l
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofKug-0001e8-MV
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:51:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofKuf-000292-4Z
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:51:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v128-20020a1cac86000000b003b7a6ad5ccdso2771965wme.3
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=P1MT00C3SAbx9H/EzxWfse1cQq2d+M6VyHtsH7PyEdE=;
 b=hDGl4xQPBwL5zu/Ea9E9/rd7xCuQAzk8giHbhOGy7yxMClAVN1FUTqHoKWtsXSYrw9
 gHTwiYpY0FXyx8VHF+NeiIM8L1TzHiG+GMo3eaR97nHgMJRGeNP01gBwQFFH9xdsy+rK
 dyLBggRHL3IskF2jmmx6H8K5xWrbyW89fZjgiSXRsrCeh+TqaGHqorVDhoRfgOsDs19/
 tf+csPzHFhkuaChallCfJSMsE2cN01oaTaU5HqdmszLYoKVRN2u4l7yHBTOf4ZZyGMUn
 tqKvJly0G3cIam5jCAmOBJI724Esdg7NL/SlE+TAMvcw7vToXbsjC3T1UNi8r0xK1l1u
 Re4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=P1MT00C3SAbx9H/EzxWfse1cQq2d+M6VyHtsH7PyEdE=;
 b=Y+tPZrsiqohMMe2U9s8fib0Zqhp77+5sncLzpgrV2KsP4HO954F1UN7OL26WWxKX8q
 RRSfEAkm8q5ooJ7O1JGpxpvA6XmDMfMxXnhjyq31vnSEtT4k71O1jCmXEwoQnHYz2SmC
 Xmsmxgzg/9SPLj0YzsqMMg9MONaNxPkf3fdgtHZqpaJDoc3L7B9HjuH2tRm7SHAeDKyz
 yCWenCyScwYTA+//snejCSAzX4wfqVdOOnnXXUjOqKeVOSpd9zrbmXHnML1zizpwArRE
 II9lYmEboUCDBMkcBj7A2ngaQjVzd/qC0TnZRUnKF4cFsOCehePr25+DPSFKTZF8Xvhz
 zGCA==
X-Gm-Message-State: ACrzQf2vYHXxRl5nR5pqHt1fN0xNXck3MBYLtKxfXZS+TIvyoxKIN2Pa
 lpypVJroQguIGaWhSkhkKBtPNw==
X-Google-Smtp-Source: AMsMyM7rMwGFc2lSWwSnkbA3TFbPEBUgBjrKxVWeCghqtb3Exw2fyimzp1xSA0TG8VM8s+NqXzw8FQ==
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id
 bh19-20020a05600c3d1300b003b4be259236mr6915575wmb.65.1664801470552; 
 Mon, 03 Oct 2022 05:51:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a5d595a000000b0022abcc1e3cesm9045202wri.116.2022.10.03.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 05:51:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 669411FFB7;
 Mon,  3 Oct 2022 13:51:09 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-15-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 14/18] accel/tcg: Inline tb_flush_jmp_cache
Date: Mon, 03 Oct 2022 13:51:04 +0100
In-reply-to: <20220930212622.108363-15-richard.henderson@linaro.org>
Message-ID: <87bkqtnk8y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This function has two users, who use it incompatibly.
> In tlb_flush_page_by_mmuidx_async_0, when flushing a
> single page, we need to flush exactly two pages.
> In tlb_flush_range_by_mmuidx_async_0, when flushing a
> range of pages, we need to flush N+1 pages.
>
> This avoids double-flushing of jmp cache pages in a range.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

