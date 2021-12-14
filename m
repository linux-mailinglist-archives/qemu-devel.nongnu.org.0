Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3BC47455F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:40:55 +0100 (CET)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8z8-0003Mo-Ds
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx8xd-0002fa-PR
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:39:21 -0500
Received: from [2607:f8b0:4864:20::932] (port=33514
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx8xY-0006o2-Cl
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:39:21 -0500
Received: by mail-ua1-x932.google.com with SMTP id a14so35269403uak.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 06:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GkidbBhNS1PPnLOwupuAj/HEg5tlBNNOjho90o2C/zY=;
 b=v5RDL+INTKDSDLg1JgDhzv3r1SvCUHDAIytSv5LgVfLqCyLVDvgnkrllm87pxou/kK
 R8N4XKhlL0K+N1nr2Tz8wqurIYQSByFUc3e41qVBCf9KfbwqPpigGgTfEsmSSgVJu01F
 TwWOKG8JW+1QchLBBGZ3qYdNXY0x8Zc1QHvVO4RhXYpmVBbBD4L3KC/zcOtJ7a9T8hfL
 rEWO8U9gY7yFKtQoA7QvdF6/ENr8Ok6r/Gq7xQ3oG2puxkz59uu2v6PyYsFuxz08QoIL
 5575TZWdhYoo9TOKyVp1U+nXCLZVCakD8hv8qBVoVYxtJAQI5fYboUoqmKxyDeYOAOGN
 huoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GkidbBhNS1PPnLOwupuAj/HEg5tlBNNOjho90o2C/zY=;
 b=nTsT0V42JrXd+7PpkqrHp0H3f3XtuYHpPdj30tBPdS2XVYVISDy9O506elpxQP7tkf
 DcznlRxllVLJGd0NLcT+FXbVA8ahIs1yn96WVdJdZR/YmMKbJaKccNo7Rk6hTimuahfd
 +bBn+cnMhp8uJS6A99oxN4iXjArHqFHAukhPA2cZwHUV6XvDpVBwyr+UdsHx37K0ZANN
 NGxNa5HxKriZB+EyVT0ktUiV6kUtLCi1PBMC0tqQpgFWTkYYeW1b2bv5s+P51OYEN0Ns
 B4W1rRJ9rGaZvBs0eo/AEtvSZYDHi/SL/fmI+TrFqWpzcltQJnHf/PSoufkVriBLQq+O
 vrfg==
X-Gm-Message-State: AOAM532V5e1EqoP2+z0UsXamP5u23pg0Vmm5FWUCVFwKlfLCu6kLR7ai
 rSsM50/B5vp4Mg2Ap3TSWAXktA==
X-Google-Smtp-Source: ABdhPJyKgLJ2m4hcxExDAE3fVDTnLWLxr52wnD8yrx28hYE/6/XuxCVgGEk30Ufw4VkJNevprL68Ew==
X-Received: by 2002:a05:6102:3e95:: with SMTP id
 m21mr5216026vsv.77.1639492755170; 
 Tue, 14 Dec 2021 06:39:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v81sm4411396vsv.14.2021.12.14.06.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 06:39:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 542B81FF96;
 Tue, 14 Dec 2021 14:39:12 +0000 (GMT)
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/6] target/arm: Move arm_pamax out of line
Date: Tue, 14 Dec 2021 14:36:05 +0000
In-reply-to: <20211208231154.392029-3-richard.henderson@linaro.org>
Message-ID: <87bl1ji73j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x932.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

A little follow on comment in the commit message would be useful:

  We will shortly need to access PAMax outside of the internals of the tran=
slator.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

