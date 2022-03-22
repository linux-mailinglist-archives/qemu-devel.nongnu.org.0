Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A24E43C3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:00:04 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgvS-00014y-Jv
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:00:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWgub-0000QW-Mu
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:59:09 -0400
Received: from [2a00:1450:4864:20::432] (port=40735
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWguZ-0003NX-S6
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:59:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id d7so24057233wrb.7
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wKi9MnSVWRPvxpPkPAVnJdLowmZKaelZvvY+JYNRVWo=;
 b=slWSoArEfiA3jD8evfFBOPc5NRCJJWHtoxaVvU2iym3CQxvZr5D6O2J/BbiMQpVWal
 AnDTaCyKkPgCPn7ujkmOZ+U39qXuW4YXd6V17QvSlDrfHxrYfr4qIQ59azLXLVef/VW8
 NQEvZ/TYuIgZPQkNOhxN3j/N409UznlOU75epw6CvRNyT8mL0C/DNarmbYRETRoz6g6Z
 9aGadCojEgM6cJy2bTI35689k+JOItjX7lL8zcNJZ8FA8mrNdKbKMRfBGKgPYEMdsUpc
 gJLzx1tOAtsI9cgIAQ8L8L90Ck9zMHpLjVu0KVwP6mbyFCDRkrhW7D0t3ECMsvykv8Ak
 kOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wKi9MnSVWRPvxpPkPAVnJdLowmZKaelZvvY+JYNRVWo=;
 b=CIyC6G+udRGmM7RkrJZ+NP2nC/MBfpIbowss/uED4BVx7gya20hd4Tsi1OmzyaCv50
 TIc7rXP1SHrQ+Gb/IM8LWRT4wJnpAopTB6qy9mkjyS2g2l/2T0iJ7oNBorWBYKtDXQnk
 WHyqn0j62fSMPzXvMgqfOKj4E+A3sJxoXwga3WWA7Gc2FrhCNO5/MLUPSbLw6CeeQ4mB
 IwkiV6NjJm6USsLtJhP3ZRdEv80aPZba1BRmZd//OiNT9dNOb37SmddRNKiHilv8zODW
 eeteNtuTFKJCmSPTfu6s3JEgWt744ilqRElc9KGJC/St495rXKoXhzMfFaFwKsJdedNM
 +bow==
X-Gm-Message-State: AOAM533qLnhxDEmZmmu466Zl/zBQrOh1FXkMCS3rvFGTLtG24/vkFttp
 5a+1d7ONfCRPWRw/zN4dopdDQg==
X-Google-Smtp-Source: ABdhPJyB35uxzj544J/7V74rsf7lkv5HSBSFH0sRQMfHG+dWNHQi1gXSAMHs7b4l81ubBXCb0EoR5w==
X-Received: by 2002:a05:6000:1e11:b0:203:efaa:fa87 with SMTP id
 bj17-20020a0560001e1100b00203efaafa87mr20084264wrb.411.1647964746352; 
 Tue, 22 Mar 2022 08:59:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm2167829wmq.46.2022.03.22.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:59:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8646C1FFB7;
 Tue, 22 Mar 2022 15:59:04 +0000 (GMT)
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-13-alex.bennee@linaro.org>
 <20220322095720-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH  v1 12/13] hw/virtio/vhost-user: don't suppress F_CONFIG
 when supported
Date: Tue, 22 Mar 2022 15:54:32 +0000
In-reply-to: <20220322095720-mutt-send-email-mst@kernel.org>
Message-ID: <87o81y567r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, slp@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Mar 21, 2022 at 03:30:36PM +0000, Alex Benn=C3=A9e wrote:
>> Previously we would silently suppress VHOST_USER_PROTOCOL_F_CONFIG
>> during the protocol negotiation if the QEMU stub hadn't implemented
>> the vhost_dev_config_notifier. However this isn't the only way we can
>> handle config messages, the existing vdc->get/set_config can do this
>> as well.
>
> Could you give an example where the problem is encountered please?

Well I only came across it when I realised by rpmb implementation wasn't
sending config updates to the vhost-user daemon because it only
implemented set/get_config methods.

I think vhost-user-scsi suffers from this but I'm not able to test it as
it's not clear how to do it. The vhost-user-scsi daemon want to attach
to real SCSI devices rather than a file for the block device. I guess I
need to somehow add "fake" scsi nodes to my host system which SCSI
commands can be passed to?

When was the last time vhost-user-scsi was tested with anything?

>> Lightly re-factor the code to check for both potential methods and
>> instead of silently squashing the feature error out. It is unlikely
>> that a vhost-user backend expecting to handle CONFIG messages will
>> behave correctly if they never get sent.
>
> Hmm but are you sure? Most devices work mostly fine without CONFIG
> messages, there's a chance a backend set this flag just in case
> without much thought ...

But that would be a bug right? Certainly a mismatch if something really
does want to see config messages. Again RPMB needs this because it's the
vhost-user daemon that knows the size of the device.

>> Fixes: 1c3e5a2617 ("vhost-user: back SET/GET_CONFIG requests with a prot=
ocol feature")
>
> I'm not sure whether something is broken or this is a cleanup patch.
> Fixes tag means "if you have 1c3e5a2617 you should pick this patch", so
> cleanups don't need a fixes: tag.

No I think it's broken, we just didn't notice because as you say most
devices don't need to care.

>
>
>> Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ---
>>   - we can't check for get_config/set_config as the stack squashed vdev
>>   - use vhost-user-state to transmit this
>> ---
>>  include/hw/virtio/vhost-user.h |  1 +
>>  hw/scsi/vhost-user-scsi.c      |  1 +
>>  hw/virtio/vhost-user.c         | 46 ++++++++++++++++++++++++----------
>>  3 files changed, 35 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-us=
er.h
>> index e44a41bb70..6e0e8a71a3 100644
>> --- a/include/hw/virtio/vhost-user.h
>> +++ b/include/hw/virtio/vhost-user.h
>> @@ -22,6 +22,7 @@ typedef struct VhostUserState {
>>      CharBackend *chr;
>>      VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
>>      int memory_slots;
>> +    bool supports_config;
>>  } VhostUserState;
>>=20=20
>>  bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **er=
rp);
>> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
>> index 1b2f7eed98..9be21d07ee 100644
>> --- a/hw/scsi/vhost-user-scsi.c
>> +++ b/hw/scsi/vhost-user-scsi.c
>> @@ -121,6 +121,7 @@ static void vhost_user_scsi_realize(DeviceState *dev=
, Error **errp)
>>      vsc->dev.backend_features =3D 0;
>>      vqs =3D vsc->dev.vqs;
>>=20=20
>> +    s->vhost_user.supports_config =3D true;
>>      ret =3D vhost_dev_init(&vsc->dev, &s->vhost_user,
>>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>>      if (ret < 0) {
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index b27b8c56e2..6ce082861b 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -1949,14 +1949,15 @@ static int vhost_user_postcopy_notifier(Notifier=
WithReturn *notifier,
>>  static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>>                                     Error **errp)
>>  {
>> -    uint64_t features, protocol_features, ram_slots;
>> +    uint64_t features, ram_slots;
>>      struct vhost_user *u;
>> +    VhostUserState *vus =3D (VhostUserState *) opaque;
>>      int err;
>>=20=20
>>      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER);
>>=20=20
>>      u =3D g_new0(struct vhost_user, 1);
>> -    u->user =3D opaque;
>> +    u->user =3D vus;
>>      u->dev =3D dev;
>>      dev->opaque =3D u;
>>=20=20
>> @@ -1967,6 +1968,10 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque,
>>      }
>>=20=20
>>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>> +        bool supports_f_config =3D vus->supports_config ||
>> +            (dev->config_ops && dev->config_ops->vhost_dev_config_notif=
ier);
>> +        uint64_t protocol_features;
>> +
>>          dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATUR=
ES;
>>=20=20
>>          err =3D vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURE=
S,
>> @@ -1976,19 +1981,34 @@ static int vhost_user_backend_init(struct vhost_=
dev *dev, void *opaque,
>>              return -EPROTO;
>>          }
>>=20=20
>> -        dev->protocol_features =3D
>> -            protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
>> -
>> -        if (!dev->config_ops || !dev->config_ops->vhost_dev_config_noti=
fier) {
>> -            /* Don't acknowledge CONFIG feature if device doesn't suppo=
rt it */
>> -            dev->protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F=
_CONFIG);
>> -        } else if (!(protocol_features &
>> -                    (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
>> -            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONF=
IG "
>> -                       "but backend does not support it.");
>> -            return -EINVAL;
>> +        /*
>> +         * We will use all the protocol features we support - although
>> +         * we suppress F_CONFIG if we know QEMUs internal code can not =
support
>> +         * it.
>> +         */
>> +        protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;
>> +
>> +        if (supports_f_config) {
>> +            if (!virtio_has_feature(protocol_features,
>> +                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
>> +                error_setg(errp, "vhost-user device %s expecting "
>> +                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-=
user backend does "
>> +                           "not support it.", dev->vdev->name);
>> +                return -EPROTO;
>> +            }
>> +        } else {
>> +            if (virtio_has_feature(protocol_features,
>> +                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
>> +                warn_reportf_err(*errp, "vhost-user backend supports "
>> +                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
>> +                                 "device %s but QEMU does not.",
>> +                                 dev->vdev->name);
>> +                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_=
CONFIG);
>> +            }
>>          }
>>=20=20
>> +        /* final set of protocol features */
>> +        dev->protocol_features =3D protocol_features;
>>          err =3D vhost_user_set_protocol_features(dev, dev->protocol_fea=
tures);
>>          if (err < 0) {
>>              error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
>> --=20
>> 2.30.2


--=20
Alex Benn=C3=A9e

