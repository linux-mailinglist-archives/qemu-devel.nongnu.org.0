Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495B48E730
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:14:01 +0100 (CET)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Iel-0005fm-UG
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8ISd-0001oU-Lv
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:01:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8ISb-0001IJ-VY
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMKHAoHd5bj6VaKNeKLiXYoaq30S7MPU0P4Z5Cnyhk0=;
 b=P0LlPicooOvns5YojqQE3PLgIlPCFoH5tZF8okJRRzPJGd4K2AGK7h3J8+b6hgHtmyrwbB
 2ygpxrnfxnhWSwQeaSWD6kjDD56BS3BDnKmajWHbYrl1LeyYUQ5fKt2hHQqRWJQK2FHaSa
 4pbsKCQ1FaD5RqC3VbMVwulyCstlPJY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-Mt3IOVfIP_Ow7eKoHjv6ew-1; Fri, 14 Jan 2022 04:01:24 -0500
X-MC-Unique: Mt3IOVfIP_Ow7eKoHjv6ew-1
Received: by mail-wr1-f69.google.com with SMTP id
 d20-20020adfa414000000b001c9207acbe3so825038wra.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 01:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMKHAoHd5bj6VaKNeKLiXYoaq30S7MPU0P4Z5Cnyhk0=;
 b=iIXPAT8WHFRMkqbFKZPCxFT2d3dh3XhCc7rlyNbBlFvCTDCBcTsm2Cv6s/s6IKmcXE
 3nGwA2l3SlW6DmIpJYsKiwSSfxBWeobTshSratm14SU8hOdc+O63FeEi2dbDAw9ex6QY
 gCQzqs6YU1O3zAkD7nOcc85eb3oXS7iOXgprvHv1Bk/ujRPzne4R4u6rgt03IqDtW5+W
 ZtYYnvqIcbaXLJtdgOvUsiOyfh6goKL3RTSiDQT+dYrre6un9ceDwIIPLQyW/ycAXMbz
 HVJpHL0E7+DGK5OMcpZOcCVSnkclQYP/hok+apEgQkYVH7LuvS1ITyWbESJ13qs7Rfy7
 /ZpQ==
X-Gm-Message-State: AOAM530WnqyV+HRoqLM+gWlyn8MFHcoVg/OkXEPJyRogx9UZMZ3wDBcA
 3Gb2WCBeEk9w1Vs1LB+icLcRTW2lOVUb8g5ym3qfJlP3LUgt8h6CbUQtkPZbzLSjzXF7C/6DKpF
 MrbylG5SDnZ4weio=
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr7248329wrr.559.1642150883039; 
 Fri, 14 Jan 2022 01:01:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKbGx1hh5+E691plhLnE5rPvEVlkL6yyMsueWKXFpbIzhfMB/et4PKzbdR56duE3jJGYMKpg==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr7248307wrr.559.1642150882808; 
 Fri, 14 Jan 2022 01:01:22 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o11sm10348219wmq.15.2022.01.14.01.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:01:22 -0800 (PST)
Message-ID: <9be87573-34e5-c11d-9bbf-5a61610e3c5e@redhat.com>
Date: Fri, 14 Jan 2022 10:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/6] tests/qtest/vhost-user-blk-test: Factorize vq setup
 code
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-6-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-6-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 22.19, Eric Auger wrote:
> The vq setup code is repeated several times and can be
> easily factorized.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/vhost-user-blk-test.c | 33 +++++++++++++++----------------
>   1 file changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


