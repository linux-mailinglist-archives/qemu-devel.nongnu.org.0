Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E08C62B6CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 10:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovExG-0007eo-BU; Wed, 16 Nov 2022 04:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovExE-0007eJ-PI
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovExC-0001vo-FS
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668591808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+unuBzFpfH1k2QVpLYeMyWcRBu4QoK8NJtdGBBPFN8=;
 b=KNkeQdC+YdbqDoNbt4shhpEG0fVpRT7C92lbSqsa16kQh8L44dn7A+BhDAoEtssD9mb/pf
 JzM7yysEqZx3MuUgILkkP14idHusdh0vLxtU55JZG/4+z21lIUELgjOLx/p4/HC/jbGP2s
 iZG5FfeB0XYDARQeVD9tDqid6Vidbgs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-kawtmnlpOtSPoURDQ2XlUg-1; Wed, 16 Nov 2022 04:43:26 -0500
X-MC-Unique: kawtmnlpOtSPoURDQ2XlUg-1
Received: by mail-qt1-f197.google.com with SMTP id
 y8-20020ac87088000000b003a528a5b844so12495009qto.18
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 01:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+unuBzFpfH1k2QVpLYeMyWcRBu4QoK8NJtdGBBPFN8=;
 b=SoicJFLoUUYsmhvvfJYNDKkHH1auAVaupfh87xWptGu++K3fVJD7ac7bCs8Zlz1Q9x
 03qjeNtlwCrBxkN1RCZUPOdVrXxaMPJMbD25MKCTUX+NncFyFFV00zU2bOlad/TeuYMo
 qbwWldXetsyaJj6r0LbPHMgyJ1RXHXUsTMTiZaUIiGeoBr8qCsZ2hU5dTdI+MmaWgig5
 kpgpfq8U2bZTeTRU8Ig9exVoEQhScQ082YCp9gAKFpa4xOO2o3VgqZX4qY7ruxyLOZjf
 YkFLV9t0+RPZ0fLQyCOeKVnvfrv5/N8+o2cB1X0OvKAmoKuaeimnHDO87bVBSX7vNCrV
 5RLA==
X-Gm-Message-State: ANoB5pkIex4Te7tYFlhuQJpgKrDuSlB7BSuPKcWGrJKq/M4zFOxCoPVc
 XhFSGz84RyxuTT9tLG8XMqxSENzUTQyViFI2dbwLCN+kqLrSZECzFwdc9qWSP+yGHax98GWnThx
 CYet1lqRvSkWiqck=
X-Received: by 2002:ac8:53da:0:b0:3a4:f758:1c81 with SMTP id
 c26-20020ac853da000000b003a4f7581c81mr20141455qtq.456.1668591806463; 
 Wed, 16 Nov 2022 01:43:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7MPWPQfGWWNETT/QPf2rwqY3PiUxbv4a84+PgoA90fqklmwBtQ8xnOZNdccUlrsyz+txNEhg==
X-Received: by 2002:ac8:53da:0:b0:3a4:f758:1c81 with SMTP id
 c26-20020ac853da000000b003a4f7581c81mr20141447qtq.456.1668591806170; 
 Wed, 16 Nov 2022 01:43:26 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-179-13.web.vodafone.de.
 [109.43.179.13]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05620a210600b006ce1bfbd603sm9537264qkl.124.2022.11.16.01.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 01:43:25 -0800 (PST)
Message-ID: <731fb01a-b9ce-c68e-e0d7-2e3602955502@redhat.com>
Date: Wed, 16 Nov 2022 10:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: tests/avocado/machine_s390_ccw_virtio: Fedora test failing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <0245aa92-e9a0-5c1f-cd62-65002ba2ef81@linaro.org>
 <3b848b0f-4040-c281-58ad-2d6c8dff1998@redhat.com>
 <d984ce52-4fc3-8c22-83bb-93e901a67ce6@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d984ce52-4fc3-8c22-83bb-93e901a67ce6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/11/2022 12.13, Philippe Mathieu-Daudé wrote:
> On 15/11/22 12:05, Thomas Huth wrote:
>> On 15/11/2022 12.03, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> As of v7.2.0-rc0 I am getting:
>>>
>>>   (101/198) 
>>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
>>> FAIL (23.51 s)
>>
>> Is it 100% reproducible? ... the test is known to be a little bit shaky, 
>> that's also why it is disabled in the gitlab CI.
> 
> I am running it on my workstation, not GitLab.

I just double-checked and for me, it's working fine an my laptop, with both, 
rc0 and rc1.

> 5/5 failures. I'll skip it locally (no need to send a patch) and we can
> have a look after the release.

If it is a real bug, we should fix it before the release. Could you maybe 
bisect it, please?

Also, what do you get when dumping the console? I.e.:

./tests/venv/bin/avocado --show=console run -t arch:s390x \
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora

?

  Thanks,
   Thomas


