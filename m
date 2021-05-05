Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A9C373C45
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:22:17 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHTk-0002WK-Mq
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leHS3-0001De-UY
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:20:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leHS1-00083q-4D
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620220827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujBBX4Ohjb3zxsPX3c4GRBN2vO2v/Xn58LiXA743fbo=;
 b=fWi7eznRNeT/8Zem+rZpjthrbTtfop5enXzlwq+jvS2OGFrFQdXRKDE5s722PP9ZvOxOuj
 dWqhKbReFqDv4zmsPJWEdrDwhPCDgXtcONBAH00e08IlZ5QM2Zo3u2U99a0JMAHXpuu/Ui
 o2ulJ6zGCXuj872OdVVLbGgnyjqflyk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-iRayJi5CNPqnzOUjjG7xkQ-1; Wed, 05 May 2021 09:20:25 -0400
X-MC-Unique: iRayJi5CNPqnzOUjjG7xkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z9-20020a1c65090000b029014b497b2d98so546202wmb.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ujBBX4Ohjb3zxsPX3c4GRBN2vO2v/Xn58LiXA743fbo=;
 b=ZfHsciUTiYTG87DNr7RJ3LykNnzTqYOsILksm22hwf6FmRBJofTgX2iQdrTcTiIOUx
 AKlrrOi7J9LbUELQRhaTh75qpcgYZ6R68awRHyJbY/ZrGKDTx1DZfUrR+zBAXEjaVoIj
 JG4j9WOZd2VVmhHFUCDIDRDfoPmGrZc+kIUHzzA6waA06otM0amtWhWyRqs8VRYXUJ4v
 fGuQG5CRGT/AAFT+4eQIoWL3FuL/zwepPJUzd3Y3CBy4ZwgXhxr13yV9QQELUhm/CVf7
 R7qgucRc0t6gVV4zbqYc8ziid5ZvK1SSNu1jAYhUjAxKO5RCb6Kkze59kK/CAdxUGqUQ
 h71w==
X-Gm-Message-State: AOAM533fJmBQz53izRDVn13fM9brYheO2tmwBwPrIFR5pZaCk5PAHsO3
 L/0A+/1OnnJNjnVkmiVpQ5B08OV8csdXt8bek2prijoNX9gnDGMIDllalAWC6rUAJPFDTxQtUU7
 p+pLjo5upSwpjE7A=
X-Received: by 2002:a5d:4532:: with SMTP id j18mr34219200wra.223.1620220824225; 
 Wed, 05 May 2021 06:20:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTlrVaFJMZbvvNBBRXFgwAfaYG270ozPy4NVvsKXrNyUHk8d+bdSOA63P5FkNaLC53VTv/yA==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr34219185wra.223.1620220824082; 
 Wed, 05 May 2021 06:20:24 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id m11sm19624831wri.44.2021.05.05.06.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 06:20:23 -0700 (PDT)
Subject: Re: [PATCH v7 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
To: qemu-devel@nongnu.org
References: <20210505125806.1263441-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <362383cf-0e04-96d7-f950-a1ecf377f1a5@redhat.com>
Date: Wed, 5 May 2021 15:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 5/5/21 2:57 PM, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

Igor made a comment on the last patch (qtest: Do not restrict
bios-tables-test to Aarch64 hosts anymore).

The following patches are the one helping Claudio's x86 TCG/KVM split:

 2> accel: Introduce 'query-accels' QMP command
 3> qtest: Add qtest_has_accel() method
 9> qtest/bios-tables-test: Rename tests not TCG specific
10> qtest/bios-tables-test: Rename TCG specific tests
11> qtest/bios-tables-test: Make test build-independent from accelerator

The rest are for his ARM TCG/KVM split.

You might queue 1-11, or only 2-3 & 9-11 for x86 and I'll resend the
rest via qemu-arm.

Thanks,

Phil.

> Philippe Mathieu-Daudé (12):
>   MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
>   accel: Introduce 'query-accels' QMP command
>   qtest: Add qtest_has_accel() method
>   qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
>   qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
>   qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
>   qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
>   qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
>   qtest/bios-tables-test: Rename tests not TCG specific
>   qtest/bios-tables-test: Rename TCG specific tests
>   qtest/bios-tables-test: Make test build-independent from accelerator
>   qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore


