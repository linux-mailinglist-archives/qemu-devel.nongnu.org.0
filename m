Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE184875FC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:57:55 +0100 (CET)
Received: from localhost ([::1]:46942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mwT-0006tr-TT
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5mtw-0003zC-CA
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:55:16 -0500
Received: from [2a00:1450:4864:20::529] (port=36520
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5mts-0008Qt-6b
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:55:14 -0500
Received: by mail-ed1-x529.google.com with SMTP id 30so18997083edv.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UX3AQB3xG7P12z6eX0sa26fKs725urrDYOOfFY10LKs=;
 b=wA29GbLkNojodhrkRKI+YG4xTBiStDdCxzsIlyLBmT04OCEjEsAfA8tLQeZ3rMIMb6
 sxAzcl3ylRGDHPBD449exBSynd+Kesv5wW237UZNBub0gC08z+M90CFn1wDmfwpYeR0x
 ZfJu8xZvUCo5BDRo41oWgtY9iheItHORRpoT/NNKTrw3DIc0BUyDxaKqv/OT1clEJUAE
 I5teIoL66RjgXJDqJaWnPzIF8cwpWBtJ4vWCrMZ0GcoZ0ErsNNW46p1QlWu2hYq2/+5C
 68dlh612Y+JdY1FKr/5RalQ956W6m/U6fu8poTWzGQXZ0FpMgP79UUPwYHj1dXMuJ6Pi
 GkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UX3AQB3xG7P12z6eX0sa26fKs725urrDYOOfFY10LKs=;
 b=zHBdJWC+cSuGZA9qDv3dw0I4aLSfgu29oGBnxpdNbaB+mOA1Qqg9n1IKob5PpGWSNL
 7lMtOq0lDSzDYGHWKGODFVefm+Tw3p9gQAUNZKdNf0Wdwwvkkd0scX2RjEMnBRXMf7uA
 t3xGqJ87goRDOCFU4GBsl3NSMfdluKjhLnN35EDmI2PTiYDTy7ezJIPpZwRg4NTlUI9V
 TWo+7+Z8bcL3LRQUXBHzlHvJ58rLebq5B0RrfNUFV63IdanJEfdAxlgwchGs1VvX6X7g
 Qlmo0d0PrCyB6vUBXc+Lev/uTRp6dvo2wc+fPYQcaMN2rCjBzrVI4nX6FQzEAaoco3F1
 Szvg==
X-Gm-Message-State: AOAM530i708sX3nAGvmtE4E3AbI6VDrXYdTJJOPE7cOktaCnktwqBoPV
 1anwPREAj5SnDA7X/j//+YP1nA==
X-Google-Smtp-Source: ABdhPJyMyzUVoUTa5MZVB2QVQinebaSdxjZp5sZ45tlNhh1Mls+2uh6+R1iwVGcDIc6MPgGp8hL+Ag==
X-Received: by 2002:aa7:df05:: with SMTP id c5mr9040217edy.208.1641552906013; 
 Fri, 07 Jan 2022 02:55:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n26sm1899117edy.96.2022.01.07.02.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 02:55:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6F061FFB7;
 Fri,  7 Jan 2022 10:55:03 +0000 (GMT)
References: <20220104132022.2146857-1-f4bug@amsat.org>
 <4874e40b-19b3-cf4f-65cc-5991afdb5153@loongson.cn>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: gaosong <gaosong@loongson.cn>
Subject: Re: [PATCH] tests/tcg/loongson64: Add float reference files
Date: Fri, 07 Jan 2022 10:54:08 +0000
In-reply-to: <4874e40b-19b3-cf4f-65cc-5991afdb5153@loongson.cn>
Message-ID: <8735lziznc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


gaosong <gaosong@loongson.cn> writes:

> Hi Philippe,
>
> On 2022/1/4 =E4=B8=8B=E5=8D=889:20, Philippe Mathieu-Daud=C3=A9 wrote:
>
>  Generated on Loongson-3A5000 (CPU revision 0x0014c011).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/tcg/loongson64/float_convs.ref | 748 ++++++++++++++++++++++++++
>  tests/tcg/loongson64/float_madds.ref | 768 +++++++++++++++++++++++++++
>
> Maybe 'loongarch64' is more suitable.
>
> Add this patch,  run 'make check-tcg' , test failed.
> Have you tested it?  I think it's our translation problem. We'll
> correct it.

It will fail because we iterate through tests/tcg via ARCH - I'm
surprised it even saw the reference files.

>
> Thanks
> Song=20


--=20
Alex Benn=C3=A9e

