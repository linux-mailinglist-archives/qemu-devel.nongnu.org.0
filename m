Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0415A4324EE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:23:16 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcWLz-0007lQ-4t
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcWKk-0006Ym-Mw
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:21:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcWKi-0000wP-DO
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:21:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u8-20020a05600c440800b0030d90076dabso381398wmn.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DUaD4nvcW5SdtZm3VVyjM3pjLfoO86R6BkHLMT5qNuI=;
 b=Ad5c2whG91WvfbyWkwSsow9981bFtNVezzTSRR9h1txVQ0+OsHFkwpYbHZyXd+wkrM
 Kisfz1L5+nVgDxdDViJ85Fn1ICArD3dhR4Usxlq2F/U9RjBukezUih8CypaH6qzbuM36
 r+tGchw/ryVl5mtzR4btghgbkQP863tg+HN6l/HQ4+W/hyqL1AZ7UajeWAdTO0ynSqk3
 DsgW1M9cUlBnmXhYEPubzP15PC1r3oRBR8psZSUJfRkWUfsjFVBQmWJGwQIBQ0Dc2uvf
 1Gvd0qpmlbJpLQFfsPZeGAV9rB2hchEJEltegl2clQ5U8m/XxhFlNE4GUVpmTzidWhH+
 XHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DUaD4nvcW5SdtZm3VVyjM3pjLfoO86R6BkHLMT5qNuI=;
 b=YexJJRzwGKqFtXGsVPpmz95CT4DdkLaXAIH3jupICI0p5XkHCO0ua6cG5jaorTG6PA
 nUg62n1e2BPf2bP2MR/tjiKfD3XOLNH67iM5wX6ZmkQjAgLpnoTzLZF2V+gUidFLLm3P
 nswnUmArasQjwFzT/VPGZkuMW0pEaGgD6EMiiCCQ4B7fyG/Zrh9ktgsad1x2RcxwhZOb
 MZt7Ngn01OMURH9OtNigeHXf5qz+HTl3ecAQxWcSe20QKrFaqPnWuG0C1xYoeUO9M8DR
 uB6FJhXWJnT5nouxpaNf5hKGeit8Njq6F7qWqbtnnjukfdevaEFsZgptY71VT8APJ9sO
 cDKw==
X-Gm-Message-State: AOAM531Jw7+Sl68PkDJDSdzdFHJR/g0RYj2S2MGyRtfi68aVe8EcjB4S
 eJBn7D6hRi5eqqqHI6pK/UrVPg==
X-Google-Smtp-Source: ABdhPJwW7krSKT0tbcdNoe/vdclPcBiAGVDLI6HZSyYcAucMD0y74MNmALRMpsJ+mYilStHgGTe8rw==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr209775wmj.102.1634577714625; 
 Mon, 18 Oct 2021 10:21:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm97018wmq.13.2021.10.18.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 10:21:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 555281FF96;
 Mon, 18 Oct 2021 18:21:53 +0100 (BST)
References: <20211018140226.838137-1-alex.bennee@linaro.org>
 <139066ae-053c-8e55-da76-2b69f51f0717@redhat.com>
 <87sfwyz8n8.fsf@linaro.org>
 <726ce2e3-71e9-639e-df62-6f1cdbf8c1fc@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
Date: Mon, 18 Oct 2021 18:20:29 +0100
In-reply-to: <726ce2e3-71e9-639e-df62-6f1cdbf8c1fc@redhat.com>
Message-ID: <87fssyz1se.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Lukas =?utf-8?Q?J=C3=BCnger?= <lukas.junger@greensocs.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 18/10/21 16:53, Alex Benn=C3=A9e wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> On 18/10/21 16:02, Alex Benn=C3=A9e wrote:
>>>> While there are a number of uses in the code-base of the exit(0)
>>>> pattern it gets in the way of clean exit which can do all of it's
>>>> house-keeping. In particular it was reported that you can crash
>>>> plugins this way because TCG can still be running on other threads
>>>> when the atexit callback is called.
>>>> Use qemu_system_shutdown_request() instead. I did a gentle rename of
>>>> the runstate stub seeing as it now contains two functions.
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Reported-by: Lukas J=C3=BCnger <lukas.junger@greensocs.com>
>>>
>>> That won't work with -no-shutdown, but you can just call qmp_quit()
>>> instead.
>> How does calling qmp_quit() fix --no-shutdown? Isn't it just a thin
>> wrapper around the qemu_system_shutdown_request()?
>
> It first undoes the effect of -no-shutdown:
>
> void qmp_quit(Error **errp)
> {
>     shutdown_action =3D SHUTDOWN_ACTION_POWEROFF;

I guess this is it? I couldn't follow the chain of qemu_opts to find
what sort of change -no-shutdown made to the shutdown_action.

>     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
> }
>
> Paolo


--=20
Alex Benn=C3=A9e

