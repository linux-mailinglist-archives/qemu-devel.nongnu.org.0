Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48C6296BB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:06:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outlJ-0005ay-AI; Tue, 15 Nov 2022 06:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1outl9-0005Zm-LT
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:05:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1outl7-0000Ob-IC
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668510340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pehhUc4fl9e4LU9oVkADobYtEPg/TRcC+9hn9hcH200=;
 b=aiWFHuXvzrqA0egR7Duc4sk15iDbKrCN9Wy/DSTNJMq/NmMgA+SuM/7G0+UncJq49HQdZ7
 GhT0LOf+pWA7y+MiEd9UpmRqSVGtHUHrSOekATufSw7xSMUWCBbVlNBH4LuNn3miyMggzH
 fuXMhcop1M/cz7Vw2PxTSiteMwvIWas=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-emDb7eP9NIGmBlukaWloeA-1; Tue, 15 Nov 2022 06:05:39 -0500
X-MC-Unique: emDb7eP9NIGmBlukaWloeA-1
Received: by mail-qk1-f200.google.com with SMTP id
 de43-20020a05620a372b00b006fae7e5117fso13233120qkb.6
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pehhUc4fl9e4LU9oVkADobYtEPg/TRcC+9hn9hcH200=;
 b=XRrfhyb9Nw45G7nF0n9lb49Lu0CcFALAS9ZzLvJy4GTMbCizSwlytNOZrpOh1ZrjPg
 on9HzQSuBxyk2C2RtMcVySzmQaJal/+riOZjt6ZoHMl58VqE+e757TNr/MqPZki2P1Nc
 RHGi/LwwK28j79l9M6aJJL3lLLToIrli+1vlaihpSjn6Zl4pfjRVeSivz7p7JMxdaep+
 CWhmESaWSiGguemee4BPKx5CpffFD4d+Z9doVYhEkUU98nvNQHBuQ+vriD4ag6mwWjJd
 Krm5/gB6LOQkQh1218PfUPcrAiGLu4VIn+ic9PR/dLsF1Bdzd2CzlDfC4o1c+m6YLWri
 fJDA==
X-Gm-Message-State: ANoB5pnaVRopATrAJImo6SKKZKDVkv3kaQSSKEsStzqZ2r181oD8cItA
 O16sgpGxXXf/5WXgIouKA6xKw32vV0puyhCg1xoaHdClCJaLgVfUDui9K/W04BeYzlo4Rk8PCrR
 ZeEYUN4p4dOIrb+8=
X-Received: by 2002:a05:620a:1a23:b0:6ec:534d:9932 with SMTP id
 bk35-20020a05620a1a2300b006ec534d9932mr14746119qkb.140.1668510338480; 
 Tue, 15 Nov 2022 03:05:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UN/v8FfoS06i1Is7V9kO4CT3hL469NooYwQoOA1qXwraPwqT+zB72gTCZw8jh1kbppCBquQ==
X-Received: by 2002:a05:620a:1a23:b0:6ec:534d:9932 with SMTP id
 bk35-20020a05620a1a2300b006ec534d9932mr14746100qkb.140.1668510338236; 
 Tue, 15 Nov 2022 03:05:38 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-149.web.vodafone.de.
 [109.43.177.149]) by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a0f0500b006eec09eed39sm8124429qkl.40.2022.11.15.03.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 03:05:37 -0800 (PST)
Message-ID: <3b848b0f-4040-c281-58ad-2d6c8dff1998@redhat.com>
Date: Tue, 15 Nov 2022 12:05:34 +0100
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
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0245aa92-e9a0-5c1f-cd62-65002ba2ef81@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/11/2022 12.03, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> As of v7.2.0-rc0 I am getting:
> 
>   (101/198) 
> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
> FAIL (23.51 s)

Is it 100% reproducible? ... the test is known to be a little bit shaky, 
that's also why it is disabled in the gitlab CI.

  Thomas



