Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527030E07B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:05:48 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Lb6-0002Na-SK
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LQr-000436-JS
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:55:11 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LQo-0007nR-Lr
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:55:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id c4so22506506wru.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2ITDQP/r2L1W1XCu8Qaw8X7BE/ozWzAev5sNgtlL2wY=;
 b=jC8eFUl7Y4Fb5Gi60ZOZKYXeV+aNQzJCEdZJp4HtBXYwrJgFCGgvXsI/qFsJDXOXVR
 qyHvdt+rqZv2TYYKVsugQ6FPgs3/1aB9aPO8KWGeBAI0U+abbwwZ0z6Ibk5p+KrHwaJr
 lY32bMMzrqomQIgcI0bJYN/YC4oVkv7jZznpot9lnEOIpM267EZ9rPwfMTm135bdoAxx
 PvXvw6BgJuizjtMFTE/fkNjwcNqBXsdDN6xONHsKaCEBxWvbDibi0u3AWPUVXzBcYv0Y
 u2RVV0FuQ6CGqBY7OjPU25UD/xvxJkE81ow2Wk4bf0lgOd9vD12jJ9cBhd/duPDHFEJL
 F9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2ITDQP/r2L1W1XCu8Qaw8X7BE/ozWzAev5sNgtlL2wY=;
 b=synDRgcigkCo+mNgoC8KGI0RrlZhZUBOEzq4iayBQjCMEj31CkTAdO9Vm98AMCo2eA
 TcmhJ0ZFwzBO141r82zzpZeBAiVuakW7mvZaWQLjGOz76/oLEizCG2DvDwmL7BXnqN/K
 S8Va/5p9sfR+fNHGRca6N/iGfGZ5kfFBldFSl7Y3UTv55GrFPW8uhxYQZ04SqR85D35S
 iNajY3Y/FkMCYZWnW5S10+xkl/y2979RPo2aiaKHDe/lG22TZLpKPkplVItluQf7jMkh
 QeqTJxYbJF22a0aw0xDH6KHb12janaiDCimlTvzob4VPVFdT4U9mooeI5Rbcv/DN5HoS
 sndw==
X-Gm-Message-State: AOAM532eeMDm5NHpvuSzmBjv2h/2h0IXRoCJRMLZnQRiYAkXSOvDXo1I
 a3u6i1CKsbFvRTwaxNGmzPGsLA==
X-Google-Smtp-Source: ABdhPJxeOUSGB6kRySfZy7D3Y2NPHZtbnvLaRN04hPgv6dsUSWyVwsDInfNyd4R5e7O+SdWqDJCdGQ==
X-Received: by 2002:a05:6000:1202:: with SMTP id
 e2mr4572431wrx.328.1612371305305; 
 Wed, 03 Feb 2021 08:55:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm4411405wrq.30.2021.02.03.08.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 08:55:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 621601FF7E;
 Wed,  3 Feb 2021 16:55:03 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-22-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 21/23] hw/core/cpu: call qemu_init_vcpu in
 cpu_common_realizefn
Date: Wed, 03 Feb 2021 16:51:24 +0000
In-reply-to: <20210201100903.17309-22-cfontana@suse.de>
Message-ID: <871rdxrt08.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> move the call to qemu_init_vcpu inside cpu_common_realizefn,
> so it does not need to be done explicitly in each target cpu.
>
> Despite this, the way cpu realize is done continues to be not ideal;
>
> ideally the cpu_list_add would be done in common_cpu,
> and in this case we could avoid even more redundant open coded
> additional calls in target/xxx/cpu.c,
>
> but this cannot happen because target cpu code, plugins, etc
> now all came to rely on cpu->index
> (which is updated in cpu_list_add), since no particular order
> was defined previously, so we are stuck with the freak call
> order for the target cpu realizefn.
>
> After this patch the target/xxx/cpu.c realizefn body becomes:
>
> void mycpu_realizefn(DeviceState *dev, Error **errp)
> {
>     /* ... */
>     cpu_exec_realizefn(CPU_STATE(dev), errp);
>
>     /* ... anything that needs done pre-qemu_vcpu_init */
>
>     xcc->parent_realize(dev, errp); /* does qemu_vcpu_init */
>
>     /* ... anything that needs to be done after qemu_vcpu_init */
> }

Uggh, introducing a magic order seems like inviting trouble for later
on. Is there anyway we can improve things? Paolo?

--=20
Alex Benn=C3=A9e

