Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3672658422B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:49:58 +0200 (CEST)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4po-0005mt-NK
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oH4l0-0000Z7-9e
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oH4kx-0002AK-Ha
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659019495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CBDFyEbgKJc3IuuLY1e/oGomLfdfrJlxb+ZFLjj5FQ=;
 b=SBORFw/FBpsYb7jqwEey78agZdX5ld91Dia1XpoTydxyUxOkciHsjyMCBlt36R7b4Tm0Xb
 YIQc1jXGqBNU/hTwqWw2SmTfcUR4ij3zxcM7NzvGiAInxvn1giFXjcywwLRETYjyyn9cx5
 MARG7gKo/m7znrgpcjfA2s9JL6cSO88=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-rrUxxEQsMCyXDVUMLATkHg-1; Thu, 28 Jul 2022 10:44:53 -0400
X-MC-Unique: rrUxxEQsMCyXDVUMLATkHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 t25-20020a1c7719000000b003a3564fa721so1023402wmi.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 07:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1CBDFyEbgKJc3IuuLY1e/oGomLfdfrJlxb+ZFLjj5FQ=;
 b=C9SC9GpmiFg8O3iDVmtVjptkuZmFR0lDtyWN5ElPNsqQXHrRFMnb0FBYzxneh8jeLO
 0Je0qN3cC8BOrfC0EtMrIWVlkBaaRSssBnfTPmVXkkL50/xKf5YtPZN+ogydExqPkQku
 vvvYgvRewuRmsfLbh38ByXMrc7H3nf2wSK3gDdOf/yzhlzuFyaKs7YbE2hiqDcWqMMGi
 FxQV6yuyXqMF6ftZd3pgvnEJ1s8c+9nfl51Hlcrv/pKs2vFvnZe6airEsRvzxyLJdzSj
 H5QPZOt8AVd034x9weHFSzhmFGGyLY2G7MbHzyg0nGluo+W3WfrKz1Xw6Oamrtm+qHiV
 uKDA==
X-Gm-Message-State: AJIora/alijyhOpgEAcicPv9qCJ9k4IE0mJE2o1rv1gMb7cAWac93dLs
 l4A7L5fmolg/UFZYWkKiWNzsTkSp4W3IrQYW302F4LskZrYXR9QNb0kgAEYowN+Iz3uYaYqK5fC
 mg2qD9t2qvBcvyWo=
X-Received: by 2002:a05:6000:1c06:b0:21e:6c39:bb0 with SMTP id
 ba6-20020a0560001c0600b0021e6c390bb0mr18091307wrb.636.1659019492708; 
 Thu, 28 Jul 2022 07:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMiERbE9/MuF4e9Je5yGKlVLLCY9YvOJHAGQ87/iea5+C1wBlKLhM2kpj6cHd9Ne6ACWHxOw==
X-Received: by 2002:a05:6000:1c06:b0:21e:6c39:bb0 with SMTP id
 ba6-20020a0560001c0600b0021e6c390bb0mr18091289wrb.636.1659019492318; 
 Thu, 28 Jul 2022 07:44:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-134.web.vodafone.de.
 [109.43.176.134]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d55c5000000b0021eff2ecb31sm1115672wrw.95.2022.07.28.07.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:44:52 -0700 (PDT)
Message-ID: <10edefb1-3764-d0e5-f4be-0738224fcb04@redhat.com>
Date: Thu, 28 Jul 2022 16:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] migration-test: Allow test to run without uffd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220728133516.92061-1-peterx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220728133516.92061-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/07/2022 15.35, Peter Xu wrote:
> v2:
> - Fix warning in patch 1 [Thomas]
> - Collected R-b for Daniel
> 
> Compare to v1, this added a new patch as reported by Thomas to (hopefully)
> allow auto-converge test to pass on some MacOS testbeds.
> 
> Please review, thanks.
> 
> Peter Xu (2):
>    migration-test: Use migrate_ensure_converge() for auto-converge
>    migration-test: Allow test to run without uffd
> 
>   tests/qtest/migration-test.c | 67 +++++++++++++++---------------------
>   1 file changed, 27 insertions(+), 40 deletions(-)

Seems to work now:

https://api.cirrus-ci.com/v1/task/4760264934424576/logs/build.log

Citing:

" 2/59 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test         OK 
         218.87s   33 subtests passed"

Tested-by: Thomas Huth <thuth@redhat.com>


