Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A205EF6C9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:41:55 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtnW-0006ds-6f
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3Q-0000eP-HP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3J-0002aR-VZ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so610681wmb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=1wpJNgQ0MU+WvqFLhY2OaZLQ48Gr+9b6C+/OuYwYzto=;
 b=J753ytiaJtKAUJmugDSmaFvRewfHTZCy1/359nVgc57Oswj2BHE1TvFDp+Mm32hVJP
 Sjl6LJ+aZX/r699RPdWSNFiPMcpIH35+kLTuWAH+qXdZnqG8PyN+AOYuE80hqflD1jdV
 fIccz6H6Y0RJ+LsaeoAa9pENttHzNZwfpO9ao3zCmpDMLmW62VhSTQuIFLseavD4/EQA
 YNJzkJZodSw+baJYVQjCarC+SCG2nB0EOErk/5mygsxl891nxpI99aDWhu+FzpvrM2MH
 ZMnAhxp8c6hSwvpzUwnbv1JzjSyAZkjCtdWOM5KrPjoi18OQ8Fq+VksidO5rO6/AiAdA
 gnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=1wpJNgQ0MU+WvqFLhY2OaZLQ48Gr+9b6C+/OuYwYzto=;
 b=Qf/svkIv8mWUOwbs6TGiwtKHZwRKSvNtaa6a3AEy+7m7ElwB9/p1/tJMkEdIExJ4oF
 L6eViWGnjMt8BxjQxgopZ41/oLMhTF/AKYzX6q6AniKxfvHOJmclWvp2bjFXeIvWyOlk
 kczxHtsPxhjIQjqk17YCpbH2OYFPwo5BSSsU7qH/144TCNI5fdDCCL+pI35G3X/t17o7
 VMsmCsuWIU1sYCQ+V1XOkWRKNhbSN+4NVidv4euqq99I+nuMKteczFMw5jkcEtRffHAg
 X8q6nWWroxWn9PufeiW4hHb5eJmQKMsH0tPF66plsSoQu++WWVj+5z361znp8XGcDicB
 hkoA==
X-Gm-Message-State: ACrzQf0xEfYS3sYEF6iTlNQ5awyGL8RnpdypxJqIBj18FZbCA2t39lBj
 ci7WLZBksMVIjVOFpVyTY607qFlbCmbODA==
X-Google-Smtp-Source: AMsMyM4RVvWtShnKM0SOcjCqX6gLPAuioXwW9wxizzVGenhLPBLBZjIyXhBkX0ucdBjGCYg21ADcfw==
X-Received: by 2002:a7b:ce97:0:b0:3b3:4136:59fe with SMTP id
 q23-20020a7bce97000000b003b3413659femr2030521wmj.24.1664452204311; 
 Thu, 29 Sep 2022 04:50:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bk8-20020a0560001d8800b0022af865810esm6215897wrb.75.2022.09.29.04.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:50:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FCDD1FFB8;
 Thu, 29 Sep 2022 12:50:00 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 03/17] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Thu, 29 Sep 2022 12:49:55 +0100
In-reply-to: <20220925105124.82033-4-richard.henderson@linaro.org>
Message-ID: <87h70q1jtj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> When PAGE_WRITE_INV is set when calling tlb_set_page,
> we immediately set TLB_INVALID_MASK in order to force
> tlb_fill to be called on the next lookup.  Here in
> probe_access_internal, we have just called tlb_fill
> and eliminated true misses, thus the lookup must be valid.
>
> This allows us to remove a warning comment from s390x.
> There doesn't seem to be a reason to change the code though.
>
> Cc: David Hildenbrand <david@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

