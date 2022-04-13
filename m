Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BBE4FF819
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:45:33 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nedJL-0008Mq-Vy
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nedHf-0007WW-Cv
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nedHc-0003m6-NQ
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649857423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxh8aBNC7gvHne+mnSp5bjFAvvZcWoNCiqADZc5f4j4=;
 b=UATYU5lUvzq6hEFnJfX6I28Jyq9A2drfccweAaUp0zZdh31+USQUTCRBjvRk8XuCS2xETR
 vaeLi4xy0AwPQohJyyLx6lh9uQze/YXYJa+24ywcvTAZbRP4t1C41irqCvXOLHFoSkhX8Z
 OjOD+lf/3h86JAeOvR6Y+O6xw/N8V+w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-QbeqjnR1PAWhtk6LxSi_9A-1; Wed, 13 Apr 2022 09:43:40 -0400
X-MC-Unique: QbeqjnR1PAWhtk6LxSi_9A-1
Received: by mail-qv1-f70.google.com with SMTP id
 7-20020a0562140dc700b004442d23d2d8so1796840qvt.2
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 06:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bxh8aBNC7gvHne+mnSp5bjFAvvZcWoNCiqADZc5f4j4=;
 b=bMChZT5vIQcl4C+kqErogNdphVQnxAqYshr+vA246DUiWuuXhPV2c8KG7Z876mpy0o
 iVxM64ofQ0GeOauZVQqiqXgJN3WxTFFdUJDP59uxgvWxWwSpGFxS9c3vfd2mTryaTFc+
 pVnDlI4KFmLM8EoT0JRgwQVpLN0HQIWct6iwudTrlbzD0KzwOrXyS4FnDwBji6HoAm6f
 GVqWLxwC9RpmHDtQS9WVvC/jYvhlWXi9SLyP+UrOWuoM2fRaPv33Ws+wI9yg9/taAD/Q
 /JW6De4HrEWTak2IqDRfLlPc/rYO3bQnN/TNZ9ZvdZn4s4UGqE3Qej6iLR538QJ8hktL
 r0Nw==
X-Gm-Message-State: AOAM530wSr1XWTCRk/CjdCgi6yYEJJcJAedMZTUxR2u4iPhyPDxk/zty
 19OPZBuj+STqWo/vVXtSq6E3r+4eiMsQSh46YNwM72B7lVQxpt0y9dV3tILytwVXDeSOh0HLTNg
 KKRi4M2lAZciai1k=
X-Received: by 2002:a37:9e97:0:b0:69b:3863:ed83 with SMTP id
 h145-20020a379e97000000b0069b3863ed83mr6739721qke.91.1649857419840; 
 Wed, 13 Apr 2022 06:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQhuysy2XvrwZZa5pbhRuFeJj9Itzc77QtLYCMDSXUJesnYKKoO5EOD4X9SLdK4WUDKs824g==
X-Received: by 2002:a37:9e97:0:b0:69b:3863:ed83 with SMTP id
 h145-20020a379e97000000b0069b3863ed83mr6739704qke.91.1649857419599; 
 Wed, 13 Apr 2022 06:43:39 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g4-20020ac87d04000000b002e06b4674a1sm29618765qtb.61.2022.04.13.06.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 06:43:39 -0700 (PDT)
Message-ID: <6b88890c-f191-7f77-93eb-91f4951e179d@redhat.com>
Date: Wed, 13 Apr 2022 15:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Kevin Wolf <kwolf@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So this is a more concrete and up-to-date header.

Few things to notice:
- we have a list of AioContext. They are registered once an aiocontext
is created, and deleted when it is destroyed.
This list is helpful because each aiocontext can only modify its own
number of readers, avoiding unnecessary cacheline bouncing

- if a coroutine changes aiocontext, it's ok with regards to the
per-aiocontext reader counter. As long as the sum is correct, there's no
issue. The problem comes only once the original aiocontext is deleted,
and at that point we need to move the count it held to a shared global
variable, otherwise we risk to lose track of readers.

- All synchronization between the flags explained in this header is of
course handled in the implementation. But for now it would be nice to
have a feedback on the idea/API.

So in short we need:
- per-aiocontext counter
- global list of aiocontext
- global additional reader counter (in case an aiocontext is deleted)
- global CoQueue
- global has_writer flag
- global QemuMutex to protect the list access

Emanuele

#ifndef BLOCK_LOCK_H
#define BLOCK_LOCK_H

#include "qemu/osdep.h"

/*
 * register_aiocontext:
 * Add AioContext @ctx to the list of AioContext.
 * This list is used to obtain the total number of readers
 * currently running the graph.
 */
void register_aiocontext(AioContext *ctx);

/*
 * unregister_aiocontext:
 * Removes AioContext @ctx to the list of AioContext.
 */
void unregister_aiocontext(AioContext *ctx);

/*
 * bdrv_graph_wrlock:
 * Modify the graph. Nobody else is allowed to access the graph.
 * Set global has_writer to 1, so that the next readers will wait
 * that writer is done in a coroutine queue.
 * Then keep track of the running readers by counting what is the total
 * amount of readers (sum of all aiocontext readers), and wait until
 * they all finish with AIO_WAIT_WHILE.
 */
void bdrv_graph_wrlock(void);

/*
 * bdrv_graph_wrunlock:
 * Write finished, reset global has_writer to 0 and restart
 * all readers that are waiting.
 */
void bdrv_graph_wrunlock(void);

/*
 * bdrv_graph_co_rdlock:
 * Read the bs graph. Increases the reader counter of the current
aiocontext,
 * and if has_writer is set, it means that the writer is modifying
 * the graph, therefore wait in a coroutine queue.
 * The writer will then wake this coroutine once it is done.
 *
 * This lock cannot be taken recursively.
 */
void coroutine_fn bdrv_graph_co_rdlock(void);

/*
 * bdrv_graph_rdunlock:
 * Read terminated, decrease the count of readers in the current aiocontext.
 * If the writer is waiting for reads to finish (has_writer == 1), signal
 * the writer that we are done via aio_wait_kick() to let it continue.
 */
void coroutine_fn bdrv_graph_co_rdunlock(void);

#endif /* BLOCK_LOCK_H */


