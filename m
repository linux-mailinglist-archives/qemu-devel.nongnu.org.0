Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B2242B2C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 16:18:23 +0200 (CEST)
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5raA-0007TT-3c
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 10:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rYF-00061Z-R4
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 10:16:23 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rYE-0001te-0d
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 10:16:23 -0400
Received: by mail-wm1-x344.google.com with SMTP id p14so1940424wmg.1
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OESi9kWDWzE0wDAuRk4VQjADNSJ3geoF82XY5I2b1ic=;
 b=C2kPASnvEPKC/WHLTwQLAUmuKJ0J5hnPNtVqq5y4TjYYTAlFgfxa4n/94VgXOARML+
 mmv1oaA6W4mzNFykmJjcOMnfcGV+HPrAh73avVkpK94DGlugIQHEP3HmE7jGmDSHgd9A
 exEsb8OlRwuyJc+dT3a/oLGy+eOMgNkSK2+ksNmSrw/Bv/Z8vK3GOrwsB41Gaj7NZrb6
 RObxYcETb9uEfymBsqorAQbcQgsWTY0R/aiXUx6LAPLouWQmUNWaHX47sVvu3ZYBEq/w
 y+bbAQYgBr2ALhQtkkQCQ9RmulMSPOJ67dcetAlZ+JnhB2/yAFIsveEIT/N6BTI70xwQ
 6uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=OESi9kWDWzE0wDAuRk4VQjADNSJ3geoF82XY5I2b1ic=;
 b=iX2RJnInFvzBhCstt013Y38z7kmU4MbyMdimFUXCbCxbPNvP8ZrNbpnfeFhXv1xL8L
 S/kukJaOkKIjRGrZCW3pp1hMwHM4wfK48zCXyIyBBdvUNBSdWMv6qvqpSjEzw2fe4AHs
 r1E9Uwwek2K3fj1bJTBiG/omTGvhYHbrNSuyaMAPwR8iPfWajORmkNHMjK3n0wKNoxgS
 uRPII7e6MCdQO+A/mxibdUXEm1tn9LOmegSiIsf71FMGuwjHtMFu6kavqQNYVrwSRjm1
 Fc4vzRDOpKYQ5tj5QDqqSGUcgvAE7N5z0kFWPlVb9bUL/6UWUWIlOPGxH8TfFokBSjex
 Iv+w==
X-Gm-Message-State: AOAM533sJeC4qCkDzMEWYrU2zdAlBPH21iEqoxq1E8xYsK7n6J/bJSP/
 PPmvn86a1OXNPnTDkgc/b4W7Su3BAh4=
X-Google-Smtp-Source: ABdhPJyzdpHNe8LT9fMBbEt8d3d5dFAMDMTZaTAELS2sSPri8Bm0KDupjGCnk4uMyQQL2nLR4Lq4jA==
X-Received: by 2002:a1c:32c3:: with SMTP id y186mr8645082wmy.15.1597241780589; 
 Wed, 12 Aug 2020 07:16:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm4201758wrp.92.2020.08.12.07.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:16:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 561F21FF7E;
 Wed, 12 Aug 2020 15:16:18 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-11-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Subject: Re: [PATCH RFC 10/10] contrib/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-11-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:16:18 +0100
Message-ID: <87364s0x1p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the contrib folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

