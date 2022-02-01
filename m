Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B44A68D8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:59:15 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF33K-0002cC-A7
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEyil-0004Lp-5y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:21:44 -0500
Received: from [2a00:1450:4864:20::532] (port=34686
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEyij-00016J-Jm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:21:42 -0500
Received: by mail-ed1-x532.google.com with SMTP id r10so36785388edt.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GElt98Nr9tyhRIl3j10phSNyuIBWDSkql5AMCZJY0fA=;
 b=omNaudWDTe2mf3DC4KSHH8QAtLXiAkl2ZShdJbVug1QiJjG9djO34QyIIkbYmJsTJm
 neFOWmjrbfr5NUEpaRsA6UmYMfq9rq5fY1A3/85wIfogN14voa/IQMgYdVVtVG4/FeF9
 BmCVlFNB6n61lncYp2kAAK4e69/dtW3x+xz93Rm69bi3xk/BC6rm6UFT2MffTFa81MYJ
 E7uMbIhqx5jCuC03l3yShA09zsxIRlZ2P6il2lueS1Cz/vtuwub2vMYQeA8/tPu/oWPg
 qlk8o075NDWDJ3L6v4MFjp9a8U2eMx4/fliaLuHxVlHfhKmvBDcPTVqPaEOr+Tr4mfd3
 e7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GElt98Nr9tyhRIl3j10phSNyuIBWDSkql5AMCZJY0fA=;
 b=kRYceT6RWJd8qElZ3g5oEbcOsUCjQCiNlZcEFn/460UTrWSJf8dnUg7WH0MkxicHhD
 d7fWT3gfoEhJOocbQVOo/eH/NQgUv85b0zHyNZNemkRlZEzGXfaoVMPQoSe3mhZOw+51
 uoeID02oEFgQOOe1OUk6LoUjtuMp8EaMWCPbXoA2LrfoSZIrC5AZLCoZSMUUtdQRyTQJ
 dKVywjQ/BwXBSs/X5Tctj6A0D3SuMwlOYrb9SBgvP8rPWBe/8vmOaUgMd2UUEv3sEgzp
 qf7DB7i2qmcQ6qHh2xyYN6XIJhXQuMbriZ7G8eJD7PEgPCZ1HCLL3IDknXJSycMz8+UW
 K6ow==
X-Gm-Message-State: AOAM530BpNV3KUxuVSDPhq2WRSMSsd/nKshE/AdQAJbfR3yYIlq10yxK
 Mr9yRV1ByxQMdFUuOupqGlecTbwXwAd6dg==
X-Google-Smtp-Source: ABdhPJzGeYWEtOmMlwt5WfLmNpgcAgAhyzHhWoLGafq64Qk6+XZt4v1HrqyMTWNwhos44cgkRYJrDA==
X-Received: by 2002:aa7:cd57:: with SMTP id v23mr26531451edw.257.1643743299188; 
 Tue, 01 Feb 2022 11:21:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h6sm14795076ejx.164.2022.02.01.11.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:21:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A97D1FFB7;
 Tue,  1 Feb 2022 19:21:37 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 07/20] tcg/i386: Use tcg_can_emit_vec_op in
 expand_vec_cmp_noinv
Date: Tue, 01 Feb 2022 19:21:33 +0000
In-reply-to: <20211218194250.247633-8-richard.henderson@linaro.org>
Message-ID: <87leyuwfy6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

> The condition for UMIN/UMAX availability is about to change;
> use the canonical version.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

