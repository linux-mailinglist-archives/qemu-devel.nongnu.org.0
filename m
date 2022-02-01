Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175EC4A597F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:51:05 +0100 (CET)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpoV-0008DG-PK
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:51:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEpjj-0004qr-8E
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEpjh-0007T2-L3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643708764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WjYnGCzhM/UAxy9+OlQs40wzR+h3jAnWQrerbqncddk=;
 b=Q9gpq6Iw4uAdNtSOWoDdLoQZaH8R2Sw7p6JpQ6tB8SrV7rpKTAFGyRp6cBXXPXmGfSN81O
 wwdeuBMOZj5lt+qzw23qGULweZrOKl8gvkT55t7Q55dEfGILF8ZbFZmaiWqjBrHYmj2Vgk
 2UWNzPx34VvSbvigW0WiZuHm7lkCbGU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-Un57LZdaMPiRaOkWH76SxA-1; Tue, 01 Feb 2022 04:45:59 -0500
X-MC-Unique: Un57LZdaMPiRaOkWH76SxA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a6-20020adfbc46000000b001d7370ace6eso5795849wrh.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 01:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WjYnGCzhM/UAxy9+OlQs40wzR+h3jAnWQrerbqncddk=;
 b=CikmBoFRlqgNwjL4ttby67P3aexlacrBTRqvorYxnHaBH0FjFxP+gy3gAHz1/K/mVL
 SzXi3QHgoP61OlWbV2fy7L6DDF8QajmeLzDkZfoyvT3wjBNGoYiyzmXqVW71Zasr6MAT
 p8xUyI0n2/N6h4scui15leIEdKboFQuryflvPzKxN3A28e6p0y6iDFS1B7FrWN4n8xHj
 ILkJSveSPFpqMPJjxR3HM23DRK7RW1Ejw5zwA7UMNk71+1fwUm3V2RwXyduW4LGl/czw
 BToTziCZ3q2gr2C10nOixnEYIkhpi//iUOITgiBBeijPotiGxZ5C3XX2cNG98VUMnoFA
 kirw==
X-Gm-Message-State: AOAM533H2HuP/KDgVRIZqPdfTVyDr+pvDTB7OE4cn8uicRqjjrRYWd2R
 Naq6HTN0d9uD3EBR+sVqSNgQwb494qKbKveuHchKTIunX/71ZLEMtnKAQoE/UJZ4ilA54hr1QI3
 lOuqHF5ptDv+2xes=
X-Received: by 2002:a7b:c44e:: with SMTP id l14mr1011113wmi.185.1643708757842; 
 Tue, 01 Feb 2022 01:45:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqB7HmQabwg8TlPyyFdE03YyaSrCdWQE75e3EdCMGkJqMl8/vZNFsMaSZW/Iu36R9ST5Vxkw==
X-Received: by 2002:a7b:c44e:: with SMTP id l14mr1011078wmi.185.1643708757524; 
 Tue, 01 Feb 2022 01:45:57 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id i19sm1870589wmq.45.2022.02.01.01.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 01:45:56 -0800 (PST)
Message-ID: <feb30385-a222-166f-ad82-19307c980a0d@redhat.com>
Date: Tue, 1 Feb 2022 10:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com> <YfJ7pbLDuwP2hgnw@redhat.com>
 <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
 <Yff4Dl6bpHhTxAfB@redhat.com>
 <1653fd9d-e1e9-5f32-3bd1-62abecd09601@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <1653fd9d-e1e9-5f32-3bd1-62abecd09601@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/01/2022 16:58, Paolo Bonzini wrote:
> On 1/31/22 15:54, Kevin Wolf wrote:
>> So I guess the decision depends on what you're going to use the
>> categories in the future. I get the feeling that we have one more
>> category than this series introduces:
>>
>> * Global State (must run from the main thread/hold the BQL)
>> * I/O (can be called in any thread under the AioContext lock, doesn't
>>    modify global state, drain waits for it to complete)
>> * Common (doesn't even touch global state)
>> * iothread dependent (can run without the BQL, but only in one specific
>>    iothread while holding its AioContext lock; this would cover at least
>>    AIO_WAIT_WHILE() and all of its indirect callers)
> 
> Yes, I agree.
> 
> bdrv_drained_begin and friends are somewhat like a coroutine-level
> lock/unlock primitive, so they need to be available in both the main
> thread and the iothread.  They could be called iothread dependent,
> AioContext dependent, or perhaps "global or I/O".
> 
> That said, even if they are a different category, I think it makes sense
> to leave them in the same header file as I/O functions, because I/O
> functions are locked out between drained_begin and drained_end.
> 
> Paolo
> 

Proposed category description:
/*
 * "Global OR I/O" API functions. These functions can run without
 * the BQL, but only in one specific iothread/main loop.
 *
 * More specifically, these functions use BDRV_POLL_WHILE(bs), which
 * requires the caller to be either in the main thread and hold
 * the BlockdriverState (bs) AioContext lock, or directly in the
 * home thread that runs the bs AioContext. Calling them from
 * another thread in another AioContext would cause deadlocks.
 *
 * Therefore, these functions are not proper I/O, because they
 * can't run in *any* iothreads, but only in a specific one.
 */

Functions that will surely go under this category:

BDRV_POLL_WHILE
bdrv_parent_drained_begin_single
bdrv_parent_drained_end_single
bdrv_drain_poll
bdrv_drained_begin
bdrv_do_drained_begin_quiesce
bdrv_subtree_drained_begin
bdrv_drained_end
bdrv_drained_end_no_poll
bdrv_subtree_drained_end

(all generated_co_wrapper)
bdrv_truncate
bdrv_check
bdrv_invalidate_cache
bdrv_flush
bdrv_pdiscard
bdrv_readv_vmstate
bdrv_writev_vmstate


What I am not sure:

* bdrv_drain_all_begin - bdrv_drain_all_end - bdrv_drain_all: these were
classified as GS, because thay are always called from the main loop.
Should they go in this new category?

* how should I interpret "all the callers of BDRV_POLL_WHILE"?
Meaning, if I consider also the callers of the callers, we end up
covering much much more functions. Should I only consider the direct
callers (ie the above)?

Emanuele


