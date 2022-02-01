Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C44A5A17
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:34:46 +0100 (CET)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqUm-0001J9-U8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqRD-00086M-Qp; Tue, 01 Feb 2022 05:31:04 -0500
Received: from [2a00:1450:4864:20::42f] (port=39615
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqRC-0005j0-11; Tue, 01 Feb 2022 05:31:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s9so31001756wrb.6;
 Tue, 01 Feb 2022 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U5rxB2/eJedDAwB06DJu8ZJl5lUy7yKcfqbN3VCLTUI=;
 b=FRaoBahVIlv9wiMBx6nHdxwys+8pk/I5MV6LTKqLWDGXM9ns1EJpS/7a1ScW6z8zRh
 LDx61o5q9Xp8UsHfo5pgR2XqADiP+sKdpFwaSZALEcVGgLk1YUasFy5jbz5qJFh6xjRd
 EKwCiF/aVvzj13SOGXhAG977o9u9eg+4GZtMILLDXos8Q2JwEiJ3Ef4K5qotcgW/ySNI
 7JRBbdIruBG1UkhrVJJ//nKHdH5Du2wY1hawOcqztsA8ujZUwab64oIYoJosVGgeVMOO
 cwr6VAZj57lbBHZEMjGfjTkwo0xCu/iHkKP5QmGsdcFk3qNdV5USzU+jzrKCulYLraty
 d5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U5rxB2/eJedDAwB06DJu8ZJl5lUy7yKcfqbN3VCLTUI=;
 b=BGllaefel9NSdpX4isce6xLR0OYz+TMHrVCkVRXSLo8ctKqrkX0WIdamQYMDJxoECK
 F/Z2m7+OwUxVUi7zVK0ap2MHwHeqRrb5bZDoyzh/hJ1Ov1no9gAdcH1IQt9RQyiiuRu5
 YpE5avBlTEekeMfBs/DAEjA9idVaYaGXwVlpZ0sIpqNtR43Snjzsf5c2gFfOi2yS8uDt
 vrfqxZFvJaGmfRbVA2WH5vgYFKgl1s3Op/873FveobvoTux7KSg1Iqc9N/3NdaF3iQ2D
 EnovgTp5mp1Y134zGDj3swSldZoWGT28NjQMXUsW0mTIXZnutmEypwv7/Y2tWLp+y9SF
 r/sA==
X-Gm-Message-State: AOAM533I+momIa1iZ9NAcDls5OrcLamy/G+DV6sEOIb4R2oiZPlNdLc3
 XSSi2A08XNQ+RB/m9F9qb8w=
X-Google-Smtp-Source: ABdhPJyYGSET4QiINq7M/gUt5RZq8wL81wi+qNrp1TeLGe3s/E8cqVdDzus4RfADmDyCJszaoeWrPQ==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr11823499wrr.177.1643711459222; 
 Tue, 01 Feb 2022 02:30:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m14sm17653532wrp.4.2022.02.01.02.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:30:58 -0800 (PST)
Message-ID: <bf72c7db-6f0a-e291-2f79-a061293dc810@redhat.com>
Date: Tue, 1 Feb 2022 11:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com> <YfJ7pbLDuwP2hgnw@redhat.com>
 <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
 <Yff4Dl6bpHhTxAfB@redhat.com>
 <1653fd9d-e1e9-5f32-3bd1-62abecd09601@redhat.com>
 <feb30385-a222-166f-ad82-19307c980a0d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <feb30385-a222-166f-ad82-19307c980a0d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 10:45, Emanuele Giuseppe Esposito wrote:
>> That said, even if they are a different category, I think it makes sense
>> to leave them in the same header file as I/O functions, because I/O
>> functions are locked out between drained_begin and drained_end.
> 
> Proposed category description:
> /*
>   * "Global OR I/O" API functions. These functions can run without
>   * the BQL, but only in one specific iothread/main loop.
>   *
>   * More specifically, these functions use BDRV_POLL_WHILE(bs), which
>   * requires the caller to be either in the main thread and hold
>   * the BlockdriverState (bs) AioContext lock, or directly in the
>   * home thread that runs the bs AioContext. Calling them from
>   * another thread in another AioContext would cause deadlocks.
>   *
>   * Therefore, these functions are not proper I/O, because they
>   * can't run in *any* iothreads, but only in a specific one.
>   */
> 
> Functions that will surely go under this category:
> 
> BDRV_POLL_WHILE
> bdrv_parent_drained_begin_single
> bdrv_parent_drained_end_single
> bdrv_drain_poll
> bdrv_drained_begin
> bdrv_do_drained_begin_quiesce
> bdrv_subtree_drained_begin
> bdrv_drained_end
> bdrv_drained_end_no_poll
> bdrv_subtree_drained_end
> 
> (all generated_co_wrapper)
> bdrv_truncate
> bdrv_check
> bdrv_invalidate_cache
> bdrv_flush
> bdrv_pdiscard
> bdrv_readv_vmstate
> bdrv_writev_vmstate
> 
> 
> What I am not sure:
> 
> * bdrv_drain_all_begin - bdrv_drain_all_end - bdrv_drain_all: these were
> classified as GS, because thay are always called from the main loop.
> Should they go in this new category?

1) They look at the list of BDS's, and 2) you can't in general be sure 
that all BDS's are in *your* AioContext if you call them from a specific 
AioContext.

So they should be GS.

> * how should I interpret "all the callers of BDRV_POLL_WHILE"?
> Meaning, if I consider also the callers of the callers, we end up
> covering much much more functions. Should I only consider the direct
> callers (ie the above)?

In general it is safe to make a function GS even if it is potentially 
"GS or I/O", because that _reduces_ the number of places you can call it 
from.  It's likewise safe to make it I/O-only, but probably it makes 
less sense.

Paolo

