Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F422350C847
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 10:42:36 +0200 (CEST)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niBLf-0003pn-R5
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 04:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBKQ-0002vz-NP
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:41:18 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBKP-000250-1Z
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:41:18 -0400
Received: by mail-ej1-x62c.google.com with SMTP id s18so20591702ejr.0
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p+sIIUGOENQRdckzJAptswY4hHrb57O6DTegsYZfTw0=;
 b=GJAJXk2l2Z/JdQDE6PM/CwReovh/E1pDeUbr7aVwAD2grwENLWfSfOsdqD/hBwJDqC
 Cpd2LYTIjeuBicqipthRjE+oPHpnbaEknBA7Anmmvt8Nz2TK2YDYvXx6tCxGAgJTeBGa
 wWj+Ppk0SuxRpcYD6pHG0JBher7Eht9q2kqoXlfjydRjm8fbxNakz+yVXnMJ9sARvwUR
 t0oz72LnQcev1HHyoishsc68MLU12KDxOnKY6nTlVW/jpwwjtJU8Hc/ZDrm2dtrh2avZ
 k3fqhnB77k8+6p5roMmYQoRqBNn0a7w/erUfIXxdszOSrapHSLY9yHDY+xbpSEk5lGTy
 FPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p+sIIUGOENQRdckzJAptswY4hHrb57O6DTegsYZfTw0=;
 b=kEtBVfP+CROw1JtUdt5eGHIsnBehWpxi9DrURIRB5kNrQsOl5GYC3Q+EVDUZpcDsLK
 fDX6LAwiWH0C9g+sCQR4ciWtxSurKPr6v2c6xvZOeppLyKMe4AW/emzNisT3VIxj+6ju
 30qJZQCB39zqdE6YVbGlkm7xzvqXHQBDM0d8t0lqREyh8VvlvK/1Y3n4gmGQfQn8muBA
 iMrxM3QjCKIV1dpiiUDrxm2zBeeZEbaYLP5/j2yGWn/PTZRCLNal6qr9JFl34Gvjejri
 WGmX2Ye5zk8gimwHZRgsHtpYRZ7AJmrpZiG5hkuBViIb8tmibwDB5CGrmROPSKxr/JgN
 lTVg==
X-Gm-Message-State: AOAM533MO/wUeRpXIqEFZwYIb6LjJfNjo+13rXo2ZyrdT2mFlVLzIRJ8
 m7wKA5pX+UQhDap8HCPb3FYsmdvpOXKuoA==
X-Google-Smtp-Source: ABdhPJzTM8fQNicQOjQcdFg3s6+hMwTPTQRwZgPFEcpnnMabDITFavswfDjnlHwHe4ubASleoBlZhg==
X-Received: by 2002:a17:906:ae85:b0:6e8:76c2:1f1f with SMTP id
 md5-20020a170906ae8500b006e876c21f1fmr7819579ejb.333.1650703275166; 
 Sat, 23 Apr 2022 01:41:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm1966115edz.35.2022.04.23.01.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 01:41:14 -0700 (PDT)
Message-ID: <97b909c7-041b-164d-aa80-b4154f0f9c06@redhat.com>
Date: Sat, 23 Apr 2022 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 for-7.1 9/9] nbd: document what is protected by the
 CoMutexes
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-10-pbonzini@redhat.com>
 <9f396359-7ff9-353c-b808-59aae39ad808@mail.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9f396359-7ff9-353c-b808-59aae39ad808@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/22 16:00, Vladimir Sementsov-Ogievskiy wrote:
> 14.04.2022 20:57, Paolo Bonzini wrote:
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/nbd.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 31c684772e..d0d94b40bd 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -81,12 +81,18 @@ typedef struct BDRVNBDState {
>>       NBDClientRequest requests[MAX_NBD_REQUESTS];
>>       QEMUTimer *reconnect_delay_timer;
>> +    /* Protects sending data on the socket.  */
>>       CoMutex send_mutex;
>> +
>> +    /*
>> +     * Protects receiving reply headers from the socket, as well as the
>> +     * fields reply and requests[].receiving
> 
> I think, worth noting, that s->reply is used without mutex after 
> nbd_receive_replies() success and till setting s->reply.handle to 0 in 
> nbd_co_receive_one_chunk()..
> 
> Should "s->reply.handle = 0" be done under mutex as well? And may be, in 
> same critical section as nbd_recv_coroutines_wake() ?

Could be an idea.  It could also be a store-release but no reason to be 
fancy:

diff --git a/block/nbd.c b/block/nbd.c
index 0bd9b674a9..cd760bfd50 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -149,11 +149,11 @@ static bool coroutine_fn 
nbd_recv_coroutine_wake_one(NBDClientRequest *req)
      return false;
  }

+/* Called with s->receive_mutex taken.  */
  static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s)
  {
      int i;

-    QEMU_LOCK_GUARD(&s->receive_mutex);
      for (i = 0; i < MAX_NBD_REQUESTS; i++) {
          if (nbd_recv_coroutine_wake_one(&s->requests[i])) {
              return;
@@ -924,9 +924,11 @@ static coroutine_fn int nbd_co_receive_one_chunk(
          /* For assert at loop start in nbd_connection_entry */
          *reply = s->reply;
      }
-    s->reply.handle = 0;

-    nbd_recv_coroutines_wake(s);
+    WITH_QEMU_LOCK_GUARD(&s->receive_mutex) {
+        s->reply.handle = 0;
+        nbd_recv_coroutines_wake(s);
+    }

      return ret;
  }

Paolo

>> +     */
>>       CoMutex receive_mutex;
>> +    NBDReply reply;
>>       QEMUTimer *open_timer;
>> -    NBDReply reply;
>>       BlockDriverState *bs;
>>       /* Connection parameters */
> 
> 


