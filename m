Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396167BF45
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:53:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKngL-0001pW-QC; Wed, 25 Jan 2023 16:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKng5-0001ob-Fi
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:51:33 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKng3-0007Kf-O5
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:51:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id k16so14763087wms.2
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 13:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtMjrYQEvWpG2AuLNdEHTTKCQ6D1LPu1b90gG5rRUBI=;
 b=sl2jTDL2kpnjDtqoj7P93pBhaQit//zoES0nH/n1mu/dTbSgEQcBvCZ224Dg0Ucbdo
 8z6fOdDeKZ8zX0jJ+Q3BToa9zmdTV6Wj6btgML8K9AD1rSbffso14pimIF4zk3xcil7C
 aLGVY0xFITanNBYO88+xNMI+kSy7EFzrPUSWXI3M3l+1x9hvbAMVh3QayPMeAhySLTt0
 RIAqWGHP5DAf0EiW7daJZElVjQL210ANnsCHw2y9VF33fo+7Oozg7Ml6NPOD/OU4ThXD
 mD7xdDjuE3F4IXIN6VK/ZLA66Eb/Lvx0WnTuIsw67CZF1G67GiC8xsXAYzIDwsK7ke0D
 oLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gtMjrYQEvWpG2AuLNdEHTTKCQ6D1LPu1b90gG5rRUBI=;
 b=uPH3nucX1yZPrVJsWZcPTlrsNsawY9UvmS9PoxPWktSBFjWKY5GaSYsYPdcVfhg7bZ
 hJVRFEAtSW/yamIy2D5GPHe18czh9CgRXT98/4cYvlaTSvc5KAjmIcCJ+qnc1bVQsIJ9
 00nRQVB+5FF1u5YgcDvsMUweElsXlGnOccAu3KERGi4kHZ9MGxHHrgPd4XqdDfiA1YUn
 777OJh9Pr+sPLbBQDLWREDw3D9/u1T0WuZSh/HVuFYcr5PMqix+3ykaTGgJu73wu6RJi
 ObTYQgZElc4SSPYB7nNiMc9LxRgufsMaaGg3ABorr4Uyy4Ox38LoGX/7FKvJ9UlCv72p
 hlaw==
X-Gm-Message-State: AFqh2kqDOPRv7jRMnca4Sn97ayeLrd45gbvU0usYgQQOoQ6kxHSbWThn
 /1E1fWx5exJ4N6+FD8loGM0c9g==
X-Google-Smtp-Source: AMrXdXsVyq6GB3Qknv7H5TE6LfYAt0dA10avnqZsU6gWGDU6GkphiLwDFL7r9HRoAeWAKj76kcI1Sg==
X-Received: by 2002:a7b:c5cb:0:b0:3da:fac4:7da3 with SMTP id
 n11-20020a7bc5cb000000b003dafac47da3mr32834870wmk.36.1674683489842; 
 Wed, 25 Jan 2023 13:51:29 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a05600c4d9700b003db1ca20170sm2857931wmp.37.2023.01.25.13.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:51:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF2631FFB7;
 Wed, 25 Jan 2023 21:51:28 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 00/36] tcg: Support for Int128 with helpers
Date: Wed, 25 Jan 2023 21:50:55 +0000
In-reply-to: <20230108023719.2466341-1-richard.henderson@linaro.org>
Message-ID: <87y1pqp9jz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

> Changes for v4:
>   * About half of the v3 series has been merged,
>   * AArch64 host requires even argument register.
>   * target/{arm,ppc,s390x,i386} uses included here.

Have you got a branch or a new re-base? I tried applying but got messy
conflicts I couldn't cleanly resolve.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

