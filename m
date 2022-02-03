Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFD4A82BC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:52:57 +0100 (CET)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZjU-00025r-6v
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZgS-0008DN-9h
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:49:48 -0500
Received: from [2a00:1450:4864:20::330] (port=39817
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZgO-0005N7-QS
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:49:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso6804357wmh.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=S68Cs7vNDIP2wDA061YGhwUcNgVXSiU6U1Potee7cKE=;
 b=j4tWtC+tswMZy6Sa2gPd2Pw+EzdH/b4EmW7RSkGSE9kK78QYUyIf8M0nTyGYsRciwK
 SkiapqJ+qE5geN2udB1S+SFN5hKNOMFRGzQhF0E6BNEOy1NWXsQT0sqKt2b1WKqvsv3V
 Sk3tp6wMi3l+cITeDTWLAA62xU2V8S6UGxiA9/46u1AuA7mLWQHDj59SNOeDek6gAvr5
 fqStG87+JFbuDnqoQShJ22nvhUlkwogClhzaeyxrDXBg0UvyCjLiIJaj4wW1gmvlD+eH
 Q0VwA8SauhEV0J98zvGGvnN1b/e1I9KleX+lNlUm2Zp7vT0qvMC0qkLKZw4OZv//OeI/
 z3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=S68Cs7vNDIP2wDA061YGhwUcNgVXSiU6U1Potee7cKE=;
 b=RpZTW+/ZaSXbW/LdqneXpth9m+q4u5pSmVkOas1sDAriPaUQPdoRG14DHiswcHPswq
 8ctoieOGHtLPVnESdvHmIE1tfkJG1R578JJgr5QSlOMsDDk8evwjpSTqBPPJ9aXohWog
 Q3e/l3zdypNcvIHS5oLvAK+fvaSgRQ//+lZInJFVx1zWx5ooDYGRgvAZXCFJ6UWRg6+z
 5Cwx00huq4MTyxyRbKT711diNMN67HMedeBu++Agb6kS6wXyKajUGVwdTkTuccZvLGhT
 Ora2nf29wcfxP0sUMcCQNTwHcYx5Bb3S8ZIXBHvpXGndrheHlY24H6Igw+6ZUC8CmKq8
 11Qg==
X-Gm-Message-State: AOAM5312X8+1ix3D6MbOA/MhbTwZW8OOTDy8UJBXc/vBmo+gYUbcl7x2
 nXK8i1ZgwkuvhTeLWMAJLKDVDi65jkz7jg==
X-Google-Smtp-Source: ABdhPJz5jVX6fNz7S23uYhaUeQA6utY2t1F3r9UfM3/jSr22d2Pjmynxgi7Z3HU6JkEWA/5mML34gQ==
X-Received: by 2002:a05:600c:ac7:: with SMTP id
 c7mr9847054wmr.61.1643885382917; 
 Thu, 03 Feb 2022 02:49:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm1387815wra.57.2022.02.03.02.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:49:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB2501FFB7;
 Thu,  3 Feb 2022 10:49:40 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-20-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 19/20] tcg/i386: Implement more logical operations for
 avx512
Date: Thu, 03 Feb 2022 10:46:10 +0000
In-reply-to: <20211218194250.247633-20-richard.henderson@linaro.org>
Message-ID: <87leystebf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> The general ternary logic operation can implement
> NOT, ORC, NAND, NOR, EQV.

Can we not fall back to expanding to use SSE if we don't have AVX512
available or is that done by the exiting fallback expansion?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

