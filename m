Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8CE332239
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:42:04 +0100 (CET)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYsN-0001Ih-3N
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYqR-0008AI-0k
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:40:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYqO-0002D5-EV
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:40:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id u16so14442227wrt.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yjHUa9jiJwddstVMzYFRUavNTI06M2yQkjvjJz88+B4=;
 b=rvGbmmgM/qggvnJ/oaGVzlj2cSjjM9884E28Wc+3Eiw7ei0LoWS2BRlJ3o8rwpebmF
 sBg96usLUXsWd3mLviPb0FCcbMwRif84rKEUV3+NA0Y7wdtwzJHOks1a5xHD+VpJYnfq
 a1m1sO8yc69ntlyajOiN1Wi/GaBQ2VvqbcYuyi4J/U3ASc0rEaEh9kC5hfKRdf51CbOl
 n8NY/PYbCgEeT1tmTRYPPNYSpOD9znvoQVQXw2O2PNmCnnsHhdTiU9ElH52uI8uj3XJh
 t3tQBcfeTgwPBUYLnkasJusejzJBFCNdAXtEkLNmelUSwE/nS+lswfmiqkNNB7EHDD6b
 jr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yjHUa9jiJwddstVMzYFRUavNTI06M2yQkjvjJz88+B4=;
 b=NWoLqVITjRGIHqldJkW3XdsEQtHlRYfEBV7Cnhq5GvJt7n2kOuA7yL2LqEE3zhppiy
 z450fXdRIhgzgSmWGunZFGMPYqeorrveaSTK4ZnzJw0qap1KulOkCysCJ4ULwLbqOYsR
 c9dYssO3MGLoh3KpWANRTqnNJrfyJkLi6XepJ1W1P2G5MCIXKluO+BDAV+sAv9sSGKf1
 6JV7nn7Dv5FuROP6LYfmoqCYJ/iCaH4KWRjPjj5xU69l4eDOp+IaafiXygw2/KbQyqb1
 4Luu8sjfcILljf6PrTyKHHckJ5IYkJEMGDH4DgnvFA3nRTJhi2MwTgKB9k9Yq6YywTeM
 9pXg==
X-Gm-Message-State: AOAM533VNGqhj8EK5BIBh645/sWl2WWrnRKFh/ErouOXMWqDdzhOOZHl
 H8ydXONAg4UqwE61DARlTAA=
X-Google-Smtp-Source: ABdhPJxCOpKkA3a+xsNTrm8O6RfwYGtcfUtq/nJQu0lp6N3079IbAIGwFK8vMOevQcqERddxn3A2Bw==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr28071705wra.288.1615282795552; 
 Tue, 09 Mar 2021 01:39:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o20sm3210738wmq.5.2021.03.09.01.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:39:54 -0800 (PST)
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
To: Peter Xu <peterx@redhat.com>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org> <20210308234025.GP397383@xz-x1>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
Date: Tue, 9 Mar 2021 10:39:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308234025.GP397383@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/9/21 12:40 AM, Peter Xu wrote:> On Sat, Mar 06, 2021 at 12:54:13AM
+0100, Philippe Mathieu-Daudé wrote:
>> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>  
>>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>>          qemu_printf("address-space: %s\n", as->name);
>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
>> +        mtree_print_mr(as->root, 1, 0, as->root->addr,
> 
> Root MR of any address space should have mr->addr==0, right?
> 
> I'm slightly confused on what this patch wanted to do if so, since then "base"
> will always be zero..  Or am I wrong?

That is what I am expecting too... Maybe the problem is elsewhere
when I create the address space... The simpler way to
figure it out is add an assertion. I haven't figure out my
issue yet, I'll follow up later with a proof-of-concept series
which triggers the assertion.

FYI I also have to modify:

-- >8 --
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e19bc9f1c19..41a77e15752 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2889,7 +2889,7 @@ MemTxResult address_space_read_full(AddressSpace
*as, hwaddr addr,
     if (len > 0) {
         RCU_READ_LOCK_GUARD();
         fv = address_space_to_flatview(as);
-        result = flatview_read(fv, addr, attrs, buf, len);
+        result = flatview_read(fv, as->root->addr + addr, attrs, buf, len);
     }

     return result;
@@ -2905,7 +2905,7 @@ MemTxResult address_space_write(AddressSpace *as,
hwaddr addr,
     if (len > 0) {
         RCU_READ_LOCK_GUARD();
         fv = address_space_to_flatview(as);
-        result = flatview_write(fv, addr, attrs, buf, len);
+        result = flatview_write(fv, as->root->addr + addr, attrs, buf,
len);
     }

     return result;
@@ -3117,7 +3117,8 @@ bool address_space_access_valid(AddressSpace *as,
hwaddr addr,

     RCU_READ_LOCK_GUARD();
     fv = address_space_to_flatview(as);
-    result = flatview_access_valid(fv, addr, len, is_write, attrs);
+    result = flatview_access_valid(fv, as->root->addr + addr, len,
+                                   is_write, attrs);
     return result;
 }
---

