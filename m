Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA84420F3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:36:12 +0100 (CET)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhd6I-0000JZ-KR
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc3m-0006Yl-7R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc3O-0001ew-IC
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQcLYW9YfjhOfK+5Oht351/QELInrmKm522c160F/y0=;
 b=TLOdeXAKMoXTJLdDpwtJA4IJJAXdzYXrmUMqcTWDKO31kpwomN5wPRD3A608U120BMJk3y
 xLfE04R0XwJlRzFxmXSyeICtSshdIp0HoG9qk2w9tpGTCruL8eRgeqYjn9HSqEnqZ8GL49
 REIz3hjm7f9WqpAsRO2YOogQo5osgyM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-ZfMCGn0QMquziGXsbheR6A-1; Mon, 01 Nov 2021 14:29:00 -0400
X-MC-Unique: ZfMCGn0QMquziGXsbheR6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso26558wml.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lQcLYW9YfjhOfK+5Oht351/QELInrmKm522c160F/y0=;
 b=yKwVxwkBaZUy67d2NXZSNs9Uo9k9z9Yi7VK5VJSdcn7d+j/k1sowKf8Ys/kQD57wqL
 V5m4iozBk7M6uzQVM2zH/3WebB8xd8ElvwXYswOszhglAIgSpeDZkv1im6O55lvtikNR
 qRxc4kQnpqslFStie6eF41wlH4OKSM1uv1bYohHJepFANW8uJ02bjpomCn+PrYVU4rM7
 8uTR++LjmhRTWSRJK8KdyM7hmiL/HxZ1GA9EyBt6hQwXHq1U6PN26yS4huVKD9j7FlG5
 ozv5AHQoPq9VriqEBTB3cJudyq+7+iv0Sd2XIKOA+O8nONJdjzsVTZUs0ay8c0AGXe+r
 FcPg==
X-Gm-Message-State: AOAM531YUMr4xGr+RoA1i4T1GqjMLsuFJPixj3kvXI7OqMDKuQs+T0wE
 Ky8SG0gsbF0WghfBWr2n0/cjtZq3V5I5p98QNRwtfNqn+H1MBQeFTex4f0FHvjpdys7Yry9X8bw
 bA0tZm52cjzLlRlBbRzszEhr5MnF+9Vp0fhyaZGV1sFFPHLE5ROXll0MH/ied44pm
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr29121699wrx.86.1635791339058; 
 Mon, 01 Nov 2021 11:28:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYtKNkTTkgBk+co7jx7uSeGx3fG5cfhNqz2thhECpjP2Li8+0n3sCxgFwPAmo2sJ3Ch+tNwg==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr29121673wrx.86.1635791338900; 
 Mon, 01 Nov 2021 11:28:58 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z15sm3541488wrr.65.2021.11.01.11.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:28:58 -0700 (PDT)
Message-ID: <d4cbff7b-b84c-dd9f-18dc-dae6ea3ce8ee@redhat.com>
Date: Mon, 1 Nov 2021 19:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/2] hw/core/machine: Add an unit test for smp_parse
To: qemu-devel@nongnu.org
References: <20211028150913.1975305-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028150913.1975305-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:09, Philippe Mathieu-Daudé wrote:
> Respin of Yanan Wang v3, based on
> "hw/core: Restrict qdev-hotplug to sysemu"
> 
> Based-on: 20211028150521.1973821-1-philmd@redhat.com
> https://lore.kernel.org/qemu-devel/20211028150521.1973821-1-philmd@redhat.com
> 
> git-backport-diff:
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/2:[0001] [FC] 'hw/core/machine: Split out the smp parsing code'
> 002/2:[----] [--] 'tests/unit: Add an unit test for smp parsing'
> 
> Yanan Wang (2):
>   hw/core/machine: Split out the smp parsing code
>   tests/unit: Add an unit test for smp parsing

Series queued to machine-next (including patch #2 fixup).


