Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2723FD9F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:07:48 +0200 (CEST)
Received: from localhost ([::1]:33756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPy0-0007kd-09
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPlX-0004um-Vq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPlS-0007QD-Gq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630500889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1DqXMhNAaWPqPGBapACqukI1gXp4PB9/nOZZh1WY9U=;
 b=XayeIAUCTGAbPPCqSlxNggi/NaAJd47bpXrjLpuLAul+foAC3c2sJbZRLI0KpQ7g3eBOPy
 ppELk4BvJ402cHXUUAMUJLD3KyD5bmFuYUu70uJgt+xrpQxQfsSiZh9sPdQivTD/wqIo+u
 q6hCCO+MkW899k9RN50Isa3wNS06HcU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-I2kAN7BmOfSWH2-wOeoiAw-1; Wed, 01 Sep 2021 08:54:48 -0400
X-MC-Unique: I2kAN7BmOfSWH2-wOeoiAw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso984846wma.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=F1DqXMhNAaWPqPGBapACqukI1gXp4PB9/nOZZh1WY9U=;
 b=b1vIahWFXnyVUdJ/Zql0iE68ZWTx87zSkWjX17G1swbCy+6pGmRlWevXTZU5V1vXsc
 M6/4hxdV4gQsl/R2JRbmXcxXtBYFtB36qS1N7VwlVKdxuzXJLojZXSvag3vPeVGJz/ex
 VQvn59Bb6C08MIDfamNEaWRE8PGlzfX0i9K/ysm1cYGL4fGtUVEkh3UtfyTZ3dPep//o
 LqaXmuveDAq8MvvM6IoWOaPpy2QYkRtvU00QlpsTXjzCYvdDMNQDqQWf24bmM0miG/Op
 /p7GQvOLCvyqv+0bLcULD9XEk4Ypul9v1ZY8y2aNsdPw1kVkN4wpctw1GCs95PjqHibh
 6FgA==
X-Gm-Message-State: AOAM5317dM8fmm8fhxikGbWilOyW7iIs/df4Czh0KXl5Le+kDCD/lDNw
 5+ALxmFuPiJwquW5oUwh1hHZrlmCPelf7Dgl4xthVgC5Fwg3eU8aB67wXE6kaT5e3k4GzXFiuWb
 SMwwUCxmVcYZTXRU=
X-Received: by 2002:adf:c40d:: with SMTP id v13mr35240261wrf.388.1630500887727; 
 Wed, 01 Sep 2021 05:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl6ZbRnhrjS6XklhNpfLCnUGV1oxsOhR3TrGCnphrhjWzctAnHB+tSJ5JTkNQghL44Hxk2uA==
X-Received: by 2002:adf:c40d:: with SMTP id v13mr35240231wrf.388.1630500887384; 
 Wed, 01 Sep 2021 05:54:47 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z14sm5200139wmi.24.2021.09.01.05.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:54:47 -0700 (PDT)
Subject: Re: [PATCH v8 28/34] iotests: move 222 to tests/image-fleecing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-29-vsementsov@virtuozzo.com>
 <3dc6d789-1793-d80e-7318-2714de7e36ec@redhat.com>
 <4ca70606-dba6-9fb6-20ca-a3971216b0de@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <25632190-9de5-c8c0-a1d6-40bc3c901309@redhat.com>
Date: Wed, 1 Sep 2021 14:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4ca70606-dba6-9fb6-20ca-a3971216b0de@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Max Reitz <mreitz@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 14:47, Vladimir Sementsov-Ogievskiy wrote:
> 01.09.2021 15:37, Hanna Reitz wrote:
>> On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
>>> Give a good name to test file.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/{222 => tests/image-fleecing} | 0
>>>   tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
>>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>>   rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
>>>   rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} 
>>> (100%)
>>>
>>> diff --git a/tests/qemu-iotests/222 
>>> b/tests/qemu-iotests/tests/image-fleecing
>>> similarity index 100%
>>> rename from tests/qemu-iotests/222
>>> rename to tests/qemu-iotests/tests/image-fleecing
>>> diff --git a/tests/qemu-iotests/222.out 
>>> b/tests/qemu-iotests/tests/image-fleecing.out
>>> similarity index 100%
>>> rename from tests/qemu-iotests/222.out
>>> rename to tests/qemu-iotests/tests/image-fleecing.out
>>
>> Good news: Including error-report.h helped with most of the CI errors.
>>
>> “Bad” news: .gitlab-ci.d/buildtest.yml has a complete ./check command 
>> line including test numbers...  Not sure if that’s a great idea, but 
>> in any case, this means that build-tcg-disabled fails because that 
>> command line includes 222.  I think the fix should be simply to 
>> replace 222 by image-fleecing.  I hope that’s alright for you?
>>
>
> Yes, that's OK, thanks
>
> Unpredictable thing :( A reminder to always grep for file name when 
> rename it..

Yeah, but in this case...  Grepping for three-digit-numbers is just a 
pain.  (And grepping for “check” is not much better.  “./check” works 
reasonably well, but if someone invokes it differently somewhere, I will 
have missed it.)

Hanna


