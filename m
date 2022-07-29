Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC75850EC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:30:01 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQ40-0000sC-QM
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHPxR-0000AG-C7
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:23:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHPxP-0005M5-N7
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:23:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso2495117wms.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4nj/+icUnoBDmTCI5GdQQE/ROVF9CE4qrYX0qcQsYa8=;
 b=GKmfzuTRzmA8RIt3JhBEvNdyTv6r02G/mPB5MWlXL8iu/6YuXtOupDrPbptXoXn7Z8
 Hk5DJEiK3muMdh02RI9cWW0uFvr8DIc3rFHj4vCgI8q73bl+uxCBD3GoGuFO5Wae4T2d
 ldikqB+7tujRhctblnyDYcEu06iIdNLX1WgFYUi22d32IoDtVB97pikEI5VEclUYPbDs
 8bL4PXSuO+BXpoWOcb+BWekUiGEo6t78ts1yPNqUbdLVCA+UNi5e2xshppn/fxcThMX2
 sp/Af9KRX0eh2VwxLLZI9a8xzpLfYqLhtedmMb7ZfT0l5Lp8kJBuJDNMtBoehbFfVu9w
 T/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4nj/+icUnoBDmTCI5GdQQE/ROVF9CE4qrYX0qcQsYa8=;
 b=GzDF3OMn1lMP1aDvhd2H/YeuhZwIl6W9A4anrFc5dNMZEbp6TUUe/8LG2jq7IdoGP3
 ZVblcctMOvd0e1eYtadl+Nun7soji1nvGlmjuyemuqX8/4Inj5I5i1DMSOviKtSdRkpK
 gU+KXCw09c4Pv/evGbUOaRxekbq0IFPraAppWi9XWeE85whPGss2WwJWAeTEA3UFqOgf
 xE/OyELJDWxKqzg+/7xrZgyJq/F6Cz6OycStylZbGX00Y3RqzeQExCeD6ds8qNzC766W
 pYQ/8dK09B+hvry1ijzpfUNC0CySLz/6TMIjivEyCkbm729SJQ/H9znbsJKs3MfED7Ob
 BKEg==
X-Gm-Message-State: AJIora9eW/azdaCE/OTm8/oyA6Tw710te9n6Z4XYg9K1BVmw1mmdZmwP
 wawOMcgfQrtpGuCsK3WovmSlg51Bu9s4Xg==
X-Google-Smtp-Source: AGRyM1u0I+C1pz/+yk3Kt1OInOcKMtbNWx1ZpwU1YhAviHI1XrqKfq3G3rIDGokgXao8zwO7JRn1Iw==
X-Received: by 2002:a05:600c:1554:b0:3a3:2e32:8a7d with SMTP id
 f20-20020a05600c155400b003a32e328a7dmr2937418wmg.70.1659100989507; 
 Fri, 29 Jul 2022 06:23:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b0039db31f6372sm9598621wmq.2.2022.07.29.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 06:23:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA4CE1FFB7;
 Fri, 29 Jul 2022 14:23:07 +0100 (BST)
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
 <8a8475c7-c720-1aef-02bb-ca4cb3c1ff68@suse.de>
 <20220728093501-mutt-send-email-mst@kernel.org>
 <be4dc741-4153-1620-223f-852ff5aa34a7@suse.de>
 <20220729061221-mutt-send-email-mst@kernel.org>
 <20edd357-716f-c84c-9714-607f7f64db5c@suse.de>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Date: Fri, 29 Jul 2022 14:21:48 +0100
In-reply-to: <20edd357-716f-c84c-9714-607f7f64db5c@suse.de>
Message-ID: <87sfmkf3yc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Claudio Fontana <cfontana@suse.de> writes:

> On 7/29/22 12:13, Michael S. Tsirkin wrote:
>> On Fri, Jul 29, 2022 at 11:46:05AM +0200, Claudio Fontana wrote:
>>>>> @@ -2025,7 +2031,6 @@ void virtio_reset(void *opaque)
>>>>>      VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
>>>>>      int i;
>>>>>=20=20
>>>>> -    virtio_set_status(vdev, 0);
>>>>>      if (current_cpu) {
>>>>>          /* Guest initiated reset */
>>>>>          vdev->device_endian =3D virtio_current_cpu_endian();
>>>>> --=20
>>>>> 2.26.2
>>>>
>>>> As you say this is incomplete ... bout could you share a bit more
>>>> of what issue does this address?
>>>>
>>>
>>> Hi, the problem I am trying to address is a segfault in OVS/dpdk that l=
ooks like this:
>>=20
>> Sorry I was not clear. What I mean is, you don't yet know why does remov=
ing
>> virtio_set_status call here prevent the crash in ovs, do you?
>>=20
>
> I have no idea. Trying to collect logs to figure things out, but as
> mentioned the logs easily hide the issue.
> Likely there is just more to study here.

Given the OVS is going off on a NULL ptr deref could it just be it's not
handling the disabling/reenabling of the virtqueues as you pause and
restart properly? I could certainly imagine a backend jumping the gun to
read a queue going very wrong if the current queue state is disabled.

--=20
Alex Benn=C3=A9e

