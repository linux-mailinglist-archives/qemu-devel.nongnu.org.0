Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1330F5F1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:15:23 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gLq-000091-9y
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gEC-0000GD-Ki
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:07:28 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gE8-0004ZR-Ty
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:07:28 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so3912153wrx.4
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zPSMJ3GYD3VGg4kjvO/109CJGBxUUw5hBCNg6xkDEQk=;
 b=yFp5KqSb/J4YlmFPuSQZnzH8sKw38Azm0au5DP5tCMoBke2skOy0trbaYW8ecGCd7z
 E4t1m9f5jGbDvNfOsvdrma9ktXXHI/GHNpWWBahBcinyHnRAM8IemCDQPh9pBZ65B1Qc
 zhiQKcvr2RalNyaZEzw+cuHBdTkzos+Wp1mVGlmrE97e/s63rQtOqnd/nXwrW6zLKbvJ
 G6jZsM/T9Bcc/sk8rUR+pNfUgIWU3MLC2Lh/iT4qjKuuPQGIvc/eHPDRt9kgN3Ia8aFD
 6Q233CcXLSmDpRAHMQUgfhTf6lLDMviXgapmVSBxy/PMMUv36Mn1IeMsRJ56XSATu4ND
 UK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zPSMJ3GYD3VGg4kjvO/109CJGBxUUw5hBCNg6xkDEQk=;
 b=BU7mwC/vffGlzc1F9TKygt3aL7yGkLXn6LMd/50YsdnpaOIx4+svFJFeRxW+jZk5l+
 lV1VLnGwQbncw65+BmazMMDzbMV1MOGnljeIGyvaakRLR2vrF3ZfZe0RvP3itTaULUX7
 s9mRQ/CQwrpG4q4GZM0++4cNZ6wgumHtwrNlM0Sjghm/8JACEewI3kDnWoMi+Z6e5Jfl
 0/vA/9HFOrvxrfBmHgWj95Qxn+zvhO+XnpBPH0PhTvoYuOePVE4qs/rYecmNrRutXcwL
 V4LZj1XhXI9zvioBrsIs0/LMLGuVVc2BZoloey8+abTPBENFyB2IULyt+ft1LYqC7rQN
 q+dw==
X-Gm-Message-State: AOAM530jD46AkOYLLZ0KCy8qFzbUyumPt/G2Vuzb6c/FN1Azo94Y6Z4Y
 Rf3JtEAcNVwhbc9uM98LnuUsFA==
X-Google-Smtp-Source: ABdhPJwHFsV85mHrt0QO4i4C11JwSLOTawgQ0FR+69bJhgWS+GHFkON3RPNvf7GPQGx7doDCjqDlZg==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr9928757wrt.269.1612451242500; 
 Thu, 04 Feb 2021 07:07:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u206sm6478161wme.12.2021.02.04.07.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:07:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBD771FF7E;
 Thu,  4 Feb 2021 15:07:19 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-27-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 26/93] tcg/tci: Restrict TCG_TARGET_NB_REGS to 16
Date: Thu, 04 Feb 2021 15:07:14 +0000
In-reply-to: <20210204014509.882821-27-richard.henderson@linaro.org>
Message-ID: <87o8gzq3bs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> As noted in several comments, 8 regs is not enough for 32-bit
> to perform calls, as currently implemented.  Shortly, we will
> rearrange the encoding which will make 32 regs impossible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

