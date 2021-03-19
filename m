Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32B341B2A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:09:54 +0100 (CET)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lND0r-0000xH-HN
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCy7-0007z9-B9
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCxu-00079W-5K
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StbM7Nh8IkVqbfYzrAnoXH8jZiNIg8DlqQScigD4aqk=;
 b=irMyr4gKeLesEciYn3TUbB76/vznnvb+RwClpI/F2WTkhvm6Ss2uGC+uVr8fTwwyC6GzLP
 WFJXYLjSVcFVJlgc2XXd9B8FdxpWtdLv/SHXFKgcQalCWG7aWejEtU6a5GUlecAkLecXGx
 XMs78rBlp0sWSu54pgS6PdYG9KcBUJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-T8vZ5ee6NK2-WyXg37JZgw-1; Fri, 19 Mar 2021 07:06:47 -0400
X-MC-Unique: T8vZ5ee6NK2-WyXg37JZgw-1
Received: by mail-wm1-f72.google.com with SMTP id l16so8172506wmc.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=StbM7Nh8IkVqbfYzrAnoXH8jZiNIg8DlqQScigD4aqk=;
 b=g1IVLHhmfsykw8rjYKF1UTHPk1gQ6AIs9/O8pNHS9aB4C8Er+ieRc6BaZrxml/Obx3
 Y5rB/rktx55YZ/Nh1obd+0c9eSgYMRsMvZu4i4oLJizpfmBMwg9MZTB4XpnP713fNwBY
 ILzwgBrPOO3jmNzqG+cdWTyzrbBVQvAhP8KlzKLgCemoCmgXk098mIxnrpal3zs3tXSE
 TGb3O0cizZzNNTv1ZkdY3jZMatspYXoVS6msTQjMbxk5pKB+YgxiJ29EjuDEBjmrRjkD
 jnPCzQiTCU0E7ZqxVCV4nI+i0ZZH1m5SoTZ4oRMzOK47GXrX8XJsOi93lW9SAY3McmI6
 yIkA==
X-Gm-Message-State: AOAM530rdFSLQJRzlD4wNlRwoMKEVxhDRrCFnRmWZyJoi8ZsMILsr7K5
 EyLm0pwZ3bVW0v+d2clGyLLfFx59oY4nT6sSIpzbnA9QyoZefPoWbZ+Xx0cDQk+Y1ZWhIW8Wy8B
 kV6SklGmN6eoy9no=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr4185733wru.198.1616152005402; 
 Fri, 19 Mar 2021 04:06:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd60/EPwxaZl82D7pnCNkJRPRq30LVFnpR12yUFAKszrRGjyx5jXXGX7syG9DLDRsQ1Gy3Dw==
X-Received: by 2002:a5d:6989:: with SMTP id g9mr4185705wru.198.1616152005224; 
 Fri, 19 Mar 2021 04:06:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e17sm8885292wra.65.2021.03.19.04.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:06:44 -0700 (PDT)
Subject: Re: [PATCH 4/4] iotests: iothreads need ioeventfd
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-5-laurent@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c03ef1c-d39f-dd53-c13a-7620b7899e35@redhat.com>
Date: Fri, 19 Mar 2021 12:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210318223907.1344870-5-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 23:39, Laurent Vivier wrote:
> And ioeventfd are only available with virtio-scsi-pci, so don't use the alias
> and add a rule to require virtio-scsi-pci for the tests that use iothreads.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   tests/qemu-iotests/127        | 4 ++--
>   tests/qemu-iotests/256        | 2 ++
>   tests/qemu-iotests/iotests.py | 5 +++++
>   3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
> index 98e8e82a8210..a3693533685a 100755
> --- a/tests/qemu-iotests/127
> +++ b/tests/qemu-iotests/127
> @@ -44,7 +44,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>   _supported_fmt qcow2
>   _supported_proto file fuse
>   
> -_require_devices virtio-scsi scsi-hd
> +_require_devices virtio-scsi-pci scsi-hd

Maybe

_require_devices scsi-hd
_require_devices virtio-scsi-pci || _require_devices virtio-scsi ccw

?

Paolo


