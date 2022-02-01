Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6C4A685F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:08:17 +0100 (CET)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2G0-0005Wb-7R
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEyiD-00045c-9c
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:21:09 -0500
Received: from [2a00:1450:4864:20::52b] (port=33354
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEyi8-00015A-Fr
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:21:07 -0500
Received: by mail-ed1-x52b.google.com with SMTP id b13so36728390edn.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mNcQo7XamZsaJUf5Td9w+he+xkewjn0obgz+/IXTMxA=;
 b=LtER6zhfB0r2AqvfadDyZT4yX5kC3OWQ3dhvbSAsxM0QPvKJg5paQm5a2sGuO3Mcdy
 fsYZwEDj5YcW2KAW9PVttb0mNa4/QLkl+UeXY5gwn322YaCm9XrYddrPdaR72duZ011m
 1cd6S+LDRxSy0cSYuDgWQHEmCgdjUFQKVtpqxmdsEaJPM7yyqHB3eDDf+YWTlKSQNYSR
 yyaOxMvaZyjtPmw1W4Bg6zrsCXS64gHwbJtTktWjYOoFCPqdXOfKjxvhlTHfkhRin0vJ
 jYsWMqjD9izQVoRf+G3mitboWZ8vqdVuMDXHT3L07iqoM/OUBsQoSzopDGEcBL0UC387
 Fbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mNcQo7XamZsaJUf5Td9w+he+xkewjn0obgz+/IXTMxA=;
 b=lRA6xtorjjlIs07Fuc6P4efdGUh/bQdqqqNcokUaZ17krLfQZ7NnZxjzfC/9QDlyrD
 QTujPzc9U5xTEUER3vuljVKO6yO4ij3yORHchTufDdijcV5Zh+L+6r5VWCg6h7jmch6u
 VdQn6Oei/Tpj3HP8ZNz2Abp6j7UW4Xq6ryF5EyEusUg7XpgdvkPYAiGlsyywd4Oiw5yg
 CKa6GUdepzfk02a7CMsmTa5aps277yr6QY+XWzsupVzCeOIiE5PJW+XIfvsbKWvzlL/C
 rfZyRqO5ypdx5YxdPOnCOtQuboLajwbfDOBIB3z8tmLewEjuUXfxFEi7wTJnq8VqRq5d
 030A==
X-Gm-Message-State: AOAM5303hnMri3fyzP3mzyOj0trD4M57fsTTLGvKdJ+ejVSHqTDBRNdP
 ZhzNMrWlIzJdvwI3R55JNocdjw==
X-Google-Smtp-Source: ABdhPJwjwjQxfCtGBZUuqcfOguLfiXwGyKxqlKMIhXQ4OplJttb3dnocpLl0oJjEgOxkDsIw3KUrZg==
X-Received: by 2002:a05:6402:5189:: with SMTP id
 q9mr27033267edd.314.1643743262854; 
 Tue, 01 Feb 2022 11:21:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm6702539ejm.152.2022.02.01.11.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:21:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D2061FFB7;
 Tue,  1 Feb 2022 19:21:01 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/20] tcg/i386: Add tcg_out_evex_opc
Date: Tue, 01 Feb 2022 19:20:56 +0000
In-reply-to: <20211218194250.247633-7-richard.henderson@linaro.org>
Message-ID: <87pmo6wfz6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

> The evex encoding is added here, for use in a subsequent patch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

