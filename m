Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9C4F2F34
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 14:08:15 +0200 (CEST)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhyo-0000tc-8q
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 08:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbhwN-0007gA-7G
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 08:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbhwJ-0002FZ-EA
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 08:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649160329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52UTLLemLkPgWIyRoxM6zypaiiGY6il4mmRd9s8fUHY=;
 b=fgWY7ZdppoDnR5m8AA7F1ZzDk2M1hXKNrL7wTzkfRv6775rUlzJWXkrF/8LfqdvehsAEua
 NFrzBxu69zjfuZmCs0FkkrHuGkVKy3FbHs8Xre5S4+wmmzgeCS/6d1FJq5/dWDPahG56hr
 sOjZSnIgF9+hJIGHEXMXMjr0ix3OMk8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-PeHipEjoOiG0QpASMt-FjQ-1; Tue, 05 Apr 2022 08:05:26 -0400
X-MC-Unique: PeHipEjoOiG0QpASMt-FjQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 q22-20020a50aa96000000b0041cd791e236so2921900edc.19
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 05:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=52UTLLemLkPgWIyRoxM6zypaiiGY6il4mmRd9s8fUHY=;
 b=yVAH/ZhON+LYT71/6PcBE5ho95jP49Q9NwVvEGAwniiZctLiu+H76UV/+LZRUbBsba
 cEKOu865RbgpK5/HgzsAG+DcJjXX18lBcXT8hq4pVb0qUW3qv8LJfw3v6HMssdzuVF/y
 tJIOj9f8yRaSjZgYoSsQYQcoZIbDjjuGdRNrXMEAzi5sqxojoMlxSLmcQAMfHyUzF3ER
 O0yWa+RwJgoXpRInONiwHwvn4PmshU5PT7EmKhmEyb6GSjUsCAGPHKlTxJeQWfVrcxgR
 SoQwRp5xSDI4wG21JXKLQ/oHTOJ7IvSe444AIk8ckZSQrpyhHMR3mCACB6bte4SIf+/E
 W62g==
X-Gm-Message-State: AOAM530omMf7LzG7zedkX7o3tVI6hB6+kr4bapoX+Q4z2/ZzNXewbBGs
 EppTcWdrdRJ699Y/joJdfoA3ce9Q4F3xrQoxbb4YE+82yLRgYAd2jd1kot+bhrGqYUD10ViL8N6
 15SR7NootzI9Pa08=
X-Received: by 2002:a17:906:3ad3:b0:6cd:382b:86e5 with SMTP id
 z19-20020a1709063ad300b006cd382b86e5mr3111002ejd.145.1649160325137; 
 Tue, 05 Apr 2022 05:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy5atkNpjjpvMBoDoHNRH5+rVB/lbcLRcB1uG0smBnVN7xMrU15BC5Yn//6YWjfIfvE0/F6Q==
X-Received: by 2002:a17:906:3ad3:b0:6cd:382b:86e5 with SMTP id
 z19-20020a1709063ad300b006cd382b86e5mr3110972ejd.145.1649160324892; 
 Tue, 05 Apr 2022 05:05:24 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a170907970f00b006e0466dcc42sm5405257ejc.134.2022.04.05.05.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 05:05:24 -0700 (PDT)
Message-ID: <37bbb62b-5efa-8d59-6454-32ab4d03f919@redhat.com>
Date: Tue, 5 Apr 2022 14:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
From: Hanna Reitz <hreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
 <2ee69a0b-8270-d9b3-9ddb-d31b5f5de82b@redhat.com>
In-Reply-To: <2ee69a0b-8270-d9b3-9ddb-d31b5f5de82b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eesposit@redhat.com, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.04.22 13:47, Hanna Reitz wrote:
> On 05.04.22 12:14, Kevin Wolf wrote:

[...]

>> At the same time they probably do too little, because what you're
>> describing you're protecting against is not I/O, but graph modifications
>> done by callbacks invoked in the AIO_WAIT_WHILE() when replacing the
>> backing file. The callback could be invoked by I/O on an entirely
>> different subgraph (maybe if the other thing is a mirror job)or it
>> could be a BH or anything else really. bdrv_drain_all() would increase
>> your chances, but I'm not sure if even that would be guaranteed to be
>> enough - because it's really another instance of abusing drain for
>> locking, we're not really interested in the _I/O_ of the node.

[...]

> I’m not sure what you’re arguing for, so I can only assume. Perhaps 
> you’re arguing for reverting this patch, which I wouldn’t want to do, 
> because at least it fixes the one known use-after-free case. Perhaps 
> you’re arguing that we need something better, and then I completely agree.

Perhaps I should also note that what actually fixes the use-after-free 
is the bdrv_ref()/unref() pair.  The drained section is just there to 
ensure that the graph is actually correct (i.e. if a concurrently 
finishing job removes @base before the stream job’s 
bdrv_set_backing_hd() can set it as the top node’s backing node, that we 
won’t reinstate this @base that the other job just removed).  So even if 
this does too little, at least there won’t be a use-after-free.

OTOH, if it does much too much, we can drop the drain and keep the 
ref/unref.  I don’t want to have a release with a use-after-free that I 
know of, but I’d be fine if the block graph is “just” outdated.

Hanna


