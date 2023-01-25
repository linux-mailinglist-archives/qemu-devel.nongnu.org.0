Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6867BDE1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKn5T-00078o-II; Wed, 25 Jan 2023 16:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKn5P-00075Y-0s
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:13:40 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKn5N-000868-3l
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:13:38 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d14so14669696wrr.9
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 13:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rhIEXn0pLuoc5qeKsCE66/f36q7EcfKoWih67jlqRc=;
 b=t0KnwWJAql55WRy4VNQhg4iHSJA/Z+HxSdfycFhUqj8rwWzSzF7mhYsgcsLoKx/dlT
 JDZnlSScs8J+WkgZUuIiNCHNgNdKw4Xpv7IZvGOHTn7VeyCzLiwHe01e7dXbjxq9YVvc
 6OVOFZYJMDC2NDhBOcSw2C1Ei/DTQIijvvlG0B+Oob+OM07lvelbzw8mlhL2EtAOaI5f
 pugsd/jU0JzQikxb+wW69+WhYQhqtsLtELJDk730JhUZJA+t9IRruANp0BKpMfwNh6+M
 2HTY7Zrybax1XJ8kAibnxthFaFwBUQTQga3wDPTMtUBhB2Sx1k3qLzcrItDBGlWqGmBB
 rH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1rhIEXn0pLuoc5qeKsCE66/f36q7EcfKoWih67jlqRc=;
 b=7AZN1XcHnQCW0HRL0Ix19QYWQYT6UlH83cLT9GO2/r0ZHa8Os1oZrqXhKdAMQ5gucb
 38ZqiEDzW//NQeKGRq90mCKnwJ4ZJ9byqTQ2WnJ52ySE6bxDpbwV00kYAsEG0zNQsbkh
 xt2THiSDdYhrz53ApQwm73hfHWDqQOBLZGPUODy07l9d/tUYp1bKKXrT40ISomPf/BY+
 ouxMt7JGw2imznI+6nOHEihByQ7jbRGhSRcf9vcdn7BIvDWPMmYhYEW+Px951fkYzYSH
 JdiUF7beoPkt+yIMs9nny+ZPqRsPo5AM+pp8UAg9jaiay2Ha2u3ZQ9bbao2omFthztov
 o75Q==
X-Gm-Message-State: AFqh2krncygARXXCVc10UJyUMAGbIU9UM0oc1XHwunLlh+7Mgi6GMf0c
 mOfbT3MoxeeHTgl0m8IMheE4IQ==
X-Google-Smtp-Source: AMrXdXs8K04BkAmYGGOB3ozwhu/qJwHs+UNMN2as9ghMk+SvxeJoItXE+OwG97BDzTONwtdfxQyYxg==
X-Received: by 2002:a05:6000:1049:b0:242:15d6:1a75 with SMTP id
 c9-20020a056000104900b0024215d61a75mr26404607wrx.66.1674681215488; 
 Wed, 25 Jan 2023 13:13:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b002bfb5618ee7sm3692468wrb.91.2023.01.25.13.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:13:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86BB71FFB7;
 Wed, 25 Jan 2023 21:13:34 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Wed, 25 Jan 2023 21:13:30 +0000
In-reply-to: <20230108023719.2466341-8-richard.henderson@linaro.org>
Message-ID: <87357yqpvl.fsf@linaro.org>
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

> This will be used by _WIN64 to return i128.  Not yet used,
> because allocation is not yet enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

