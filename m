Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4E6FDF32
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:52:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkEd-0006Ty-KG; Wed, 10 May 2023 09:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkEU-0006QF-Mf
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:51:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkEO-0002hz-IG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:51:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315712406so247948575e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726707; x=1686318707;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1uHgwTJ9CnoDq6NHxbmiHJEBjSThWHogYuU6j2MTVE=;
 b=EElyz8Ti6JWnNwYijU7sk3VvfuXSmMakdbEK4I8a0v4ytIqhq7PnTvhWJTlGQ8cD9o
 z8E4c8FAQl2X0ZYn0vBN0yKl01O4P3n9qZuXVCiZ2q0JPd3vm0e/ob9ZOrkFocdwIRMI
 LOJExt8WLXZj5fGx7FuNy8MFpI1NbdBeSc7Xuss5e0S6c4kC7S90poAXspFIVJOQKFV0
 xmnQmvfyu0OzUVNPPjlKgmC09h5vRmTK4yfjvzrSSZl3a/nQRmpIi6eoejMzomrVSYzi
 vN36pQC+d3Lv1ijCmI9ye2/zfEx+Q8NX7XXMBlCycrpFnHPNxX94RdFfsKDg+Eug2Qtv
 AAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726707; x=1686318707;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o1uHgwTJ9CnoDq6NHxbmiHJEBjSThWHogYuU6j2MTVE=;
 b=jWZaQ2luxjMOQhoZ6QEkDZx8Zfak4LLk7hPeQfbMV8/9CnzwHwkJC43HTcM+1DrEbE
 CIWPduYxpSPGa0CWeLBv4e4DnshF6taYs3LfOS07FrwJp6d/t7OBNdNcDCJjHnqw951n
 eHGL6Y52UwzcYywyoyybVd1xqyZbbvk2PME6c8DShC4X4XUhvwVuh7HiFzizcAja/0e/
 o9qacz8Vt7XYFQTGLNBLa/5Jkh7/a/Tp8/d9wJhc7BFOXR057bZ+puKNY9SHhWt4Ilgn
 qvE8CfTJCWXB+fkmDZ2Jr4aUqfYYoseuAL42KdLTAxw0KjC95eYDsx7ITWsFQ9CRxzk5
 BxIA==
X-Gm-Message-State: AC+VfDwKOVA0D5meG96WQTP4OebwqyEM0iRMsxRmdGGZIOrQoDH0iQBq
 ySEljAap5HTcikkWQc0jDTct5dAp8JB5Y+oSnKQfyw==
X-Google-Smtp-Source: ACHHUZ4hLAvcMACl144gaKjOfp6UaaO9xhYCxZj8O7MepB57tP+S+vqQ1WGESi9n4c5d8kqCYvZqEw==
X-Received: by 2002:a1c:ed10:0:b0:3f1:731e:cdb1 with SMTP id
 l16-20020a1ced10000000b003f1731ecdb1mr11880561wmh.6.1683726706861; 
 Wed, 10 May 2023 06:51:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003f42314832fsm10907723wml.18.2023.05.10.06.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:51:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 131EE1FFBB;
 Wed, 10 May 2023 14:51:46 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-25-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 24/30] tcg/ppc: Reorg tcg_out_tlb_read
Date: Wed, 10 May 2023 14:51:37 +0100
In-reply-to: <20230506072235.597467-25-richard.henderson@linaro.org>
Message-ID: <87v8h05m6l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
> the normally allocated registers for the tlb load.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

