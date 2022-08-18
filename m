Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71517597EC6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:47:50 +0200 (CEST)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZJl-00055k-HV
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOZB6-0007dB-Bt
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:38:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOZB4-0005yQ-O6
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:38:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id bs25so594891wrb.2
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 23:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=fW1cDw9USLoLQTA+gyn65FyLzqAEJWPixm0JKPhQpmo=;
 b=iw2TN8e0Pjs6j/KKdMZmnIiwxlgbVF4bErPSVzGubgEQ9cfol0wcFbmHzgvGBgJEte
 vQZnvXpdwgdla7+4d/HHMGjahG+OP0w4vphhF0+f0SMQdqTsx5lfn2kXRhV4jTLmd5rB
 BEEgbvFHdszcuys1rYPwWCgcrkdiy5fp8MbWU5Zi6H6ajcBgha4IFRTTBhcjrPM0OtrO
 1+/DNl52WKwb4SfpncGsEE2Q7/BKEg6HABdUrjlW5gfc2Iv8XJVy1esP/lkK5QcTDCXT
 gPTgnsktjwwyyBcqFP+aDvW8W4s81ibt2g6/LMsL7q623t5LA5lIyeq+Td6qH54+8dcK
 AoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=fW1cDw9USLoLQTA+gyn65FyLzqAEJWPixm0JKPhQpmo=;
 b=pbiPxmfHv7J/efugP2AYik2pOyTugXqoFynFaCe6LnSRAs6shRlQC041fS4YEJa+gw
 UUaT5TY0WKpgCEHVffVIYX2rBWbSRARIPmpnx3MrmpaO0DqDCGoLTih1s8wQmW4jfzd+
 k1EEC3JEnz9/F12aBJ+Kvs3ef0WihCefmKxdaMenIAa77FFlyhtj8Wvk8PACKH5sClh8
 l4A7BS7SAG4uM/zSFRS+a0YpzseGGT7gfz28FvJZl/gRgXquhiHdBkCks6WHV20bwkoS
 HfGd6MeFsCnvmSoESkxS4cXIkwf5St5W1QsNoOEOZWc9sf0D8SZITb4KKN4a7GSPWrmw
 6vsg==
X-Gm-Message-State: ACgBeo12GMZdFs2nOJklAZ+zAJdbT4C//oYM6eupZxVzVsqvt707rBiQ
 zasc6EWxlA58J0dPYNDcd+wlFtMXxvX+Rw==
X-Google-Smtp-Source: AA6agR7mLlWyclYcQCg/aRqX59LWpVc0Jms1m7JEYOwPqJpfeWtwKiN6InlsBc/t1/Wy93OV9f1kqg==
X-Received: by 2002:a05:6000:1c08:b0:21f:f61a:4087 with SMTP id
 ba8-20020a0560001c0800b0021ff61a4087mr704306wrb.200.1660804728242; 
 Wed, 17 Aug 2022 23:38:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c410e00b003a50924f1c0sm1056917wmi.18.2022.08.17.23.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 23:38:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F8181FFB7;
 Thu, 18 Aug 2022 07:38:46 +0100 (BST)
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
 <20220728135503.1060062-3-alex.bennee@linaro.org>
 <20220817070112-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] hw/virtio: gracefully handle unset vhost_dev vdev
Date: Thu, 18 Aug 2022 07:35:56 +0100
In-reply-to: <20220817070112-mutt-send-email-mst@kernel.org>
Message-ID: <87h72acayx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Jul 28, 2022 at 02:55:01PM +0100, Alex Benn=C3=A9e wrote:
>> I've noticed asserts firing because we query the status of vdev after
>> a vhost connection is closed down. Rather than faulting on the NULL
>> indirect just quietly reply false.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220726192150.2435175-8-alex.bennee@linaro.org>
>
> Please do not include this header when you post.

What the message id? It's added by b4 to track when the message was last
posted. On my PRs I often have two message id's, one from the series
where I picked it up and one from the last time my series was posted. I
usually only edit them down so I'm not repeating it for each iteration
of a series.

>
>
>> ---
>>  hw/virtio/vhost.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 0827d631c0..f758f177bb 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -306,7 +306,7 @@ static inline void vhost_dev_log_resize(struct vhost=
_dev *dev, uint64_t size)
>>      dev->log_size =3D size;
>>  }
>>=20=20
>> -static int vhost_dev_has_iommu(struct vhost_dev *dev)
>> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
>>  {
>>      VirtIODevice *vdev =3D dev->vdev;
>>=20=20
>> @@ -316,8 +316,12 @@ static int vhost_dev_has_iommu(struct vhost_dev *de=
v)
>>       * does not have IOMMU, there's no need to enable this feature
>>       * which may cause unnecessary IOTLB miss/update transactions.
>>       */
>> -    return virtio_bus_device_iommu_enabled(vdev) &&
>> -           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> +    if (vdev) {
>> +        return virtio_bus_device_iommu_enabled(vdev) &&
>> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> +    } else {
>> +        return false;
>> +    }
>>  }
>>=20=20
>>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>> --=20
>> 2.30.2


--=20
Alex Benn=C3=A9e

