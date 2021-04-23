Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA23694C0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 16:31:39 +0200 (CEST)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZwqI-0002QF-Qn
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 10:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZwoT-0001gA-2N
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:29:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZwoR-0003MN-Dr
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:29:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so1348153wmq.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=A9MpKVr2YkoIi2aRSLWsgvSI3ISAACYmfbknxhvYyeA=;
 b=QeVah84qd6SAHTLhRmg08TvOmSLUxfFG3GM9r26AeRuad5orFMk1hmT5bUDUSGLuje
 Vk4tdg+jmq/Ox24OBMFXaVL72FsLSjzSz0Cdfjgv2inVrGi8ehq4anrohel/zL5yoIWS
 fMZexcWznaHXSY/jEQ2ADe2o5D6q9dXBTlII139vA4gatP6xSQeNWSH7b/SZ8FcZEvdR
 q7wgECU5YIRfc1YMpFd/8acmN5Hd5s80/KbGm/It6CoPzC3e4A7CUSRpmlmHR09jme1M
 q1T2BmiIvAF6TA1Pin+68ZYF4rG3tunHhscY2jzm2+zRiuRlJdmK96U4+22tR+O8/Mis
 E0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=A9MpKVr2YkoIi2aRSLWsgvSI3ISAACYmfbknxhvYyeA=;
 b=ltKxEbm8LOJ82EHAX4O/t1O0lMX9vyyWlhLer/ioJIO0l/8hA+GVXDyYk7oE0ibRlg
 /kKBDhv8UFOIOEYrt4z3fHFAtPp3hze0ew0N3E7D4fj4/sz2afxOraXAbemalCZj6yIv
 NgtQvvyVlc0Y54qqE+K9eC++w+953D7eSOL0wQvKv2QqdVU8PRiSzE58SzOmRWP7K9Zc
 wGeAqYq0ot0GAz8l/FK7ptDln4pAzUS6l/WduAg3ISPqOGMRbwuf74eeX+WO2vVSW2WA
 1/sGLaNdS9FfZyLQmHHmKQv0EIL42XngnyDQFi2U4d6q9KERANBDxFI07TSZQcf0R+cY
 VIGg==
X-Gm-Message-State: AOAM530/yvMxgmi4WgKswq6ud3PajzAhbyH0CLv9IjGVE5OS4Xto5OdD
 LFjNtoZKSu7/WS8ejWNiY45JcA==
X-Google-Smtp-Source: ABdhPJyF8IOfwYvpEXRLGuAaJqiJJkrm1NxxIHimnj8f9/dSW9Jd/KqUT/YgXzm/vBNaeT+evbDaWA==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr5945563wmc.189.1619188181667; 
 Fri, 23 Apr 2021 07:29:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k7sm9370543wrw.64.2021.04.23.07.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:29:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A2F71FF7E;
 Fri, 23 Apr 2021 15:29:40 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 6/7] linux-user/alpha: Share code for
 TARGET_NR_sigaction
Date: Fri, 23 Apr 2021 15:29:23 +0100
In-reply-to: <20210422230227.314751-7-richard.henderson@linaro.org>
Message-ID: <87lf996pm3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> There's no longer a difference between the alpha code and
> the generic code.
>
> There is a type difference in target_old_sigaction.sa_flags,
> which can be resolved with a very much smaller ifdef, which
> allows us to finish sharing the target_sigaction definition.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

