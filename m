Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99E4345C1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:16:05 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md5pU-0000QZ-2L
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md5mj-0007wS-95
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md5me-0002rL-VI
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634713983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICPZpJ/7+RJ6DTaOfS5Iu2KAP/XMMrirk6OivVUbS0k=;
 b=HTfWwPbVmKp7/Mw/ExqwilfwQ2g8TBBwLT7x9F5M5jg/8xtZeb1qzFsWMOn53LB1e1JPAM
 Tyt1QHhffs/kNODub+DiC+mVxP6p1DJL+Dt3Ne0UIfa8LYeJoWnXKqMSF3tB+i0j29B98p
 RwFimoeynZeyNLdoGgvdaZ0HRKIXPTg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-z4N8Abl0Mq6lZflMZ9_OTg-1; Wed, 20 Oct 2021 03:13:02 -0400
X-MC-Unique: z4N8Abl0Mq6lZflMZ9_OTg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so3677071wmj.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 00:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ICPZpJ/7+RJ6DTaOfS5Iu2KAP/XMMrirk6OivVUbS0k=;
 b=NP5o+3baqY0i8zRjICUKD/p02gTz7Y7i+EGMlUoIOS6qQGscLfNbefrw/gJGGlUSfa
 zY+++34V7Z2knqK7Db83UIge98Pghmkacqa1nE604vic66DYr9ROvbFF66GXeBr64SMK
 0w9xtmE0uos13eoVjXtUibdtWtLPSzIlvZRLj7vnUcXZ9R4Keb84GdHsvcFZTHNZejmX
 m9FTQ2wy5R+FDgW+YKmS1VkgO+PG2Wek0M+HPdoCVcztmwAlmIFNSZ7KglxzjFShyWKa
 6lQxYMRRyDhUQDlVdbwXdQCMJLpthpW+GSQ9lF5SZ6gfM4n+yPa6Xk0KJ7BxgKyIGr4q
 wc9Q==
X-Gm-Message-State: AOAM533+PIjkDBGb1oH4eEQAvsUp/LAtvt7lZuAT3C924XBpC82pMnQC
 aZhN5/Aw1Dz+jlKJOxlHf9xSv+JwABuVsAooFMdXYky+rYT0Rx4zrvSSmVARcOQdKc9QngosIeV
 FrliDInv8ZDEDgTk=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr32248855wrq.18.1634713980964; 
 Wed, 20 Oct 2021 00:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziVCA19PJSuKA4AjuyxCn+V5wJcNU3XlYFakcrY6CAmSH8ve3GAXFchph2yj8Tc+57wut0Yg==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr32248827wrq.18.1634713980701; 
 Wed, 20 Oct 2021 00:13:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c3sm1144855wrw.66.2021.10.20.00.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:12:59 -0700 (PDT)
Subject: Re: [PATCH v8 6/8] tests/data/acpi/virt: Add an empty expected file
 for PPTT
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-7-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <3a626a9f-37de-0487-66cc-408eb74704a9@redhat.com>
Date: Wed, 20 Oct 2021 09:12:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,
On 10/14/21 3:22 PM, Yanan Wang wrote:
> Add a generic empty binary file for the new introduced PPTT table
> under tests/data/acpi/virt, and list it as files to be changed in> tests/qtest/bios-tables-test-allowed-diff.h
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/data/acpi/virt/PPTT                   | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/virt/PPTT
> 
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..cb143a55a6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/PPTT",
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks
Eric


