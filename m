Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544906A1CE2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXz1-0001c0-7j; Fri, 24 Feb 2023 08:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVXyy-0001bM-C6
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:19:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVXyw-0002pD-S8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:19:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so2142319wms.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmSjBPzVrNlzXhaPK7WUWLQUBmZdVtXsvqDUpZj2szw=;
 b=lyiPWxK3FZOW/5mDeDihenSxiFTKeUuVEaFYDUTYsz4Z6Xy44j/hmk9sgpLfewsYJ3
 Lx1wghQoP3+k+T6sdXxHkM0ci9/xQtDjVjMbd/3e+OKL/jGKM+K674Eve326psRi0+Z7
 wLeDS9wr4JAB/bbcpggOwTpKeftEpm2js7SKNX6piWnOKakkS5GWZb6VDVRYNR4/D3JY
 tlo4si71ym4HrgHm1eMnR02GEpf27/AGBs74qVaoZpxzs1HNomQFnDKfmA/wrfAqpHAN
 HegpS+fHf4fUmYMvM5p+FB6UwDWMiaZmS4gpO5xoj9fkFpHKqZa1pZr4YNkbsq7B7/cx
 DwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nmSjBPzVrNlzXhaPK7WUWLQUBmZdVtXsvqDUpZj2szw=;
 b=S1BHmJeE8tyTFEW7EeVqWsWmjY1G2j7ZlNOXnHHd2wXlPYKkm2JrUKPVESft+Ys46N
 Zp7/S6gOqc+q4r2YxNohzJAPSiqE2NC3hqRTEtPuliupjad0LvmpN8fowdlCowef+FBR
 IFz0XdBLncHx80vPT6uV6PFCsD4W+kIgJwpKPD2amjZ/7zwLEhVSwvEFep3WCArENuY5
 t8XByvvhDi0fJpcU3NrRXQtnE0LK6R7D7M7uqVjxjdyJfAuL9PKe8yHAykukgpVtiBiW
 ymaArdvkSOJfBT7s5EC00B7PLEcYSOG7Yg3INLLp2AT5OFde+Av8FbMfWTjnoaRvLVzE
 MSWQ==
X-Gm-Message-State: AO0yUKW2/rayMC0WbCi3FffIVlMbDQ4jmBYoLNecmFFrLDmlf0fLOjSg
 8e5Gx65wBLGPhyyrjxzvD1HZYg==
X-Google-Smtp-Source: AK7set8XWoYA6ZAZJs4ztX/KV+39V/cXs/IjeXk/2E5mg6dXcLe9sAeF1VSkYdY97CyluBSw/n+FdQ==
X-Received: by 2002:a05:600c:1546:b0:3eb:246d:7efa with SMTP id
 f6-20020a05600c154600b003eb246d7efamr1105908wmg.2.1677244765231; 
 Fri, 24 Feb 2023 05:19:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003dfe549da4fsm3254182wms.18.2023.02.24.05.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:19:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 779C61FFB7;
 Fri, 24 Feb 2023 13:19:24 +0000 (GMT)
References: <20230223220404.63630-1-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth
 <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: Enable TuxRun/mips64 (big-endian) test
Date: Fri, 24 Feb 2023 13:18:48 +0000
In-reply-to: <20230223220404.63630-1-philmd@linaro.org>
Message-ID: <87ttzbnqub.fsf@linaro.org>
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Now that the previous commit ("hw/mips/gt64xxx_pci: Don't
> endian-swap GT_PCI0_CFGADDR") fixed the issue accessing
> the GT64120 PCI config-address register on big-endian
> targets, we can enable this TuxRun test.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I guess it will go through your tree.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

