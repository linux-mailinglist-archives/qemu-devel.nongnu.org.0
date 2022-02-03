Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA364A825A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:33:58 +0100 (CET)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZR7-0005jG-Fw
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZMx-0004FP-UU
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:29:40 -0500
Received: from [2a00:1450:4864:20::531] (port=40559
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZMu-0006eP-FZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:29:38 -0500
Received: by mail-ed1-x531.google.com with SMTP id w25so4886489edt.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SeTfA8fo/jlBI0AdS7hvxrncZrPVTUb1Ui7H2NAIOps=;
 b=Z0UV6j7N/NbdCZ0yyI/OwHuLiIHOBdvLTMO/NYi3+Gpzf4Q4FIK7FsgqwwVi3qzkZk
 QgjRSGX4uoxzHvSepBdA0KLyF86E5fCwBiqNgu9hVBGJZdbdt4OT0whv/+KvQYMNuNhs
 MYOpdCWNCVWnc5ccSZxUF0okyGv0RX9DcYLByc8+0uPQpzRafpcvAeUGodwJ8PVLtENt
 palQXGDF82wmbPG0wn6QcL+ojoNBlhIWOLNPZAIw2WXmLZX4Vl16u0g1bVL8FsRPvvQb
 sSA3mikSamaQxA5jVQgC2cIi1j+d353kXLcrYyOgy1kphX8PmxWNbpO59Ryur+fHXfdY
 AB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SeTfA8fo/jlBI0AdS7hvxrncZrPVTUb1Ui7H2NAIOps=;
 b=iICqKOnRGiK5F0osiop8oGAw0+dEpC5V9cK5gGv/UfiVTGuPE3J5+ZW6VROLhPkMTN
 BSDsIj35/Pix6UAu/XfAHbkRhx7piq4MC4caXbnRQdQk9lbIqY4rfy8JSK3LT/sIFqwN
 cQLgdjlAaNlK0vj57kR54ouEO3aOF3mZwbYsP2hPDoRS74CknWQldf/k0WsJMWVfPLoM
 cxOo9FBA8g/8sNqiZQa5AwpkeRR8BzSTfHzCKWsrP3jz1vKSHC2Jq/ndeUkoKC6/zVgY
 k2RsOPtF9yP0J80mM78AZHx0UGtEFQZDRhr+VNxaHCF6UD17pQKxwP/wat5XH8yGnmdL
 TGCA==
X-Gm-Message-State: AOAM533Yyx9BgWxaj5QNPoANKL9WlV9Ts52lgDwWkAE6nyA0SoPnnlKK
 d2UJ9P4L3WB6p6b3fbcuNjFiYA==
X-Google-Smtp-Source: ABdhPJxTtDLWYdeGkhhcQ/ulrkfik+QG65a/LgebkDvZc7MgSMn+kVI0GExXNeMuUqApFrNNnH6u5A==
X-Received: by 2002:aa7:cc09:: with SMTP id q9mr34374844edt.101.1643884174793; 
 Thu, 03 Feb 2022 02:29:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id zm17sm15198900ejb.213.2022.02.03.02.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:29:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C6C61FFB7;
 Thu,  3 Feb 2022 10:29:33 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/20] tcg: vector improvements
Date: Thu, 03 Feb 2022 10:25:11 +0000
In-reply-to: <20211218194250.247633-1-richard.henderson@linaro.org>
Message-ID: <87bkzoutte.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

> Add some opcodes for compound logic operations that were so
> far marked as TODO.  Implement those for PPC and S390X.
>
> We do not want to implement 512-bit width operations, because
> those trigger a cluster clock slowdown on the current set of
> Intel cpus.  But there are new operations in avx512 that apply
> to 128 and 256-bit vectors, which do not trigger the slowdown,
> and those are very interesting.

So with a tweak to the vector tests patches I sent yesterday and running
on hackbox (which has AVX on it) I got coverage in tcg/i386 from:

    	   Hit 	Total 	Coverage
Lines: 	   839 	1768 	47.5 %
Functions: 56 	81 	69.1 %
Branches: 336 	864 	38.9 %

to:

           Hit 	Total 	Coverage
Lines: 	   1077 1668 	64.6 %
Functions: 68 	77 	88.3 %
Branches:504 	852 	59.2 %

which I think warrants a:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for the series.

--=20
Alex Benn=C3=A9e

