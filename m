Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7660DC6E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 09:47:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onb4j-0007Kk-NT; Wed, 26 Oct 2022 03:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onb4g-00070T-6F
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 03:43:42 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onb4c-0004eE-78
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 03:43:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o4so16691140wrq.6
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5vrcq4pNowyiZB4TqLdKWEnMMXrMiqxKlzblHvQVnE=;
 b=OXpDi9jAjGp700DLv9LPcA84BuKYPo9RBbW5UwqfW3Mqlb+XRkSRrs0OhwwGAZLpco
 AunjDRL0XUu1ZhxiVIXAVihNIiaMRuTwpZuN9hzQMNLKr1F+JG1LCPQaue6Wusi7IP0q
 cAqPpXb9XJ67n6OsxGDPrjzfsUOcFT8sauhCOXzv+6rkaN9jtlzz+uW8mXsoqzA/b4fn
 W0ZQxpSgSjKJthgeGXMAD9Uhw7IvfsBSCgkUuzNniPotVDy1sKhKFCbBmOMvY4YaJu/e
 eaT++iqSnybRxDeyrdsCTS0JVfg3xqVPwAXWESKxAnKlEL+VMdqxl15FwObRF4i5OBSD
 XAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q5vrcq4pNowyiZB4TqLdKWEnMMXrMiqxKlzblHvQVnE=;
 b=0PKLx/koH3nG7pMKimBMQBSewn6Pwaocx/YrsFh3qVlqov8ocPUhyoWdpY8Ru3Yovl
 Ahd8fVPzBMbRCVbjutiRetUZQjTDcBMR/2in6TcBO3oB+rq6py6RwlitEhOaK/ne9hV+
 ltCvlSGT6xqOzS0LvN3XWqL7EXC/XV6zcjO2M/zXFeFJ9tOQ3JXGzWr0mgJSD8i6lpsE
 vCVJyAWu/6WBbKBunMGUkIxe6aSsZDjSSj5XZ6p3ceOj1mmgAIeFw4pIHTo1bnEadAmg
 79DA9qIPe+h5aq1oh7p70GypLawh9S+4MuBA0ybumUfwIeOWxyuUHVyYaH8vrVNfQkjl
 T0Gg==
X-Gm-Message-State: ACrzQf2OixYm8uKd1KCRsNby501F1Ya9cJdWpPZ4m6YTm0Im3qmoE7DL
 l6kaKO1T8vpkFUqYEDQxJKsLx/MZ08f4mA==
X-Google-Smtp-Source: AMsMyM62ZjxktGurIB9Ok5fhVztK0IEt8girSupm154F3ZtsGf1xb/1nUjnreBUF6PwIrC6TBgy+iA==
X-Received: by 2002:a05:6000:178c:b0:231:ce45:7e00 with SMTP id
 e12-20020a056000178c00b00231ce457e00mr28138793wrg.598.1666770215131; 
 Wed, 26 Oct 2022 00:43:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a056000009100b0022eafed36ebsm4559292wrx.73.2022.10.26.00.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 00:43:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 757E01FFB7;
 Wed, 26 Oct 2022 08:43:33 +0100 (BST)
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
 <20220728135503.1060062-2-alex.bennee@linaro.org>
 <DM4PR12MB5168A6071D5A3A961E0CCB69B6309@DM4PR12MB5168.namprd12.prod.outlook.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yajun Wu <yajunw@nvidia.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH  v2 1/4] hw/virtio: incorporate backend features in
 features
Date: Wed, 26 Oct 2022 08:41:53 +0100
In-reply-to: <DM4PR12MB5168A6071D5A3A961E0CCB69B6309@DM4PR12MB5168.namprd12.prod.outlook.com>
Message-ID: <877d0n58t6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Yajun Wu <yajunw@nvidia.com> writes:

> Hi Alex,
>
> With this change, VHOST_USER_F_PROTOCOL_FEATURES bit will be set to
> backend for virtio block device (previously not).
>
> From https://www.qemu.org/docs/master/interop/vhost-user.html spec:
> If VHOST_USER_F_PROTOCOL_FEATURES has not been negotiated, the ring start=
s directly in the enabled state.
> If VHOST_USER_F_PROTOCOL_FEATURES has been negotiated, the ring is
> initialized in a disabled state and is enabled by
> VHOST_USER_SET_VRING_ENABLE with parameter 1.
>
> Vhost-user-blk won't send out VHOST_USER_SET_VRING_ENABLE today.=20
> Backend gets VHOST_USER_F_PROTOCOL_FEATURES negotiated and can't get VHOS=
T_USER_SET_VRING_ENABLE.
> VQs keep in disabled state.

If the backend advertises protocol features but the stub doesn't support
it how does it get enabled?

The testing I did was mostly by hand with the gpio backend and using the
qtests. I Think we need to add some acceptance testing into avocado with
some real daemons because I don't think we have enough coverage with the
current qtest approach.

>
> Can you check on this scenario?
>
> Thanks
>
> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+yajunw=3Dnvidia.com@nongnu.org> On B=
ehalf Of Alex Benn=C3=A9e
> Sent: Thursday, July 28, 2022 9:55 PM
> To: qemu-devel@nongnu.org
> Cc: mst@redhat.com; Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Subject: [PATCH v2 1/4] hw/virtio: incorporate backend features in featur=
es
>
> External email: Use caution opening links or attachments
>
>
> There are some extra bits used over a vhost-user connection which are hid=
den from the device itself. We need to set them here to ensure we enable th=
ings like the protocol extensions.
>
> Currently net/vhost-user.c has it's own inscrutable way of persisting thi=
s data but it really should live in the core vhost_user code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>
> ---
>  hw/virtio/vhost-user.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c index 75b8df=
21a4..1936a44e82 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1460,7 +1460,14 @@ static int vhost_user_set_features(struct vhost_de=
v *dev,
>       */
>      bool log_enabled =3D features & (0x1ULL << VHOST_F_LOG_ALL);
>
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
> +    /*
> +     * We need to include any extra backend only feature bits that
> +     * might be needed by our device. Currently this includes the
> +     * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
> +     * features.
> +     */
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
> +                              features | dev->backend_features,
>                                log_enabled);  }


--=20
Alex Benn=C3=A9e

