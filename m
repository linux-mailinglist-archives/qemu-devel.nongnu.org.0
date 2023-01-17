Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390966DA1B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:38:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiPR-0005du-Ak; Tue, 17 Jan 2023 04:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHiPD-0005dS-Ss
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:37:27 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHiPB-00045U-UP
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:37:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id k8so15429110wrc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2p/devgoxcE4SqgdfUP8hZIi3DonfQgUIrlVRs6v+s=;
 b=Sd1p3TuuUasidqe087YEt9FwC+yvy74WPLBXFRDWXXMrEFis0ecAr7XcbxNn94TKxL
 4HwH0GKQqCQ0JfWC0LEpjj7RlVujmSaUMin5pXvUOAGJ+ZC7kT74rw8G9Q+CTqyubFnO
 UufnMBRd5ZIDUsrKGG2/V6sV1ludBnFRtwuA2SugrZlOtBGakG2Xho7BN2/s04jL3Y+v
 OPQbUkdBNXcwC2Em2O3sOv4mr9vBrGTxvB6CVSxRlWgHdoOflpCHrwuc3KCgkOM+bQEc
 RynBIIKJ0D53jM/FaD6AezaKUCigV2JXR9gj5YnS/wZm98ZJBrtOUO0TQ3fEM9gYYKFd
 S8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o2p/devgoxcE4SqgdfUP8hZIi3DonfQgUIrlVRs6v+s=;
 b=whbz1qhGiPso9WJwsqTzbpVeJkzWYpVLaU8H9Jvv2b8t9FERvESEabGLTq9YF4dmlS
 +aBuPbiXNbYe87+9tlVMniy9Ao3Orai94QxNwje48LboXFM8CO09eDWHa/bZzRY+u4ZH
 Q/0GfdRAd3cQ4uPyrm/zls4dLbyryPAbh9d3OJ3ZYdGPOXAeeAlT7XciNBCxky9hBFfE
 IT8pCMVc17qAgdDhn23BzAHzhf9RIvcs+cQM5g1EPgfaYDWvePRZrjr7E9DuClfrOR7t
 TeYVPUOL2S8TWFjB+ROJwgjSNo/Uqz0m2Vnuoe61owN9r4/pgvRkXgfPIZFSyo+ie2Sn
 PFlw==
X-Gm-Message-State: AFqh2krwkCMC5VjTLGqXJgjVJJFk/JxIyykzhsWbCNKysT6qBl5iUCpw
 k1JjiMtuvd9gsFqBK5zIKPRE8w==
X-Google-Smtp-Source: AMrXdXsLDACbWoZa4U1AIspxpIYCvu1m1K/16vWQGZQHBaLr+gTKEdqsmctJjAb8fromWq3gpMcNkA==
X-Received: by 2002:a5d:66c9:0:b0:2b9:d6ba:21ef with SMTP id
 k9-20020a5d66c9000000b002b9d6ba21efmr2146947wrw.65.1673948238120; 
 Tue, 17 Jan 2023 01:37:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b002bdfb97e029sm6310360wrq.19.2023.01.17.01.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:37:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 382411FFB7;
 Tue, 17 Jan 2023 09:37:16 +0000 (GMT)
References: <20230117035701.168514-1-richard.henderson@linaro.org>
 <20230117035701.168514-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] tests/tcg: Use SIGKILL for timeout
Date: Tue, 17 Jan 2023 09:36:47 +0000
In-reply-to: <20230117035701.168514-2-richard.henderson@linaro.org>
Message-ID: <87y1q1cxir.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> There are some tests for which SIGTERM appears insufficient.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/Makefile.target | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 14bc013181..a3b0aaf8af 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -54,10 +54,10 @@ cc-option =3D if $(call cc-test, $1); then \
>=20=20
>  # $1 =3D test name, $2 =3D cmd, $3 =3D desc
>  ifeq ($(filter %-softmmu, $(TARGET)),)
> -run-test =3D $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > =
$1.out, \
> +run-test =3D $(call quiet-command, timeout -s KILL --foreground $(TIMEOU=
T) $2 > $1.out, \
>  	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
>  else
> -run-test =3D $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
> +run-test =3D $(call quiet-command, timeout -s KILL --foreground $(TIMEOU=
T) $2, \
>          TEST,$(or $3, $*, $<) on $(TARGET_NAME))
>  endif

I'll queue this directly into testing/next, thanks. Is this to deal with
the hanging tests on the s390x box?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

