Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BD342E87
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 18:12:15 +0100 (CET)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNf94-0006oq-Oj
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 13:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lNf4a-0003Ki-Bi; Sat, 20 Mar 2021 13:07:36 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lNf4Y-0007P1-Ol; Sat, 20 Mar 2021 13:07:36 -0400
Received: by mail-ej1-x632.google.com with SMTP id ce10so14581196ejb.6;
 Sat, 20 Mar 2021 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fqY4D/uz8Gfx6j8oaXiYh5fGPY2y2sLm5P6geStiptY=;
 b=egP3VYCMDlky81lhDo8A7xHGMVk0+7Im+NggU8JpBucWlVpGRQO5ypYkbOXgUcxkIv
 sRworhdpoaehNdCcdZU6iIjGIsajh143P+Xe6aY92Axp4Npjg2Qu8TE+Y6MeeqzDIqN4
 d903Nb+v9sdOJUyhNCElM0YCXG+/WrKx6yTeMxm6peuCZ3CcWTEvrDo7CZB1jIfhAMlx
 dZP6B6X/nEpyzh7Kn6WfIcnka3s/RDEiUgc8sDiyH0EF7U7VnHaUihRxiuMed4E8Y0o2
 ksogqxrmgItlas/osiBfYrYUj+1ypRkGlGmrfkEgIvM6Ov/L8ibSINdpQQr7+I9eNDRd
 eyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fqY4D/uz8Gfx6j8oaXiYh5fGPY2y2sLm5P6geStiptY=;
 b=WvgbDSqZWGQF4J8PWkRYUjuBtC66/GREIz0oOgMkwPfxikgH3zatcpKEZd/G3Jm9Vj
 q2JreroXYxt4e7hBpy0dnu3Lm7SbfPXPNUZRwXfCiBTmTpt/UOpIE94556ja9vk1IHuy
 +Ou02tEeOqs4QHabvGzUOySBHrGqjb4I3dk2mHwvy9GUPLiW08qPEc7kuWNSFxYr/1Cs
 RE68o3zZBSb/Y6yTNM4fmynpOiUGGgexal9vGedwuGJMnQJcyLsnuVyfRIdJQuFYiHrM
 jom4ogaK9+7eIeH2JtW2YDCVVLhF1JEMx6yYT8cSelsIaT0otPpOLHm2NvRQqAPhwznd
 XFcQ==
X-Gm-Message-State: AOAM5320LOlz83Cl7s5wuNKbQXEfxUOEl/ZuNvi7PPK/v5fIc0DzbR/M
 uQ8ltw+z2wLB7kGxtgX9BWs=
X-Google-Smtp-Source: ABdhPJzzY58CxZytP5gMURR+QV247vmSzxpTq0DIG6wRLOjlG9aU9l71ZFDylRr/teD48t9nat4X9A==
X-Received: by 2002:a17:907:2bd7:: with SMTP id
 gv23mr10742984ejc.351.1616260052017; 
 Sat, 20 Mar 2021 10:07:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id n16sm6571885edr.42.2021.03.20.10.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 10:07:31 -0700 (PDT)
Subject: Re: [PATCH] meson: Propagate gnutls dependency to migration
From: Paolo Bonzini <pbonzini@redhat.com>
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
 <87f34651-8726-398e-31bb-3df7e8fac0dd@redhat.com>
Message-ID: <f13f65ab-b921-112a-a4b8-9b14d1fa2b2e@redhat.com>
Date: Sat, 20 Mar 2021 18:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87f34651-8726-398e-31bb-3df7e8fac0dd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/03/21 18:06, Paolo Bonzini wrote:
> On 20/03/21 17:47, Jessica Clarke wrote:
>> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
>> for softmmu configs, which pull in migration's use of gnutls.
>>
>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>> ---
>>   migration/meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/meson.build b/migration/meson.build
>> index 9645f44005..6fa2f8745d 100644
>> --- a/migration/meson.build
>> +++ b/migration/meson.build
>> @@ -24,7 +24,7 @@ softmmu_ss.add(files(
>>     'savevm.c',
>>     'socket.c',
>>     'tls.c',
>> -))
>> +), gnutls)
>>   softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>>   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: 
>> files('block.c'))
>>
> 
> Hi, can you explain in the commit message the compilation failure that 
> is being fixed here?

I suppose it's migration/tls.c?

Paolo

