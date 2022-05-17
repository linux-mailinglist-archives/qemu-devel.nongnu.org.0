Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA352A56B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:54:33 +0200 (CEST)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyan-00037z-2L
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy45-0000VE-Jx; Tue, 17 May 2022 10:20:49 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy3w-0006hQ-1k; Tue, 17 May 2022 10:20:41 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ch13so34944100ejb.12;
 Tue, 17 May 2022 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wbyCKBJR5yzSSGFKbBymlfOnB2dE0USMr5972q1A+Zg=;
 b=o+kgXET08srcpfKOof+HqQ4rI4G9j+M6l2ke7NLVNmNSaCTTIT3baJwM37gljNl9SE
 gsXaGgQu917PHdfp8DelFhPf3LHbvFetpP+Op/0jFddpCr2JjnG/lEayC2/YMEPACz/X
 r9Tet3kUh0lCR8C+7XKYqWt/gdu71BOHY2CG+Roo6Pw9ZTW8nYVA2nByIRjcHT8wKNUT
 AYIeG+B7n2vGvJqyzL/4QxoN5/qblcoyVU6D2pmVqruTQF1a7gheGGGjUMj2G5X4GkZe
 fJG4XRb1vSJG8j3lNcsp5fpMSUHJ+FyRnK4OOC2grzIToQetnKnonq6/+Cgv5Qm+Eoem
 1x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wbyCKBJR5yzSSGFKbBymlfOnB2dE0USMr5972q1A+Zg=;
 b=aXpGbOVwQIPWkpriHuE3ln5+1JoGzKC2+xjojNjtaHunRW3W7gl+KBif1d37tQV8zN
 AsidpA7qwBiqnJvdcj500miNnU6818tL18iPnHirICjWkv5hLmKzHawukBUaVb54rUOi
 4HohuAoZJN7QIsqHbq/4iW4VHIzllgRY93rL2EVUpaRaRpEZHwKFVaBb3uZ96TRP+xV1
 pZ6tAvVgP0QhPCVozIDz/4MvdzbCQKIG1K3GP6lT0LP1B76MyT3e9PjDEEmtC/BXP4S/
 hO9b9m7kOqbPL1VOrIHf+hx0cxX1n6wyi+sgkObNuLXlEvhzLeN++rTu6o6H1aJzXlxf
 D8Pg==
X-Gm-Message-State: AOAM5337TNvxVwxJoyd7rQk65hIFsQoTIt/0LegCeQJ9XzdTi+zNzKM0
 EvNlA3PBrGhEeNxD/v0zQVik5HO/lNEqAQ==
X-Google-Smtp-Source: ABdhPJz4U4VocYMaX0Nf9/cOGd9Cglom9rR6+60FEFXGYgm7FRcbyk6ZX2sr7onj4F4i/gApewn/5w==
X-Received: by 2002:a17:906:9c85:b0:6f4:e065:4f4b with SMTP id
 fj5-20020a1709069c8500b006f4e0654f4bmr19733835ejc.92.1652797233008; 
 Tue, 17 May 2022 07:20:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 cx4-20020a05640222a400b0042ac2b71078sm1651606edb.55.2022.05.17.07.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:20:32 -0700 (PDT)
Message-ID: <08a986d2-df07-2516-7bee-1099c3368ef0@redhat.com>
Date: Tue, 17 May 2022 16:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/18] block: Make 'bytes' param of blk_{pread, pwrite}()
 an int64_t
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113812.199312-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113812.199312-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 13:37, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement them using generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 6 +++---
>   include/sysemu/block-backend-io.h | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

