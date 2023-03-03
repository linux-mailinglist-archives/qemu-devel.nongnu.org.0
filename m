Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD66A9C80
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:58:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8j7-00041T-2P; Fri, 03 Mar 2023 11:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY8j4-0003rm-7w
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:57:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY8j2-0004ON-I6
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:57:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1654961wmq.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRKkB/7SCqQKf0SyAmt/Xgo8DfBUANB3Xb3LOPqtnM4=;
 b=w1Mwbu7UQFls/4I/rgLpeRYD403ULBJm7pZXqRs+Hgt+JkC9TZyaHTg6Kni/xR8ZEM
 5x6UGyRvILtO+V1gd1sxuFkGuD9KPRhJJ1HEbAOjPZvb6x9cDbTsdjE/lVKhdabbXJOd
 UE/swpgAhVGLG2UUcbYsDfJqhX0bGTQsInN+8dyO+a7H1Ljp8gb3zOC2tNZDVpXVefba
 pS74HWP4/lU5OwD2AIaZHC5Jvn7mhHT5H4IVRsQMb27watzVrTbWdUPyablv/rsrP7Cd
 +QNP+loC2a6LcJGAUuX3QXz23u3z8Yjy6UT+Mab3+soR63qLfPvq4csu1+1XaOtRFK+e
 p22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fRKkB/7SCqQKf0SyAmt/Xgo8DfBUANB3Xb3LOPqtnM4=;
 b=sWMuMFdj2l7mXIpJa838APYk8iAYq2zlwfnoAC4T8MVcUZ1qIbeNJeVZwYRD1CV/O1
 yGHx/0zZEK4NxScy7ErlPIK1+4JqOVnUjdMCwY4yCQdhgtXph9OYEez2aXDHS3UNP8k9
 GK+6rkVKAV4/BFGsRwh8YS4gzdesTUOmeRZbh37upGKSI2fRIca9c/joPTVlQ8IxnKPs
 1H0j+FUP0Hf3DNKKNqyGd4dGUfClVAI0TuRUPAkyGYaLzlK15wHgftQh98LP1emrHFjD
 FpyhyJ6vpK1e4DxIuFbNChbWcJDRlyHWhq1tfjh9LAUu/3uRt33f9ouN7q/67ss9lqcP
 0f6A==
X-Gm-Message-State: AO0yUKW97eUKMdljmdm7B/AkuxVdNqw2Se5SeMc+qJM9GXVJVy752sMS
 OUGVaEJx/wqDs8sxJmbbb8hP1A==
X-Google-Smtp-Source: AK7set9mi6unoWy3w8eifRnpag6Uxxg9A3DbL+mT5tTEcgvEFBUdc6Zq3mzc5FwlCv8NLBd28bNP7A==
X-Received: by 2002:a05:600c:1906:b0:3eb:3c76:c23c with SMTP id
 j6-20020a05600c190600b003eb3c76c23cmr2202491wmq.3.1677862662445; 
 Fri, 03 Mar 2023 08:57:42 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003daf6e3bc2fsm10876312wmq.1.2023.03.03.08.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 08:57:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 710661FFB7;
 Fri,  3 Mar 2023 16:57:41 +0000 (GMT)
References: <20230301024737.1210851-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, aaron@os.amperecomputing.com,
 frederic.petrot@univ-grenoble-alpes.fr
Subject: Re: [PATCH 0/2] plugin: fix clearing of plugin_mem_cbs on TB exit
Date: Fri, 03 Mar 2023 16:57:11 +0000
In-reply-to: <20230301024737.1210851-1-richard.henderson@linaro.org>
Message-ID: <874jr193i2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> Supercedes: <20230222043204.941336-1-cota@braap.org>
> ("[PATCH] plugin: fix clearing of plugin_mem_cbs before TB exit")
>
> Let's handle this as we do can_do_io, and reset the value in C.

Queued to plugins/next, thanks.

I've manually fixed up the #ifdefs and called
plugin_gen_disable_mem_helpers() directly as Emilio recommended.

>
>
> r~
>
>
> Richard Henderson (2):
>   tcg: Clear plugin_mem_cbs on TB exit
>   include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
>
>  include/qemu/plugin.h       | 4 ----
>  accel/tcg/cpu-exec-common.c | 4 ++++
>  accel/tcg/cpu-exec.c        | 5 +++--
>  3 files changed, 7 insertions(+), 6 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

