Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C93796B8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 19:59:26 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgABh-0001t0-2O
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 13:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lgAAR-000135-9V
 for qemu-devel@nongnu.org; Mon, 10 May 2021 13:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lgAAH-0008CK-Vl
 for qemu-devel@nongnu.org; Mon, 10 May 2021 13:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620669476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XicTCUN+OxWOMUgQA6FsdiauVSgR4QXyEvYrd/ilcv4=;
 b=JXFzouHMqG0ChuR/nr6YRtPircngaySIExyZ5YM3ixjaB7XsO/Jh6AQiHF3wWAm9sFJ/yI
 6tcD4HtYTXVU3E8WMB+R9PRdjZZMbfUavdYTrbAcy4ql495lYgnsu4gYJz5IOSPUtrqyAR
 ogHTHiAEhBw0w6VHEUjLoNJEy2A0pEk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-mskKA2yhOfal1hVpvkESdQ-1; Mon, 10 May 2021 13:57:55 -0400
X-MC-Unique: mskKA2yhOfal1hVpvkESdQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so5070056ejc.15
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 10:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XicTCUN+OxWOMUgQA6FsdiauVSgR4QXyEvYrd/ilcv4=;
 b=gU7DggJlN7yz/Sni18nvSoG0JJrLhF2I4xsTSRhxxxc3tqb6eqIBAgL4lSJcT/EjIu
 H3Kntt3vgcdBYjYr59MmSeWysjaiR7jYMMZmBExQxtPr9NZxJO3NctAWXPj3gglXklrs
 TEIHaUYuikALThxeyHIhqNkTfeI+jo+80zFaDdL5Y1A7twWeBCYVFxbK74RMWTlKGD1/
 4iyG0nGkYaJo0ssj7zTfcDfNyUimzDl6S3MbR6gCAPPepEYJiANQ3Hra+J783F4mW2+r
 CDzRky7TRQo2VK4YzChuQGIKyk8YurznY/FJfDQhSz1cGfVyA5k4noiFPVKVWdT5AlrP
 yT+A==
X-Gm-Message-State: AOAM532PZXrYK0BLU5gB0Rcb3wh1CMGpi0+iZLY9fXrfZruvqeozENHD
 xDGRfEKw8+HH0NX4D5OPDFz+4LmMHys5vTW7WXavhzDBYofq4ttcQ5MIGmNlufBU4iBdUut0Xh2
 /O8oO4aLnegv+ApjjPpl4Ea9Xtam3Ayb44pNhUguuhCs1YdH2ZoUjpJjKU0oX3FgJDYY=
X-Received: by 2002:a50:ba88:: with SMTP id x8mr30506891ede.28.1620669473933; 
 Mon, 10 May 2021 10:57:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK8rXPgFD4+ehtHuhbEBuqfYRgLGOO3+pPyPfpdkNvsbMrnyKoRhwfexQ4xIOBTqR2ka+FqQ==
X-Received: by 2002:a50:ba88:: with SMTP id x8mr30506855ede.28.1620669473556; 
 Mon, 10 May 2021 10:57:53 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 b9sm11740036edt.2.2021.05.10.10.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 10:57:53 -0700 (PDT)
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
 <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
 <3d7d8bf6-a750-045a-0e47-5c496995e1c8@redhat.com>
 <47ca990e-5bd1-b446-3dd3-2956e9aa9111@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <887327d9-485e-4a46-7c53-8033ab9d5669@redhat.com>
Date: Mon, 10 May 2021 19:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <47ca990e-5bd1-b446-3dd3-2956e9aa9111@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>>
>>> We don't have caller that pass only one pointer. So we can just do
>>>
>>> *current = pm->current;
>>> *total = pm->total;
>>>
>>> implicitly requiring both pointers to be non NULL.
>>
>> Is it so performance critical that we need to skip these safety checks?
>> IMHO we can keep it as it is.
> 
> 
> Not performance. It's just less code. You propose more complex interface 
> (pointers may be valid pointers or NULL), implemented by more complex 
> code (extra if blocks). And there no users for this. So, I don't see any 
> reason for extra logic and code lines.
> 
> What kind of safety you want? All current callers pass non-zero 
> pointers, it's obvious. If someone will create new call, he should look 
> first at function itself, not blindly pass NULL pointers. And if not, he 
> will get clean crash on zero pointer dereference.

Ok, makes sense. Will remove the ifs.

Thank you,
Emanuele


