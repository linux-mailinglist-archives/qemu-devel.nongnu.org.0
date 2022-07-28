Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123B583C32
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:42:49 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0ye-0007dn-7m
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH0sf-0002Qf-43
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:36:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH0sc-0006Jg-Lp
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:36:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso814142wmm.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+C1lYJ6XGpwuSJJUQRE2NQVIYkLefs8qq0pRYzV42ZA=;
 b=jhNWRGX2OJ89gVfigLDRqnVDR/LmE2kHTEBEf3yB5CnBpuDUsF8MOxIJy/EjLCQfG/
 d6tuEKzpXzMk0xLnxZFQZXzcK3XROyk499y6ec4wW2wVwhHug9FsFRMxm1vCk1RdC0UJ
 2gaZATCQph/CWht2OoYgCW7qpR5zSvr9J+yKZn3PkOz4A50WwXVi/OXhjxqfg6Twnk8T
 kpgXJMnATk5fpGpf3QsvtWiQydaWLwleWeEzT6PWKq70eWHwO9DYoXqNff6yVH5jlGhc
 s+tzd+92AqQuOwW1ph/KWhnqLV04VkxAFst6esWHiqDZBPv9GhIUMiw4ePODpngkD5HQ
 fiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+C1lYJ6XGpwuSJJUQRE2NQVIYkLefs8qq0pRYzV42ZA=;
 b=mra838Al0a82I/yUMASlb1Fy7LRfEm6Ah0FGVOQzsR26rV7Le7G09UKjOnspqb2zoZ
 0+/kgB514L588CMQPpTs8ryTUULtYRarMiU/EX36pfeZRWsjjjCT4K/wtLl7ppq0/GJJ
 IDhRxyT9kw24cAwT3ytbkwNvb2Nu7b010qMjTix1BLp7Fntwsywv1ZnWb4+uIxzhQ2zQ
 T4aXkGIMzIDtwImihJEaObx8whTX6QTGkfj/Sh+dQtHECPqCgHr3q+GANhWBEW4YhqdL
 8IaEPgh2mIvTUqpp5KLi5qmEmhe83M5pQOhBl5ey98wSPoVGF9zYA+zLooPtTfDaWN1c
 1V1g==
X-Gm-Message-State: AJIora8s3r+wR6VFTDnL0FTkP6d5onTYN6xRBFBl1zNy6RvPUi91yrn3
 WHtC7aV9ujpFEulENvlb84D6IQ==
X-Google-Smtp-Source: AGRyM1vUROji5ufTKa3SA4pJG4r/UTe8vfyz+/eQfmSIiRg9gMBv+Gjw9mxC2oVzLjhSKMvNWBD1Ng==
X-Received: by 2002:a05:600c:2907:b0:3a3:3451:6f96 with SMTP id
 i7-20020a05600c290700b003a334516f96mr6216608wmd.79.1659004592858; 
 Thu, 28 Jul 2022 03:36:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b003a31d200a7dsm969088wmq.9.2022.07.28.03.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 03:36:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38D071FFB7;
 Thu, 28 Jul 2022 11:36:31 +0100 (BST)
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-3-alex.bennee@linaro.org>
 <b68aa6b3-5425-263a-6364-0d656f15d91c@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 02/21] include/hw: document vhost_dev feature life-cycle
Date: Thu, 28 Jul 2022 11:34:44 +0100
In-reply-to: <b68aa6b3-5425-263a-6364-0d656f15d91c@redhat.com>
Message-ID: <87a68th6c0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Jason Wang <jasowang@redhat.com> writes:

> =E5=9C=A8 2022/7/27 03:21, Alex Benn=C3=A9e =E5=86=99=E9=81=93:
>> Try and explicitly document the various state of feature bits as
>> related to the vhost_dev structure. Importantly the backend_features
>> can advertise things like VHOST_USER_F_PROTOCOL_FEATURES which is
>> never exposed to the driver and is only present in the vhost-user
>> feature negotiation.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> Maybe it's better to document backend_cap as well which is only used
> for vhost-kernel/vdpa.
>
> And in the future we should try to unify them.

I'm fairly sure there is a lot of duplication across the various
vhost_dev, VirtIO, and individual virtio structures. Documenting is a
first step to cleaning that up but ideally we need more coverage to make
sure we aren't inadvertently breaking things when we refactor.

>
> Thanks
>
>
>> ---
>>   include/hw/virtio/vhost.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index a346f23d13..586c5457e2 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -86,8 +86,11 @@ struct vhost_dev {
>>       /* if non-zero, minimum required value for max_queues */
>>       int num_queues;
>>       uint64_t features;
>> +    /** @acked_features: final set of negotiated features */
>>       uint64_t acked_features;
>> +    /** @backend_features: backend specific feature bits */
>>       uint64_t backend_features;
>> +    /** @protocol_features: final negotiated protocol features */
>>       uint64_t protocol_features;
>>       uint64_t max_queues;
>>       uint64_t backend_cap;


--=20
Alex Benn=C3=A9e

