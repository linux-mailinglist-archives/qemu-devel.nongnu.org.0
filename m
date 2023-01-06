Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4D660190
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 14:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDn97-00039t-IU; Fri, 06 Jan 2023 08:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDn96-000374-6Y
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:52:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDn94-0007KT-9O
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:52:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so3583269wmb.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 05:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIgEEQtwGVaGiAEM/YmeDtFYsm0I6hxDS0XEEAYVzek=;
 b=sM4+sH0f94KcJ/cixTNXbCuzH/vg3AkZxoPDvReaZMFEcbfz9fbBGEHvJSD+Wm8+v6
 /yQF58PGgskr0oX12xKZkGYHi66CAKy76Ay7BIaMIzseUF9LFxz985M6FC5dRIKHPqN6
 1Dz8p+Yh7RP/GzFBPkkQSc2oOc/ycPDI/Wd69MBOLwqIIY5ld2Zi+Pti3UUdNIF6b790
 U4syN1NlnzI6xyejgPl1ZT/N6WA6qDZK51EoERn487WY5nkfdcHVWE7PxM/UK4xqoNaV
 iYSlo3rzZaCo8IwmxT0doT0nbxVl7pRmnQ8ILml2R7zdgfHdZQNi5007Ph7p8xPfn2GO
 jwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AIgEEQtwGVaGiAEM/YmeDtFYsm0I6hxDS0XEEAYVzek=;
 b=t6cH2sj/vRDrQGf8yiO+FVSzVBLVupipE9HJA/iDvFBnvCjPRlN75QODqn+I3eaok2
 j88fhHpypfYwF4HpUCavHcFG2tqpnHYFb2XzbOUNHXG3bqlTsHOc+qTEiw+XsRfOWDse
 MWTW5ScBvRhGJYMmyFz/LBZF7PZrOToQ1mOFEiA59v5F1WS8eMiZCSoGgth8gyjR0ysu
 wDV7e2sdbhT9jDJSOQo3ajo8w+3H5hYEMD/3ZR92sriuZEAxuaS3nz6BXk7yW+gUSWw5
 vPsnsUrbZCtdf5OJ1GpAP8T6wnXbZFjZthqsOt4sniGT/XhjZW3lu5sUyq5XM0m/qGSD
 SJng==
X-Gm-Message-State: AFqh2kqXSBWanUpuu7JCI+mNyK2WWX9+oHDfdr/KVfANYiwqW0pCY+NO
 7kZa5bcn0vJjMT4mXTynKV+uyDwEBtxYUyXj
X-Google-Smtp-Source: AMrXdXuU1nIEG1yVWbddSu5ndb5fkpAsXRTjtzRpI+IWAh3JDHoCpGIkDZJ0Q61gCw42DxGHa+aDDQ==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id
 ay16-20020a05600c1e1000b003d1f496e25fmr42563569wmb.16.1673013148612; 
 Fri, 06 Jan 2023 05:52:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm1726369wmj.36.2023.01.06.05.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:52:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C27831FFB7;
 Fri,  6 Jan 2023 13:52:27 +0000 (GMT)
References: <20221012014822.1242170-1-keithp@keithp.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] semihosting: Write back semihosting data before
 completion callback
Date: Fri, 06 Jan 2023 13:52:22 +0000
In-reply-to: <20221012014822.1242170-1-keithp@keithp.com>
Message-ID: <875ydjpy78.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Keith Packard <keithp@keithp.com> writes:

> 'lock_user' allocates a host buffer to shadow a target buffer,
> 'unlock_user' copies that host buffer back to the target and frees the
> host memory. If the completion function uses the target buffer, it
> must be called after unlock_user to ensure the data are present.
>
> This caused the arm-compatible TARGET_SYS_READC to fail as the
> completion function, common_semi_readc_cb, pulled data from the target
> buffer which would not have been gotten the console data.
>
> I decided to fix all instances of this pattern instead of just the
> console_read function to make things consistent and potentially fix
> bugs in other cases.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

