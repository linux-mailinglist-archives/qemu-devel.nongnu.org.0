Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0248E72B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:11:31 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IcL-0002IC-Ma
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:11:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IMC-0001OZ-0u
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IMA-00006r-5P
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96a0o/zGn6+jmJgYuV2SaRYOmyrJsGqi1HSKr1shTYc=;
 b=L5CB1aFzmqAAEOkHNQ8Sn8cN7Fe++fTtB7tcletYmR/WH4dig/h9A2bEvwCEp1RD588una
 XzX4l7HNWBNCspQr9/fQHFgZ7g9EA2Fwx2RVVPMWB2v7sXKZbcm1fBhbRbrXvRjynauu8P
 EzRee6jGmZ1l2/VqnzpXKtaw5kBrD3Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-wcQwqlnaP-yRYeShH2AyDw-1; Fri, 14 Jan 2022 03:54:39 -0500
X-MC-Unique: wcQwqlnaP-yRYeShH2AyDw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so7653000wmq.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=96a0o/zGn6+jmJgYuV2SaRYOmyrJsGqi1HSKr1shTYc=;
 b=Zn6cR7dYnhyB0IH02L3a2BNglVVycxLGFw9ufqxn983RYGciw/CVA5tFB84qcWr3R+
 icnQ9w/yvA6MkOfjgybS8CI+j9N77XW+TjD0vyBBOcTY7LWXCdz4al8/d+ifBkJSndhG
 9z9LUlL4nXxuzruPD4WUC3xogKCNzbdYVa+cfmlsqy1HFBfV4cHGEFaNzDiZezwgSNNq
 pMlA2gZVzbCv7ppM4n40bA10VfiNUjtBCl7BAiXaLv1+vUFArrWwB2CXFFSukNgWJrQf
 wonvvAZQkr44JXrnvT77A+WxTZGEQd5CewVLjKSiqIwPz7BWcEpQA8twouh4AZstNfUn
 13zA==
X-Gm-Message-State: AOAM533XnIcp4EWUyAuMoKx5mtehlXHDQIzf4L9NVW/bDIZxuQxZRW9X
 pyL2F1+avUVrGqrDA5juML2cWrG5UOZdcZEEIc9ppWw20pKNKoNDLE07H2TvbyJOSLIvNyOZfP9
 6x/5PgNXeebhN4Uw=
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr7341906wrs.322.1642150478511; 
 Fri, 14 Jan 2022 00:54:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwrO8W3vjqr6Z+E1C+opoVdGX0yV0wAM1AJW68SN/KhpcGto9ajWC6UOovkPBMp2hUYmSkrA==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr7341887wrs.322.1642150478233; 
 Fri, 14 Jan 2022 00:54:38 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id v8sm4917050wrt.116.2022.01.14.00.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:54:37 -0800 (PST)
Message-ID: <9448f6b2-4ad3-162f-170d-d82f0a03455c@redhat.com>
Date: Fri, 14 Jan 2022 09:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/6] tests/qtest/libqos/pci: Introduce pio_limit
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-3-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> At the moment the IO space limit is hardcoded to
> QPCI_PIO_LIMIT = 0x10000. When accesses are performed to a bar,
> the base address of this latter is compared against the limit
> to decide whether we perform an IO or a memory access.
> 
> On ARM, we cannot keep this PIO limit as the arm-virt machine
> uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
> are mandated to allocate at 0x0.
> 
> Add a new flag in QPCIBar indicating whether it is an IO bar
> or a memory bar. This flag is set on QPCIBar allocation and
> provisionned based on the BAR configuration. Then the new flag
> is used in access functions and in iomap() function.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/libqos/pci-pc.c    |  1 +
>   tests/qtest/libqos/pci-spapr.c |  1 +
>   tests/qtest/libqos/pci.c       | 78 ++++++++++++++++++++++------------
>   tests/qtest/libqos/pci.h       |  5 +--
>   4 files changed, 54 insertions(+), 31 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


