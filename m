Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48C5068A1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:21:30 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkz9-0004DO-95
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngksd-0008Ix-K7
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:14:43 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngksc-0001AS-4e
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:14:43 -0400
Received: by mail-ej1-x630.google.com with SMTP id g18so31842596ejc.10
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HyLnG4uuGlnYhRNAk7l53NnFPK9TmETj/2LLct/00tk=;
 b=kQ8Jxc730IDQI15U/kpBeoK+DHUzwdmh/9sf7ZYtlyQvzsa1FGD5v2PzPVR/ja3g/X
 GvPDMG9W8NdrYt5/xuiuvdvIIlEYGWwbDMD76TDfvS0PANk7pUdbTdCy1pXKKNhCNrzn
 9gcsmd7DTpVIGPpSRUgxkwhZjmB3G+6Syx+mbd9fmGKckfKA22JMZvzzR1Cx/xa0Pz92
 iTi4lUyIIkZO9O0BK6i/rcnFp+yKukYm+yNvZY8yIW3ltEuFbN1OkuL72F71rOLa74x9
 JMEHS3ZTJraxfY1hWenScvfSIDxJTyTj9UY/A6vXVe6ISu0v5hQW+9ehy3lIKvSZGcsU
 VEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HyLnG4uuGlnYhRNAk7l53NnFPK9TmETj/2LLct/00tk=;
 b=p+2zpCONvgH9ScICPvmaPmueiZ0lkwzywIgmvpvD+bTNCa4jJenff71Arp0hkGjSgN
 7KNc6fUXxqwKasEq16wMdNm5XhYAes9MT/aj1PXefsIyij7pxVAbF31QcPCjq5y3pMeb
 XOzrfI496CFNzyGGC3qLBHVLvigBJI9BWdDgpQT600NYQDD4vcjqlo937lW05YAw7LTL
 oAkWcgeMGXhtw0tyrZp56FzNujKw1AIlewuBF0dVaUzrm+lYGwaoYAnBCbwOm2+18BqS
 hWzSGur6u10cGrRezce7pb70zuOA3pBVUWw6WZRDzQZG+i81x3tVHQV4j2v3wDsfjcdb
 0LkA==
X-Gm-Message-State: AOAM533EwqE0yO+tiA7Cn9fSpp5KX8gAUvny/Dy/8rzchkYfNpL/Dklm
 ErbRpZ+nH+Fo2HWzANDdJyAK2FRRVmULlQ==
X-Google-Smtp-Source: ABdhPJzbfujEOA7pLBNJnS3quvdSmDdnvAPs6af7+SEK3OslEalTzN8ZaFFwpdlu4S0opzfUV83Kiw==
X-Received: by 2002:a17:906:3ec1:b0:6e8:aae3:90de with SMTP id
 d1-20020a1709063ec100b006e8aae390demr8589652ejj.127.1650363280511; 
 Tue, 19 Apr 2022 03:14:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm8639239eda.2.2022.04.19.03.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:14:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED97E1FFB7;
 Tue, 19 Apr 2022 11:14:38 +0100 (BST)
References: <20220417183019.755276-1-richard.henderson@linaro.org>
 <20220417183019.755276-25-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 24/39] include/exec/log: Do not reference QemuLogFile
 directly
Date: Tue, 19 Apr 2022 11:14:30 +0100
In-reply-to: <20220417183019.755276-25-richard.henderson@linaro.org>
Message-ID: <87o80xxtv5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use qemu_log_trylock/unlock instead of the raw rcu_read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

