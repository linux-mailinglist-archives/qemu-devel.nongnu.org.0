Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2D37D3A3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:44:10 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtq4-00060v-U4
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtd9-0005O4-Oi
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtd8-00016a-6Q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620844245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BP7W6a8RpVCY4wpWZIAfNBiQdnheZb9+Rrgsjy/+n3Y=;
 b=T6u3feWm/QvGFkVS2FVyFgn1hYDvNaWeMeeDswEv+5P4H79xVusYg7iNKqE1ri+FO7na9Z
 wDknagfX3nQfPhI59KKi+lGg798//EQavUTg7ZtgkWzlhfAP5hFC6DhwbdJpR58s8k+RKT
 E7u4GGa94OHMWEXroaa+KZE/QRmt2UY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-KdHVY_AaNaC25ERTelKqdQ-1; Wed, 12 May 2021 14:30:44 -0400
X-MC-Unique: KdHVY_AaNaC25ERTelKqdQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y15-20020aa7d50f0000b02903885ee98723so13251969edq.16
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BP7W6a8RpVCY4wpWZIAfNBiQdnheZb9+Rrgsjy/+n3Y=;
 b=qklDrxXeUeQoE+8Yj3jqjXUmhdeivWDHifqf6TKZum/SBvkLua2V+dqWd1WqxRKW8y
 pxPovLlALe6xWRYLWUYuybFK5XckAHmNDiYLR1HaFDlbvnvhhFu52paPXMPIOaBJ+vC5
 Yge2hP63518TDlCTSAfck+qTOxNCckQv+UtND+kUAL8VTeOtSqhDZnwLl+ZIhYvwNtFI
 rFZr45fpzc7I7iIwqmK6Zhb9WKux7wBQJerOvvKN53vrWnqE7yUiaZzXUpb8E8QCu5N/
 p9QYDfuBzA6JWfPWFKz5RxP2fLe1bhwTi5o7JyHz69SM2ROeKNPIinnMpAhSi54h1qTA
 J34A==
X-Gm-Message-State: AOAM530FnegffeCuwhXWQmqSR8vGKGFg9k461kH7pLiB4tnIi4+qQMum
 VuM96djMZXaHbqJ0TJbvj2fbbBSGsq4Nj9P8Ol3L37N/k7IOSALmwVlSRjdajH3pTCsSdThRg8o
 HAyvIfEoX4BS6HPw=
X-Received: by 2002:a05:6402:378:: with SMTP id
 s24mr10388281edw.164.1620844242853; 
 Wed, 12 May 2021 11:30:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI3BZsueKJ/QD8ZJJ6hKH0Vppq0Dt9l6zACy0LTz3SrP7B+WhO+LH7kwhTkXrhzpjy/bigBg==
X-Received: by 2002:a05:6402:378:: with SMTP id
 s24mr10388261edw.164.1620844242664; 
 Wed, 12 May 2021 11:30:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm460217edu.64.2021.05.12.11.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:30:41 -0700 (PDT)
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d11a9bb1-b1ce-0e7c-36b5-8b4b83c1e8fe@redhat.com>
Date: Wed, 12 May 2021 20:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 17:44, Stefan Hajnoczi wrote:
> If we follow this strategy basically any data structure used
> by coroutines needs its own fine-grained lock (like Java's Object base
> class which has its own lock).

Maybe not all, but only those that use CoQueue?  Interestingly, I was a 
bit less okay with ProgressMeter and didn't think twice about the other two.

Paolo


