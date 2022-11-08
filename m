Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B07620D3A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 11:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osLmr-0005l2-Pn; Tue, 08 Nov 2022 05:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osLmp-0005kk-MJ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 05:24:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osLmo-0002Eu-1I
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 05:24:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso7236698wms.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 02:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WF6j/KD3fmsCLUb/ZrngzINUgXk/+e/E3+TQ4Dk64k=;
 b=gM8kgT5LBWZExQV1vxPczuq0jcxNOvS0M9rFhY5GPTBjXa40IDJTeYjyq57jFJlbnj
 zLgjTeGqJdi698m/IgsjT743YL4DqByPzCINiHhOUpeCT+L5jCKsjo2aJGLcwQq+HlA1
 SSBdeyjrf0SCoi4v2+yFxvlQ3f3NDfoCfX2P+T0PYF5RYO8LqqTfzykWPdgTJrvtTQAx
 lyC2xXkJMaeHZqfJuT8P02aDtHPryHSRjbUeCK3N0GgrB16y/5D2QYw7l6heNo3wrsCz
 zJ0OrfpgktkE4g5h31ohZv8/d0S0GB4Yhtvt9Rg+xwaFd0aZluA1yCCceBvaAq3hXvFd
 0p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9WF6j/KD3fmsCLUb/ZrngzINUgXk/+e/E3+TQ4Dk64k=;
 b=StoxvPqY3VvIyHKx69N7GgeXb/SAOdG9e/feD69T2Qqc0sq4CHby8xyCeXkARTaKRw
 q69G5In3pnfUAJOyLaQfWaxkR79XYk2ZXM+YUBtF7c+guvhg/pNehi59zloCEH4daPLr
 k11s4qwD0gsqS+rWC35jOuIlDcZlu7YMFQRRXr0EBXmPQrmn9zdwL/2KU8sdeNMGd9Xs
 pYZd5zUkEBqXadrDNIMsxWtyuDkK9qCj+Z3pl32H5TZCQArSFJezh4Zvz7w6SEhgMidF
 PQRh+8DqXeKdwCL03rYi3m5GevQo2BAS0Fzh643x0jAjJ3ID6AQluYnOegyE/qQQ6v7w
 aFgQ==
X-Gm-Message-State: ACrzQf3fM1VTmPqnRx3mBG1VlFNZIqFVqik4NCTywAyXqrfbiRroqxpX
 tDvJdPJxVyALl/1WUXqx7OGXng==
X-Google-Smtp-Source: AMsMyM7UkcvpE81Q7Fs1CS3vbVTscZYG97rW3VlvctK4KhQH+6gO6FXGiPfRwhKdpvjbmsnsS4gVUg==
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id
 f12-20020a1cc90c000000b003b4adc79766mr36949917wmb.66.1667903091961; 
 Tue, 08 Nov 2022 02:24:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600c4e0a00b003cf6a55d8e8sm11121949wmq.7.2022.11.08.02.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 02:24:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6CF21FFB7;
 Tue,  8 Nov 2022 10:24:50 +0000 (GMT)
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <20221108043249-mutt-send-email-mst@kernel.org>
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
Date: Tue, 08 Nov 2022 10:23:15 +0000
In-reply-to: <20221108043249-mutt-send-email-mst@kernel.org>
Message-ID: <8735atg2vh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Nov 08, 2022 at 09:23:04AM +0000, Alex Benn=C3=A9e wrote:
>> The previous fix to virtio_device_started revealed a problem in its
>> use by both the core and the device code. The core code should be able
>> to handle the device "starting" while the VM isn't running to handle
>> the restoration of migration state. To solve this dual use introduce a
>> new helper for use by the vhost-user backends who all use it to feed a
>> should_start variable.
>>=20
>> We can also pick up a change vhost_user_blk_set_status while we are at
>> it which follows the same pattern.
>>=20
>> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_sta=
rted)
>> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>
> why is this in this patchset?

As per my cover letter:

  Most of these patches have been posted before as single patch RFCs. A
  couple are already scheduled through other trees so will drop out in
  due course

but I keep them in my tree until they are merged so I can continue to
soak test them (and have a stable base for my other WIP trees).

--=20
Alex Benn=C3=A9e

