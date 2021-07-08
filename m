Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E43BF884
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:40:51 +0200 (CEST)
Received: from localhost ([::1]:56566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RSc-0007vJ-RD
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1RRM-00077f-1h; Thu, 08 Jul 2021 06:39:32 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1RRI-0002dU-VM; Thu, 08 Jul 2021 06:39:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 09BAE74570D;
 Thu,  8 Jul 2021 12:39:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8D6DC745708; Thu,  8 Jul 2021 12:39:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8BC8E7456E3;
 Thu,  8 Jul 2021 12:39:24 +0200 (CEST)
Date: Thu, 8 Jul 2021 12:39:24 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
In-Reply-To: <07d3a270-6d44-591d-d0ee-0264d3b4c7f2@ozlabs.ru>
Message-ID: <4a903fde-4ea-a296-3132-bae249d261a@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <22b9ae49-7252-b664-ea98-99bb7baf4680@eik.bme.hu>
 <07d3a270-6d44-591d-d0ee-0264d3b4c7f2@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
> On 08/07/2021 20:18, BALATON Zoltan wrote:
>> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>>> This addresses the comments from v22.
>>> 
>>> The functional changes are (the VOF ones need retesting with Pegasos2):
>>> 
>>> (VOF) setprop will start failing if the machine class callback
>>> did not handle it;
>> 
>> I'll try this later but I think I've seen guests using setprop (Linux also 
>> does that for some property). How should I allow that? Do I need a new 
>> callback for this? Could it be allower unless there's a callback that could 
>> deby it? But that was the previous way I think.
>
> A simple defined callback which always returns "true" should do.

Yes but what's the point? That would just effectiverly disable this change 
so if we need that, we could just as well keep the previous behaviour 
which is to allow setprop unless there's a callback that can decide 
otherwise. The spapr machine has such a callback so it already does not 
allow all setprop and if I'll have a callback in pegasos2 returning true 
that will allow what's allowed now so this part of this patch does nothing 
indeed.

Since guests could do all kinds of things that we don't know without 
trying them restricting setprop is a good way to run into problems with 
guests that were not tested that could otherwise just work. Then we'll 
need another patch to enable that guest adding some more properties to the 
list of allowed ones. Why it it a problem to allow this by default in the 
first place and only reject changes for machines that have a callback? 
Then I would not need more empty callbacks in pegasos2.

Regards,
BALATON Zoltan

