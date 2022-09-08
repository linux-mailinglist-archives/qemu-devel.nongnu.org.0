Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD4A5B1BC3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:43:12 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFw7-0004Kk-K7
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWFqv-0007xd-1J
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:37:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWFqq-0006PH-0O
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:37:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id ay12so10668409wmb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9pbnlDTMAFQQ3HWzVEN/9wbX1MFeWcv/zBSJhz1JjLo=;
 b=Xx23UKYxeF8CJxMJIoeARL6WkLNgy6Q32aCnh8jBxYAQaiwuGuKejZkE8nOQqp3EaM
 goRA1FN9QTpCldDVw46Ti0xFwFyB35oFbfgzUX+yd23lPOntvJ3NeR2pry9bNxcFI+Cu
 wIhw2UwMhvrbUN/XBwlA4aiethB51oY7usVUzbE7i49rUNozPv8kDaLAa8vMsWbFvUsR
 /N5uuzhXlu3EGnN//hq7pbGr02BNs9vbHJ6dJ5YV3bUHGenLCOXAx1A4PXdKrfrZ/RH4
 u/6JXZtxScBq9fQ0VrzUVyJDdKACKw9sEBySUoa3CTnxn7Q3TcVxeFrCLtbeJ/3P/8KE
 nKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9pbnlDTMAFQQ3HWzVEN/9wbX1MFeWcv/zBSJhz1JjLo=;
 b=RG1fTF5rUWBiBh3f1E8mOSRTl5GquXrHz9T9ZzBLXoPNkXJs6GtiHuToaO9LP8GYFE
 DpoB8SkwcfGFEq/3GKGHSTC3oVlx+JIkiFUDgfOnGGr6VIrakwRF5F0ib0HJcaKyO9pJ
 bjjfLEoRz9gdrijhYU2jMoMsLNCzbGDv3s81gGcOWqCvIUouSfUMAzFa3R/yFDHarjly
 GYSL/7T8SirfIYLDLdk7JZ3EEWa0PilmDMALIPGoMiOMVHIUYu8ApiHKNbfCPOONrJrX
 GXtxWMqviAMc+hGwb58dI9i1Bib4DGJ4y3p21jcMKPXzu5BOessE82Tdpa9xjNGb7VZ7
 Pi2Q==
X-Gm-Message-State: ACgBeo29pkiWMBvlv3ggVgm8UCcIKLihcXRor+xupa11CEi5plBxih9+
 LSkDDm9XyGfOIqI+XzjsuwhNyg==
X-Google-Smtp-Source: AA6agR5tCK7VIigX9ahQNa98tawdqvZLvqNfeGZij5OvuU1YtGpLUGHht+pSgMuTDW3/4ZztBNdE7A==
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id
 l26-20020a05600c089a00b003a54ea9d5eemr1959908wmp.8.1662637061240; 
 Thu, 08 Sep 2022 04:37:41 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b003a601a1c2f7sm2682850wms.19.2022.09.08.04.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 04:37:40 -0700 (PDT)
Message-ID: <72157830-56b8-ee02-6ef1-99b56106c4e5@linaro.org>
Date: Thu, 8 Sep 2022 12:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWljaGFsIFByw612b3puw61r?=
 <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
 <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
 <YxmxVuYq2vqFgvqK@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YxmxVuYq2vqFgvqK@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/8/22 10:09, Daniel P. Berrangé wrote:
> 'kvm_msrs info' is variable in size, so offset of 'entries[1]' is
> undefined by C99. I presume the GNU defined semantics are that the
> variable length 'entries[]' field in 'info' is zero-sized, in order
> to give predictable offset for 'entries[1]' in the local msr_data.

Correct.  I invented this gcc extension for the benefit of glibc, which wanted to append N 
entries to that header, in static storage no less.

I still find it odd that clang warns about a gnu extension when gnu extensions are 
requested via -std=gnu*.


r~

