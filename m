Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82743B764
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:39:03 +0200 (CEST)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPTa-0002n3-Cv
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPQM-0008Ne-NY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:35:42 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPQ8-0004ak-9S
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:35:42 -0400
Received: by mail-lj1-x22c.google.com with SMTP id s19so16906643ljj.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZJgeDkD0dYI+BizdHTA1g5/k/oJtuF4T+9CsxTvxEIk=;
 b=ZfRa/zwUUqF8WlDBK5oMCyf8sk1lj1gbuQlFEvFQG+RjQkGC2mbKQ6aWawHSx3gBdn
 qjjp1/alZVYFx5qSIhEQq4tZrGi+VieIr7IJK7EHulXEw2I5owtjFBDc9aS/T9mXDxTx
 ZorZxzxC6cvwGOhMinPc2ahgJiKqfaCb4yj5//x7/SUm6eOROTBHo501aY0x9WQQA5b5
 4cbGL53ma/yFlElXKM7TYUTIDq1kywrxee/VpcrICSA2ionFkEVuyUsArSJW2MJt40e/
 sS6YS5Lg3CzK9m5MyVDEThDOPqTcMmtk7ODm0ams87xwiBh6fslEt5uM50/4oq1DyN54
 PNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZJgeDkD0dYI+BizdHTA1g5/k/oJtuF4T+9CsxTvxEIk=;
 b=c3b2q1M9VmmaTbYay0h69FZD9gpRpsTkcsQKsuk/QM09MsCje5ma521YaUnkZ6A28i
 QzKWRkPl2AUobyf9HUapSGDSHUbFDXcqtjOIt5ZiMILZC+OmAGnRgD/zn4HxpFWGv4L+
 3xlARxdH+mGPT99QjjbYba16zIJkuZI4dm/FoTOzZ3LjwHJkadx3UdQYr0K9PJwW9+7E
 CMDFuREOTWXO+bIARL5a43wxSeD2RZcRo7t3nx0+i/MrPD1OFWRe8G4YD666vdB3eh3a
 SYRhnbz92g3FkPeCGXQEe8Ds2t+nl8A6XL3IIZxo2AgK/jUYf1yYPQN+FzQ9L/lFzu0E
 gT2g==
X-Gm-Message-State: AOAM5321Wc3RVitrocgxX/QBDFtt/cbORNoze6/JpuDVa5USx3S7jnzv
 pItaPNPP9mZ5yd8hmgxtppzU4g==
X-Google-Smtp-Source: ABdhPJxx25n0Rl8xeJV+kyUDHJhDhWhgotD/wFGfY5vtBWJ04ZlGkyNtQKsZ0g0/yp8DIkTwBl7A4w==
X-Received: by 2002:a2e:9ca:: with SMTP id 193mr2563694ljj.83.1635266126542;
 Tue, 26 Oct 2021 09:35:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm1074224lfu.75.2021.10.26.09.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:35:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6FAA1FF96;
 Tue, 26 Oct 2021 17:35:24 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-44-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 43/48] tcg/optimize: Stop forcing z_mask to "garbage"
 for 32-bit values
Date: Tue, 26 Oct 2021 17:35:20 +0100
In-reply-to: <20211021210539.825582-44-richard.henderson@linaro.org>
Message-ID: <87fssnzqur.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This "garbage" setting pre-dates the addition of the type
> changing opcodes INDEX_op_ext_i32_i64, INDEX_op_extu_i32_i64,
> and INDEX_op_extr{l,h}_i64_i32.
>
> So now we have a definitive points at which to adjust z_mask
> to eliminate such bits from the 32-bit operands.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

