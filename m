Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01BC64BA32
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:50:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58TI-00088d-00; Tue, 13 Dec 2022 11:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p58TG-00088I-G3
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:49:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p58TD-00017X-Qi
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:49:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ja17so5978463wmb.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZxfG6edEA7X2SntCYSAFqjY0i+iqpsC4PIKa5y/e8k=;
 b=eEz0Ss+PIFcbLagXM8gl8HpWtQkLlBPAGhnJYBs/C3ykK+8sp/uNEXx0m1pb/kp5qh
 G/B8esIQ/VguGMgz0wux9fAhf1EPe3BKqHt0HnoEsrlGxJsEAT0xS1GS/kAoibfdYgnF
 mGBzFNk7ebD0Hvfj0+7wLmZ/YL9oOu5nyqRhgFQMeWFuCZJCWk0PtjtGCKOcLoyMteIu
 5xdvUZsajYgH6l73xuGbDtUkgAYv2WoIOY29AR/slFNj89t34mBKyQPBB59cOtYtU4a8
 ZrdyEAvpJX5TbDRyqFDCXGz43L0e7WicUXUQPavJiBOAduRuY3MO6acoyYISw4pow1ob
 kTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yZxfG6edEA7X2SntCYSAFqjY0i+iqpsC4PIKa5y/e8k=;
 b=yG5MqEOHaQ0Fp/QxW009+4WpK8Se1upn5atgyqAeZcgAexPBKTFywjgXC2Eq9ZRmcE
 +Zyr0maebLFnIBxUaU+7m12zouYRw05Ng46Z2R/36Fq8UnzhFrj+W5C+OVFewhWSCaWl
 0aDuqFKDgWMWi8LpooprOa5uQMlLtRwvU48fB5hfa9sLneP+GBXI79S/nTn8hb5Hgbu4
 GcUHHMWtjDVzsLlMEws561QfDvIo9sEuuEr4ZkwyNdTXnDTrJzoTDoF9QHCfvVHBHbg1
 vTsUfBR6NoUn4+hZjvKKA7lxBDeNnbt702Z8cBX3WVxMXScjfBJve+WqmdnrF+HOdtv1
 PP+Q==
X-Gm-Message-State: ANoB5plrQoGBoRFN9qOinqN9rYzJjxLcGJgwHHrnFO4b9uBHgkO7yw9M
 GXaXPmzrH+nwf+CJHA9Qyr8UXg==
X-Google-Smtp-Source: AA0mqf7+QL9n2f5J7FywhpIB8cc8rZG9AcLrGOilEYMG1rpI5nCUpayMFVdUs3LSK0y0wjEBSkLPFA==
X-Received: by 2002:a05:600c:4f52:b0:3cf:702b:2fd2 with SMTP id
 m18-20020a05600c4f5200b003cf702b2fd2mr15853486wmq.3.1670950170206; 
 Tue, 13 Dec 2022 08:49:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003c6f8d30e40sm14912534wms.31.2022.12.13.08.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 08:49:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B0E31FFB7;
 Tue, 13 Dec 2022 16:49:29 +0000 (GMT)
References: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: wanghw364 <wanghw364@163.com>
Cc: qemu-devel@nongnu.org
Subject: Re: QEMU function trace
Date: Tue, 13 Dec 2022 16:44:29 +0000
In-reply-to: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
Message-ID: <87y1rbjlk6.fsf@linaro.org>
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


wanghw364 <wanghw364@163.com> writes:

> Hi all,
>
> Does qemu-system-riscv64 have any plugin or tools that can support target=
 program function trace feature?
>
> It seems there is no such feature under
> link:https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/tcg-pl=
ugins.rst=20
>
> For example, we can use libexeclog.so plugin to trace target program inst=
ruction trace.
>
> In my case, when I boot linux kernel with qemu, it hangs in the halfway, =
but I don't know the hang position in
> the code,=20
>
> so I want to trace the kernel function calling trace so that I can
> find out when and where execution diverges.

Not currently but it wouldn't be super hard to write such a thing.
However currently we only have debug symbols available for linux-user so
that is all the helper qemu_plugin_insn_symbol() will see.

You need to teach the linux kernel loader to understand and relocate
symbols from an ELF kernel image. Alternatively you could extract then
and feed them directly to the plugin. It would then be fairly trivial to
stick an execution callback at every function entrance.

I suspect KASLR messes things up though.

>
> Thanks.=20


--=20
Alex Benn=C3=A9e

