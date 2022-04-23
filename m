Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48350C83A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 10:33:50 +0200 (CEST)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niBDA-0005EC-VJ
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 04:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBAN-0004Wa-P7
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:30:55 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBAM-0000Y4-0f
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:30:55 -0400
Received: by mail-ej1-x634.google.com with SMTP id s18so20565825ejr.0
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IpkeRxlgj/L6MkLjaldfl3rnGVi22K9iIwPeRXXvvt4=;
 b=WTIOc0zTyIVKEy/OalCNiv2212bXNU4NMyeJgNCHjHI5h32f8ndE0qC8foqyHft78m
 TqIEQzz80ao3YMVIHEFaOe5JoZStH+ZQ5LmQWzpwTDiV/FPgZrSWp8fkg8kFMI+ma6EN
 peC/0Nm/A+5+++EZI2KF0S2wsyGkKlpOm1gTNpC+bMV4d8U7jc7n4iJVbM+Cyb7qp//h
 kpkNkV+JWYv1YxDL32P+rS4v+m0QDwsgRg171TT/Vjada1WQkO/0DXJi4W5U/rp0FjYX
 LBDIYkEs4re8PMRZlwA1sQ7jxqF2Q/EiIfr85gOzBBgl3ZWgTnniKR1qjco93CdrVAdU
 DT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IpkeRxlgj/L6MkLjaldfl3rnGVi22K9iIwPeRXXvvt4=;
 b=NnflKix1oBK9bU0regabA9oD8d2HAcmD913VNaPKKS0f6J+H3cyMsOychKGWskL+2R
 36oq3Vt3xAS4baDq9Vz2tPdGzxEOGHOkJZAE7gVsKYZEGfKuT7PY61X2JmpzjBBFne7C
 G7nkEhMBq1S5E2gPYHGCNLVpCXCYZwldioMML0CHbWqi8F746LcuMU3xHZcCGwsS5Wwl
 4F/K8zaplUNoylWcEVSCFw2WuAnUfqUhfUWKaBJXJhGDRm1I1o5Ek4slThU9VLcmdP7B
 Ro7j8NO9HgaG8yoFgbsECX2ZDtnjC0U1iwlN1YncuYzg2034HfebvzuewkvSXO0g3hNj
 ltvA==
X-Gm-Message-State: AOAM530UwfUuMCmN8tuJl6TnBDsxbrCu8R+KwCDaypWFioTj8w5p1kld
 bBtDBUXLpCzkeh2bOw1ZudE=
X-Google-Smtp-Source: ABdhPJze5MRlQHJnG92c4mZmjPMOhQ6Y2ahernTV9GInbOQxQxzdd3aH7vVE3BQLgH/HhBtQNUOcBw==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr7809399eje.746.1650702652051; 
 Sat, 23 Apr 2022 01:30:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gq5-20020a170906e24500b006e87644f2f7sm1473622ejb.38.2022.04.23.01.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 01:30:51 -0700 (PDT)
Message-ID: <92ba49ad-9e82-e008-da31-f19a80ebfae1@redhat.com>
Date: Sat, 23 Apr 2022 10:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 for-7.1 3/9] nbd: remove peppering of
 nbd_client_connected
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-4-pbonzini@redhat.com>
 <43c9ee35-5d82-a848-5be7-6e76090f34e9@mail.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <43c9ee35-5d82-a848-5be7-6e76090f34e9@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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

Hi,

thanks for the careful review and sorry I'm only replying now.

On 4/15/22 19:01, Vladimir Sementsov-Ogievskiy wrote:
>> @@ -982,11 +978,6 @@ static bool 
>> nbd_reply_chunk_iter_receive(BDRVNBDState *s,
>>       NBDReply local_reply;
>>       NBDStructuredReplyChunk *chunk;
>>       Error *local_err = NULL;
>> -    if (!nbd_client_connected(s)) {
>> -        error_setg(&local_err, "Connection closed");
>> -        nbd_iter_channel_error(iter, -EIO, &local_err);
>> -        goto break_loop;
>> -    }
> 
> Probably we should still check iter->ret here. It's strange to start new 
> iteration, when user set iter->ret in previous iteration of 
> NBD_FOREACH_REPLY_CHUNK()
> 
> Or, maybe we should set iter->done in nbd_iter_channel_error ?

Yes, this second one is a possibility.  I chose to check iter->ret below 
because it was a bit more self-contained ("before reading again check 
that the error code is not overwritten"), but it is also less obvious.

Paolo

>>       if (iter->done) {
>>           /* Previous iteration was last. */
>> @@ -1007,7 +998,7 @@ static bool 
>> nbd_reply_chunk_iter_receive(BDRVNBDState *s,
>>       }
>>       /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple 
>> reply. */
>> -    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
>> +    if (nbd_reply_is_simple(reply) || iter->ret < 0) {
> 
> And then here, may be we can just goto break_loop from previous "if (ret 
> < 0)". Then we'll not have to check iter->ret.
> 
>>           goto break_loop;
>>       }
> 
> anyway:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> (a bit weak, as it really hard to imagine all these paths and possible 
> consequences :/
> 


