Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBB477788
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:13:57 +0100 (CET)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtOG-0004LV-Qk
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:13:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxtMY-0002wq-Ca
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxtMW-0001Nk-Mp
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639671128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ci8aUumshJi3+Oqr89V5mrbBCto8cnGrrZ4pltdLslw=;
 b=C7q7Ci+WenJdmJ9Fg0IGeDTmd6o47XpjJZTpPShIVvkoL5BYrl/V5wp6ddjxHLYUJgvM4P
 P2aqjOWoBMJVZoK0jkEdu20jMGLfde7ZZh6jmaPygl+Mbo++qyh7lI+V/SJa/52uPjpJgA
 Qyc6rYkKbX9Wjuz9dt/tpEo0mbhS1uo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-ENYQw90sNuqqYvyIjVzZdw-1; Thu, 16 Dec 2021 11:12:06 -0500
X-MC-Unique: ENYQw90sNuqqYvyIjVzZdw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso10468137wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ci8aUumshJi3+Oqr89V5mrbBCto8cnGrrZ4pltdLslw=;
 b=YWdFTb+Tq4V1Bm8zqpcCIGwvIf1UBPqJ2RDE/LyH13wxW23pPDcKcwsA4M5EvNn9ZQ
 GCkFo+b1r13pQ2nnkDMmHbvhNshsfnxnqAFoFP4XhzsPtOV5CZPg+R4j92WTVWnXCHin
 02FKgEL74Nc/5LvI5eeqfO7wGnIqhTMcbt9Uyk2nlsKsU5x5aQtHJOl8Wgr4NbnGgirQ
 lFAna+PPCgV2eKswbHLaSn9ifq4z9y0lxj5wQdjpA1PWI0mWBxXI6op/G2R17vZyFZgX
 w2udP4bjbEmmXyEDoTAzDLh/dbGzX+FOp2J1/jwehh2xVPeNLdDRrVqf0oOGwnuNEm8q
 crDg==
X-Gm-Message-State: AOAM533A9N0xZ1seIzDCYfur/LcAqyDHTHdUGeXVm8EJcUuwu+pSpRlw
 D9i8njfhd6igm0ZbIQBzz52TUzP2OeSzQV2eBtrvz12IbZoh6htCqotpfaxrcKONflHjuKCjjOF
 SF0HkNCBkTa7ScaI=
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr10033667wrw.253.1639671125643; 
 Thu, 16 Dec 2021 08:12:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDbfOZ/dYf77ITe46SfIlBwB9C/MaO5U7b/tyjkbXTvZCqpeObHQnzK0Rl7kGhetET2a1CsQ==
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr10033639wrw.253.1639671125480; 
 Thu, 16 Dec 2021 08:12:05 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b15sm7017913wri.62.2021.12.16.08.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:12:05 -0800 (PST)
Message-ID: <78deb03e-3c35-af2a-b804-29689bbfcd80@redhat.com>
Date: Thu, 16 Dec 2021 17:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 10/31] block.c: modify .attach and .detach callbacks of
 child_of_bds
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-11-eesposit@redhat.com>
 <f996c8cc-c025-f8a5-c89d-cd8b8a94e7c5@redhat.com>
 <937d15e5-4ba5-af84-f3bf-a4aa828f9d82@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <937d15e5-4ba5-af84-f3bf-a4aa828f9d82@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.12.21 17:05, Emanuele Giuseppe Esposito wrote:
>
>
> On 16/12/2021 15:57, Hanna Reitz wrote:
>> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
>>> According to the assertions put in the previous patch, we should
>>> first drain and then modify the ->children list. In this way
>>> we prevent other iothreads to read the list while it is being
>>> updated.
>>>
>>> In this case, moving the drain won't cause any harm, because
>>> child is a parameter of the drain function so it will still be
>>> included in the operation, despite not being in the list.
>>
>> Sounds good.
>
> Uhm.. I don't think this is useful at all. I was thinking to drop this 
> patch in v6.
>
> My plans on subtree drains, ->children and ->parent lists are 
> explained in "Removal of Aiocontext lock and usage of subtree drains 
> in aborted transactions"
>
> https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/
>
> And as I say there, commit d736f119da makes sure that it is safe to 
> modify the graph even side a bdrv_subtree_drained_begin/end() section.
> So this should be unnecessary.

Sounds good, too. :)

Hanna


