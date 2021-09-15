Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE240C4FA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:13:29 +0200 (CEST)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTn5-0002Z5-JX
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQTlX-0001hx-Qe
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQTlV-0005Sv-2c
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631707908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjEs8bCQoCSQ/IZS12jUc7fSrAl+YN2O1Q2qJubQkGM=;
 b=Wmo/HNR61KhLaLFdMmyuSkn93kML5wnwjJHIkOCiTT62CEuNgDr9hd151g65hr7vhk47Gh
 XcAnmAwGDDMVX99XmFraED2BnWhJfWnaE33X8O1bAg4sMUUZpx+pggOoIQVfXbuX5579sc
 qRfbqZklJk3n1Qwn461phwTqZdkCZGQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-SpaSzxiSPcqajPB9b59Img-1; Wed, 15 Sep 2021 08:11:47 -0400
X-MC-Unique: SpaSzxiSPcqajPB9b59Img-1
Received: by mail-ed1-f72.google.com with SMTP id
 y17-20020a50e611000000b003d051004603so1503668edm.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 05:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pjEs8bCQoCSQ/IZS12jUc7fSrAl+YN2O1Q2qJubQkGM=;
 b=HyRReijImWqI6KegTey7YIB9Pw4nDSliTXfuppHMwKvMTCI9j4KmKx1yEr/tFahQAZ
 eru2kiVlL+Izj57qwvQhtMns1JpHzUSUCOZVngjjTHspzDUniULICX2ZVaD/GwBvgxKF
 GfG670sZi4C+lD5i3/V+AiiTNG/uGF3puC8MRDXdF/KlI/q1q/u5T6WwznS2JVCVB9eH
 k6If72nASfYuSS5nSvqpigSpOc61ctr25Bxn+eEJEXEi2q1CshIM5RGoE3+RblEiZReG
 NHdqIJ8lhviEOC5hbVLjeebnsoYDyghEbyn0bBEBVjAhpsUhR4W4iPNdwYMHMLmiDVUi
 Roaw==
X-Gm-Message-State: AOAM5312uuVswnI7JY9I6AFqubK/bX2Y5klj4nmqXwN1GJoNUskq6pfJ
 jBxbLRO6GVoFxsuF1hfQpe6UNGivyhlnh0r/z5h0s/+04Rhp3O/obmLw3yhscb9jWA3qxTA+jwW
 yq91V0i0lqoyz6wsptkw8QHDzeKsN6OUJNMxX/ZsyBCBzFbbBrBAzS2h47w7IXFYZtCc=
X-Received: by 2002:a17:906:1c99:: with SMTP id
 g25mr24549661ejh.521.1631707905792; 
 Wed, 15 Sep 2021 05:11:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyngN2lFdQfb0bcMQaQ6fDC7lxIkHXiqbA5srSylv6xQlMsAirLp0JINZoHnzqEPhgBk+/cUA==
X-Received: by 2002:a17:906:1c99:: with SMTP id
 g25mr24549607ejh.521.1631707905394; 
 Wed, 15 Sep 2021 05:11:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 10sm702230eju.12.2021.09.15.05.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 05:11:44 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <YT9NuK84J2hvMXs2@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <916c8456-9433-42a0-df2d-3e62ced283fd@redhat.com>
Date: Wed, 15 Sep 2021 14:11:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YT9NuK84J2hvMXs2@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/21 15:10, Stefan Hajnoczi wrote:
> On Wed, Sep 08, 2021 at 09:10:17AM -0400, Emanuele Giuseppe Esposito wrote:
>> Currently, block layer APIs like block-backend.h contain a mix of
>> functions that are either running in the main loop and under the
>> BQL, or are thread-safe functions and run in iothreads performing I/O.
>> The functions running under BQL also take care of modifying the
>> block graph, by using drain and/or aio_context_acquire/release.
>> This makes it very confusing to understand where each function
>> runs, and what assumptions it provided with regards to thread
>> safety.
>>
>> We call the functions running under BQL "graph API", and
>> distinguish them from the thread-safe "I/O API".
> 
> Maybe "BQL" is clearer than "graph" because not all functions classified
> as "graph" need to traverse/modify the graph.

Bikeshedding, I like it! :)

... on the other hand, qemu-storage-daemon does not have a BQL (see 
patch 1); "graph API" functions run from the main (monitor) thread.

The characteristic of the "graph API" is that they affect global state, 
so another possibility could be "global state API".  But is there any 
global state apart from the BlockDriverState graph and the associated 
BlockBackends?

Paolo


