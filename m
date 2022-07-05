Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303645665E1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:11:09 +0200 (CEST)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eaJ-00031e-QJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eXn-0001bX-RY
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eXl-0001O9-3e
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657012108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51aMgnxq242xPD4xY3j87t+6mzcDVzVVg953tYkRveM=;
 b=DlZALVP5aMqSA0pcPeKTl/4C2a7pWnW1TPy+rfvZypeHRpzkDfn5cATHofn7Y8iFvVeEVF
 TpMPZw6eq9wdvjke7k0+e4FujlToJeZ4ThBTXCHNjXSrMrrjvUpDOYJ6MKAJnyrquS9sGp
 9d0Ate8hQMAvuQIeFlxbe6DULYtTO7U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-4ebisqQqM8yLQ0bIFtj8sg-1; Tue, 05 Jul 2022 05:08:26 -0400
X-MC-Unique: 4ebisqQqM8yLQ0bIFtj8sg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z19-20020a05640240d300b00437633081abso8808392edb.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=51aMgnxq242xPD4xY3j87t+6mzcDVzVVg953tYkRveM=;
 b=Scj9xw9bitHOZ2AB1tEuTM0kNveDLs0UVklG3XXE4ZoAIrT7nbGyaA4P/exhPvCUE3
 gIrw5UQGx9+cefPDXtgszeV6q1j7Tp896mz4Jhg4yZBGomM2vsUfBqQAvxzVv4Z2KxS9
 VjoqM5alh8EjlRmCfDpXdzhxmD4SDcmdbKhTv/IJQJtL+oQJBvSlljefQnykAhQxvZqE
 Auu3a52K9+Z/5mDWLLxHngknW9NseIxgbbKUqeA4i9fmh541M2NgFQfcKt7MPmNr3EUj
 5MzDRRLkvWOClevQK0hLFrLNun45xviUb+BWCVePFx6/wd1cRmlm3skp7fmAPea0xMx6
 zA2Q==
X-Gm-Message-State: AJIora8AzFUVJXkOaHFRsA3QKeP7UhbLUI4OWLos+JIltgT8RIj4Duxk
 GU+Jn4WpNRisAeRNUTfFmnbV/DNFOD85sOeWtQ2sYNPcsICCzbOnaBjuOkssfdA+ZZmG3IMNm3m
 5SP9t3Zc5cElXAuE=
X-Received: by 2002:a05:6402:320f:b0:435:7236:e312 with SMTP id
 g15-20020a056402320f00b004357236e312mr45339794eda.115.1657012105109; 
 Tue, 05 Jul 2022 02:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vj/cIeDMcAGY/ZlAP7oMiP9E2rYMaIwS1Y0GdqU50aDZUpvshESFnDLWN71aK5ZtBS9HL+nw==
X-Received: by 2002:a05:6402:320f:b0:435:7236:e312 with SMTP id
 g15-20020a056402320f00b004357236e312mr45339757eda.115.1657012104804; 
 Tue, 05 Jul 2022 02:08:24 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a50fa82000000b0043a64eee322sm3580968edr.28.2022.07.05.02.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:08:24 -0700 (PDT)
Message-ID: <aec6b523-cbfb-9f48-9715-0b0637500c7e@redhat.com>
Date: Tue, 5 Jul 2022 11:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 16/18] block: Add blk_co_truncate()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-5-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-5-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 17.05.22 13:39, Alberto Faria wrote:
> Also convert blk_truncate() into a generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             |  7 ++++---
>   include/sysemu/block-backend-io.h |  8 ++++++--
>   tests/unit/test-block-iothread.c  | 14 ++++++++++++++
>   3 files changed, 24 insertions(+), 5 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


