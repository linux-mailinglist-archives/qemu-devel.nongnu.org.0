Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02F373856
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:05:26 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEPF-0005lN-KR
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leENO-0004PI-KM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leENM-00048m-SA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVDr7S1R82pzEymYP6sk0DB+V7lmkL4DDRwspvg8WNo=;
 b=AteumWWsqPojiVYVc/G1i/OXu+GiHA5GdI2CEtuh5MKc6xFaxvs/LwbwhNggxP3FBD708x
 CwbRDXLfppsSJBcJ4ra0f6aMb+6FwZFnKapmll6yWGxu2VN/W9Thg14Ru552a41kI5wbxq
 Q2N0J6GA6sTx+XCCgdzVxWPgqvD68vs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-tKcch0E7Mcqdgt3GNNT7KQ-1; Wed, 05 May 2021 06:03:26 -0400
X-MC-Unique: tKcch0E7Mcqdgt3GNNT7KQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 bm3-20020a0564020b03b0290387c8b79486so578693edb.20
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PVDr7S1R82pzEymYP6sk0DB+V7lmkL4DDRwspvg8WNo=;
 b=C/JcAuktag3rj2g4J7lYS8QSPfAUz3GlvuSxkU73eWylK02teyulayfvjlHj2hVBeA
 xElLYPVCJlV5OhT5w21RUi9nDL8PyNSfp+mzlMgnQQP+9HuXVPsCXCw+yLtr/IcCMuvs
 hAEQKAfyLuXnZw+ZfKBS1RsLy/N7o0mIfDC/qudIw3nEAQjj/wQXQpo1UmJqKraRlT76
 XxvuWp8qWeqjpbSryYY4RQL+6k2ek83Tva8G+5c02NU6cOuqC0UkwnG9zgl5IHbg0/IU
 6cIoGkzm1cGdIKMgV/l+uOuY7jO8tWcEhe6W9NEXJjbFlIo8Dr2TWlHLh5bKWDhHBAm6
 JQMg==
X-Gm-Message-State: AOAM530TxlORfQzjWF+q6E6r6GH8LeBB82bnCNSJjwCjmoIl74SWcKrO
 2IHC8fTMAXICGzUyeoTK3bEYzfik2M8pnJzck+5Vlxt0364BCRtNObJfALzAOQ94KkTO0tXBOu6
 bGPuiZ5PbeKULQJk=
X-Received: by 2002:a17:906:5814:: with SMTP id
 m20mr10218587ejq.152.1620209005182; 
 Wed, 05 May 2021 03:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7TA0Bb0/BjPfC9w95r1mxn5srmoCr8rAYWHSD/L65zciDqWnbpqcoZtPrZmcFfu66j44wRA==
X-Received: by 2002:a17:906:5814:: with SMTP id
 m20mr10218571ejq.152.1620209004992; 
 Wed, 05 May 2021 03:03:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p14sm15484577eds.28.2021.05.05.03.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 03:03:24 -0700 (PDT)
Subject: Re: Prevent compiler warning on block.c
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
 <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <892d3ff4-a510-2f57-b8b5-69ff8387d2ad@redhat.com>
Date: Wed, 5 May 2021 12:03:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/21 10:05, Vladimir Sementsov-Ogievskiy wrote:
>> diff --git a/block.c b/block.c
>> index 874c22c43e..3ca27bd2d9 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4851,7 +4851,7 @@ static int 
>> bdrv_replace_node_common(BlockDriverState *from,
>>       Transaction *tran = tran_new();
>>       g_autoptr(GHashTable) found = NULL;
>>       g_autoptr(GSList) refresh_list = NULL;
>> -    BlockDriverState *to_cow_parent;
>> +    BlockDriverState *to_cow_parent = NULL;
> 
> May be
> 
> +    BlockDriverState *to_cow_parent = NULL; /* Silence compiler warning */


We can also do something like this where the only caller with
to_detach==true takes care of passing the right CoW-parent, and the
for loop goes away completely if I'm not mistaken:

diff --git a/block.c b/block.c
index ae1a7e25aa..3f6fa8475c 100644
--- a/block.c
+++ b/block.c
@@ -4839,31 +4839,19 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
   * With auto_skip=false the error is returned if from has a parent which should
   * not be updated.
   *
- * With @detach_subchain=true @to must be in a backing chain of @from. In this
- * case backing link of the cow-parent of @to is removed.
+ * With @to_detach is not #NULL its link to @to is removed.
   */
  static int bdrv_replace_node_common(BlockDriverState *from,
                                      BlockDriverState *to,
-                                    bool auto_skip, bool detach_subchain,
+                                    bool auto_skip, BlockDriverState *to_detach,
                                      Error **errp)
  {
      Transaction *tran = tran_new();
      g_autoptr(GHashTable) found = NULL;
      g_autoptr(GSList) refresh_list = NULL;
-    BlockDriverState *to_cow_parent;
+    BlockDriverState *to_detach;
      int ret;
  
-    if (detach_subchain) {
-        assert(bdrv_chain_contains(from, to));
-        assert(from != to);
-        for (to_cow_parent = from;
-             bdrv_filter_or_cow_bs(to_cow_parent) != to;
-             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
-        {
-            ;
-        }
-    }
-
      /* Make sure that @from doesn't go away until we have successfully attached
       * all of its parents to @to. */
      bdrv_ref(from);
@@ -4883,8 +4871,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
          goto out;
      }
  
-    if (detach_subchain) {
-        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+    if (to_detach) {
+        bdrv_remove_filter_or_cow_child(to_detach, tran);
      }
  
      found = g_hash_table_new(NULL, NULL);
@@ -4911,13 +4899,21 @@ out:
  int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp)
  {
-    return bdrv_replace_node_common(from, to, true, false, errp);
+    return bdrv_replace_node_common(from, to, true, NULL, errp);
  }
  
  int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
  {
-    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
-                                    errp);
+    BlockDriverState *to = bdrv_filter_or_cow_bs(bs);
+
+    assert(bdrv_chain_contains(bs, to));
+    assert(bs != to);
+    return bdrv_replace_node_common(bs, to, true, bs, errp);
  }
  
  /*
@@ -5262,7 +5262,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
       * test-bdrv-drain. test_drop_intermediate_poll() test-case will crash.
       * That's a FIXME.
       */
-    bdrv_replace_node_common(top, base, false, false, &local_err);
+    bdrv_replace_node_common(top, base, false, NULL, &local_err);
      if (local_err) {
          error_report_err(local_err);
          goto exit;

Even nicer would be to move the bdrv_remove_filter_or_cow_child() call to
bdrv_drop_filter, and pass in a Transaction to bdrv_replace_node_common, but
I'm not sure if bdrv_replace_node_noperm and bdrv_remove_filter_or_cow_child
can commute.

Paolo


