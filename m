Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFF6FDA72
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:11:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfqd-00034q-J5; Wed, 10 May 2023 05:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfqV-000349-VF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:10:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfqS-0000dT-Pl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:10:50 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso2512035e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709847; x=1686301847;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=gWoJHtcjTnWCeJ96MEsMnvcYZUgKS3QemxAB+70vWFxri+evfa2UutY+x5a7Nor3xW
 UFI+fv4skfh65UXJIhpHj9mcUYDpO7JQe1LF0a6iZZrWLFx6y2A0HZ2Rxu0r/D4IOz1l
 wKflup6xf3cjQ6t9WXVyApYT/W+tvbuUa9AkhVzqdy0etsEnlfTvsQ1YrFbneH/w4805
 ic+juBAGC4SC1DS5gDSllfPAIoUjhSIiNcHCzgMoUD8KIWjoYBFWchUlWMmnRbhcYTBR
 28ww3ZIfjI9hLAdcF6Bh/0vdDMz5LS0T6dgaxtKXsYLhP29q+738aL6Z0stddC5mvzBz
 Ri7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709847; x=1686301847;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=XoHVMzg0XxWEfgV4JRiW+sPC+X078LWRLjJcVWjyjSfK1xN9G96Aow7byY0V+OewDr
 q/G/McCMRDUS++3BXINzJDje0zw4X9sbXIJYgCs/C5QJ5nGKjf534D4hBg6zJRaZ11YL
 1jcBgis+sj5zbgV1ViDJsrZOPNJxMISng5rX6NyZEk7dEp9MHygI0JCg3+rwufjaKaDo
 GKmeQd7yh0Ak80c8qRy3FleU+D19leO+69Yanwr+rT/+VN3ViiICqu9c7p3nS7Jv6bHv
 Q3Rq1nmG4XphGcPFooBr9x6e+AeYSqp3ilsen2aXmm3ARetrEsw5Y5joRnjofk6LI5k5
 WWwQ==
X-Gm-Message-State: AC+VfDyguSzo73StPtRPt82E2BELuR75hayw/q0baisDdO8lgRGQlz7R
 mhGa4+qQR5B5DEJA6cBr57ZqUg==
X-Google-Smtp-Source: ACHHUZ6yWsluTjMYPkpc0sZvvRRho007h/YdriCbtHeDSQFYRpSiX+k/Rzy+sd8O8GklKwO3hxPo8g==
X-Received: by 2002:a05:600c:258:b0:3f4:20ec:75f1 with SMTP id
 24-20020a05600c025800b003f420ec75f1mr8931850wmj.33.1683709847060; 
 Wed, 10 May 2023 02:10:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g14-20020adff3ce000000b00300aee6c9cesm16817503wrp.20.2023.05.10.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:10:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D00B1FFBB;
 Wed, 10 May 2023 10:10:46 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-8-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 07/30] tcg/ppc: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:10:38 +0100
In-reply-to: <20230506072235.597467-8-richard.henderson@linaro.org>
Message-ID: <875y90a6w9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
> and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
> into one function that returns HostAddress and TCGLabelQemuLdst structure=
s.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

