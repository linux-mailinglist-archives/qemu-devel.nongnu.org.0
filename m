Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E56BAB53
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:59:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMy6-0008Dv-E1; Wed, 15 Mar 2023 04:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMy1-00081k-Jb
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:58:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMxz-0007JW-KQ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678870718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOROqArk9cJo7YrYeAy2jNmNFxqYqbbxEqzEaxysdU0=;
 b=gOREQliDBLXY0W+TXwURaHNIB1YeEv8vDEfIyOr/G3tFEaG8KraV5ro01/VEVa8yw7/CBw
 gWf3PxlRjHlCwgTMnPB10sUZItOUs0/3uDlLmKTcj6riuGWsJnnQTeYm1g/Y7XIkXb7PI7
 CgVHTKdkALFT06IAnoRrEKUnE8iDfO4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-RrlXAnFQOr2CafYQ5XSzGA-1; Wed, 15 Mar 2023 04:58:37 -0400
X-MC-Unique: RrlXAnFQOr2CafYQ5XSzGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m10-20020adfe94a000000b002cdc5eac0d0so3055472wrn.2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870716;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOROqArk9cJo7YrYeAy2jNmNFxqYqbbxEqzEaxysdU0=;
 b=PqE3VrvN6gI6p27huFFFGvsZksM454CgOSyQikxB/n4s9DGd/ErnNOhbEGhaxb09tl
 49skbstwYr0wxbjYKm3Z+Q8+TzS4SVvlxOeu9cGyJxRmKCny1Q48D6IWJWTuu/jEiZdg
 VrsRuJrARVWmJb0BS9rKwvUPDYbY02VEZe5IlhtwuhN/evitdQdvUWQbH4SWxFZb0BZu
 RkXuGftDHCnXbxRq/1sINNINf9zwZ5wNijR70IM4zVPlidHurmej1XYxcyi7I1Mxla1c
 q73Pqx4V0Pq89uD+ejy+7o+SfVA4DgXgmJRsa1bP61IS5xSt32P7TrOVXnmOoX2REBgR
 jeDw==
X-Gm-Message-State: AO0yUKXNELLDAoxMMxEjr0n9VLOnYJn4vhs32+SrZuhgl3Lm+DdaJmaP
 jGyEPAYiNP0ZbAw1c45B/dMPtmOX0NJ1quiYJJgZz31rgob2NUMQt2rqDtSd/4hSvTTAJfyovva
 bYD9WIduHxXuJKD0=
X-Received: by 2002:adf:ce11:0:b0:2cf:e3d0:2a43 with SMTP id
 p17-20020adfce11000000b002cfe3d02a43mr1259988wrn.4.1678870716057; 
 Wed, 15 Mar 2023 01:58:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set9tear7tZAYV54vGVL51KqbxSpWItdUBZWyXZNIf2efWZE/I3H3JfZ1lzJANicjUgzK4Z0cNQ==
X-Received: by 2002:adf:ce11:0:b0:2cf:e3d0:2a43 with SMTP id
 p17-20020adfce11000000b002cfe3d02a43mr1259981wrn.4.1678870715793; 
 Wed, 15 Mar 2023 01:58:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:2f00:2038:213d:e59f:7d44?
 (p200300cbc7022f002038213de59f7d44.dip0.t-ipconnect.de.
 [2003:cb:c702:2f00:2038:213d:e59f:7d44])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d550a000000b002c706c754fesm3961676wrv.32.2023.03.15.01.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:58:35 -0700 (PDT)
Message-ID: <70e78bb2-2409-c614-4c17-14688d79af2c@redhat.com>
Date: Wed, 15 Mar 2023 09:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] target/s390x: Fix EXECUTE of relative long
 instructions
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230315001117.337128-1-iii@linux.ibm.com>
 <20230315001117.337128-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230315001117.337128-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15.03.23 01:11, Ilya Leoshkevich wrote:
> The code uses the wrong base for relative addressing: it should use the
> target instruction address and not the EXECUTE's address.
> 
> Fix by storing the target instruction address in the new CPUS390XState
> member and loading it from the code generated by gen_ri2().
> 
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


