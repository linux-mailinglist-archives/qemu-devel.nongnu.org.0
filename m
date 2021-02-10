Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247093164FF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:20:07 +0100 (CET)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nXS-0002sC-7y
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9nTX-0007oY-EC
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9nTN-0005TR-B7
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612955751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVWejQ8vRG3rUmHzXbbwPCovaqNjYPEF0Lq6SgCF/m4=;
 b=icVLedbGH+g3huBy6h+iZwtnCp1zWZnW0aAstZoyE7O0wbb6lZ/97JmlCuGf6inwlBHgc5
 0/Z7bETpFJ/HY62Mk29T2NacBQpcM8H0N7vrikXgmAMK+iw3cQiGqY5ldGnfLoPR+Kci0q
 ElrB9qogzcCvBCAKerz5QG/6HXnMFJM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-Sd52H_fnNgifLtn09PlXJw-1; Wed, 10 Feb 2021 06:15:49 -0500
X-MC-Unique: Sd52H_fnNgifLtn09PlXJw-1
Received: by mail-ej1-f70.google.com with SMTP id n25so2413089ejd.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VVWejQ8vRG3rUmHzXbbwPCovaqNjYPEF0Lq6SgCF/m4=;
 b=nKqEiqJVTxmsenwMMlYAN8eSnWaBdThZsBqQwFhulwjZHMBZzDrIsjWRtt7LUdte8B
 nZz30KNc33zKaMGoRB5kBb8HY8jfcgjcKqGP2wXvRvjz+59hwKWYd+8uAe+TrmR7hJnF
 XwHCNoGBFJFI0ykwnzKp+pxKMEomtsZLdk/VcnmHHTE47aiA1IgDSULS1zU7/uaXuH53
 turMLOebuXV+leh+1T9aN689aFwsYK+LdEBG3IFFbQj04m/H4vvZoD3iXvw1h4O/wRdy
 JiHWNBWUc/W+cUI9PJMmKcHmRJpEXxpRElnBCSoL+LDOWHprQPw9Z6rZLlWB+DdZzDVv
 MiPw==
X-Gm-Message-State: AOAM533IogpKAdrwGw5lK4ft53Jyo801VUZMRvDVBeiME2i+BYjZi1ug
 6HJZnowtmHHUHzuncwTCOgpmxk9Zweo7LxHjG+RCAvjqZPF1XrRB39A2C262sPVlrc9TiPX4p1X
 y8ixJfEZSBJn7vko=
X-Received: by 2002:a05:6402:208:: with SMTP id
 t8mr2613877edv.189.1612955748340; 
 Wed, 10 Feb 2021 03:15:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBEGi217jyfMCaMYb4QKS9hTLJSJUQEI2QBdslVL0Yy66EYhZh8sAQ/8X92rdCt4xJKnx30w==
X-Received: by 2002:a05:6402:208:: with SMTP id
 t8mr2613854edv.189.1612955748176; 
 Wed, 10 Feb 2021 03:15:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q1sm887161eji.101.2021.02.10.03.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:15:47 -0800 (PST)
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
 <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
Message-ID: <efffe227-472d-698d-d8f7-cc0bbd1800c0@redhat.com>
Date: Wed, 10 Feb 2021 12:15:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 12:12 PM, Philippe Mathieu-Daudé wrote:
> Hi Bin,
> 
> On 2/10/21 11:23 AM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Current QEMU HEAD nvme.c does not compile:
>>
>>   hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>>          ^
>>   hw/block/nvme.c:3150:14: note: ‘result’ was declared here
>>      uint32_t result;
>>               ^
> 
> Why isn't this catched by our CI? What is your host OS? Fedora 33?

Just noticed v1 and Peter's explanation:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03528.html

Can you amend "default GCC 5.4 on a Ubuntu 16.04 host" information
please?

> 
>>
>> Explicitly initialize the result to fix it.
>>
>> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v2:
>> - update function name in the commit message
>>
>>  hw/block/nvme.c | 1 +
>>  1 file changed, 1 insertion(+)


