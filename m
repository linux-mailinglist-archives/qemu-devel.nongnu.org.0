Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5353B544
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 10:42:13 +0200 (CEST)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwgPE-0003bJ-1u
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 04:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwgMk-0002la-5r
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 04:39:38 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwgMi-0003vs-6u
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 04:39:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id s12so1352455ejx.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BgxDmflc0PC/0Mf94t4ro5pjMIF7pBWBQGTETuN7BtI=;
 b=r1OMep5jdBoa8XgXiKkyit5/7pLWDGRq/VLeMpUvz46ggYo+GSS2mhRFWNIbaP5Alj
 AC1PwvQAvgbbRmG/jA5dqeEOubcYOMSMIdeUczNlhOFMpSjfBnjPsKP9TkxjLyPEwf5V
 JBRceCOwIaJb3Nq9E5rzmfaK9nLbY69S7q1DdimQG5yuxZgzuwnQ3WZJCtwl0E+FghSf
 0ooG7LiFqGcCnMhTdG2VkWNA3EeuXqtbSeI+fBP74GeMNV81hSeC4Vcfvi8Ve3M/urKM
 LlfaMWsRMmE/0Brde0f/ddiQvebClKiQ9aqq60iumSIjP3bg8T16UETWTjsfEZPWRC+I
 ZJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BgxDmflc0PC/0Mf94t4ro5pjMIF7pBWBQGTETuN7BtI=;
 b=zSDuJxK4ov453hDhhuvzk3Pq00mUwbJChPTYiyuOsQeNdSqgflNRAYKmUVs2pcdWMI
 IJQKlHCrOVKK+00KyM+BJeQ821LO/0iNWwg67I/wKrnZeY+7EHk4CcfVr3Ub5uio7elv
 RrAYSaTqx9vqfgZ9A554GDM8FrWkpkRniCUE98mJgwJRQh5sv9foVK8Kqd5+gl1YfGof
 3Yh1pVT+oCXF4XcnsGAOFpwg1TdggPJzBGtKcyd/u+OjY+4JrvGNKAc93FMgHZtfQr4l
 uQc5t9vIrJlkEIeO8P+t2IXxMFXDNU7KHFmP8d+2D/qPcPxjVR4MYGapvj80BxiumRPW
 N61w==
X-Gm-Message-State: AOAM531Fs6PsLWucfqDf56WEUBNzOS7eOjAh6kuw54ArUQ2oYnB0EmS7
 CnmzlvCNGkd2umJ38V26Rtrb9A==
X-Google-Smtp-Source: ABdhPJx3Icy164JusxYugvMGViFoTJJcZuosdJmk6JLg80iuciqdoffwGX4LfGLzXDQc6sN5UpQvdg==
X-Received: by 2002:a17:907:9895:b0:6fe:991e:efe3 with SMTP id
 ja21-20020a170907989500b006fe991eefe3mr3288846ejc.74.1654159174147; 
 Thu, 02 Jun 2022 01:39:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a056402159800b0042617ba63c2sm2164466edv.76.2022.06.02.01.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 01:39:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB25C1FFB7;
 Thu,  2 Jun 2022 09:39:32 +0100 (BST)
References: <20220525125540.50979-1-changpeng.liu@intel.com>
 <87ee09wyh0.fsf@linaro.org>
 <PH0PR11MB50934D0391B918A38DD2488EEEDF9@PH0PR11MB5093.namprd11.prod.outlook.com>
User-agent: mu4e 1.7.25; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Liu, Changpeng" <changpeng.liu@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jason Wang
 <jasowang@redhat.com>, Michael S. Tsirkin <mst@redhat.com>
Subject: Re: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized variable
Date: Thu, 02 Jun 2022 09:27:38 +0100
In-reply-to: <PH0PR11MB50934D0391B918A38DD2488EEEDF9@PH0PR11MB5093.namprd11.prod.outlook.com>
Message-ID: <87tu93v4qj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Liu, Changpeng" <changpeng.liu@intel.com> writes:

>> -----Original Message-----
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Sent: Tuesday, May 31, 2022 10:46 PM
>> To: Liu, Changpeng <changpeng.liu@intel.com>
>> Cc: qemu-devel@nongnu.org
>> Subject: Re: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized v=
ariable
>>=20
>>=20
>> Changpeng Liu <changpeng.liu@intel.com> writes:
>>=20
>> > Variable `vdev` in `struct vhost_dev` will not be ready
>> > until start the device, so let's not use it for the error
>> > output here.
>>=20
>> This seems to be one of the areas where vhost_user_backend_dev_init and
>> vhost_dev_init do things differently. Is there any particular reason why
>> we couldn't initialise hdev->vdev consistently at init time?
> vhost_dev_init() set hdev->vdev to NULL, and vhost_dev_start() set it to =
VirtIODevice,
> it's consistent, they are common APIs designed for vhost-kernel and
> vhost-user.

Ahh vhost_user_backend_dev_init actually sets VhostUserBackend->vdev
right before calling vhost_dev_init during it's realize phase.

There is definitely some scope for rationalisation here given we know
the type at realize. Why delay setting it?

It looks like this all came in with c471ad0e9b (vhost_net: device IOTLB
support).

>>=20
>> >
>> > Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when
>> supported")
>> >
>> > Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
>> > ---
>> >  hw/virtio/vhost-user.c | 8 +++-----
>> >  1 file changed, 3 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> > index b040c1ad2b..0594178224 100644
>> > --- a/hw/virtio/vhost-user.c
>> > +++ b/hw/virtio/vhost-user.c
>> > @@ -2031,18 +2031,16 @@ static int vhost_user_backend_init(struct
>> vhost_dev *dev, void *opaque,
>> >          if (supports_f_config) {
>> >              if (!virtio_has_feature(protocol_features,
>> >                                      VHOST_USER_PROTOCOL_F_CONFIG)) {
>> > -                error_setg(errp, "vhost-user device %s expecting "
>> > +                error_setg(errp, "vhost-user device expecting "
>> >                             "VHOST_USER_PROTOCOL_F_CONFIG but the vhos=
t-user
>> backend does "
>> > -                           "not support it.", dev->vdev->name);
>> > +                           "not support it.");
>> >                  return -EPROTO;
>> >              }
>> >          } else {
>> >              if (virtio_has_feature(protocol_features,
>> >                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
>> >                  warn_reportf_err(*errp, "vhost-user backend supports "
>> > -                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
>> > -                                 "device %s but QEMU does not.",
>> > -                                 dev->vdev->name);
>> > +                                 "VHOST_USER_PROTOCOL_F_CONFIG but QE=
MU does not.");
>> >                  protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_=
F_CONFIG);
>> >              }
>> >          }
>>=20
>>=20
>> --
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

