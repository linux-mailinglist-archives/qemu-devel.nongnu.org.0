Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D4517020
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 15:19:07 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlVxB-00006K-PQ
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 09:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nlVu7-0006NC-4C
 for qemu-devel@nongnu.org; Mon, 02 May 2022 09:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nlVu4-00076b-V6
 for qemu-devel@nongnu.org; Mon, 02 May 2022 09:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651497340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2As4WXF4vmNqrlRWzgFxQt3bWlegamlDPii6Io1e7U=;
 b=QWR5fnLiHIa2F6ZIWJU4ymhA7gneR5H3G/Ie+h8kgcd46e/mwT+NAdoH19upA73oSCvewu
 7elNOxckT5b1A9lRwnkBOqadb9KXy2awQmNIeSHRW8kjrJvaf1HszIWZvtgfLLnSdYxj53
 t0ZSEPTn51q1Vx3TsttVaJ8o6NcqOVs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-RLHelrUOPX2ndBAu5Br1mw-1; Mon, 02 May 2022 09:15:38 -0400
X-MC-Unique: RLHelrUOPX2ndBAu5Br1mw-1
Received: by mail-ed1-f72.google.com with SMTP id
 r26-20020a50aada000000b00425afa72622so8596129edc.19
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 06:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=L2As4WXF4vmNqrlRWzgFxQt3bWlegamlDPii6Io1e7U=;
 b=DeEv+FG4imWGUli2GPauP16jgJ7vQkRX5RaoRUn6W2lJljrW2pjhGgkI4MscsyxJ+C
 PkwziUyOekjeWlQevNnxIrca28j5688aVcA5wJ6R/q+rkyMae7Tilvkw1qRtMDrDcMcD
 boRo6wYbX/8tMF9FnbntmmvRI35V/E/Y1w8VGMRngCgBI4kbULvQdPaj9+As9471wdZ0
 6Pk5+/4j/Rr7hK9oE8HIVHPByJ2k/U0Sc1cLIoIhOghF4Vj42d3GTA6gMzfmp1L4qhbV
 EeHJ4MUvR1IM4jJMSHo5GXmCjFEt1oWvdHZyxhGYLv5TzEuhu39vvmIEMwZf2i1sIooA
 P7RQ==
X-Gm-Message-State: AOAM530W9hla4fL7zDwhfxhrFSLKliBo34der6cibLl5Y/XtCRUV8Ty+
 bCH6RPp39eeGhlXRa7RuhMaBKUR9zJS+7vtCQ27ii2vxusO492yZ+oHJOJhBDC3hLdutvImqzaz
 g2Zvd72pGxUUr+vY=
X-Received: by 2002:a17:906:80d4:b0:6f3:bead:750c with SMTP id
 a20-20020a17090680d400b006f3bead750cmr11252517ejx.129.1651497337715; 
 Mon, 02 May 2022 06:15:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2LkMV1Uo8RFzbBVj9cnnLMpFWsHV6mXGp8n/r9Ccl0+Lb6md/IgUsNlLlR2i+hR2YHkC/oQ==
X-Received: by 2002:a17:906:80d4:b0:6f3:bead:750c with SMTP id
 a20-20020a17090680d400b006f3bead750cmr11252489ejx.129.1651497337381; 
 Mon, 02 May 2022 06:15:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bd28-20020a056402207c00b0042617ba6391sm6761361edb.27.2022.05.02.06.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:15:36 -0700 (PDT)
Message-ID: <46c5318b-ae01-1b8d-a81c-3d02403460de@redhat.com>
Date: Mon, 2 May 2022 15:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
 <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
 <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
 <YmzGV8Evmet8RXUh@stefanha-x1.localdomain>
 <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
In-Reply-To: <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 10:02, Emanuele Giuseppe Esposito wrote:
>> Are you saying rdlock isn't necessary in the main loop because nothing
>> can take the wrlock while our code is executing in the main loop?
> Yes, that's the idea.
> If I am not mistaken (and I hope I am not), only the main loop currently
> modifies/is allowed to modify the graph.
> 
> The only case where currently we need to take the rdlock in main loop is
> when we have the case
> 
> simplified_flush_callback(bs) {
> 	for (child in bs)
> 		bdrv_flush(child->bs);
> }
> 
> some_function() {
> 	GLOBAL_STATE_CODE();
> 	/* assume bdrv_get_aio_context(bs) != qemu_in_main_thread() */
> 
> 	bdrv_flush(bs);
> 		co = coroutine_create(bdrv_get_aio_context(bs))
> 		qemu_coroutine_enter(co, simplified_flush_callback)
> }

This is correct, but it is very unsafe as long as bdrv_flush(bs) is 
allowed to run both in coroutine context and outside.  So we go circling 
back to the same issue that was there in the stackless coroutine 
experiment, i.e. functions that can run both in coroutine context and 
outside.

This issue is fundamentally one of unclear invariants, and reminds me a 
lot of the problems with recursive mutexes.

Paolo


