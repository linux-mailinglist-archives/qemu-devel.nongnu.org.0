Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D9358160
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:09:57 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSXs-0005WJ-SI
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSWL-000546-FE
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:08:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSWI-0007Fw-Tz
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:08:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a4so1687948wrr.2
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VXMVZW25q5cLpaW4xOWV9wTmVFGoEG6XlOF0lA7fhpI=;
 b=D7GIJkKZQtDGupMbcxi+EdOHd29UD+qfrPwWtMuuzF2dyPbL7UNroX5hMi7csymsEv
 L+n7OBf43iXw4n7IstuKAUYsIgtixIhMgPb8n2D9QuMk6VGPeG32LFJgDK2EJ/UpeNf+
 hhlgqguIEz2lFHjjpoiq1SStKUDTVnyMgNnjB5k5NomwB4k5qiUYJ/PPQt5CYrHbn++s
 RCTJjTYOPZ+eV/oHzhdo8EoGxgYKyeDXc5/YcW4Tee8I1D7z6clZ+HO0AVRAISyUSX/Q
 fLG7CiOmC4rVwqAephGOXKBDyMqojlbzB+kKuyfSyrUGo4RLWas9ysk+Tw3yQNlnEGB+
 QbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VXMVZW25q5cLpaW4xOWV9wTmVFGoEG6XlOF0lA7fhpI=;
 b=O4BDQyNoW0JyRkNLnru2gWUq0Wlp5v8vxUisKYPKi71ve03pfOjJTL/sMehNQ3DSNL
 TCV1ddIMKhBjX5AmEmwopIJ3ylba+45/Ls7oYGapU0sAOEs6ci2jkGEuruvoiQFRBWVi
 hq9KnG5/ScGV5h5u0Audy4qt+H/CbIN+rOQDebPlogE1oml3j4fIRt4ntXSdSImp+yyY
 hs0QyhQwtQep25WbvkdE2hSfGy5Rbind0GYXvOMFvjzFiO4qRfGbgkpSyUXSQ1H+NyMW
 z75dQmAtH0sb04k8dqDfcGoFawCHlbBQlWChaVRZiCLvSKQtjPK16Hn2jt8I1sIU9+9h
 A+Sg==
X-Gm-Message-State: AOAM530XWDPQ2Le288wVYFSd/J+qpxXBbu/3jaEuTSeAQ6Uo8P9WD5Q8
 vfI9v5jtgdyaXCVUJlwUF6FuWQ==
X-Google-Smtp-Source: ABdhPJweO4z0HLJuP1su+zm8kHhP221jlkecwIcbVfm1D/TBTXJK3oN5f1pNcBCtpNEpnryv88BZ6w==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr1722201wrw.280.1617880097478; 
 Thu, 08 Apr 2021 04:08:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w7sm21119952wru.74.2021.04.08.04.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:08:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B23301FF7E;
 Thu,  8 Apr 2021 12:08:15 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 07/12] target/arm: Replace MTEDESC ESIZE+TSIZE with
 SIZEM1
Date: Thu, 08 Apr 2021 12:08:10 +0100
In-reply-to: <20210406174031.64299-8-richard.henderson@linaro.org>
Message-ID: <87h7kht4o0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> After recent changes, mte_checkN does not use ESIZE,
> and mte_check1 never used TSIZE.  We can combine the
> two into a single field: SIZEM1.
>
> Choose to pass size - 1 because size =3D=3D 0 is never used,
> our immediate need in mte_probe_int is for the address
> of the last byte (ptr + size - 1), and since almost all
> operations are powers of 2, this makes the immediate
> constant one bit smaller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

