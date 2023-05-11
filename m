Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76086FEE1A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:58:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28F-0004y8-Bx; Thu, 11 May 2023 04:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px28C-0004r0-V6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px283-0003n9-Pv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683795506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZnbcja1AXkpW76bEJXa+Ia1trhta/y7mr+gMPujRco=;
 b=J6keMVSKHB61uUJFqSdAx9wcvSpetub/8Rgd41VM5qdhoQVYNSKESGDad4zEok1vw45be3
 rRAD1Nv/08BNp7UJmUnBMz/aWR1ixO3kCFvvAESaZlVE42CMAnvNe5+euJyih38FJevQCk
 KM+V9H0aigwaWKwoCCr8Y9xqnoLG/F4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-ubElLWI7NXqtpJ-68hFM7Q-1; Thu, 11 May 2023 04:58:25 -0400
X-MC-Unique: ubElLWI7NXqtpJ-68hFM7Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso12387735e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683795504; x=1686387504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SZnbcja1AXkpW76bEJXa+Ia1trhta/y7mr+gMPujRco=;
 b=UyqAUSTpUI8SIo4Og7gxZ4cMLxEM7drmSl6bnSb6KLl8KT82l2LEIF7WJGt3YxDEg8
 Q5vxXd0R/h10K6mOB8LlPPKJjSd6okktzVsRce2eXn8y/39iUoA5UcEPVZ1WTadMzwhK
 RDgcUXTW96XyshAGTUMfVo7DP9zVh0py6oKnLJSUin5mFtnCIX+PwT0cD62EPNWcG8GV
 yqBtfJ3y6QnWJNaBATkTfBPujm9wB6UpZYO5UH9lO8oKmGvcSng0Y40kQimj9T8x3Qs9
 NtRgZJSH+z5OxZZ9wYQmO2nPENw7lo4NP8wLH8XSth3lDXtc+d3kjQpuLpJW7zabORzL
 WxpA==
X-Gm-Message-State: AC+VfDyw2qcFNjmuL+TNHuCwe+/JW6Y3cbwJOfRiYg6RNUTKs9sM3UNI
 8ec4OvwDa0fjqwdu3tsj3Ygdx2tNI3oOamrZUYetjosL9UUWM758TtteHeqD8/q/TEyMxUifJWr
 /+9OPkj2YW06ooOYwzsprQz0=
X-Received: by 2002:a1c:7210:0:b0:3f4:e850:64e4 with SMTP id
 n16-20020a1c7210000000b003f4e85064e4mr1076648wmc.37.1683795504480; 
 Thu, 11 May 2023 01:58:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/8wpRoVO0cogdpBr7Lj3BkbfOGrIwCzZwvhgg+n5LbATIAc/ciZ3h/jTacNxrPy4YZHMmtg==
X-Received: by 2002:a1c:7210:0:b0:3f4:e850:64e4 with SMTP id
 n16-20020a1c7210000000b003f4e85064e4mr1076634wmc.37.1683795504205; 
 Thu, 11 May 2023 01:58:24 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-67.web.vodafone.de.
 [109.43.177.67]) by smtp.gmail.com with ESMTPSA id
 14-20020a05600c230e00b003f4248dcfcbsm11891119wmo.30.2023.05.11.01.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 01:58:23 -0700 (PDT)
Message-ID: <1e0cf322-7c22-862c-f9c3-9b6099abaa54@redhat.com>
Date: Thu, 11 May 2023 10:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, maobibo@loongson.cn
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu> <ZEt/3RwtL/jePTTv@redhat.com>
 <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
 <20230428091159.haydefdtq4m6z2tz@mozz.bu.edu>
 <b151ecf7-0544-86ac-a182-1112a4dd7dca@redhat.com>
 <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
 <981cdcd7-7326-08f0-9882-e66840175205@redhat.com>
 <c4919eb6-74f1-7699-f924-6917cdf435bb@loongson.cn>
 <faa1c6e0-abc2-f108-cc25-2b2cf71bd3d0@redhat.com>
 <a5a05af5-bf26-ad10-f866-230e4525881f@loongson.cn>
 <1b3f4f59-4773-014c-1c8e-e300d14b1d2e@redhat.com>
 <d883eaaa-96e7-3cd9-9226-76a1fee874d8@loongson.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d883eaaa-96e7-3cd9-9226-76a1fee874d8@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/05/2023 10.53, Song Gao wrote:
...
> And
> Should we need add  '  @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')' ?
> 
> I see some tests add this.

No, please don't add that unless there is a good reason. That marker is only 
required if the test does not work reliable on gitlab, e.g. if it sometimes 
fails due to race conditions or if it takes incredibly long to finish.

  Thomas


