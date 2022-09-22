Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D45E683C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:15:58 +0200 (CEST)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOrk-0006Iy-PI
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obNXz-0002t0-Hm
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obNXw-0006c4-Sf
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663858283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGSzYsniUGaTVqk17aJOyiqvc7FCsrWL6qtLjgF4+tY=;
 b=Ul07zYkRkofDT5eXGbA92sZZWtnCbVTxznFONcr3Ie72FVoIiPWhvMqAD4qMmOSXWMvm2q
 dkO3RXvSmKGPsJLYyIx6gBil3l6UtCnve5eeV1bxM9RV6QpA4Fr80VWO7F8AJQDwwFhnMM
 WXsmtGGm54PZySZJ2p3aNalWNmNqhyM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-TSJM2IwlNkyvD5Bgc2T2ZA-1; Thu, 22 Sep 2022 10:51:22 -0400
X-MC-Unique: TSJM2IwlNkyvD5Bgc2T2ZA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so1203133wms.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=AGSzYsniUGaTVqk17aJOyiqvc7FCsrWL6qtLjgF4+tY=;
 b=xpmSKMcL89Nw9ZjlKBZ1tZEZy6G1WlFJLxfn9fVF3qTfIzS+CRDvSule1JhGPeZDHj
 378FiJ71+t69VPqKhgSR5Zn3Ik7SoY57RsOqafhD1N5i0xL9J6jOzNtHftE19nI0LmLN
 urXdoW0lGk2XqwfWrWSNLgSwo7ROUaIJhVoOK13y1YMNJQA9VV6cEyvQwxLYTp77ZORE
 Saz0PJ697weLxiuw7eaJSJQ3FkRDlD1JTQK3r39QJ8cgp8XaXKamvS1FRw0edS0HhatI
 fyOn85s79rG705GDh7RUCcMcioqVnj11D71QowzOBAwb3WPQWz/ObBbN56lQgtH0vJzK
 rIXw==
X-Gm-Message-State: ACrzQf1+Qq/shJnXvzAhx9D2D14Q9zTQ7JtmlgLRHyZlVnYk2qhEAplP
 1VPHNG6pY850FhNpJqPQ0pP5Srgop21xU3nnFMhylPSNhOqs2YdikEr+8x/qDlvwWVUItCjvauF
 FN77T+C9CBVM6q2o=
X-Received: by 2002:a5d:61c7:0:b0:22a:fa77:1cef with SMTP id
 q7-20020a5d61c7000000b0022afa771cefmr2491557wrv.50.1663858279459; 
 Thu, 22 Sep 2022 07:51:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XNrGJUMpEl06hkdHH29JoPOqP/UEYltfLt69FE0VH8javRC1QUkbUYaLwYtOCuJwa0gxQ0w==
X-Received: by 2002:a5d:61c7:0:b0:22a:fa77:1cef with SMTP id
 q7-20020a5d61c7000000b0022afa771cefmr2491550wrv.50.1663858279197; 
 Thu, 22 Sep 2022 07:51:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f?
 (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de.
 [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
 by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b003a62400724bsm7309088wms.0.2022.09.22.07.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 07:51:18 -0700 (PDT)
Message-ID: <5a8f56a5-50ec-01f3-094f-b1213bb29e56@redhat.com>
Date: Thu, 22 Sep 2022 16:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
 <YyxyxCZH4X5n7Rdy@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YyxyxCZH4X5n7Rdy@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 22.09.22 16:35, Jason A. Donenfeld wrote:
> On Thu, Sep 22, 2022 at 03:07:13PM +0200, David Hildenbrand wrote:
>> +        if (processed >= MAX_BLOCKS_PER_RUN * 128) {
>> +            break;
> 
> If you make this a `goto out` or similar instead of a break, then you
> can
> 
>> +    if (type == S390_FEAT_TYPE_KLMD && len < 128) {
> 
> change that to `if (len)`.


Thanks, I'll do this on top:

diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 67133ba33a..c1505b27a4 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -190,7 +190,7 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
          uint64_t w[16];
  
          if (processed >= MAX_BLOCKS_PER_RUN * 128) {
-            break;
+            goto write_ocv;
          }
  
          sha512_read_block(env, *message_reg + processed, w, ra);
@@ -198,7 +198,7 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
      }
  
      /* KMLD: Process partial/empty block last. */
-    if (type == S390_FEAT_TYPE_KLMD && len < 128) {
+    if (len) {
          uint8_t x[128];
  
          /* Read the remainder of the message byte-per-byte. */
@@ -237,6 +237,7 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
       * TODO: if writing fails halfway through (e.g., when crossing page
       * boundaries), we're in trouble. We'd need something like access_prepare().
       */
+write_ocv:
      sha512_write_ocv(env, param_addr, a, ra);
      *message_reg = deposit64(*message_reg, 0, message_reg_len,
                               *message_reg + processed);


> 
>> +        /*
>> +         * Pad the remainder with zero and place magic value 128 after the
>> +         * message.
>> +         */
>> +        memset(x + len, 0, 128 - len);
>> +        x[len] = 128;
> 
> "magic value 128" ==> "set the top bit"

Yes, thanks. I missed that detail in the PoP. (not sure if it's documented at all ...)

"Pad the remainder with zero and set the top bit."

> 
> Aside from these nits, this refactoring looks fine. I haven't tested
> this or checked the crypto carefully, but if it passes all the Linux
> test vectors, hopefully things are still fine.


Thanks. I'll resend this patch only as reply to your original one,
so Thomas can easily pick it up (or add more feedback :)).

-- 
Thanks,

David / dhildenb


