Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D0620EC6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:23:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMgl-00016n-Es; Tue, 08 Nov 2022 06:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osMgj-00016C-AR
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:22:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osMgh-0006SS-78
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:22:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id cl5so20439093wrb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQQVfxGXslFxaIYTIhDazAibkGiGo8meDy3HCi/DvrE=;
 b=bYBSjC43GcWawHK5hAk+w8hGlFQDosmIdhpOVCMQ/WJFZbF21ZwkN7HvEk5tUfqgbv
 XUUWkih7pdikHcUvrXtLWxLuFxTevwZTGLNlq086U6jBoS60nr0p8V2cj9uNzqCwykPs
 x+HpbRwnz3nO3Rt5zCTYskCkna67paqMIfGbbU7mPpo4xgCBdXjQwNg9hzUyAfhX+syu
 JALor57jM2MvtvJ2UmsXKy8A6DkHNtNzbGxDM8Szi+3qDVl+RUw1H/NioaE0qqXQaFDQ
 BAmuSRdO93fjfFjbyh7YoffE8/h1kmkKfPcKQhz/R6GkTYithi15j3ow9S2jwapW7/uG
 DgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RQQVfxGXslFxaIYTIhDazAibkGiGo8meDy3HCi/DvrE=;
 b=7/dcgzBdwHf+Un0uG+o6ufPO7QN7MAYVjIYRiZIkOw41Olc9Qcwql6189LvGnHp2Ir
 f0/lrisnS9o96/2l3/LnYaiKQRWb+MzcKsNmI6RnXsshku9Dn2dtTWxSBN+XlHWB84+Q
 KNvFGVgcWzzOk3mWVlVCWXjcuXmpslnh7lwsg7aT7dwM4AQgHFC55g2Ao6MB1BFRa7bT
 6fLcHKVwigUNJe/vH5R+rRffuCFFhEkRugghF2WSSSIuNFhOfS2bQg/bp0Fm9IVlyY09
 AfLkEo+rh1fnpJnhapfTO3JupzCpEE5EhrbUpGyFYI16btHafb0Qd9Bz4Jmy9vxzWsWf
 m8XA==
X-Gm-Message-State: ACrzQf11n7lHIDRGNYlgc1z0Y99p0FehwYsyV8DQuDnPPCJSVSfxJjRY
 EOXNadQeY2bANojsDHA2ICBZQQ==
X-Google-Smtp-Source: AMsMyM41mjm+KISDMC/H6y5fvn4P/T1b7Hf7B1GaL9v1aC9gr9tYBdKli15+wsaiSaBQ08tUz92W7w==
X-Received: by 2002:a5d:43c5:0:b0:236:6ff9:9167 with SMTP id
 v5-20020a5d43c5000000b002366ff99167mr35092009wrr.160.1667906552361; 
 Tue, 08 Nov 2022 03:22:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003cf57329221sm15906592wmb.14.2022.11.08.03.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:22:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B0831FFB7;
 Tue,  8 Nov 2022 11:22:31 +0000 (GMT)
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <20221108043249-mutt-send-email-mst@kernel.org>
 <8735atg2vh.fsf@linaro.org>
 <20221108052544-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v1 5/9] hw/virtio: introduce virtio_device_should_start
Date: Tue, 08 Nov 2022 11:21:26 +0000
In-reply-to: <20221108052544-mutt-send-email-mst@kernel.org>
Message-ID: <87y1slelmw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Nov 08, 2022 at 10:23:15AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Tue, Nov 08, 2022 at 09:23:04AM +0000, Alex Benn=C3=A9e wrote:
>> >> The previous fix to virtio_device_started revealed a problem in its
>> >> use by both the core and the device code. The core code should be able
>> >> to handle the device "starting" while the VM isn't running to handle
>> >> the restoration of migration state. To solve this dual use introduce a
>> >> new helper for use by the vhost-user backends who all use it to feed a
>> >> should_start variable.
>> >>=20
>> >> We can also pick up a change vhost_user_blk_set_status while we are at
>> >> it which follows the same pattern.
>> >>=20
>> >> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_=
started)
>> >> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio dev=
ice)
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> >
>> > why is this in this patchset?
>>=20
>> As per my cover letter:
>>=20
>>   Most of these patches have been posted before as single patch RFCs. A
>>   couple are already scheduled through other trees so will drop out in
>>   due course
>>=20
>> but I keep them in my tree until they are merged so I can continue to
>> soak test them (and have a stable base for my other WIP trees).
>
> That's fine just pls don't double-post them on list, certainly
> not as part of a patchset.

Why not? Is this breaking some tooling?

--=20
Alex Benn=C3=A9e

