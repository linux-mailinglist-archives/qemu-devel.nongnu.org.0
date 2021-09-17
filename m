Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE640FAD2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:53:08 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFEd-0000iz-L9
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRFBb-0006In-O4
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRFBZ-0005h1-Rd
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631890193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdjJomhq7uhdCuK023i8kvx7DuuzdX9OmWfDYG5CoIo=;
 b=Xo2VJJI8MyssMGLUNascQjoSt97/jUQcaGXaezJx0JYUoca+0oIYoV4lt0VXUgedKFgcAR
 EOKygAN/ujZcMIXp8JXk3H/TbXRjic4XHdVeAb00WONDvlQu/xdXEEga2VfqBwHPTsshGd
 lBCEvOxG4W6g/IqW9GIOphq1aKK1ktE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-tbo56hgqNmGzhU5xLUs3XA-1; Fri, 17 Sep 2021 10:49:50 -0400
X-MC-Unique: tbo56hgqNmGzhU5xLUs3XA-1
Received: by mail-wm1-f69.google.com with SMTP id
 75-20020a1c004e000000b00307b9b32cc9so4815774wma.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cdjJomhq7uhdCuK023i8kvx7DuuzdX9OmWfDYG5CoIo=;
 b=3EBYFwz2ol1rjjUGQtDA2JZuk0C23mzpMyHLI84KSc6yhazqycfG7huFvfO7Gr2wH1
 BpDmaxkH9BZxvKmUItPvAX+5xhohVniSqLF8UsjSXQf0eYnOa4h2aVEb9J+pR/GEx/ut
 9SXprcuSMRo7pfc/XkhJHC+lA9aVojX/7ph10LTqvD+69HZtBGpnObs42n1h2Y4vjz23
 Aj35aghKFjjc+FY4sZ1gl7lQfPHCbkpAmI9ibdo65DlRVQaOYZgphKekqy+/Bzic08rj
 /Mj9ehV5Th9UMp6emTaCSZwjWbW/lj+74It6gT3roXBxBA9ovhhKvXPFKjkBdAU8UHY0
 DI1A==
X-Gm-Message-State: AOAM532sGUVVx2OrdWq/KET6SdIapAMB8XvfQEnuYm7qr0xxxAe3djZI
 cY0nxrX+Kx8GqUY4t+G+Ht5mufcZAMJMc2c9Sky1+cLb9qe+n7Q5amoUXTE382pz7tFRpYIqhUv
 J7w7GuW51CTHEqdA=
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr15789536wme.51.1631890189543; 
 Fri, 17 Sep 2021 07:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCrk+HOLZEeI5JL8aGYKl58IAJ4xJ1dI97j504MR8BQpiUYAhT/CXaP09ynUm+SLPhEGojYg==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr15789516wme.51.1631890189357; 
 Fri, 17 Sep 2021 07:49:49 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z5sm11151527wmp.26.2021.09.17.07.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:49:49 -0700 (PDT)
Subject: Re: [PATCH v3 00/17] iotests: support zstd
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <2e923c5b-0bfa-6870-be68-cd1ccb7b125d@redhat.com>
Message-ID: <6de70a00-ff7a-9155-ff97-3e28df4c9059@redhat.com>
Date: Fri, 17 Sep 2021 16:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2e923c5b-0bfa-6870-be68-cd1ccb7b125d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.09.21 16:45, Hanna Reitz wrote:
> On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>> These series makes tests pass with
>>
>>     IMGOPTS='compression_type=zstd'
>>
>> Also, python iotests start to support IMGOPTS (they didn't before).
>
> Unfortunately, the problem I have now is that it makes the tests fail 
> with other IMGOPTS.
>
> My regular test set includes 'refcount_bits=1', 'compat=0.10', and 
> 'data_file=$TEST_IMG.ext_data_file'.  These fail now, because the 
> Python tests don’t have a way to specify which test options they don’t 
> support (like _unsupported_imgopts).  Handling data_file of course is 
> extra tricky because now every disk image consists of two files, and 
> the qemu-img create invocation needs to expand '$TEST_IMG', like 
> _make_test_img does (in the line where imgopts_expanded is set).
>
> I think we need an unsupported_imgopts parameter for Python tests, and 
> it needs to be filled (perhaps 
> https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00082.html 
> can serve as a starting point).  And for the time being, I think 
> Python tests should be skipped altogether when IMGOPTS contains data_file.

(Perhaps I should explicitly say that this means I didn’t include this 
series in my pull request this week, because, well, my pre-pull tests 
were failing :/)

(Also wanted to let you know I’ll be on PTO the next two weeks, so I 
won’t be able to review a v4 or talk about how exactly we want to handle 
IMGOPTS other than compression_type until Oct 4.)

Hanna


