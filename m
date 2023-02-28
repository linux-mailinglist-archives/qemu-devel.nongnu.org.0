Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522226A56C3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxEx-0005W3-VS; Tue, 28 Feb 2023 05:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWxEo-0005Jd-PF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:29:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWxEn-0007dh-9F
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:29:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id bx12so6007219wrb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hseie5Sbq3tya5Z0AR4daJTbJmYerWl65fuFxSvz928=;
 b=qQz2ifWhgXnxZs5hNEx+HB3xc+Tj6rQzeBJNksMfyCQCSywNzfKKArwcA9wJ48ud4x
 Eh2PZVJi9NCJ9ZH+eC57dO8fpB+1g0/BEqX6y0kkc/DlE2Y21w9bMCwQ9kCyjfjZY0T4
 usc62RWm/mHJ3N6IU4OEyJxntCx+aViVHFtSBp+fV+cXzTZNO+WwtM9SzD5GO0MV8yFc
 XvoKNUJ7BNLrzsY3JbkwR0HIB232M1YoSwTfwYWvMv48a4Bwldwkmp7qyPOxK5Fyx5in
 8sRvdNdV/vpT/q93MSB+rmWF6c9lut/+00JnfVPMD0nXU4gkH1cYMwgQz37oIqkfcD3f
 ylJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hseie5Sbq3tya5Z0AR4daJTbJmYerWl65fuFxSvz928=;
 b=D45gOUOnn3ofAwc32LSbg0eyPJQ22boAbh4fpNH/v/KFS12p+Le873DQ4q1rORY8Dh
 ieGrg31SswkQXRZAqcaxdr3mGlF0ZytmoL1JPS9+3dccsWP1ApVtIj/38aJM82il22KM
 /VDCMhPXtu5wWwbab/deDAj8EiPVPbPnCqux1l2kV57vZXfU/8M9H4TAxHkbGymsuqjH
 LKryXL366cNAU65TIZ5SK5OR78li4V9ZS+C67pVQ1cdpJuKMdBh8qawry57J2mRRFzyv
 t2Zx+H5aER8mvnTch0N+BsNvg4k2ac5+PlhuxMYuBqm76ST4kM+Zjm7POG2LTl4jjf5y
 dNiw==
X-Gm-Message-State: AO0yUKVPXmxGHJztRWrMmoVM368qU9BhqQb9kamPLBRyw7dOYX6+HUCj
 eGhA4dduAhh8/e613Yb6jTpRFA==
X-Google-Smtp-Source: AK7set/RbWB6TTmgDaFfsnmijQqb62AHTFt4UwFftV5Y6MBlOLIgbp8g0b47hVeV1ZapKck5ZPlaMA==
X-Received: by 2002:adf:dd85:0:b0:2c7:efb:dded with SMTP id
 x5-20020adfdd85000000b002c70efbddedmr1712942wrl.24.1677580175374; 
 Tue, 28 Feb 2023 02:29:35 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c128a00b003dfee43863fsm15289722wmd.26.2023.02.28.02.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:29:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A60E91FFB7;
 Tue, 28 Feb 2023 10:29:34 +0000 (GMT)
References: <20230227151110.31455-1-farosas@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 0/1] ci: Speed up container stage
Date: Tue, 28 Feb 2023 10:29:18 +0000
In-reply-to: <20230227151110.31455-1-farosas@suse.de>
Message-ID: <87y1oif5gx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


Fabiano Rosas <farosas@suse.de> writes:

<snip>
>
> What do you think?
>
> Fabiano Rosas (1):
>   gitlab: Use plain docker in container-template.yml
>
>  .gitlab-ci.d/container-template.yml | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)


Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

