Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4BF1D9377
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 11:38:59 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jayiA-0007HS-K0
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 05:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jayhL-0006qy-Qq
 for qemu-devel@nongnu.org; Tue, 19 May 2020 05:38:07 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jayhK-00089m-8k
 for qemu-devel@nongnu.org; Tue, 19 May 2020 05:38:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id n18so2686333wmj.5
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=duwZuvE4gjgOT/7O0pTEfPVBGFVBLbazfocuPKqxKrk=;
 b=ZhdxZXtdPxPMTXEYggofptGnZz3zM6RkvxH4yg7LuRiRwxQBrUZDt2L9slk02q53is
 p8qQ/+82WLZLyrkW5GNfMsqSC2hNxx3DPA/+wOszDAguwsfSCGpUjPPVSVePkRApnUIA
 d5I7v3OJllsmCXJu75+CdexfPzHt/x2g/LVFfjW/aF7CFFqrERtJr8TAKWCe8Tz7vK2U
 yuUMx06V2J4msK1FKUfFr+XMOxd1Uyy958Fa9cmB26pLI7sA9jvonC6aDq3p9ZGaJcsx
 FsA3jRopu02CwyVzSezJ8hdhi+ia0wfMVVVvCRxSTQp1xU5B6apI+9vq872sLXaSEjVw
 vmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=duwZuvE4gjgOT/7O0pTEfPVBGFVBLbazfocuPKqxKrk=;
 b=Y3AqZNQi5dZOtWUKtAF7s4jPq76OZedZr8AeZ8P2UnozOi0VaqknVcB22Q8xIJpyYl
 EKErVeih8fONWKDNNaAnsXf5IumE6BnSvKsKA9JPhmuTFzf4q3ZN9kDLcaHsTP4U12U/
 CAKY+K9qZgecJ9rqny/V6wXpWYXK3uRwzYPItqopNcbNw2uKUb1mCwRLVoCXpceRuI2i
 I6CTMILJxZkNvdafOEDMghaKKgZ/7oIaKXMAJrkfXCgZowFrrdtlTmfJYHfP5mvqDwsr
 V4U6vWgebIjWRhyGqoOsG48Re+dkLEHS0K7qgWtvgcXrnECOmrRUua7Xh508bZy+iUGw
 FDsA==
X-Gm-Message-State: AOAM532u68p4yjhjqoQd6ChEVsElPaGKIf79u6bCVdbrs2SL3Qihx5YI
 DnvgSHE92IlchfgE+gHwXa7cAQ==
X-Google-Smtp-Source: ABdhPJwNPW8tWUAplJFftiDcACHsuAUOkNK5PWPd7PqjgrXrV1jRRm+FCnOnjP9u6XCu3LGa9Bi5hQ==
X-Received: by 2002:a1c:3bc2:: with SMTP id i185mr3904249wma.157.1589881084290; 
 Tue, 19 May 2020 02:38:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm20109697wro.48.2020.05.19.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 02:38:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 503841FF7E;
 Tue, 19 May 2020 10:38:02 +0100 (BST)
References: <20200515190153.6017-1-richard.henderson@linaro.org>
 <20200515190153.6017-7-richard.henderson@linaro.org>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/10] softfloat: Inline float32 compare specializations
In-reply-to: <20200515190153.6017-7-richard.henderson@linaro.org>
Date: Tue, 19 May 2020 10:38:02 +0100
Message-ID: <87v9ksi7t1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Replace the float32 compare specializations with inline functions
> that call the standard float32_compare{,_quiet} functions.
> Use bool as the return type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat.h |  49 +++++++--
>  fpu/softfloat.c         | 216 ----------------------------------------
>  2 files changed, 41 insertions(+), 224 deletions(-)

\o/

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

<snip>

--=20
Alex Benn=C3=A9e

