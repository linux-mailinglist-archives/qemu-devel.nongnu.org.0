Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3EE500FF0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:24:51 +0200 (CEST)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0Ow-0006kg-14
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Mb-0003Mq-Iy
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:22:25 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0MZ-0002i0-Ol
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:22:25 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ks6so10403754ejb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Kw+0ypcrmU8jkmBh1FTf9A73mNrmjXlBIT46daLVzV0=;
 b=t7khTwPwLzouhZTrBzFzJZ5uMnhhD+WHNXGXZ3fJ3F7Z7RTzVRNXCSUdHQtd1YOV3M
 qTUTw6SN3cPct3iElcPYgEmYzAx4F0yv62qaiitxCNs4CZfEYMQ4DoqXEc3aBcZ/Q2Vc
 3iu8ntQ6VgLLtJvF14gkZUkQ/FHiyMpwpHzqsAI1Jpy0UfvgMCBZJuOdJsj1r9nAsbcp
 4KKf/ksiRL+g6w0/4FzxLktrpVYogcsh6q1TwU2Dy+PoaLu8SHKCILS23A5QnQu9WSdV
 zgCS1po7rZd/sICfR7p1IALS9o1++vYpK6cb441G2xovzGZKt83rdjNwDCGqK+S/Wc24
 o/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Kw+0ypcrmU8jkmBh1FTf9A73mNrmjXlBIT46daLVzV0=;
 b=F6SVJLs4/H7RDtu/A2LRuOk1rByd7+5ejEhR+TMFlgVfiyoyNw4ZQ7W0X1hwbAkh8L
 kNNQmSds2YjCjTCGa3vTee15N+GMWh1VRVHEHVzoixCefckad6MQj+SpSZugkNL2RWXP
 cTZsWVu+sqZGliKt+4od6n9nluw8dmUaHKueqUFI9DQc3JFYtAooQewyRaj+dS7pB2QX
 xg3QKKzn1AShKOOaXLZb9ZzaF8Tggn8zXNrTRlKY0r5DTjkQszsqTTJ++MRCRuve+uvP
 o1er1Aybjm9WhUBM/+69PMz5cVaGumopgJkmkTRTt2GtHOBh4CEuQm6PjDe7YEr80zYm
 VeLQ==
X-Gm-Message-State: AOAM532Kp86Yi+wSklMOij6OnUyheYmTBm/8VE+QP2pHW9QK3zDWmjWh
 DHyONlu8jCh5i6JPvY7tOs6yutTLryOjpA==
X-Google-Smtp-Source: ABdhPJzPu4QVDeuo+vRHrDsyjCj5WtaejcVWswUNINnhw3N52csnUiYnLHOtgmx33SKK5WybeRD3QQ==
X-Received: by 2002:a17:906:2bcb:b0:6e7:f655:3b96 with SMTP id
 n11-20020a1709062bcb00b006e7f6553b96mr2493796ejg.175.1649946142443; 
 Thu, 14 Apr 2022 07:22:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 qb10-20020a1709077e8a00b006e892cf471asm657191ejc.84.2022.04.14.07.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:22:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9CEB1FFB7;
 Thu, 14 Apr 2022 15:22:20 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-31-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 22/39] linux-user: Expand log_page_dump inline
Date: Thu, 14 Apr 2022 15:22:15 +0100
In-reply-to: <20220326132534.543738-31-richard.henderson@linaro.org>
Message-ID: <87y207vj6r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We have extra stuff to log at the same time.
> Hoist the qemu_log_lock/unlock to the caller and use fprintf.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

