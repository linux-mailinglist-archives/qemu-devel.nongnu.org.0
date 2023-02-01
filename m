Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814B68641D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAAl-0003cv-JK; Wed, 01 Feb 2023 05:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAAi-0003ca-Pz
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:16:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAAh-0000Px-5t
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:16:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so991493wms.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tE7/Dm/8gYYdpWDLVsI0Wv50wSZnbb93fWAA7KjsKyY=;
 b=WXi1MpU0+keAJlQ3Z0zGYdixg9U81GCjChe4m0Jp+pyGBqBhsPj1JDrdOdR26TevI9
 goQ5YvwRia8Ny9QWIJMLMGcv7Ipdm9dGWfqt/qbQDRbiVHhhuLcCojSB9Sek/pfKu1Pq
 KEsXvvR16SGMjfLrmM2UfhddIV/Kv8GW53jupaHxG2FOQrvRL/9ZPsUTpcTybVn1P8OX
 VXlqiigr6zW1cZWR5eEK9obA6c314vaMypmt+hU3sEFj+n8XfWE0ZbPoGKDfRezYpJiH
 XNYSdoUU7hFElFFK1U3mTTmHXjLcoDWaim6aG+PVayTmxOHrmHu8rQ5+7pOc7toWsUBp
 FFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tE7/Dm/8gYYdpWDLVsI0Wv50wSZnbb93fWAA7KjsKyY=;
 b=HRYpgfG9Lx0tFq0/jG6Q8o2VTa3cmm9Qk4yDSA9Z7U2GCmtimC5Ts5W3A82kD5R7Oj
 Pahqx5knCHURBHao9hgGgOiyjp1VDlwzBvOQEfP9NsS1Q79rmoG1rTiAq5sui3WjuhIn
 yd5r0Dm3b/odUXrjhIYYGD+Je5yyohy+/tSg5+xgB6423eSLWpaJrvYoTcVivODjmbtX
 I3WohsBpblXjH6MHnjUhVX+1KwEVlFy3ZyPqtCNm7+hJPo31mGjR+I4sii3h++gJ7S1l
 8yacynorkHqVl9LBaXdOOPaf2bt51nKXCTjzW5wCntNTqdbl/N5Ub2rk7GzrhrkauNKi
 qqKQ==
X-Gm-Message-State: AO0yUKXkhCgX8mY852c99R/dzjX8dapKfqLgSpjQLXfqmvIrYhhv3mVF
 hvk78smMfDTVBNVBYm+PABtXELOudk6r/w/d
X-Google-Smtp-Source: AK7set++VCENbxntgrIVMIosN+kxLMH2SSKKHA6ETO9nGBGSeaCUnQXTIdFnqi1qgy48G0humhs0cg==
X-Received: by 2002:a7b:cc12:0:b0:3df:1673:90b6 with SMTP id
 f18-20020a7bcc12000000b003df167390b6mr473087wmh.39.1675246613911; 
 Wed, 01 Feb 2023 02:16:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p35-20020a05600c1da300b003db16770bc5sm1342721wms.6.2023.02.01.02.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:16:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2944A1FFB7;
 Wed,  1 Feb 2023 10:16:53 +0000 (GMT)
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v6 17/36] tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,
 64}
Date: Wed, 01 Feb 2023 10:16:48 +0000
In-reply-to: <20230130214844.1158612-18-richard.henderson@linaro.org>
Message-ID: <87v8klsnai.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> Normally this is automatically handled by the CF_PARALLEL checks
> with in tcg_gen_atomic_cmpxchg_i{32,64}, but x86 has a special
> case of !PREFIX_LOCK where it always wants the non-atomic version.
>
> Split these out so that x86 does not have to roll its own.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

