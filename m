Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961EB63D475
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LGr-0000Ap-6J; Wed, 30 Nov 2022 06:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LGo-0000AU-Ar
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:28:54 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LGm-0007Kn-Lw
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:28:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so26584944wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TbnjGNviPSK9NHCQBEm1Nt++imUJcAe0chb4Eikv4u8=;
 b=sucTL4zlSebZ8lFHQYb9WxdxiREZ1vld1beNTE6sNeCOC60exolYm+wtTOmhevN1Yl
 r+yXIeUP/kYvTwmKGwWqDU1Pu4Oqz+E/k4mHhzipBjeaNKAByZ13TVxcUdhFdm+fzb6x
 8jMH/bI4bLRy2vrMy73zL8R9IxfeQHhoNTzXLxEDfLud/mHGLbzOCsxMBFBrcK1gaODR
 o2DMnZO9Hb3FYUjEUjPidUUp2Lal5mcbOOXBUMKiOyJ2x7eK+Mx6eENuKs1D5wt6c0Fd
 qV1Fq9CbD7QWzMNCSfmrkaiNVeCcD8c7dxWP2CtPRpKoN/hm+CFe/UxeR4lRyocViEnq
 e4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TbnjGNviPSK9NHCQBEm1Nt++imUJcAe0chb4Eikv4u8=;
 b=m3GsG0aQvXErbpiEHCb5olqHfvSSqSY1ZNkV4buwlu89q4NfOCK++xpey8MxaHPPdI
 JQmSXRl0ulqxhEhw/Yaf36jF0QEcld5rEOWNjiA2q2IAxWdXG3jy5cgtyOHiL1Wiles7
 KMTlr0uxp2FOzJKa18d4kgKGUtSetydY9VttK3RWnzppMBK9FHT0vq22EgIn2sTFWms/
 ScI1c+gF5pLFyhHw3N1TcY4pvK5q5LKC9LEguSR8y45xV+pksSwnumtJCYhz37yyipPQ
 Uq5LAXdVtaZkwZWyScPiiRWGUqwVLIEC7b4m70R6lvhCIt4Aiqno0ViSu+hQisXIQPfq
 b/cA==
X-Gm-Message-State: ANoB5pmns2zlGTlV7t4sI5QXsyYu3j1n74Jx/mAUGFZYsEqEZLQMOzJk
 MUWApZuyHFJAEFnp9jfCaxnEVw==
X-Google-Smtp-Source: AA0mqf7qLG4o/Pw0dFc+q8mMOVvbUDI7lTeHpVwD3QG8tfMRVKTCPUwlIDE57BrNL9QdsF7b9p1PFA==
X-Received: by 2002:adf:f146:0:b0:242:624:8cc5 with SMTP id
 y6-20020adff146000000b0024206248cc5mr16113359wro.59.1669807730733; 
 Wed, 30 Nov 2022 03:28:50 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c444e00b003a1980d55c4sm5633616wmn.47.2022.11.30.03.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:28:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E33B31FFB7;
 Wed, 30 Nov 2022 11:28:49 +0000 (GMT)
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-8-alex.bennee@linaro.org>
 <4B9A0F71-8134-476F-ADFB-22FCFC142462@nutanix.com>
 <20221129002939-mutt-send-email-mst@kernel.org>
 <0D6478DF-5A53-43DA-9521-9EFD08CA1A59@nutanix.com>
 <87wn7cd9f3.fsf@linaro.org>
 <20221130052824-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "slp@redhat.com" <slp@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:Block layer core"
 <qemu-block@nongnu.org>
Subject: Re: [PATCH  v3 7/7] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Wed, 30 Nov 2022 11:28:36 +0000
In-reply-to: <20221130052824-mutt-send-email-mst@kernel.org>
Message-ID: <87sfi0d6ku.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> On Wed, Nov 30, 2022 at 10:25:58AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Raphael Norwitz <raphael.norwitz@nutanix.com> writes:
>>=20
>> >> On Nov 29, 2022, at 12:30 AM, Michael S. Tsirkin <mst@redhat.com> wro=
te:
>> >>=20
>> >> On Tue, Nov 29, 2022 at 05:18:58AM +0000, Raphael Norwitz wrote:
>> >>>> On Nov 28, 2022, at 11:41 AM, Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
>> >>>>=20
>> >>>> ..and use for both virtio-user-blk and virtio-user-gpio. This avoids
>> >>>> the circular close by deferring shutdown due to disconnection until=
 a
>> >>>> later point. virtio-user-blk already had this mechanism in place so
>> >>>=20
>> >>> The mechanism was originally copied from virtio-net so we should
>> >>> probably fix it there too. AFAICT calling vhost_user_async_close()
>> >>> should work in net_vhost_user_event().
>> >>>=20
>> >>> Otherwise the code looks good modulo a few nits. Happy to see
>> >>> the duplicated logic is being generalized.
>> >>=20
>> >> If you do, separate patch pls and does not have to block this series.
>> >
>> > If the series is urgent my comments can be addressed later.
>>=20
>> On the surface it looks similar but the vhost-net code doesn't deal in
>> DeviceState opaques and also has invented a s->watch variable for
>> manually removing gio sources. I'm not sure I'm confident I can
>> re-factor this code and not break something so close to release.
>
> OK, that's fair.

See 20221130112439.2527228-1-alex.bennee@linaro.org for the v4 series.

--=20
Alex Benn=C3=A9e

