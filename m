Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EBE6FDE46
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:14:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwjds-0001KL-Pa; Wed, 10 May 2023 09:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjdo-0001HE-G6
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:14:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjdk-0002yn-Ta
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:13:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4449fa085so8021095e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724435; x=1686316435;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkPitXG+2pvHy4Df7CTJN2gV9Q5lQg3x6ti74ywiyR4=;
 b=pdYvUbNf4Q/WjBbI7aUT1X8lO9Ix3X8Fx4Ro5Hz5YN3aNnHFG8qIMPXqGKuqVpNyoQ
 hv4rCh62x2cQLvccENJ5+dXZqJuGFySH/TFpZGtRQ7gqbFkogbqOyjS+ex5JV6Y9BBEI
 aCxhlvDI1qlwJMWy2xYZWduxBbiNLVaQ6Jp+3QYRlBo7mqc1eeRA/B68nRL+dj3MNeAN
 eoBYZxzfVYjxLBJn2RLWQFRbfastLpqO29Ml+R20AtYsbuSZPxGF5jeLIpGVJg6yMX1V
 uyY+/O0qVUQx2a6u7ScVT86TXUrqMTecgeorBz7hlUcvOxS3NcXC4td0XEvakAt5RwML
 CVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724435; x=1686316435;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fkPitXG+2pvHy4Df7CTJN2gV9Q5lQg3x6ti74ywiyR4=;
 b=dRyHGHLlBN42mRUcMPtm5Olk6F8YWSoXUtg6W9kufmDKwu0hjuHHeE4ZyehxAatFn1
 gCcs5oDmmM0TrMZPGbKY31jdvVaIXPnFo17LgzlN5VmPE3TTOxngwP447q4E6VxuF3x7
 pnkLh9kJpoU27LaV+ho/t/yUsHQyYc0+MnN9/v5Yhs1u2xsPp/NWcQ8UnMFlmfZk58sZ
 jHSzwiq1odF+1r/XORHQWZ0wz+MdG0kLdl2MqCeZzQAh0OJA75AIHuhun34QHGa2XzDU
 LR5creLq4tgUcHEU3k3tbA6ztF9k0ZKKu3UdOauCRf7AshwR5NgIPwL9pQxBRkCKbIP0
 Tzfw==
X-Gm-Message-State: AC+VfDz51CMwq70axBbOmCk0HTPfBf50DaqgZ/GmeSU+peMMVqF6sDMI
 EJd7LDDaWdL+alHOtIC4yaBLLg==
X-Google-Smtp-Source: ACHHUZ5mt2pqy1Xrj/SJ28YboBm/ETIG7k6OTLiabevOL3y1986sS92+sZ56kYkT/Lvg+78+xJRzpA==
X-Received: by 2002:a7b:c5d3:0:b0:3f1:6ef6:c9d0 with SMTP id
 n19-20020a7bc5d3000000b003f16ef6c9d0mr11671780wmk.17.1683724435205; 
 Wed, 10 May 2023 06:13:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a7bc34b000000b003f195d2f1a9sm22686412wmj.15.2023.05.10.06.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:13:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 950631FFBB;
 Wed, 10 May 2023 14:13:54 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-13-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 12/30] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Wed, 10 May 2023 14:13:45 +0100
In-reply-to: <20230506072235.597467-13-richard.henderson@linaro.org>
Message-ID: <87bkis8h2l.fsf@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Use tcg_out_st_helper_args.  This eliminates the use of a tail call to
> the store helper.  This may or may not be an improvement, depending on
> the call/return branch prediction of the host microarchitecture.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

