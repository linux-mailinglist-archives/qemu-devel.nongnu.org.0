Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D06B6DAA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 03:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbYJV-0004nu-Rk; Sun, 12 Mar 2023 22:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pbYJT-0004ne-7F
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 22:53:27 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pbYJR-0003Uk-FI
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 22:53:26 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h8so11384770plf.10
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 19:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678675997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzmGMal5KOYANvEedLoJYACk53rMrAuFfji5fxSP2hQ=;
 b=bEhXJBazkDTK+LJ74Cg6Bvo+P/cKy7u20bbaE7Jgxnwz6wyqUFVYNG5eAaSle/Jy6s
 G3n+tItLL+CxLxT6chNVUNfhuMiM0PGiJXLGvC2fKbwkzJtJqWtQ620HgKBfRY17PydS
 AgN/0UOedsVQOID17QWNCQH+suLth7pzdTQQrRDlS2wiLgjMEQeFdZJoWk6eVn84sy+f
 2RBN1+5CzONaYVqX6IMxfljslNT3sfoi9QseRP4c38ugX4pMuO7PN6wBNeSDu+Y6nomI
 JlW96o9av+qGGJiv44Q8+K2geu1pMF3J1DAsikCHYMZaHkr5i4JkhRLWYVnb1yiaSn/M
 Y0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678675997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wzmGMal5KOYANvEedLoJYACk53rMrAuFfji5fxSP2hQ=;
 b=EoPM+IPtSV65ZkmRqPTj6KX/h9Fu+EITKg79Bz2IiO8qlYFzHLRh/S7vzyv6z5/f/x
 zVJB1svm0RL/a2aMiKw0P+iXvf3y2RCK5cZTTVLrKUOHyWMc6SD80Sso2OKaZ4v302hq
 AFh5PddgYTrfRM4FLutKCS0zuJcPxEMdglsCciQc4h5LEINngGG6SBfL2alzJqay2c0I
 SZRyLVYmFWG/dpB8WSLMjhlzanVCXS/wxe3E62U0zYsSooLWk9gHLO1I1uO1VuMSHMhS
 FvBOR7SoP/g6j4Uffn1CP4UWJeygMtrYkEC8J0sIGdOoVB3QQswOEyHEwOiv9YtawvBi
 KpBw==
X-Gm-Message-State: AO0yUKXrBJ+k1L8cyV7sm71TcJAWhDPuL0CwsrPOMgkjrd5CIJPoD/5R
 A/mdNn8t7oj5DRSZDYtteXj61g==
X-Google-Smtp-Source: AK7set9zWPTuBTAnPFzrzWaO8lYx4nFt3eBJEbmldq6VK/++NqPbEnz18e+HeCQQ7S2gPKJGHiOhWQ==
X-Received: by 2002:a05:6a20:a11c:b0:cc:63c6:8d3a with SMTP id
 q28-20020a056a20a11c00b000cc63c68d3amr34555486pzk.41.1678675997589; 
 Sun, 12 Mar 2023 19:53:17 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a62fb09000000b005941ff79428sm3367348pfm.90.2023.03.12.19.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 19:53:17 -0700 (PDT)
Message-ID: <dae72611-77fe-946d-a4b7-d4cf1647f99e@bytedance.com>
Date: Mon, 13 Mar 2023 10:53:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v7 3/6] memory: Introduce
 memory_region_transaction_do_commit()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-4-xuchuangxclwt@bytedance.com> <ZAtD9BZ4x2QwYUaH@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <ZAtD9BZ4x2QwYUaH@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter,

On 2023/3/10 下午10:51, Peter Xu wrote:
> On Fri, Mar 10, 2023 at 10:24:22AM +0800, Chuang Xu wrote:
>> Split memory_region_transaction_do_commit() from
>> memory_region_transaction_commit().
>>
>> We'll call do_commit() in address_space_to_flatview() in the later patch.
>>
>> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> [...]
>
>> +void memory_region_transaction_commit(void)
>> +{
>> +    assert(memory_region_transaction_depth);
>> +    assert(qemu_mutex_iothread_locked());
> This context has nothing to assert BQL, so this can be dropped I think (you
> have one in do_commit).

do_commit() will be triggered only when depth is 0. Before do_commit() is
triggered, we must ensure that the BQL is held when the depth is modified.

>> +
>> +    --memory_region_transaction_depth;
>> +    if (!memory_region_transaction_depth) {
>> +        memory_region_transaction_do_commit();
>> +    }
>>   }
> With above dropped:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
Thanks!


