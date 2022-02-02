Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B04A7363
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 15:41:52 +0100 (CET)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFGpS-0004VP-Gm
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 09:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGQB-00007q-90
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:15:44 -0500
Received: from [2a00:1450:4864:20::62e] (port=44731
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGPu-0005vY-Pc
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:15:38 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ka4so65854307ejc.11
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 06:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fI6cdO2WqRJVIfZJFdvQpUVBjomfwJnewGTBvVOz3RI=;
 b=fcOTMezz9dPgHu9DrLFS+axPn4VzQfU/EkVHIh1qQnB12u96A5c7rBRyKWphENh+pL
 kmn6RrDpg/bTdYUGwv/FeStuPm+hMjP4PbQgqdIcfQQxQ3j4KeoeWnvyXmyrBloMLHFL
 a8Y84T2W07CQMJ5uHGIqF3s1ceVd2SFiOPG5tTuzcANbb6VDdvZnJpGDmPbB2TeOL0p+
 v+sAwF4U1vlxFUAMndQXaJIMSl1C9Xw4jdmr03PKY7+mjGRRfULF20eGQDBwrHpN1SJ4
 0oYVet5s9geeVM0enrzhpJY5IPaSYZVkmEe/oNekjNKP22kPx7yNa2JBi7WxNIproXjq
 viOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fI6cdO2WqRJVIfZJFdvQpUVBjomfwJnewGTBvVOz3RI=;
 b=N7abyC2enG9l6ZSXWxZgeiMTPZvmzkS3plGzHwr6LSEo0t2Y/8hZNeS9yN0icumbnD
 wXBySuEr6Wv/UvtDxkusKZ50m35El/RC1fv02dz/w/9HwcBPMO4Aos8b7c6I6Lz87F7o
 xFZwYAq1Ts3mxUmiJbuINHDdkFcXvB+gvMN7gOLD6z4acGxMPzsmLkEC23Qs78EOyDhf
 hOgM0rW1w6JhuwhZRNmldZ5SDNMtNh1aoW6w7bufpvVtfe6keX3MKPaR2MjNCjIeWk4i
 /NbElzeG1ZytRsPA+/TchZ4Dcyqr0KkXY+VXpWJplT5HrSzHkWKFto7k1tosJGFgJA7W
 vCXw==
X-Gm-Message-State: AOAM532XGQia0SQIcZJjjqn0FruriS+kOg/DCfXGKI9TzIauxNt2alIt
 x5LpPhQkNWLMOYKvjUxz6HlbAQ==
X-Google-Smtp-Source: ABdhPJzH8blAuVDX3H0eq3tl6/6vQKt3E93zEHw8lex2vL7uHbkx5IDnH+gr3/MMHHgmrmszpPjLdA==
X-Received: by 2002:a17:906:d555:: with SMTP id
 cr21mr26611600ejc.458.1643811325166; 
 Wed, 02 Feb 2022 06:15:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gu2sm15779427ejb.221.2022.02.02.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 06:15:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51CBD1FFB7;
 Wed,  2 Feb 2022 14:15:23 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-13-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 12/20] tcg/i386: Implement avx512 variable rotate
Date: Wed, 02 Feb 2022 14:14:45 +0000
In-reply-to: <20211218194250.247633-13-richard.henderson@linaro.org>
Message-ID: <87sft1uzgk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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

> AVX512VL has VPROLVQ and VPRORVQ.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I could make the same comment from the previous patch about the goto
gen_simd stuff. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

