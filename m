Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C95E818F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:11:07 +0200 (CEST)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obn8k-00013u-EZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obn0y-0001m6-49
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obn0t-0004fp-76
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663956173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1osVp+IRRt/6H2eCPovCASGECZdGg0b2QaWhDa4D8GI=;
 b=G7U+ErIdWtJshePkeX8weZHQG8nG0Oo6QRatKNwnimwu+hh4vSOtut9Cm8z2fOLGvLwXDG
 6du7rHGCQ+GCVeWbwEfJ5EpOnpUaORVyalgdZX+izY34fbBkQ8Kvni8s2NcgQAL+1L/rt0
 7v9RVMOMytjJr1UeFjkjdve4D6i7L5M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-K-EXQ1hCOP2m6WyQYErwIQ-1; Fri, 23 Sep 2022 14:02:51 -0400
X-MC-Unique: K-EXQ1hCOP2m6WyQYErwIQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso427437wmq.7
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 11:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1osVp+IRRt/6H2eCPovCASGECZdGg0b2QaWhDa4D8GI=;
 b=GbL0c1ZZuqJR2uXPxNWnLlrd+IPdEfh9aWxnXwAwmBeeHcL05Okwr9MLvexkzzn4ir
 CWd/+s47qxLJEGuW4Qv7kpumq2/KWyuaNvjTXMa5wy5d781KK+sB10lqJfqV14S+Hf7H
 bby1Drnq+HtfFCbBnKdZCfzLj5HCQ89WDBJwRghIDjEj/gokfSSSA1wDXt+tYOKDGBJB
 NZkOcf4kyRUsh8b3ejclAgwJObxoCvay2gCBwYPEWaI7cgTRvu7yhqxwmRMWu62A+g54
 8pS0J2ZGXIBTWU3epDBMeRs7td9Y3NE/XneQ6mRStn66FHINsYOwtkzf3+6PthHTMe/G
 Aghw==
X-Gm-Message-State: ACrzQf0rWKPfO8PZmTGVrbTAZk+9bAlM+lB4Hfa/GPCfEwYWkMdujNqe
 k0tMkTUI6HiwDK7d5QXMeUmjLxWkzeEHnwKWmx2/OBOso+Ttbo117jxVftgzQpvAD7u92sVbJrh
 y2NsEiLxQSQeeCsE=
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id
 r5-20020a05600c35c500b003b4bf50f84amr6541033wmq.22.1663956170157; 
 Fri, 23 Sep 2022 11:02:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5wzR5A0Ua3qXprP8A1cuHn4spq67nDfzrDHrxq7RvwIhhUS/oYp+G0Uxtj1jsBK6/ypFJLJg==
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id
 r5-20020a05600c35c500b003b4bf50f84amr6541015wmq.22.1663956169910; 
 Fri, 23 Sep 2022 11:02:49 -0700 (PDT)
Received: from [192.168.8.103] (tmo-097-189.customers.d1-online.com.
 [80.187.97.189]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003b477532e66sm14849446wmq.2.2022.09.23.11.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:02:49 -0700 (PDT)
Message-ID: <1cec4c45-4449-8800-7bb3-c72269967398@redhat.com>
Date: Fri, 23 Sep 2022 20:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 01/39] tests: Change to use g_mkdir()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-2-bmeng.cn@gmail.com>
 <CAJ+F1CKiCiWBwr5CGAODZukJ8eYoJerhQ01AQYqWMLktsVDM2Q@mail.gmail.com>
 <CAEUhbmXV8SBNfW3teZw+A-EKxbjv-UwJZrND4mWOdxUKQT_MCw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmXV8SBNfW3teZw+A-EKxbjv-UwJZrND4mWOdxUKQT_MCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23/09/2022 03.09, Bin Meng wrote:
> On Fri, Sep 23, 2022 at 3:32 AM Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
>>
>> Hi
>>
>> On Tue, Sep 20, 2022 at 1:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> Commit 413bebc04603 ("tests: Use g_mkdir_with_parents()") replaces
>>> the mkdir() call in the test codes with glib's g_mkdir_with_parents(),
>>> but the exact portable replacement for mkdir() should be g_mkdir().
>>>
>>> I probably was misled by the GTK glib doc [1] before, thinking that
>>> g_mkdir() is not a supported API from glib. But the glib sources do
>>> not support this statement. It is probably that the GTK documentation
>>> was not built to include all APIs.
>>>
>>> [1] https://docs.gtk.org/glib/?q=mkdir
>>>
>>> Fixes: 413bebc04603 ("tests: Use g_mkdir_with_parents()")
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>>
>> I wouldn't bother anymore, I'd keep mkdir_with_parents for now. YMMV
>>
> 
> Yep but some maintainers pointed out in other patches in v1 that
> g_mkdir() is the strict replacement for mkdir() :)
> 
> @Thomas Huth Would you share your thoughts?

It's a little bit weird that g_mkdir() does not show up in the glib docs ... 
let's keep g_mkdir_with_parents(), that sounds like the better choice to me.

  Thomas


