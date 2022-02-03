Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B74A851C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 14:21:49 +0100 (CET)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFc3X-0002wd-44
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 08:21:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFbvg-0007pk-30
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFbvb-0002Ll-4P
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643894013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpn1FCAskexSPL32X+Jll7NBPtdAO/Z4cXBlOOL0sKU=;
 b=gerZ6ZMNpV8zZJEq8SODMTPr12X+j6GrIhT5oyCRJxaU0KCxvgu66v35zDOT60RAEd86cw
 l25C7FIFLwWwnVuoLUm1TORfY9Yu1x0HHwErDxDP+GUt0JphJKtIMCiPFt75HZsx2imyVT
 1efjKw10utAQnSYZKbPufoUN1ULhEgQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-qNhkmptFPJKBRZNaqw7Olg-1; Thu, 03 Feb 2022 08:13:32 -0500
X-MC-Unique: qNhkmptFPJKBRZNaqw7Olg-1
Received: by mail-qt1-f199.google.com with SMTP id
 h5-20020ac87765000000b002cff8751c63so1872615qtu.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 05:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kpn1FCAskexSPL32X+Jll7NBPtdAO/Z4cXBlOOL0sKU=;
 b=WBwsbb0ggiL977U1YhWCn7oZlXpIcjwXGM63mnGiar9aK/K2dPGPBONM4KPrs/6UF1
 f8dQHyPa5ERHpenrHyvtgA0H/nvSWKC7Z13jN97z3a5G5HoXX4AV+LLQcYoZNJiI/cFT
 jtXfDmpcQXYSMYoDNKQly2pYr43pqG8hR+yCkkbq3kEVGIsFfwEyZjiTlGl6m7DI2pbz
 Ee5+HEkB0qnz8z10IOBLkwDpe+wcsBL6VhxjlxFMe9wVZdCLWVNLfu8r8VVQO/4hAG4d
 bU2DAZyX5dhTLa5UM1an5f1YhlydOp2+Otz6GzIuCSa+vsOJ21OUKZOllf3Z47VawaiN
 ci+A==
X-Gm-Message-State: AOAM532VoEinnHymmi9eSBPKoaOw3Ys+gEmILLTY6Dg4cciCnl4mfXGP
 TP6ZtDUE02Wy1O9QclomtgDWeqeIdkqTRSJ363i38zJ+J4ed3RPkwP5Nnj9Er7K3WhLPG491MXG
 fJ1F7VNkP93TKRr8=
X-Received: by 2002:a05:6214:2aab:: with SMTP id
 js11mr30817268qvb.79.1643894012167; 
 Thu, 03 Feb 2022 05:13:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyb3pZvSHzGmeUUDOPqH5C9fNC7UrgY/CYm8Dy8PSZCag7Ifq/k5PlNcUj521HBiwkl7p+ttg==
X-Received: by 2002:a05:6214:2aab:: with SMTP id
 js11mr30817208qvb.79.1643894011532; 
 Thu, 03 Feb 2022 05:13:31 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id b10sm2912100qtb.34.2022.02.03.05.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 05:13:31 -0800 (PST)
Message-ID: <0493f074-a641-686e-0473-4d3c1f3a39b6@redhat.com>
Date: Thu, 3 Feb 2022 14:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <3d99fc75-9b7a-a55c-3587-b1c1ce07b6f4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <3d99fc75-9b7a-a55c-3587-b1c1ce07b6f4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/01/2022 10:47, Paolo Bonzini wrote:
> 
> About this:
> 
>> +         * TODO: this is called by job_unref with lock held, because
>> +         * afterwards it calls bdrv_try_set_aio_context.
>> +         * Once all of this is fixed, take care of removing
>> +         * the aiocontext lock and make this function _unlocked.
> 
> It may be clear to you, but it's quite cryptic:
> 

I think you figured it by looking at the job patches, but:

> - which lock is held by job_unref()?  Also, would it make more sense to
> talk about block_job_free() rather than job_unref()?  I can't quite
> follow where the AioContext lock is taken.

AioContext lock. I think this is a change I made in the job patches, so
comparing it with the master would make this piece harder to understand.
In the job series, I reduce the granularity of the AioContext lock,
ending up having it only around few callbacks of JobDriver, namely
->free(). This is why I talk about job_unref, because it calls ->free.

The actual lock is taken in job_unref, but the caller (->free) is
block_job_free. Yes it makes more sense mentioning block_job_free.

> - what is "all of this", and what do you mean by "not safe yet"?  Do
> both refer to bdrv_try_set_aio_context() needing the AioContext lock?

Yes

> - what is "this function" (that should become _unlocked)?

bdrv_subtree_drained_begin

This is the new comment I intend to put:
/*
* TODO: this function is called by BlockJobDriver's ->free()
* callback, block_job_free.
* We unfortunately must still take the AioContext lock around
* ->free() in job_unref, because of the bdrv_try_set_aio_context
* call below that still releases/acquires it.
* Once bdrv_try_set_aio_context does not require the AioContext lock,
* take care of removing it around ->free() and replace
* the following bdrv_subtree_drained_begin with its
* _unlocked version.
*/
> 
> I think you could also split the patch in multiple parts for different
> call chains.  In particular bdrv_set_backing_hd can be merged with the
> patch to bdrv_reopen_parse_file_or_backing, since both of them deal with
> bdrv_set_file_or_backing_noperm.
> Ok, I will try to do that.

Emanuele


