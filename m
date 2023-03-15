Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5606BAB5D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 10:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMzM-0003LO-JV; Wed, 15 Mar 2023 05:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMzI-0003G8-P0
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 05:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMzH-0007Vw-CH
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 05:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678870798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAv8yjRN8J5WDStGtLG3Q/B4raZanbVupLwYyc+1yBU=;
 b=OCGDLQBuZ4MQHShgz0Ut14J5yyPqlhB5tH7it2Qo5grN8ExFpC/Gz0xeR9eHcYv7yavmUQ
 uZhOVPI16D19z+I+wY14Q/p7BQS9Gbe9b/KTWf2VBu2Y+t6/FX/M+vlXb/Pa9ylygkhXRg
 JOH99THfCIe4ogkPSiqa/O+Ez6UMFuY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-asOwdQk2P-WQ7ojE9n29oA-1; Wed, 15 Mar 2023 04:59:55 -0400
X-MC-Unique: asOwdQk2P-WQ7ojE9n29oA-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl22-20020a05600c0b9600b003ed26ca6206so687888wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870794;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAv8yjRN8J5WDStGtLG3Q/B4raZanbVupLwYyc+1yBU=;
 b=xpmIBhxyYLYxxYXDDbBwk9kYxgvMH1ZShoQkNJ0StsjeqRzmPFel0ZxnX5iLHIICcD
 8HZZ8TwaEUiqaOOS/r8AmlKSl+KYtEDy8YO1jUevB3Ic/W93utmdF7SaVkxwUtey7sT/
 iKoDoWChcYhH40KBcCMYLW4Dzk/Di/a2yJ8J+oyo+9gakrwKDhR95TgC5pWN+XX7TwJB
 S4OYq6R8GgOKgIgBXTPT0CiAYjAobSJ9QdC16GkfsO+hrJzE49wz2jtidWRXRnaJBOVD
 iLclNncuZGbpF1JYR7WOEUEONow/KJMYhmj8fmvu2bP2MVLe1MZ/o5LGAZ8JCJLjuArn
 Jdag==
X-Gm-Message-State: AO0yUKUH8EW50MtKM7y9tLD7ZKUPDB6tPyOBLb4rI061OJPRe1anmaX8
 wptnm7kUAaU8xq3ibRDGAyj08kjjDleswfBC7rbxqFOS4rHZtrq4RI/RdsVuEXdSqQDjYKQ20t5
 YjBt1nzJITMWG9MA=
X-Received: by 2002:a05:6000:b:b0:2cf:e758:7a4a with SMTP id
 h11-20020a056000000b00b002cfe7587a4amr1341835wrx.60.1678870794003; 
 Wed, 15 Mar 2023 01:59:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set9ldL2qo+orRgjCmiqdzf3ihErl3btOIfZzAF2enck9ATYqZpfKa/IJki7UXBXklsygmKTRdQ==
X-Received: by 2002:a05:6000:b:b0:2cf:e758:7a4a with SMTP id
 h11-20020a056000000b00b002cfe7587a4amr1341823wrx.60.1678870793645; 
 Wed, 15 Mar 2023 01:59:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:2f00:2038:213d:e59f:7d44?
 (p200300cbc7022f002038213de59f7d44.dip0.t-ipconnect.de.
 [2003:cb:c702:2f00:2038:213d:e59f:7d44])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b002c559843748sm3980601wrw.10.2023.03.15.01.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:59:53 -0700 (PDT)
Message-ID: <d8d37931-0099-f4db-58b3-54b3511df598@redhat.com>
Date: Wed, 15 Mar 2023 09:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/s390x: Fix R[NOX]SBG with T=1
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230314233443.324727-1-iii@linux.ibm.com>
 <20230314233443.324727-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230314233443.324727-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15.03.23 00:34, Ilya Leoshkevich wrote:
> RXSBG usage in the "filetests" test from the wasmtime testsuite makes
> tcg_reg_alloc_op() attempt to temp_load() a TEMP_VAL_DEAD temporary,
> causing an assertion failure:
> 
>      0x01000a70:  ec14 b040 3057  rxsbg    %r1, %r4, 0xb0, 0x40, 0x30
> 
>      OP after optimization and liveness analysis:
>       ---- 0000000001000a70 0000000000000004 0000000000000006
>       rotl_i64 tmp2,r4,$0x30                   dead: 1 2  pref=0xffff
>       and_i64 tmp2,tmp2,$0x800000000000ffff    dead: 1  pref=0xffff
>      [xor_i64 tmp3,tmp3,tmp2                   dead: 1 2  pref=0xffff]
>       and_i64 cc_dst,tmp3,$0x800000000000ffff  sync: 0  dead: 0 1 2  pref=0xffff
>       mov_i64 psw_addr,$0x1000a76              sync: 0  dead: 0 1  pref=0xffff
>       mov_i32 cc_op,$0x6                       sync: 0  dead: 0 1  pref=0xffff
>       call lookup_tb_ptr,$0x6,$1,tmp8,env      dead: 1  pref=none
>       goto_ptr tmp8                            dead: 0
>       set_label $L0
>       exit_tb $0x7fffe809d183
> 
>      ../tcg/tcg.c:3865: tcg fatal error
> 
> The reason is that tmp3 does not have an initial value, which confuses
> the register allocator. This also affects the correctness of the
> results.
> 
> Fix by assigning R1 to it.
> 
> Fixes: d6c6372e186e ("target-s390: Implement R[NOX]SBG")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


