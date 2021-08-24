Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0003F5A7B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:09:23 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISQn-0001ck-4h
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mISHE-0003bL-RZ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mISHD-0003Pn-9j
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629795561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6To4mBDii8n7RZzkmYfy7v2pYf7u1L7GDyOC36JOL8=;
 b=SQ/AC6ZQT1GKi9sJByQoZMsbQq/fdaCXAKGIo3Likvb3jHBgaIXvkHC9psFv88s92Uu2sB
 RrmU86JFAg3eIeWkogQO2H6arbI4x3V7fYX9N1xKCKZfMVDNn6foHGpV4QT+oIb7KRQN0N
 WgjzZF6EHbCfb3LFd0TcsvIHfi04sYU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-WukPuPgEMsuoBFol-YqlOg-1; Tue, 24 Aug 2021 04:59:20 -0400
X-MC-Unique: WukPuPgEMsuoBFol-YqlOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so3863693wmc.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=T6To4mBDii8n7RZzkmYfy7v2pYf7u1L7GDyOC36JOL8=;
 b=k7MCz/QSr03kcVowcVXTghHiJz7BKFKapEUpD6DqdImDEwlPJqWk61lbAMcGKoIyHm
 aLqMdN70sr52r5OV9fIUiICXw2D++4VRELqtWOgHRJxrhqljdpHZvRc6GqTRfmMqo1t9
 I98JSTs+wnNpeLNQvUSVxPpF/L1e578ivfJ9q7v7oHdjlLUU1+3roO+3EruGXKbuUlNP
 QfOJA9WqUh4CdldRmR5S/klzZFTeU92PTOphbHm+7nnskyHCDNWFZDbOAspDlNjki8+l
 Y7b5ni7NVdP08336pIQjoDG/IoBi0zFqWtePZxSyn9nS5p4syW6ynu1xB7fjguRWgIuh
 9IeA==
X-Gm-Message-State: AOAM532tlBdq5OwU/xFv2mYccBJjJHLvf0SxtufVZpXsdlv1O6FGSBTK
 SZN1vldogMd5i9vBn/lJonlDgDlTeSqQtg/a//aaRUInqdrCFDmuZ9myQ2/Bnqjin+8y+al/Gkl
 gQsDflJmJ+OEzLeM=
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr2982346wmc.41.1629795559356; 
 Tue, 24 Aug 2021 01:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygCwzldpKChM2EQgYHvtHyUvDpksoRp1CD2K/clcecrWtXEJPpm/p0JudWyAAe3xLO26uqLw==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr2982326wmc.41.1629795559147; 
 Tue, 24 Aug 2021 01:59:19 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 l15sm1657808wms.38.2021.08.24.01.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:59:18 -0700 (PDT)
Subject: Re: [PATCH 1/3] simplebench: add img_bench_templater.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-2-vsementsov@virtuozzo.com>
 <784f21b4-f990-f0af-1f24-caa2c66144bf@redhat.com>
 <86ef6f7a-a9de-e422-be66-99a1edf27cae@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <18d5aa59-3d73-02b6-589e-bd2f52d1f626@redhat.com>
Date: Tue, 24 Aug 2021 10:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <86ef6f7a-a9de-e422-be66-99a1edf27cae@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:53, Vladimir Sementsov-Ogievskiy wrote:
> 19.08.2021 19:37, Hanna Reitz wrote:
>> On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:

[...]

>> +import itertools
>> +from lark import Lark
>> +
>> +grammar = """
>> +start: ( text | column_switch | row_switch )+
>> +
>> +column_switch: "{" text ["|" text]+ "}"
>> +row_switch: "[" text ["|" text]+ "]"
>> +text: /[^|{}\[\]]+/
>>
>> So I have no idea how this really works, of course, but does this 
>> mean that the `text` pattern cannot contain pipe symbols? I.e. that 
>> you cannot use pipes in the test template?
>>
>
> Hmm. I didn't try. I hope lark is smart enough to keep pipes that are 
> out of {} [] as is.. But of course, you can't hope that pipe inside {} 
> or [] will work as bash-pipe.

Yep, sure.  It’s just that the `text` nonterminal symbol doesn’t look 
like it could match anything with a pipe in it.

> Same thing with other special symbols ("{}" and "[]"). I don't want to 
> care about this too much now. This simple grammar works good for test 
> template in patch 03. If we need something more, we can add a kind of 
> special symbols escaping later.

But yes, if someone trips over this (i.e. we ourselves), we can still 
fix it then.

Hanna


