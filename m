Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5726FD9AA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:40:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfLs-0005Sb-Vv; Wed, 10 May 2023 04:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfLq-0005RT-NP
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:39:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfLo-0001rJ-6M
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:39:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f475366514so3627845e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683707946; x=1686299946;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tbRbzYaaMUy2bPM1xbFldUCmgJzdNP6nGNj1mPtNhI=;
 b=sJ27k/c93qgrX6E8AbDUI2aV2A7gMZC24SGgp31owkPCf/zY/x8EYPm1CwMefwhvkK
 oWbjjyOD4xhlGWW0ZNkkGq9aklvkDLTERplkwVogV4QTQdsLvFP/82HskXc6AL7nqn6r
 21Nja/wjQcftv4F6lBOjvNijgPXavJoBgC63wZic8hJra3fIuA3UDhaO4fyTo5dfL//f
 w2+naeMw0g9ysYLOT+DcT7MoAWQ8GMCxibcvnZvZfkJbhH6mWjPs8DRYObnjAbG2MrS0
 82/sMHhJtlHhl3MC948bNW4Hf/BylcKMjkbZxROi4cyl1MJx9prKOpRnMcKC31rbthOp
 UeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683707946; x=1686299946;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4tbRbzYaaMUy2bPM1xbFldUCmgJzdNP6nGNj1mPtNhI=;
 b=NIi4GEjOtLqTAWXM40yK8iPKVOUy1X17yC/ca/rdWuX3REwez/y4yQ2DI2o5ud+Gzb
 14ZlVNhuaFz4n5z7WZx9lDgjhIE1VM27zWm7LAFK36vBuwNEEqnUWcaSfjcOsTVYeUSr
 fzbghLGvDbLf0dxuPNdPR6FYvSG+cC4nvI9lP6F2YHVwN40DTj4dYAIoK7NqkpsHRJys
 6nlbQSk6pfTEhE5Gw31IqacJT83zrSgjp7k3wGixf4OAor9+rEEnvBe7QzGgojXE5zn1
 ZhoCofApxDTJX+jTFUFHg8Hy8JuUeVBqnwv7wROUAFNGAYG6u1+ph7yx/9yAEE5qugnl
 glMg==
X-Gm-Message-State: AC+VfDzORd/+o5azUVoASUSkFgi27lE0wpjDIUQcOWyEYMD4k5nt0Tat
 r4cHdr0kkCSCSTyRfJhG9UtBaQ==
X-Google-Smtp-Source: ACHHUZ61eEYbKeM6vZLVUuz+evz/WMNQZE+/yIel0xk3OoOFuZmYHtU+YsqlHB2QbR6loe3uglRDjw==
X-Received: by 2002:a7b:c5d6:0:b0:3f0:b1c9:25d4 with SMTP id
 n22-20020a7bc5d6000000b003f0b1c925d4mr11259292wmk.21.1683707946439; 
 Wed, 10 May 2023 01:39:06 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a7bcd8a000000b003f16fc33fbesm21899725wmj.17.2023.05.10.01.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:39:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A72A91FFBB;
 Wed, 10 May 2023 09:39:05 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-2-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 01/30] tcg/i386: Introduce prepare_host_addr
Date: Wed, 10 May 2023 09:38:55 +0100
In-reply-to: <20230506072235.597467-2-richard.henderson@linaro.org>
Message-ID: <87v8h0a8d2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label,
> tcg_out_test_alignment, and some code that lived in both
> tcg_out_qemu_ld and tcg_out_qemu_st into one function
> that returns HostAddress and TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

