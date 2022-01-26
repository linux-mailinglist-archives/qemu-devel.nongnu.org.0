Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9149CF54
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:16:00 +0100 (CET)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkxi-0004Wj-TM
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nCkhl-0005JS-9S
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nCkhj-0006qs-NU
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643212726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75+4YHbsjSjAX7Q3avJ7p7bRBe/5N2/37hFD7IlBNDU=;
 b=Ly8TiTU1uG6Li5JFfFMmEg2mmkCWE6PMaYFFX1sEgZz+rBHmO3tdXEMrhI6+NphzFJHgeQ
 /jER8UWLRKn9DcBuRhDmSha+fosFohhrgyeD3CzVJmX1zaxqHEV9WL+z7awi+JIffSHk/P
 Y8gnYlAEKYKN9guDrkIETr0wZ1wmfPE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-A-MCTi8ZM_uWvMh2WlTteg-1; Wed, 26 Jan 2022 10:58:43 -0500
X-MC-Unique: A-MCTi8ZM_uWvMh2WlTteg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m17-20020adfa3d1000000b001dd66c10c0cso1969953wrb.19
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 07:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=75+4YHbsjSjAX7Q3avJ7p7bRBe/5N2/37hFD7IlBNDU=;
 b=scTbb7xvptVa12sSR/bdPI7VSB+Y2/xdj6YUJJ643KZDT+pXJ4rxy61ysB4frs4H+s
 BBuf+/ZzyAejUPR4maijg+wOmbCQZdsYIvH0cMP9vMhIXRaSDoYNuATE/4JtEDvJD5xp
 c+6eYv55jb3idrm77fA3pJ9c5v8BWChwdDouT30ny99ZwHyuT3QGsXQdmUJbJp3wtMEo
 fE3q/Vp1KrAhLBTdlCtRTyvLSbD0JVgsWanxMgQWZf/xn1zsjdY3LH7ThZ47533O3oey
 1xQUCROZtlIkbMMXCEjJncqCQ/bfdZnVkNM3IAHSv/DW8CF/lbcYYysD87guQP3RS2/o
 j4fA==
X-Gm-Message-State: AOAM531bVZrZXFGXKlqhWHUP7cWwvQxg3pH5v9Si672iUfyqkfFuVBw2
 vbE+A8KCqyaz2jgNEimCZDBU7EH2++2T+1u8qN0oNcRo3CFKGjBssw71m/4G20/3QqyUdRUC/c4
 4yHd/bmwfUu1ebxU=
X-Received: by 2002:a5d:4050:: with SMTP id w16mr6756261wrp.662.1643212722470; 
 Wed, 26 Jan 2022 07:58:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4jCrqIhaO8zqZfDRX6rnEx+A0KIXTwLb3zvaXY+MMHZFYQHpD63bKdEYdHwiWEzC15g53HA==
X-Received: by 2002:a5d:4050:: with SMTP id w16mr6756243wrp.662.1643212722333; 
 Wed, 26 Jan 2022 07:58:42 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id m14sm13795841wrp.4.2022.01.26.07.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 07:58:41 -0800 (PST)
Message-ID: <b6843f45-4f2d-e502-2b32-fcb39f36b083@redhat.com>
Date: Wed, 26 Jan 2022 16:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 03/16] job.h: define locked functions
To: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-4-eesposit@redhat.com>
 <6a9dafe7-b3e2-68e7-e727-2086c7ceca6d@redhat.com>
 <93565619-bff8-9f64-50f0-3e9acd570777@redhat.com>
 <58f1095a-ac51-67b2-467a-fb2611664423@virtuozzo.com>
 <9e812bce-4acd-82e3-81e7-45a7011bac90@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <9e812bce-4acd-82e3-81e7-45a7011bac90@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/01/2022 15:26, Paolo Bonzini wrote:
> On 1/21/22 17:04, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> The split was proposed in previous versions, but Vladimir did not
>>> really like it and suggested to send it as a separate series:
>>
>> I didn't really like it as it seemed unusual and unobvious to me. But
>> if we already accepted similar split for generic block layer, no way
>> for me to resist :) And if we follow new logic of generic block layer
>> in jobs, it's not "unusual" any more.
> 
> Either way I think it's okay to have it as a follow-up.  The explicit
> naming in the API is a bit verbose but definitely clearer, so it's okay
> to order different than the graph/IO split.  In that case we weren't
> even sure, until you went through all the testcase failures, that a
> _locked or rather "_drained" API was possible.
> 
> Paolo
> 

Ok, I will send the split in a separate series.

Thank you,
Emanuele


