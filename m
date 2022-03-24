Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4174E6237
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:15:48 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXLRS-0000ZH-U6
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:15:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXLKP-0002S7-VA
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXLKL-0004cs-34
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648120104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZQzhddaE32qt9kQq99vv4hZPeqpTTs4EM24kZ6tX1k=;
 b=eSUbare4UErHFh2iHe6g/SUkGkySVtb+y7q4Kh7cdYJCv1PPZc4Sx3qihBE1MSRa1x3wT+
 llECMld7sSrDGHb3wI9e2Kd8ZGivkoqJ6V4rw+XAWwBR9g2cTajHkGMxRr0vRhfsSHIQc4
 sX6XE6whMUWGS4xbF1N1soeQsktYK58=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-Ie6BND22P4mAy9qQy8eAEg-1; Thu, 24 Mar 2022 07:08:23 -0400
X-MC-Unique: Ie6BND22P4mAy9qQy8eAEg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x1-20020a50f181000000b00418f6d4bccbso2821158edl.12
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nZQzhddaE32qt9kQq99vv4hZPeqpTTs4EM24kZ6tX1k=;
 b=sqya5+OoVDgnmAguRnB0frUpEKoCtgKEdNjr1UUaMeI05S2hoToDfvZzOqASWecGDW
 b1Pq1VrMe7ZZxMZiKNBotjbeSUZaEB1OJPTn1H2Xu9l4Pr/1yYTcidIPHbBmi+eFazUF
 vD7dJfA0/eptsDtyLWViYnYZyYxEI5Mb0R+lalGKy7TSWwJlBzF38tzA9jilEbc5b+Bf
 sMUhCp6IQbjMImVx6qiT3tmBVrL/fus9TgClw51WlGThFZ8UYYVP6srHCavnvtdEXvR+
 GMA3SiHzMMznuEGKFuA5XkIZGVSPRH08+HLSIuA6zHXciV32a67ht2N9Z0E4Y9+olHkO
 xceQ==
X-Gm-Message-State: AOAM530sqfcAODgzNF9B/8DSPXZW/Xyv9aDARl95cQ7ZfVp7G0m7xlT/
 oNKPKyLfYx9iiAh0/+hEwYIfAhqgRf/z7/cEVmkRn4CtAKuJOQC0PqtKFc4iSRL+drg9nb9aSbA
 zyqFqBgyQCLJRIek=
X-Received: by 2002:a17:906:4987:b0:6ce:88fc:3c88 with SMTP id
 p7-20020a170906498700b006ce88fc3c88mr4840310eju.608.1648120101729; 
 Thu, 24 Mar 2022 04:08:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuB9mkiW9NunLVetx4lu3MPD/Fl4pGRRPczHDhpftbiQE4jFYO8IWm4Ywai/hI/XYho+hlWg==
X-Received: by 2002:a17:906:4987:b0:6ce:88fc:3c88 with SMTP id
 p7-20020a170906498700b006ce88fc3c88mr4840286eju.608.1648120101517; 
 Thu, 24 Mar 2022 04:08:21 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 ga5-20020a1709070c0500b006de43e9605asm986888ejc.181.2022.03.24.04.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 04:08:21 -0700 (PDT)
Message-ID: <f0727d57-74e2-31b3-a89e-20ee636cfa0a@redhat.com>
Date: Thu, 24 Mar 2022 12:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] iotests: update test owner contact information
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220322174212.1169630-1-jsnow@redhat.com>
 <51806099-c55d-ce5e-ae3f-e1609c8a92e5@redhat.com>
 <993fb20b-0445-037b-e6a5-f13a48f9db4f@redhat.com>
 <YjxJsSRRk1kBzwz9@stefanha-x1.localdomain>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YjxJsSRRk1kBzwz9@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.22 11:36, Stefan Hajnoczi wrote:
> On Wed, Mar 23, 2022 at 01:10:19PM +0100, Hanna Reitz wrote:
>> On 23.03.22 09:39, Thomas Huth wrote:
>>> On 22/03/2022 18.42, John Snow wrote:
>>>> Quite a few of these tests have stale contact information. This patch
>>>> updates the stale ones that I happen to be aware of at the moment.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    tests/qemu-iotests/025 | 2 +-
>>>>    tests/qemu-iotests/027 | 2 +-
>>>>    tests/qemu-iotests/028 | 2 +-
>>>>    tests/qemu-iotests/036 | 2 +-
>>>>    tests/qemu-iotests/039 | 2 +-
>>>>    tests/qemu-iotests/059 | 2 +-
>>>>    tests/qemu-iotests/060 | 2 +-
>>>>    tests/qemu-iotests/061 | 2 +-
>>>>    tests/qemu-iotests/062 | 2 +-
>>>>    tests/qemu-iotests/064 | 2 +-
>>>>    tests/qemu-iotests/066 | 2 +-
>>>>    tests/qemu-iotests/068 | 2 +-
>>>>    tests/qemu-iotests/069 | 2 +-
>>>>    tests/qemu-iotests/070 | 2 +-
>>>>    tests/qemu-iotests/071 | 2 +-
>>>>    tests/qemu-iotests/072 | 2 +-
>>>>    tests/qemu-iotests/074 | 2 +-
>>>>    tests/qemu-iotests/084 | 2 +-
>>>>    tests/qemu-iotests/085 | 2 +-
>>>>    tests/qemu-iotests/089 | 2 +-
>>>>    tests/qemu-iotests/090 | 2 +-
>>>>    tests/qemu-iotests/091 | 2 +-
>>>>    tests/qemu-iotests/094 | 2 +-
>>>>    tests/qemu-iotests/095 | 2 +-
>>>>    tests/qemu-iotests/097 | 2 +-
>>>>    tests/qemu-iotests/098 | 2 +-
>>>>    tests/qemu-iotests/099 | 2 +-
>>>>    tests/qemu-iotests/102 | 2 +-
>>>>    tests/qemu-iotests/103 | 2 +-
>>>>    tests/qemu-iotests/105 | 2 +-
>>>>    tests/qemu-iotests/106 | 2 +-
>>>>    tests/qemu-iotests/107 | 2 +-
>>>>    tests/qemu-iotests/108 | 2 +-
>>>>    tests/qemu-iotests/110 | 2 +-
>>>>    tests/qemu-iotests/111 | 2 +-
>>>>    tests/qemu-iotests/112 | 2 +-
>>>>    tests/qemu-iotests/113 | 2 +-
>>>>    tests/qemu-iotests/115 | 2 +-
>>>>    tests/qemu-iotests/117 | 2 +-
>>>>    tests/qemu-iotests/119 | 2 +-
>>>>    tests/qemu-iotests/120 | 2 +-
>>>>    tests/qemu-iotests/121 | 2 +-
>>>>    tests/qemu-iotests/123 | 2 +-
>>>>    tests/qemu-iotests/125 | 2 +-
>>>>    tests/qemu-iotests/126 | 2 +-
>>>>    tests/qemu-iotests/127 | 2 +-
>>>>    tests/qemu-iotests/135 | 2 +-
>>>>    tests/qemu-iotests/138 | 2 +-
>>>>    tests/qemu-iotests/140 | 2 +-
>>>>    tests/qemu-iotests/141 | 2 +-
>>>>    tests/qemu-iotests/143 | 2 +-
>>>>    tests/qemu-iotests/144 | 2 +-
>>>>    tests/qemu-iotests/146 | 2 +-
>>>>    tests/qemu-iotests/150 | 2 +-
>>>>    tests/qemu-iotests/153 | 2 +-
>>>>    tests/qemu-iotests/156 | 2 +-
>>>>    tests/qemu-iotests/162 | 2 +-
>>>>    tests/qemu-iotests/173 | 2 +-
>>>>    tests/qemu-iotests/176 | 2 +-
>>>>    tests/qemu-iotests/182 | 2 +-
>>>>    tests/qemu-iotests/192 | 2 +-
>>>>    tests/qemu-iotests/200 | 2 +-
>>>>    tests/qemu-iotests/216 | 2 +-
>>>>    tests/qemu-iotests/218 | 2 +-
>>>>    tests/qemu-iotests/224 | 2 +-
>>>>    tests/qemu-iotests/225 | 2 +-
>>>>    tests/qemu-iotests/228 | 2 +-
>>>>    tests/qemu-iotests/229 | 2 +-
>>>>    tests/qemu-iotests/231 | 2 +-
>>>>    tests/qemu-iotests/250 | 2 +-
>>>>    tests/qemu-iotests/251 | 2 +-
>>>>    tests/qemu-iotests/252 | 2 +-
>>>>    tests/qemu-iotests/258 | 2 +-
>>>>    tests/qemu-iotests/259 | 2 +-
>>>>    tests/qemu-iotests/261 | 2 +-
>>>>    tests/qemu-iotests/310 | 2 +-
>>>>    76 files changed, 76 insertions(+), 76 deletions(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/025 b/tests/qemu-iotests/025
>>>> index 80686a30d5..5771ea9200 100755
>>>> --- a/tests/qemu-iotests/025
>>>> +++ b/tests/qemu-iotests/025
>>>> @@ -20,7 +20,7 @@
>>>>    #
>>>>      # creator
>>>> -owner=stefanha@linux.vnet.ibm.com
>>>> +owner=stefanha@redhat.com
>>> Wow, these were really old ones ... I wonder whether these "owner" lines
>>> really still make that much sense if they are neglected that much, or
>>> whether the information should maybe rather be captured in MAINTAINERS
>>> instead?
>> Or maybe we should just drop the whole concept of ownership in the iotests
>> altogether, I can’t remember it ever coming up.  If a test fails, it never
>> mattered to me who the “owner” is, I just did my best to fix it myself,
>> usually.  If I couldn’t, I used git-blame to figure out who to ask, because
>> tests tend to be written by multiple people anyway.
>>
>> Anyway, that’d be more difficult, I suppose, because dropping ownership
>> information would (I guess) require consent from everyone, so this is
>> simpler for now.
>>
>> Thanks for the patch, I’ve applied it to my block branch:
>>
>> https://gitlab.com/hreitz/qemu/-/commits/block
> For the record:
> I'm happy fro my @linux.vnet.ibm.com email address to be removed or
> replaced since the address is no longer in use. IBM copyright needs to
> be kept.

Absolutely.  I just don’t think putting actual contact info into each 
test is helpful; or at least less helpful then what git-blame + .mailmap 
provides.

Hanna


