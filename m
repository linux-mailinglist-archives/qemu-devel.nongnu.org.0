Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DF4330F1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:18:00 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckJs-00028D-0N
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck7A-0007r0-RG
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck79-0004Ny-57
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634630690;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E2ak/cYO/40XPTNbbXa/Fna5o65qCLumBTNqFrRdJI=;
 b=CZn/ziN9/GSzpAKvBYKwtbYpNulT6VrIjpiY3VfNMYREiUcVLG8iunxRhuQY9Yje8OS+Av
 BoJgiYj6mgX6yK13LdK5eWQhC6z5+ycwXyxsAP4XIemWWBiOIYsdG+vwBDzwE/b7Rj7mT7
 FJIwQF5D8jrvA9LQkCtx5CX0uNA2NKk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-8RcxOGoVNyOVwdvJ0C2DkQ-1; Tue, 19 Oct 2021 04:04:49 -0400
X-MC-Unique: 8RcxOGoVNyOVwdvJ0C2DkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 204-20020a1c01d5000000b003101167101bso2415236wmb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 01:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6E2ak/cYO/40XPTNbbXa/Fna5o65qCLumBTNqFrRdJI=;
 b=oqc32FyjE479OCzZHw9u3hvdwG73ONRFVU3Yfwf4aO49jE+j9cZzZELAw8yKj4grhd
 aERViykJhE1vKwLyGoXN3RsoC/Sg7rUQHQP11Bwa5u+JIoqKGdDnvBGwLmMh+N4W6iMd
 ZNn0q2eKkP9+CmzFTy6ZCLkMExyTA09xfy2zL5HMNlpL7piPDA/gfy4VDOYenyCXbHLN
 VTvU+4S0JfgZDxJph8Z19hAijh75aCukWEfI04tFYhTWXKew/5dqmulPbHmrSIlWjx86
 DRvQcvrFcdtfhENi+5ax2+q4Zhp5zxZEdfwk6soFR2ilf/CVcT+OGYvEmx5LcIUvf19r
 Rqgw==
X-Gm-Message-State: AOAM531Sl+e8gsQH+KoLkb1iI5C4dNfDZ+x8jDq5KtvnHeC6XMEwvo3+
 e4pmonlPxm/9aQ828EfYHk1gGO1YZCaSeNy4v36weaL2tavQXxD43hcmEBXmBjlMzcu9Vf+3GEN
 quFgW4aoJ7n+M+WQ=
X-Received: by 2002:a05:600c:ac1:: with SMTP id
 c1mr4350007wmr.99.1634630687889; 
 Tue, 19 Oct 2021 01:04:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYBaa8vNsC2AzPviw1UYvrjdoMCQNuISLcMhg+bMhMMWXZWTXRs3AOnDb6Qj/aIKWU0F/xnQ==
X-Received: by 2002:a05:600c:ac1:: with SMTP id
 c1mr4349978wmr.99.1634630687576; 
 Tue, 19 Oct 2021 01:04:47 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i17sm16697185wru.18.2021.10.19.01.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:04:46 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, mst@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, ardb@kernel.org,
 drjones@redhat.com
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-4-eric.auger@redhat.com>
 <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a79bd0d8-741a-497b-d9c4-61a71d6a6c85@redhat.com>
Date: Tue, 19 Oct 2021 10:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 10/18/21 11:00 PM, Richard Henderson wrote:
> On 10/7/21 12:29 AM, Eric Auger wrote:
>> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
>> index
>> e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
>> 100644
>> GIT binary patch
>> literal 87
>> zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
>> TFmQk+Il-a=3=Gcxz6J~c3~mVl
>>
>> literal 0
>> HcmV?d00001
>>
>
> Something went wrong here:
>
> Applying: bios-tables-test: Generate reference table for virt/DBG2
> error: corrupt binary patch at line 75: --
>
> Can you please re-send?

the v4 applied on my end (?). I have added Igor and Drew's R-b and sent
v5 without any other change. I hope this will fix the issue:
[PATCH v5 0/3] hw/arm/virt_acpi_build: Generate DBG2 table

Thanks

Eric

>
>
> r~
>


