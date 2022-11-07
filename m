Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A520461F6AE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3W6-0004Ql-1V; Mon, 07 Nov 2022 09:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os3W3-0004Oy-KA
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:54:23 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os3Vq-000230-6l
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:54:23 -0500
Received: by mail-wr1-x435.google.com with SMTP id g12so16551471wrs.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sc0H+0gmVKP1oP3Lc8YZbSe5M9VsRpfAa6swb68wD80=;
 b=xZfyIV0sEKGpOPdpeDLh1ncn62F4ZubWU/Co/cps4799Dad3FYLz3r562cz7OkcSYY
 hQE9r3jQ+yFCZ7WuKOYK59gEWy07ddGKeZOHO1ROwSnrcoDwVea18pUkSxcegOAnUjFY
 0QEDVkNqi1p2xWecerXX+4z6JsDBzQMfks1XtoQVZL4PgdSaVuHd47v9OoG3kcIpoEPk
 UvMiwy4m9/gq5wtDmLm0rROdCH/qGOIl5NI82sQTMBW6GXXI5ktPVt/p1ffH4s2t35cv
 V6TgGKzm7qQ+/NNCPn8s4VY5j/thNg/PIdGWeXKaV0y+uZTS4M7JzhY/w3ER7eh8J1X9
 LO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sc0H+0gmVKP1oP3Lc8YZbSe5M9VsRpfAa6swb68wD80=;
 b=URoY2W+mA1ny3M8sncQ0V0+OH7cX8lczxpqXelkqiYalZ0w51naJzGGQo4RaLivZN9
 OKen82X9g7kdUdZjUBBHJSrMy5XE9+WxPDgIy5H7bryQKTpb9zCmVPa3SuxzDrMxaUi3
 kZa44unVEHbmEA8I+NYb0+cd8cc7O9K4/VuFOI1gNwL3hTyKacvwfk3bvsiuQz6IxmWw
 5DAVv7P4hKwvJOOIZxivhw0RvjgRn/LcRLo16JtTNvbp2pNbNxWh37vjM2XQwDQl7//F
 606lVQgAuGGdsMQXWeILiWDCPZPawjFQEn199leyWkldhL1aZQcP5FEz3Uvu5LFg2k2/
 69qQ==
X-Gm-Message-State: ACrzQf0akYG3hI09Rm6H16UztAKewwx+WrIBe9/UEs0j+htJX2uSO5Ge
 +HRc/vRMPWvWdWdGMsgs198A9VyifKOdRw==
X-Google-Smtp-Source: AMsMyM6z2mHcW74prtiivNltCaqfS21/ajae2W9kUlmD8mfVoZ1joQLYdt2SShzctrNV3WmiskQcvw==
X-Received: by 2002:a5d:4351:0:b0:236:c820:97b8 with SMTP id
 u17-20020a5d4351000000b00236c82097b8mr28131115wrr.699.1667832848589; 
 Mon, 07 Nov 2022 06:54:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003b47b80cec3sm12601374wmq.42.2022.11.07.06.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:54:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E4EF1FFB7;
 Mon,  7 Nov 2022 14:54:07 +0000 (GMT)
References: <20221107121407.1010913-1-alex.bennee@linaro.org>
 <20221107071516-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [RFC PATCH] hw/virtio: introduce virtio_device_should_start
Date: Mon, 07 Nov 2022 13:30:38 +0000
In-reply-to: <20221107071516-mutt-send-email-mst@kernel.org>
Message-ID: <875yfqhl2o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

> On Mon, Nov 07, 2022 at 12:14:07PM +0000, Alex Benn=C3=A9e wrote:
>> The previous fix to virtio_device_started revealed a problem in its
>> use by both the core and the device code. The core code should be able
>> to handle the device "starting" while the VM isn't running to handle
>> the restoration of migration state. To solve this duel use introduce a
>> new helper for use by the vhost-user backends who all use it to feed a
>> should_start variable.
>>=20
>> We can also pick up a change vhost_user_blk_set_status while we are at
>> it which follows the same pattern.
>>=20
>> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_sta=
rted)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>
> Hi Alex, did you actually check this under gitlab CI?

It's had a clean pass as part of my for-7.2/misc-fixes branch but I've
been unable to replicate the crash it was meant to fix locally as of
yet.

  https://gitlab.com/stsquad/qemu/-/pipelines/687366712

--=20
Alex Benn=C3=A9e

