Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305B532F9B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:27:46 +0200 (CEST)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYJt-00080l-Cj
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntYHc-0005a6-E9; Tue, 24 May 2022 13:25:26 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntYHa-0006iC-W0; Tue, 24 May 2022 13:25:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id i40so23972700eda.7;
 Tue, 24 May 2022 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dnmwt+F26AMh7zif6d9yxcsZl1izCZHXXsocY6Cefno=;
 b=AUHqZWTk/UiOWp12ZiMFQufMEuPhkvLt7pYZH020T74atxxPHqv5mthgZIrM65FqVG
 JBQq7raml8nP1PJc19ZYhMSvkX94jhaxPMVjWAhpMAj6F+TrjTnwShHvR5xIW3TqXcCm
 UVsU8Wx5WpcN16lJpiEsFiTe9Ss/FNH87aKz19MxsBbdta/2UZv2ztQyNJsnCE9p9lg5
 BiqNz+tq3lPUSelBxXqUcHl56GCfVaB1pao6rYnBt3qo0JOOeiqO9uTOHNDS7d5c4QOc
 q3jFmgRseRs/l3t2Z6bA0unGSHqGM4FokVHi8mOj8PX2WupkBNcc04Wl0ihB0WNXEi86
 diDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dnmwt+F26AMh7zif6d9yxcsZl1izCZHXXsocY6Cefno=;
 b=LeO2VrgwiKnIGB1/GPvQDUUcBbBlqxLZQIRe3hhAc1binRx113I4vw9e71XUQp9ffD
 1wSuEufTcSuAKWictA28K6C7g61YHM/ngSNUJnfaM9AFfXOUr2C0vWVIVwnAVpqKHCQR
 dsUHPyIb/ZfOrqZzPTtZUj4c8sDbznMMV4w9gizVhy9s8rkG/Ficl0PUslCXjT3vLZB+
 pjTLBchg4ncKmNZv69VZ2YdqbLR3KC7bXY3wTjXsDZwOJnhv+A1BbXhnXGO76HLVC+UQ
 rPCoXvlZCYkhdC3UFC9xjw9glqLozhklaf1A8ebd6qIU1ehsPH7QEpy09lr5DGLYJlEA
 SclQ==
X-Gm-Message-State: AOAM5337O5WZj9CgsI81gX9j+j/4zXsU954PHoMxEiiBQR2wTiXfH5Lc
 UiKLP1vn2ohQWTFeEiqPS64=
X-Google-Smtp-Source: ABdhPJyryYDJB9/G2QpYaQdMWYqAnT7SGeXIHdusWBnJ9yzQ7+qI+qTjMEWoSk9rDkwFkzWw+K5lRg==
X-Received: by 2002:a05:6402:1508:b0:42a:b5da:b112 with SMTP id
 f8-20020a056402150800b0042ab5dab112mr30156130edw.192.1653413121301; 
 Tue, 24 May 2022 10:25:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 gx13-20020a1709068a4d00b006f39ffe23fdsm7502536ejc.0.2022.05.24.10.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 10:25:20 -0700 (PDT)
Message-ID: <f0552d30-2dc8-df5f-6de9-c59a2a2951c1@redhat.com>
Date: Tue, 24 May 2022 19:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com> <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <67993f7d-bc84-9929-0a28-10a441c3d5bd@redhat.com>
 <YoySiI+ReM2O8WEs@stefanha-x1.localdomain>
 <584d7d1a-94cc-9ebb-363b-2fddb8d79f5b@redhat.com>
 <Yoyxf4XDxhl4pDhr@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yoyxf4XDxhl4pDhr@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/24/22 12:20, Stefan Hajnoczi wrote:
>> Maybe it's safe to run it without a lock because it runs after
>> virtio_set_status(vdev, 0) but I'd rather play it safe and protect s->rq
>> with a lock.
>
> What does the lock protect?
> 
> A lock can prevent s->rq or req->vq corruption but it cannot prevent
> request leaks. This loop's job is to free all requests so there is no
> leak. If a lock is necessary then this code is already broken in a more
> fundamental way because it can leak.

Yes, you're right.  This particular list is always accessed in the 
iothread (if any) and blk_drain() is enough.  virtio-blk should already 
not need aio_context_{acquire,release}.

It's worth a comment, though!

Paolo

