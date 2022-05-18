Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293A152B45E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:10:46 +0200 (CEST)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrElZ-00040m-7f
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEh7-0002AC-PP
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEh1-0003ys-9s
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652861157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vb9VySVR+4W+uz+Lu99v5HuhF6i+HtZKB3KJwQnTgSg=;
 b=KvBHVRjkX51vbyLsRjpWsnfBScO5QcTWR8dH2JP0Wz6CuzWR6LRyJcQP45RV8pyt6TUdgA
 twU3GsOMq7ypr5m056sn0iW20/YXiyMrQmn78lnjq+nP8yzQgZCKOmugqGhjGRCB2jHJDg
 aNI06Mg8fm1TYPGHVdg/FFYKr5vL6X4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-l_0Cv0WrO7KXwzY2iry5GQ-1; Wed, 18 May 2022 04:05:56 -0400
X-MC-Unique: l_0Cv0WrO7KXwzY2iry5GQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so566257wma.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vb9VySVR+4W+uz+Lu99v5HuhF6i+HtZKB3KJwQnTgSg=;
 b=2AtHPS2fOdpKDG4PNIsDYz9Rxz2rreWBekhX3B5V1XjrHobIFdztNVUf43e8emOqq/
 OjfpcwCel7s/5btBgpIdhvbsjkwqEYE/we5ZM5ds/z8h8yuhvhO456jyrdzYW+5QYxuP
 bhFiI2odsceWHGd50mHI5XqJ8ydYaIV1iH8lL5eq8ibk3QnTxqTHlHiTGsu6BuQaXGK4
 QSW0GmRwBi4fovuzP8K7prH4ZgWESufEWlWGAyjA9ZjlWVHw8d6igJ1x2SnB7AAX7O3b
 97i5oqT5As17FlH5KX5FsOCkoqcNTlS/Mfh7Ynzx/2OWpJNlEhodS+tNU3q290d+Y+bU
 LuVA==
X-Gm-Message-State: AOAM530vqdysIQupXcUzUdQNAgJJ1goEHsPwXItCvOprhZpv4K5m6bX7
 QQm+7I6KDwMYZ94Vy0XZT299dthigSsBu6icORc7AIGT9J9strOU4q8inoa4gac511kNDxMUfXX
 OIg7BC7VCh0vTjHI=
X-Received: by 2002:a05:6000:1846:b0:20e:5d27:7ca7 with SMTP id
 c6-20020a056000184600b0020e5d277ca7mr3564823wri.536.1652861155113; 
 Wed, 18 May 2022 01:05:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/30cS4PJxmHAl+2xrMBwaMFiCWGXTdx7x4IINri6wxV/RgNXy9UYZKLMriIL5IvLAWmSHMw==
X-Received: by 2002:a05:6000:1846:b0:20e:5d27:7ca7 with SMTP id
 c6-20020a056000184600b0020e5d277ca7mr3564789wri.536.1652861154786; 
 Wed, 18 May 2022 01:05:54 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a7bcd95000000b0039489e1bbd6sm3594130wmj.47.2022.05.18.01.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 01:05:54 -0700 (PDT)
Message-ID: <db7ebd91-818d-f63e-6835-c38b9881383a@redhat.com>
Date: Wed, 18 May 2022 10:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/9] target/s390x: add zpci-interp to cpu models
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-4-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220404181726.60291-4-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 04/04/2022 20.17, Matthew Rosato wrote:
> The zpci-interp feature is used to specify whether zPCI interpretation is
> to be used for this guest.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c          | 1 +
>   target/s390x/cpu_features_def.h.inc | 1 +
>   target/s390x/gen-features.c         | 2 ++
>   target/s390x/kvm/kvm.c              | 1 +
>   4 files changed, 5 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9..b190234308 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -805,6 +805,7 @@ static void ccw_machine_6_2_instance_options(MachineState *machine)
>       static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_2 };
>   
>       ccw_machine_7_0_instance_options(machine);
> +    s390_cpudef_featoff_greater(14, 1, S390_FEAT_ZPCI_INTERP);
>       s390_set_qemu_cpu_model(0x3906, 14, 2, qemu_cpu_feat);
>   }

This needs to be moved into ccw_machine_7_0_instance_options() now that 7.0 
has been released without this feature.

  Thomas


