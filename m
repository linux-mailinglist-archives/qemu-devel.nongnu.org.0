Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385814B4B66
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:41:48 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYni-0005qf-1o
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:41:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nJYjT-0003MH-Jb
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:37:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nJYjQ-0000P4-0G
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644835039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZeYmOQSf48ucYMBNWGlsDTl/iC3mM37twuk9k2iYcY=;
 b=hXfNyDHhtJBn7uLzGKquJs85J0It4kvVN0r9ujROuvzzfkojJ+HkixQMHFF+5sxxfS0jFn
 6uU1c20flChSvZhh/M9Cun96+fTUnvPxhSfN0gMusQeQ2DHuJpWSTOAqEF53V2/p/NMQnB
 BSlL0d3QlveOdqYmPGuehq4uf0pwcIk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-Z1uU_tHyORCj6nNMrzgOMA-1; Mon, 14 Feb 2022 05:37:18 -0500
X-MC-Unique: Z1uU_tHyORCj6nNMrzgOMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a05600c1d9800b0037be98d03a1so8738687wms.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 02:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eZeYmOQSf48ucYMBNWGlsDTl/iC3mM37twuk9k2iYcY=;
 b=w4G6Lai0VkCRqpkYCYae+iA1TUbN1mgJ1tapeuLq0k0Bny8J4uzuqGAHejZ/tDoqfm
 pr2kUYT72cN6eUnRC4ZX8FDkcOwQ9ODzdByMEXjnk235QAKJFODf8hZrm6jAVC9M0fno
 3MSoRQPTOtwK3qhPx4IZKETucnbm4qXYI1K1QacV3En8cba0c3PwFIb8eNiFxu0/j8FR
 e6qwo1xsHuZdGv6nv/qAb8MlXUtdTgXGG/VCOduYiz83mMz5GlG1D1UWXV+v4hxXHoVp
 AM+4GFoHXcZp3muI1xvFV2zID5Gm5LIfysavkvCRP9d0Unpn8NLEaHNyhbfflZda8IY3
 bcrA==
X-Gm-Message-State: AOAM532F8Pp7DDsh/cQYJ9a/9YRuwfx2wPfCutJsDP3MG+wqAK78lQ0A
 O6Kx8S383yoOrspMPVsRS75fCJRhVCltve+kbM8ymb8qDEOIiCovpiwEhsQofN7yT/qs8RuDdeG
 fFhq+K1KMyK9OM1Y=
X-Received: by 2002:a5d:45d1:: with SMTP id b17mr10568962wrs.340.1644835037068; 
 Mon, 14 Feb 2022 02:37:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCkBM1iq2hFp6gAGICVRszYp4kWF233rbl1Z5q04VunJNGo+gr2ub4LsxBn8p6ixSZLAfbDg==
X-Received: by 2002:a5d:45d1:: with SMTP id b17mr10568945wrs.340.1644835036910; 
 Mon, 14 Feb 2022 02:37:16 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id a9sm12181838wrr.20.2022.02.14.02.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 02:37:16 -0800 (PST)
Message-ID: <115ec672-80b5-f9c6-dccc-1febc0d46505@redhat.com>
Date: Mon, 14 Feb 2022 11:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/6] block.c: bdrv_replace_child_noperm: first call
 ->attach(), and then add child
To: Kevin Wolf <kwolf@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-4-eesposit@redhat.com> <YgZXyuNKUozyXhip@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgZXyuNKUozyXhip@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/02/2022 13:34, Kevin Wolf wrote:
> Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
>> Doing the opposite can make adding the child node to a non-drained node,
>> as apply_subtree_drain is only done in ->attach() and thus make
>> assert_bdrv_graph_writable fail.
>>
>> This can happen for example during a transaction rollback (test 245,
>> test_io_with_graph_changes):
>> 1. a node is removed from the graph, thus it is undrained
>> 2. then something happens, and we need to roll back the transactions
>>    through tran_abort()
>> 3. at this point, the current code would first attach the undrained node
>>    to the graph via QLIST_INSERT_HEAD, and then call ->attach() that
>>    will take care of restoring the drain with apply_subtree_drain(),
>>    leaving the node undrained between the two operations.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  block.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index ec346a7e2e..08a6e3a4ef 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2872,8 +2872,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>>      }
>>  
>>      if (new_bs) {
>> -        assert_bdrv_graph_writable(new_bs);
>> -        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>>  
>>          /*
>>           * Detaching the old node may have led to the new node's
>> @@ -2890,6 +2888,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>>          if (child->klass->attach) {
>>              child->klass->attach(child);
>>          }
>> +
>> +        assert_bdrv_graph_writable(new_bs);
>> +        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>> +
>>      }
> 
> Extra empty line. Looks good otherwise.
> 
> Does this also mean that the order in bdrv_child_cb_attach/detach() is
> wrong? Or maybe adding a new node to bs->children is okay even when the
> child node isn't drained.

No I don't think it's wrong. In fact, if we are just replacing a node
(so old_bs and new_bs are both != NULL), the child will be just removed
and then re-added to the same children's list of the same parent
(child->opaque).

Whether adding a new node to bs->children requires a drain or not is
still under debate in the other serie with Vladimir. We'll see about
that, but in the meanwhile this is just a safe fix that makes sure that
*if* drains are added, everything will always stay under proper drain.

Emanuele

> 
> Kevin
> 


