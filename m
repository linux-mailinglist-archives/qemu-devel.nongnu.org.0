Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4736C4AF5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:45:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexqW-0003OW-1b; Wed, 22 Mar 2023 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexqS-0003Nr-5F
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexqQ-0008NX-NA
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679489133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukh4TsvbX6BoG/mAb87ob0ae4G9DFAoK18AeEMtB+fw=;
 b=I33IOiiS5YbdGnFMiUfgmI6CMPG8Riep1g/syMC8jQGXXElcbw0G8Y/tzGHHjN5md1H4WU
 uDwKXd5pkXLBrGEdYKtVMF4yY2hZrFeEPVfP9hcWbuxrqS+aHi/MR1rLMc1hrFiN5x6Rkx
 M/O2OkqsIZ4pG9rj0yc0ehgNKhGrPUE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-ioIcW3QrNa6O9EHQ6oU5AQ-1; Wed, 22 Mar 2023 08:45:32 -0400
X-MC-Unique: ioIcW3QrNa6O9EHQ6oU5AQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 w2-20020a0cc242000000b00583d8e55181so9221276qvh.23
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679489132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ukh4TsvbX6BoG/mAb87ob0ae4G9DFAoK18AeEMtB+fw=;
 b=6/BU9xlv6VuSzWMHSmVGtuU/GWOFzDJCAgudlW0TjL42bhMrsvSp/hp97slQHhNb/N
 7jvE5t3FFV/ZjdD3lly3GI11n/nNraZ78Rz/jed26ifpBiJhvxN1xCvPzf/8CZP/INBo
 xTIPXXKiPEy/yACJ94kPR/mHS9xB3ZtBqFXNm9bwLtu9vgjoc4mZHvv3/VwXeq7K128D
 1tlERFNCihlMY6GDZ3Lhj9dHpM39IgcOD3oiTT5d32LpoY7G3uC2UbI3KiqYGEinoOZ3
 kVQPiZwoel/2XSvSjRl1zWxj4SdaaGdd5cOa9WzrId9E2jVwhp7l4fo5XeK3kfqc1wIu
 nnJw==
X-Gm-Message-State: AO0yUKWUlUm2Eo0xboo2o/4YvGE2mUc2VSd8vGCuotdssB5Y9vxc+78Q
 AHIHyGFKmS7jXyEo5CbgQjIBQ6jOvv/SX4iIhXbXqVafQVGGGc9K85iwT/ivzAaA0qbYce0mGpz
 aJ0V/nrSXmYnW/Xo=
X-Received: by 2002:a05:622a:1191:b0:3e1:5060:5c92 with SMTP id
 m17-20020a05622a119100b003e150605c92mr6028805qtk.16.1679489132042; 
 Wed, 22 Mar 2023 05:45:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set+KxC7Plp43DJY3yCAnZy8VwBzfWnhJxUbmuhR6DKvlClfbbU4ad9UwZJMoJ66UkZFlwdpx0w==
X-Received: by 2002:a05:622a:1191:b0:3e1:5060:5c92 with SMTP id
 m17-20020a05622a119100b003e150605c92mr6028772qtk.16.1679489131758; 
 Wed, 22 Mar 2023 05:45:31 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 15-20020a05620a048f00b0074636e35405sm3782390qkr.65.2023.03.22.05.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:45:31 -0700 (PDT)
Message-ID: <0b00fc7d-8232-97a8-cf3a-21628597a135@redhat.com>
Date: Wed, 22 Mar 2023 13:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] tests/vm: custom openbsd partitioning to increase
 /home space
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230322123639.836104-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/03/2023 13.36, Daniel P. Berrangé wrote:
> The openbsd image is 20GB in size, but the automatic partitioning
> done by the installer leaves /home with a mere ~3.5 GB of space,
> wasting free space across many other partitions that are not
> used by our build process:
> 
> openbsd$ df
> Filesystem  512-blocks      Used     Avail Capacity  Mounted on
> /dev/sd0a      1229692    213592    954616    18%    /
> /dev/sd0k      7672220        40   7288572     0%    /home
> /dev/sd0d      1736604        24   1649752     0%    /tmp
> /dev/sd0f      4847676   2505124   2100172    54%    /usr
> /dev/sd0g      1326684    555656    704696    44%    /usr/X11R6
> /dev/sd0h      4845436   1445932   3157236    31%    /usr/local
> /dev/sd0j     10898972         4  10354020     0%    /usr/obj
> /dev/sd0i      3343644         4   3176460     0%    /usr/src
> /dev/sd0e      2601212     19840   2451312     1%    /var
> 
> This change tells the installer todo custom partitioning with

s/todo/to do/

> 4 GB on /, 256 MB swap, and the remaining ~15GB for /home
> 
> openbsd$ df
> Filesystem  512-blocks      Used     Avail Capacity  Mounted on
> /dev/sd0a      7932412   4740204   2795588    63%    /
> /dev/sd0d     32164636        40  30556368     0%    /home
> 
> This will avoid ENOSPC failures when tests that need to create
> big files (disk images) run in parallel.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/vm/openbsd | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)

Acked-by: Thomas Huth <thuth@redhat.com>


