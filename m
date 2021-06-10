Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA993A2248
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 04:31:46 +0200 (CEST)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrATw-0006m1-Kj
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 22:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lrAT6-00060O-AE
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 22:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lrAT2-0004fp-NY
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 22:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623292246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlY7ZU1mzlzH0TtvVol2e+OV0IIWKH7NwH52n2a0lFA=;
 b=eUZ4sFnLn+RSbN7f6kudsqKz03T1wF77HL5HbEW0a4V0favEMdvsO3XDen3ozoTwJ6RmjR
 EP1rF1LXaK0v9arrl+TU1e8RAgiteSylVF7n7L5cQ0ty3tMjjQzHGrkn0SR+H0rJuJV/0p
 fv/F5EOpjbg8UFK7B7ukEAiz2avMxVs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-EZw7vLsXPT-GAqjv1imDrw-1; Wed, 09 Jun 2021 22:30:45 -0400
X-MC-Unique: EZw7vLsXPT-GAqjv1imDrw-1
Received: by mail-pf1-f199.google.com with SMTP id
 y11-20020aa79e0b0000b02902e9e0e19fdcso329402pfq.14
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 19:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MlY7ZU1mzlzH0TtvVol2e+OV0IIWKH7NwH52n2a0lFA=;
 b=KI6aZ8sOTMoOi3SF5WTm5ZYqjYAb0tb3JSeqcA/T8SeCGYKZD6OXHphMueEquSL0PA
 ShK6hhkiqNlNb8TUh/CeQofBHmXJAQi65n+sllOpJoFV9YcLbLNU38LjM80wSMI4hkkB
 iFKo0+pS/S8hYKHIvPVPE945W4EALFNi9SWILLfkjqpkYzRuOfWmKWhEgQ+yspi3ufSN
 A91thvQyxE/ud0xQzGl7iyq64oNC5v06COJc7+HQitnTQzdpc+a3Lmxr9F7Es2x7T6Ky
 tQyX8ufBSr/BG92lPPOovgaLUCgz7ZipoBfMGouDeqNzdm4sZsmE0MyjWrm+kftPUp2M
 sPDg==
X-Gm-Message-State: AOAM530+lB3rGIFz9+ouzNqKgoc7xJinu4nuBmFc5CNVLJE0+mcbdQ+g
 R1p4JDFBJ9pKxvshFJDxlDWwI06W9osmO37wVbqUVr1hNc88M1b0Bx6JukbUXIr44/SyUep8OXn
 JSNNYkKm2vwuT3Fs=
X-Received: by 2002:a17:902:fe03:b029:104:12b5:954f with SMTP id
 g3-20020a170902fe03b029010412b5954fmr2752754plj.85.1623292244367; 
 Wed, 09 Jun 2021 19:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrHAIGIae5IoGESB7aNKfxKlYJBi632EOkq6dLqETL3anMjGw/1CP1KzVOd7vqmlY2//9jcQ==
X-Received: by 2002:a17:902:fe03:b029:104:12b5:954f with SMTP id
 g3-20020a170902fe03b029010412b5954fmr2752739plj.85.1623292244093; 
 Wed, 09 Jun 2021 19:30:44 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y73sm691988pfb.129.2021.06.09.19.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 19:30:43 -0700 (PDT)
Subject: Re: [PATCH V2 0/2] vhost-vDPA: vq notification map support
To: mst@redhat.com, qemu-devel@nongnu.org
References: <20210602084106.43186-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7f5c4713-44d2-f852-972e-ee138262e09a@redhat.com>
Date: Thu, 10 Jun 2021 10:30:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210602084106.43186-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: si-wei.liu@oracle.com, elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/2 ÏÂÎç4:41, Jason Wang Ð´µÀ:
> Hi All:
>
> This series tries to implement doorbell mapping support for
> vhost-vDPA. Tested with virtio-pci vDPA driver.
>
> Please review.
>
> Changes since V1:
> - use dev->vq_index to calculate the virtqueue index
> - remove the unused host_notifier_set
>
> Jason Wang (2):
>    vhost-vdpa: skip ram device from the IOTLB mapping
>    vhost-vdpa: map virtqueue notification area if possible
>
>   hw/virtio/vhost-vdpa.c         | 97 ++++++++++++++++++++++++++++++----
>   include/hw/virtio/vhost-vdpa.h |  6 +++
>   2 files changed, 93 insertions(+), 10 deletions(-)
>

If no objection, I will queue this series.

Thanks


