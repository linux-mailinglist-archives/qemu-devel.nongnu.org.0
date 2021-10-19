Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF75432E73
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:39:26 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcimT-0002ix-86
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mcike-00017B-Fm
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mcikb-00034h-UE
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634625448;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKYniC+Z4LnN/kcvtEwO06pa0oOywxrqa4rY8AeKY2U=;
 b=B0It5spkN6vQyZYRHN2SFTsejJf3lv3YQrBIxGHg8eaOuI83kNpq0uBmbpi7rP1F53qNAq
 0BsyJoLE0tof1o5AsP4hC1qweIrCuPhdqB+T3IWzyrN8ScrbzSj1+ZJgJjSmezciiNgV2o
 oiJ7Soio0Nzn481f6iRIhygCsRcGg6I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-W0k_sgZ5OVWNG5ze7mfzkg-1; Tue, 19 Oct 2021 02:37:26 -0400
X-MC-Unique: W0k_sgZ5OVWNG5ze7mfzkg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h99-20020adf906c000000b001644add8925so6544895wrh.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rKYniC+Z4LnN/kcvtEwO06pa0oOywxrqa4rY8AeKY2U=;
 b=Rkpv4cu3ElVTb5oEd+HxwTChZREsUuUYHs0p8+HIBXrYCMK5C9VWEceZEvswqpGZzw
 vKqJwjznT0L7CvlW0Mjr1KXl92k32ltBxWtO7VpEeoeI+TaO/lHkMZlBhQnFRAHmCpO6
 xzTuLv2faYeRuScD4+E65pacgfuRLOWtjexRqDbxJSPT6tlt4qZWBh0X79wE46O1BHLt
 bxE2mraZTvQ1fQ0w1hh/nyeuT3tgX2ROb2muVp3FlrGYZrEqFVXLpWZiYrsf9NUsJCvg
 i5QGMM6jKNrYL1ehqdV8uKw41tunajZOdLhrS9WPmeX7SVzPqEghPh6QD0Gm9kw1g9AS
 dMdw==
X-Gm-Message-State: AOAM532FXFWlcatUwH8AbP5bZ+Fcew7prkpVTm2+edTfZ9p8RmcRDF4H
 Ey+T3L6ot8N2MNWNE2Ql0f5K/vMIKTl4Xhm/d4n1THVJbFRzgPbKKCIIV6G6t4D1CeebFEhhk/j
 kx2noYBdA5nG1RzM=
X-Received: by 2002:a1c:f601:: with SMTP id w1mr3993772wmc.112.1634625445778; 
 Mon, 18 Oct 2021 23:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2rYfi0ar9AZzreFO4bsCowObZGK3BDvzn+fsHPysoFfwJB/Qjy9gn71JxZ4Hd8fbhJhiWPw==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr3993747wmc.112.1634625445567; 
 Mon, 18 Oct 2021 23:37:25 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m2sm1371884wml.15.2021.10.18.23.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 23:37:24 -0700 (PDT)
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
Message-ID: <49d48940-0f0d-c292-3fd4-8b15560c55c5@redhat.com>
Date: Tue, 19 Oct 2021 08:37:23 +0200
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
Received-SPF: pass client-ip=216.205.24.124;
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

Sure I will resend asap. Sorry for the inconvenience.

Eric
>
>
> r~
>


