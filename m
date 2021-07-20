Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2627C3D0464
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:18:37 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5y4S-0004hh-7w
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5y1y-0001Cp-M5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:16:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5y1x-0000Q8-6p
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:16:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p15-20020a05600c358fb0290245467f26a4so429415wmq.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Rsq8l1CxOW5xxGOWWiIEtBPIo/JtrnkO2MhgyXn5OLo=;
 b=xxfF93hCIImUaTrZ8MS6TMqeonWG+XD4y/iVvqKNWIFhPuywZ5GdLeRo18Qsa30Qzt
 UjHWYMoKv6CTdSU8NXsEwWmQsS93rP4kM/iE6fIjcuwKnxofP4ClnIEw/YGM5aygo2Gj
 MukTiUYYCtmFJHaRBbF9nGec6d/8LhmuF1DpAg1NM46VyARhWWjOJO00rTiaDfLwfFDl
 UHGbpMJ55lGQZNwD7eqPh3Rljt71bM+LuW0SWax/7my5m3JRc/LshRZf/4HQLcTuJOXY
 Bg7ZBFP2Ag/76W2eug4/EtEJNRBnX6PMBsKAS6SKil2zMnsW2sb/40DbV8WbPpLb2/is
 INyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Rsq8l1CxOW5xxGOWWiIEtBPIo/JtrnkO2MhgyXn5OLo=;
 b=moEzNedPRr/YcoqdP7x5pf4/2ZVFKMcgI9khgW2jPUYqOISI8i+snHfl7jUwTwej9L
 38Ue0yduiuH1gtt4zmAGeAK/3AeQ9lcuct9FFhM8lk3S9VCcYeQ2AlAvPUOxlFKbrBvM
 ycao3eUk/j5d9ZZeQSeEVx0MbQOP99tRH5xg71iaMLMdFuPSTFiXC2pySrw5NNyBxdEV
 y1GdbQVeg8/HdnE/LP1UohbtS8KitQ2tda2mWwKuGxxBE6YN68q0hGb8w/9axONhuFUg
 FuCfT1Da2eLSRDvNNAq6qK3sXymRI3YrzlmxUyFersm2BiEwrWay/vJQgDpe2v/mwCmh
 l8kg==
X-Gm-Message-State: AOAM531aOgAPj9N8G42iqNemVII5J/JZlnl5ueRAk9j9bPDga9pp11OQ
 fT0w6TINUtv+2gXR3u43+G9dyg==
X-Google-Smtp-Source: ABdhPJyzUiLYucvTuChAJY30M5ggVQdicC9UsToPNyoL9J1QYWcnOdaCyf/5pGcAPHITV16Fnqeksg==
X-Received: by 2002:a7b:c251:: with SMTP id b17mr651177wmj.83.1626819359779;
 Tue, 20 Jul 2021 15:15:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm3184408wrc.6.2021.07.20.15.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 15:15:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4ED6E1FF7E;
 Tue, 20 Jul 2021 23:15:58 +0100 (BST)
References: <20210720164829.3949558-1-philmd@redhat.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract OpenSBI job rules to
 reusable section
Date: Tue, 20 Jul 2021 23:15:50 +0100
In-reply-to: <20210720164829.3949558-1-philmd@redhat.com>
Message-ID: <87pmvcljhd.fsf@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> All jobs depending on 'docker-opensbi' job must use at most all
> the rules that triggers it. The simplest way to ensure that
> is to always use the same rules. Extract all the rules to a
> reusable section, and include this section (with the 'extends'
> keyword) in both 'docker-opensbi' and 'build-opensbi' jobs.
>
> The problem was introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
> Add jobs to build OpenSBI firmware binaries"), but was revealed in
> commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
> container").
>
> This fix is similar to the one used with the EDK2 firmware job in
> commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
> section").
>
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Queued to for-6.1/fixes-for-rc1, thanks.

--=20
Alex Benn=C3=A9e

