Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30AA66573D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXGL-000818-MX; Wed, 11 Jan 2023 04:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFXFo-000806-Rq
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFXFi-0003WD-Nm
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673428714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAZ74DNFr8VQmOq5a6BTjOUg0iwYl2rQsjWMCqwz/is=;
 b=dm6DYR3aRYUO2PhUnEDEbM+iwzeDjGlVfmpOZZm10zH4jASaZ7X0l5r7PaZW9g2y7UdtCi
 uPxoB+U9GqtWF6xi+xHbulHvKe6lDBgdsdpA3m3MCEL9Kt35dtuhln0IWgZaa0pLwKsUkp
 Y/bqp2st20b47GotuMPGleWBF8nesrQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-rcrz6g8lP1q_LsUJFmhOqw-1; Wed, 11 Jan 2023 04:18:33 -0500
X-MC-Unique: rcrz6g8lP1q_LsUJFmhOqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso3243245wmk.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HAZ74DNFr8VQmOq5a6BTjOUg0iwYl2rQsjWMCqwz/is=;
 b=hcRWLqJXv9OOS95E1AIJmI4nkGH4EsRWlylVeFOSLb2PCbw9zwda2czqgp2mIfnruG
 zUGs3lwGjkzxdU4pCP/LK7GriAWkNsh36SlhsuW586Kjes84o6MwMwrNdHBF1MF+fwNN
 7mArlWspKpY3AAjNMoF7h8WMG4IkBgiCbujwd82CO4wzENJ6vnuMhHGYeu5W3Lx8YqTM
 V2j98uIsAQnP7YgCdNq9RotALLceZlD9z+rVQxGVhEuLGXvSrtOHcdaGom6drJShq8nG
 jO8fcXldDAuwtacpck0fGKalvndM/RQdvV4XWlyR9QYQY9x1XwHylXWNBVNjv99TJ+mw
 3mTA==
X-Gm-Message-State: AFqh2koTL7UlDzzghsxBXwn2S5swzxGMKjfrk901YGcRFhy1PGC6mcnl
 XRZAmlRcPCJXzbNHJ1+VgXAw1C+ppNVU08Df7+w6yyPZPQTKd/ejvl7QG8HQ+4UvDPBhIrJ7QUa
 XILmSHjBNxhm6eOo=
X-Received: by 2002:a05:600c:34d3:b0:3c6:e61e:ae74 with SMTP id
 d19-20020a05600c34d300b003c6e61eae74mr62842791wmq.4.1673428711851; 
 Wed, 11 Jan 2023 01:18:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVoHsAD9ZVUZBOgPcy+dJgjvGUF2H09xRyMBkw8MuebW58DcEg5VIk4VmkDD9vUP8myORwOA==
X-Received: by 2002:a05:600c:34d3:b0:3c6:e61e:ae74 with SMTP id
 d19-20020a05600c34d300b003c6e61eae74mr62842776wmq.4.1673428711637; 
 Wed, 11 Jan 2023 01:18:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 h10-20020a1ccc0a000000b003d237d60318sm17946691wmb.2.2023.01.11.01.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:18:31 -0800 (PST)
Message-ID: <435b0b4d-ea27-fe83-015e-c8b8bbe6d210@redhat.com>
Date: Wed, 11 Jan 2023 10:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PULL 06/29] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
References: <20230110160233.339771-1-pbonzini@redhat.com>
 <20230110160233.339771-7-pbonzini@redhat.com>
 <47e506b7-d364-284a-fc11-69ee64045d6b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <47e506b7-d364-284a-fc11-69ee64045d6b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 1/10/23 18:19, Eric Auger wrote:
> Hi Paolo,
> 
> On 1/10/23 17:02, Paolo Bonzini wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
>> replace 'case 3' by 'default'.
>>
>> Otherwise we get:
>>
>> ../target/i386/ops_sse.h: In function â€˜helper_vpermdq_ymmâ€™:
>> ../target/i386/ops_sse.h:2495:13: error: â€˜r3â€™ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2495 |     d->Q(3) = r3;
>>          |     ~~~~~~~~^~~~
>> ../target/i386/ops_sse.h:2494:13: error: â€˜r2â€™ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2494 |     d->Q(2) = r2;
>>          |     ~~~~~~~~^~~~
>> ../target/i386/ops_sse.h:2493:13: error: â€˜r1â€™ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2493 |     d->Q(1) = r1;
>>          |     ~~~~~~~~^~~~
>> ../target/i386/ops_sse.h:2492:13: error: â€˜r0â€™ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2492 |     d->Q(0) = r0;
>>          |     ~~~~~~~~^~~~
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>> Message-Id: <20221221163652.1239362-1-eric.auger@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> you pulled v1 but there were additional comments afterwards and last
> iteration was:
> https://lore.kernel.org/all/20221222140158.1260748-1-eric.auger@redhat.com/

Ok, since I have to respin I will replace.  Thanks!

Paolo


