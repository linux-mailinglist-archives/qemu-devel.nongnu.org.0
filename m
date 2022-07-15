Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DEA575FD9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:15:48 +0200 (CEST)
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJIR-0004EB-7O
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCJGy-0002kK-UJ
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCJGv-0000Lg-QO
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657883653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wEp/relPQQTHqWSKb+sIF2rrK2M8dCy7IFGkGjFvUo=;
 b=hn7ttl03TnND+TeeICPIN+aFWch3QYv8xcEDmsws9jQGNfo1+BzQ02HKFMKvEKUDEEAcbf
 TBTRHPLvGQE7xe1DumbqpvM3cjLJDzJ771EkAq0ODCss3ZMV4Y2YRaq6KlihbwJkNzeFUy
 h81IhFtVKZEMCyjKbxAHeOkTlxTPXDc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-Rt8cy1t7Pf2CsNrfiIk7Ag-1; Fri, 15 Jul 2022 07:14:12 -0400
X-MC-Unique: Rt8cy1t7Pf2CsNrfiIk7Ag-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga9-20020a1709070c0900b0072b4d787f5dso1439173ejc.21
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8wEp/relPQQTHqWSKb+sIF2rrK2M8dCy7IFGkGjFvUo=;
 b=bgzXnnjXIGBZtN8qm1So26eWjsaH3qKQr9QEQlupkdZVgI9ldefeU6/6JnuzviBsP6
 EzEAVMyI7BKqoIdPpnXCXAwkDDz3YC3NeM0nIKZAcTkqa8oCtvxaQRh41ceWzsndVoWI
 45AHu8f0N6UuKNFXTHbAmH2+iUi9Cf623JDjeb85bD184Z84rIZft5wYNjdj0YfDyQzo
 aBGpHtALzgzr7QhHOWN4W9A372yuU6dNxIeH4ofTNomU4Obk2AoFeGr0xGjke4MR51GD
 u26nBC3b0QbagsfvnHr9sFMKDs/qTHKAt6REUfxnXNXWrbNwDFGqfnBi1vvruxmG2UL6
 XJoA==
X-Gm-Message-State: AJIora+cZkL0u/xUZ8C+XO6oXAVopw7FJNSbJ2TeV+ybA4uOQ+tBnbA/
 SVtdcf24nyClDHXlE41IiDBh1ViAbXXVfqR6XjOzG0JridBBLVOMZDcAiOmvWpTkallA5eL85fh
 pwuwgR9sP6CsbjE8=
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id
 gz28-20020a170907a05c00b0072b347b4f59mr12798219ejc.764.1657883650814; 
 Fri, 15 Jul 2022 04:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tU0NVouo73HpktB8CE8J2l/eYTxvd/2bGTp3Z8bCHU4B2JjZumy/9z2+5dFlk05naRou2kZA==
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id
 gz28-20020a170907a05c00b0072b347b4f59mr12798200ejc.764.1657883650630; 
 Fri, 15 Jul 2022 04:14:10 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 b6-20020aa7cd06000000b004355998ec1asm2571077edw.14.2022.07.15.04.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 04:14:09 -0700 (PDT)
Message-ID: <fb8f1979-4108-6307-57f0-10daa9c01bbf@redhat.com>
Date: Fri, 15 Jul 2022 13:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 4/8] blockjob: implement .change_aio_ctx in child_job
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-5-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-5-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> child_job_change_aio_ctx() is very similar to
> child_job_can_set_aio_ctx(), but it implements a new transaction
> so that if all check pass, the new transaction's .commit()
> will take care of changin the BlockJob AioContext.
> child_job_set_aio_ctx_commit() is similar to child_job_set_aio_ctx(),
> but it doesn't need to invoke the recursion, as this is already
> taken care by child_job_change_aio_ctx().
>
> Note: bdrv_child_try_change_aio_context() is not called by
> anyone at this point.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockjob.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)

Looks good, disregarding the fact that I’d like it very much if we could 
find some other primitive than tran_add_trail() to get these handlers to 
run on a drained graph.

But that’s taste (and something to talk about in patch 3), so I’ll just 
give a

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


