Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937455EB11
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 19:30:58 +0200 (CEST)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6F3A-00056r-RZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 13:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6F19-0003XA-HU
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 13:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6F15-0000wy-3k
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 13:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656437326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSUGgiftVee3F10o2acRiBoHevmMPvJmIsPtHYZfiyY=;
 b=B81GK/PaqJBwB9DI4d6OO/f4pPInb49aNBdDI1WnBF6Nz9+q+HQOqmGZB2ailqY8tboVHL
 p/NkKoGY87T2adE1lHx95J3vc47O2e99YyWzIH8MLqSuqs0haswc0e0BqkdE4cPmVoKMI3
 BpS9Xfzab/m41pywtIjw7PC5+UGpdF4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-Knh_30UlNB2JqUwPTP3BlQ-1; Tue, 28 Jun 2022 13:28:45 -0400
X-MC-Unique: Knh_30UlNB2JqUwPTP3BlQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b7-20020a056402350700b00435bd1c4523so10057113edd.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 10:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cSUGgiftVee3F10o2acRiBoHevmMPvJmIsPtHYZfiyY=;
 b=fKsoKGWbfQhaI+kBlpAi6dD/XLg82xHyM2GCxILYLyOrZx6cHS9w758YIMoADOG6ga
 nEeqxhyo/8SuUVoD8PhYmsXvBLA+crUyaCqYe1kG4veC6PBZH6xZVsBrgdOtQXiPvGWM
 ya3gsQkxK0KfL4arwtE06/S9nBqP9XTitViPO7EMOSNRarS9y1FfOnO+g/LYqeXjkhAR
 XJH6GR92g18p4eyushecnly7cFWe4JlVhcBgn64WWRQjVjoyYyzBmNW6RRWIrLiz0kk4
 iVAu6PI5tNtkWQ2SFBY1mn+eg23hU5E/pyI1DIZ6lC50sWPwqaidTFhoc0o3/1lWJw0O
 N4NQ==
X-Gm-Message-State: AJIora8vS7gPtZXn6xDJG6Opt/Ukx3fmRax/Sq5o6mB6P3rQWqG+pAvt
 +tvFIaKQb6TJGoLM+s12cv3lvhf+haAH4Y5lXY+IKlLzaUXXtr6dVdBlIH3pRwTQMnW4VSagXcG
 SmDC3ObwjmDmCArA=
X-Received: by 2002:a17:906:c5:b0:722:e65d:770d with SMTP id
 5-20020a17090600c500b00722e65d770dmr19177733eji.330.1656437323760; 
 Tue, 28 Jun 2022 10:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4gspU8MptMxxso/tzZ3W2939ASjEA/Ft08c9IfS4x2/S7Byo9J6SrF5bV+1ZpH7t8hwFMsA==
X-Received: by 2002:a17:906:c5:b0:722:e65d:770d with SMTP id
 5-20020a17090600c500b00722e65d770dmr19177690eji.330.1656437323401; 
 Tue, 28 Jun 2022 10:28:43 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9988633edb.56.2022.06.28.10.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 10:28:42 -0700 (PDT)
Message-ID: <0a2914ed-2976-1e6e-ca90-73bffb92d361@redhat.com>
Date: Tue, 28 Jun 2022 19:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-11-eesposit@redhat.com>
 <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
 <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
 <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
 <8248df6b-3b48-6e09-5a5e-021cf65041dd@redhat.com>
 <98558a3e-3bd6-40b0-07da-1d022dfb0c0c@yandex-team.ru>
 <458dfa2c-4161-394c-95a0-d9e06757add5@redhat.com>
 <bdfafb6d-baaf-55ac-c323-dd2cbfb02d11@yandex-team.ru>
 <97ebf37c-1e86-7627-18de-d5d740dd0a6f@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <97ebf37c-1e86-7627-18de-d5d740dd0a6f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 28/06/2022 um 17:26 schrieb Vladimir Sementsov-Ogievskiy:
> On 6/28/22 18:22, Vladimir Sementsov-Ogievskiy wrote:
>> On 6/28/22 16:04, Emanuele Giuseppe Esposito wrote:
>>>>> Ok so far I did the following:
>>>>>
>>>>> - duplicated each public function as static {function}_locked()
>>>> They shouldn't be duplicates: function without _locked suffix should
>>>> take the mutex.
>>> By "duplicate" I mean same function name, with just _locked suffix.
>>> Maybe a better definition?
>>>
>>> Almost done preparing the patches!
>>
>> Why not just add _locked version and rework the version without suffix
>> to call _locked under mutex one in one patch, to just keep it all
>> meaningful?
>>
> 
> I mean, instead of:
> 
> patch 1: add a _locked() duplicate
> 
>   At this point we have a duplicated function that's just bad practice.
> 
> patch 2: remake version without prefix to call _locked() under mutex
>  
>   Now everything is correct. But we have to track the moment when
> something strange becomes something correct.
> 
> 
> do just
> 
> patch 1: rename function to _locked() and add a wrapper without suffix,
> that calls _locked() under mutex
> 
> 

That's what I always intended to do. As I said, I just used the wrong word.

Emanuele


