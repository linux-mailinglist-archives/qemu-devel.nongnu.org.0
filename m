Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B953337112F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 07:18:38 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQyb-0003pU-QS
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 01:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldQxG-0003Mi-99
 for qemu-devel@nongnu.org; Mon, 03 May 2021 01:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldQxC-0007QW-NZ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 01:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620019029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgL+7qOptBe6X0eBMmZhTvHSG+CEO9aCV45UeBhj/gI=;
 b=Ci3uML+o0gAuVh6nP4CfYV/chfdztvee7AOdSWtl1wfiTJ19UKa6HRmGOEf7tUIjQDzWj2
 80XO1ZhJGwmRAbj5sr5VvnMVwpyZCvUXexApd9R5XVQBr9zcsBpqVevjdb8i1OKvnzzJvL
 2jv0FpNosphb+WUHldcmPuD0AT+WXVU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-TKUloOndN5Gj1vip8boZMQ-1; Mon, 03 May 2021 01:17:05 -0400
X-MC-Unique: TKUloOndN5Gj1vip8boZMQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so3225690wre.22
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 22:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cgL+7qOptBe6X0eBMmZhTvHSG+CEO9aCV45UeBhj/gI=;
 b=iiAdaBYDXyOgedl3kGQTmlS2Xd7CpGoUdcFhl4xoulsStCiJquykpriOp59Srv9pbF
 C5Dc9DxGK/6cfaNNjvNK5I5B5Xu46gbjKIC1L1lJOx1WeTlGxEZbR9RsRjPT4wNMis+g
 fKOQwWvg025meTQv8/ZychTfIXd9yCX68tOyA696LXpImaiYo7AxPiPiMtWHjpPS0QF5
 B5kzojFLwWPQPbmE3+QqpHFXxHe7g4uvmsnbJNn5fC0JH2NdSVAPFQmNp8L75z2vP3mv
 Oqgba2zbV3qQvUh6/vv658um+T6Y78Pv0euDjtrZP97JnOsCCrCAQ5fsT5Pn6TgRv1OR
 Mjmg==
X-Gm-Message-State: AOAM533LeNOA/QvlMKu643xl5AWMJLkw5mZc8zbPAxJY+dQEvQfd2Oox
 L6u+XmTXIidwzaRamxtirnjSyUDGZNBoB7qh8aaJNF1Eju9AxFguqke83YmzbMv3sczz/vuhrq/
 gtgw222gCupdTUks=
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr22686666wrn.6.1620019024732; 
 Sun, 02 May 2021 22:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdulMoyr4Xg0aBFddClu1CCYhHiaWIXVY8REHnzEAgacvGDGpmaA4o1A6hSGu5iifTk55eig==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr22686651wrn.6.1620019024574; 
 Sun, 02 May 2021 22:17:04 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id b6sm19107438wmj.2.2021.05.02.22.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 22:17:04 -0700 (PDT)
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
To: Markus Armbruster <armbru@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
 <87r1iofm61.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
Date: Mon, 3 May 2021 07:17:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87r1iofm61.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 06.58, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Clang unfortunately does not support generating code for the z900
>> architecture level and starts with the z10 instead. Thus to be able
>> to support compiling with Clang, we have to check for the supported
>> compiler flags. The disadvantage is of course that the bios image
>> will only run with z10 guest CPUs upwards (which is what most people
>> use anyway), so just in case let's also emit a warning in that case.
> 
> What happens when you try to use this bios with an old CPU anyway?

Interesting question. I was expecting the guest to crash since it would be 
using a CPU instruction that is not supported on the old CPU model. But I 
just gave it a try, and there was no crash. The guest booted just fine. 
Either Clang only emits instructions that work with the old z900 anyway, or 
our emulation in QEMU is imprecise and we allow newer instructions to be 
executed on old models, too.

  Thomas


