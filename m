Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A38862AE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 23:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov4gs-0006Ui-LV; Tue, 15 Nov 2022 17:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ov4gk-0006Pv-CX
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:45:54 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ov4gf-0002mx-Lx
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:45:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so184544wmi.3
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 14:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXaURXNLa2Ka3P8IYl4ax/39kAXY0ICMv+19eliBBOI=;
 b=wxIcZWjopmlJk3S1qwNYXJhGyTxCJvwbQSn2eGrToS6jiEdn3RVxAJ+JEcPtrunhNK
 9QY6rjIpi8QsVPmzbZboFb7i025hvUmnc4G6aUH2xCnXsHN9qlm5pO8sv7NJLG1zDYVL
 t+GdsyqPYCn8DEICUh8/oZX6E+Up49jHf55Fh1aQew7+PAbSPatZlA3NoHulQOmPXGXF
 zdEwZERzZ0hSPsOjEZnkenVJdgpLd6kSXPGJAykCyzDjKhwGZ9yHyN0UYOlty//BZSz9
 pXxuELkTB1PREMODaRwZKetgkUdv3pgiapbZb5mKhgGEcBDD8KiqXVVWT26qEpALg6Il
 pByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NXaURXNLa2Ka3P8IYl4ax/39kAXY0ICMv+19eliBBOI=;
 b=AR+wenuY3zSa0F4ynhOfPXXN78dsnE7ViECbDMfcfGjk1eaxT68Qyzoco6X/B8LXQE
 ZPmsW7A41JlXFedJfelG0Exddf+e2lzftrOmXSaHHPu7KjLk01we9cIBboXEnl5ascZS
 r5C7vAY5ba+ms4awfKQ/s0T0xQqRyxkTyTSJJ2Vkc6lcu1jOE/TlFcPlmEiGYkom2kbd
 4fngT4pVAVHJ+bf/lwSDw7ML1BVwsOSYzPlHbsPUowkdaktRdaJQTJUBv4p7YPqOJ6yg
 VZYf77+OUxWeYE2wTfsLhq6Uf1ftCRoF7lGgH6ZZcnvtnwyifOMpLUG1fU4+IYdzEtRg
 Fc0g==
X-Gm-Message-State: ANoB5pksl+Iu9Xw56vbPhmpzMAtIat2Fuuz30BqDXYwIglKjCK9snxjy
 W34tn8G0Z2GCvgG8RQ9ib7dUpA==
X-Google-Smtp-Source: AA0mqf5nDkOvfMZfKgMYV7n8K0AFXQqI5qIv/fYrBqE2xpSgxnLIvpK2ZKblJeLjEoBKaSh/wncFoA==
X-Received: by 2002:a05:600c:2053:b0:3cf:b49e:1638 with SMTP id
 p19-20020a05600c205300b003cfb49e1638mr281940wmg.50.1668552346675; 
 Tue, 15 Nov 2022 14:45:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r128-20020a1c4486000000b003cf75f56105sm96153wma.41.2022.11.15.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 14:45:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C99551FFB7;
 Tue, 15 Nov 2022 22:45:45 +0000 (GMT)
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Date: Tue, 15 Nov 2022 22:36:07 +0000
In-reply-to: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
Message-ID: <878rkbalba.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Hello,
>
> I have been wrestling with what might be a bug in the plugin memory
> callbacks. The immediate error is that I hit the
> `g_assert_not_reached()` in the 'default:' case in
> qemu_plugin_vcpu_mem_cb, indicating the callback type was invalid. When
> breaking on this assertion in gdb, the contents of cpu->plugin_mem_cbs
> are obviously bogus (`len` was absurdly high, for example).  After doing
> some further digging/instrumenting, I eventually found that
> `free_dyn_cb_arr(void *p, ...)` is being called shortly before the
> assertion is hit with `p` pointing to the same address as
> `cpu->plugin_mem_cbs` will later hold at assertion-time. We are freeing
> the memory still pointed to by `cpu->plugin_mem_cbs`.
>
> I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at=
 the
> end of an instruction/TB's execution, so its not exactly clear to me how =
this
> is occurring. However, I suspect it may be relevant that we are calling
> `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.

Hmm I'm going to have to remind myself about how this bit works.

>
> I have additionally found that the below addition allows me to run succes=
sfully
> without hitting the assert:
>
> diff --git a/plugins/core.c b/plugins/core.c
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -427,9 +427,14 @@ static bool free_dyn_cb_arr(void *p, uint32_t h, voi=
d *userp)
>
>  void qemu_plugin_flush_cb(void)
>  {
> +    CPUState *cpu;
>      qht_iter_remove(&plugin.dyn_cb_arr_ht, free_dyn_cb_arr, NULL);
>      qht_reset(&plugin.dyn_cb_arr_ht);
>
> +    CPU_FOREACH(cpu) {
> +        cpu->plugin_mem_cbs =3D NULL;
> +    }
> +

This is essentially qemu_plugin_disable_mem_helpers() but for all CPUs.
I think we should be able to treat the CPUs separately.

>      plugin_cb__simple(QEMU_PLUGIN_EV_FLUSH);
>  }
>
> Unfortunately, the workload/setup I have encountered this bug with are
> difficult to reproduce in a way suitable for sharing upstream (admittedly
> potentially because I do not fully understand the conditions necessary to
> trigger it). It is also deep into a run

How many full TB flushes have there been? You only see
qemu_plugin_flush_cb when we flush whole translation buffer (which is
something we do more often when plugins exit).

Does lowering tb-size make it easier to hit the failure mode?

> , and I haven't found a good way
> to break in gdb immediately prior to it happening in order to inspect
> it, without perturbing it enough such that it doesn't happen...

This is exactly the sort of thing rr is great for. Can you trigger it in
that?

  https://rr-project.org/

>
> I welcome any feedback or insights on how to further nail down the
> failure case and/or help in working towards an appropriate solution.
>
> Thanks!
>
> -Aaron


--=20
Alex Benn=C3=A9e

