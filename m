Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FAC3A283C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:25:58 +0200 (CEST)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGwn-0003Tt-2y
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lrGvJ-0001vP-87; Thu, 10 Jun 2021 05:24:25 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lrGvE-0001My-UH; Thu, 10 Jun 2021 05:24:24 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2538421A68;
 Thu, 10 Jun 2021 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623317059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
 b=qH01F5/zQuj51QiNxpZr64OMBUXbY53Q7NCmddjCCCc2WzF8bII1Cq6g3pH7OWWKQtaKa5
 xJ8wgMUG8HOpaAmUKZ7silylO3SyjmIKU/G/RSHaO4aF9twoXVw+tmZYm89LhqzvQXy1oC
 VEi/3f0cDnwryktbAZZoGMs/8AIHA1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623317059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
 b=yWLMarGKzfdg/c7UnJ8ThFiTqt3b4CLONcM1hL50CYy8KOMUvoKR2MutDvw64rIB3QxBQ3
 jgntQu6fDA+FHOCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E6BF7118DD;
 Thu, 10 Jun 2021 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623317059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
 b=qH01F5/zQuj51QiNxpZr64OMBUXbY53Q7NCmddjCCCc2WzF8bII1Cq6g3pH7OWWKQtaKa5
 xJ8wgMUG8HOpaAmUKZ7silylO3SyjmIKU/G/RSHaO4aF9twoXVw+tmZYm89LhqzvQXy1oC
 VEi/3f0cDnwryktbAZZoGMs/8AIHA1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623317059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
 b=yWLMarGKzfdg/c7UnJ8ThFiTqt3b4CLONcM1hL50CYy8KOMUvoKR2MutDvw64rIB3QxBQ3
 jgntQu6fDA+FHOCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id tW3lNkLawWD5OgAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 09:24:18 +0000
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
 <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
 <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
 <CAFEAcA-GGr50x8XQOssOEVqPvE7Wq+=tpypirxT+rso+diCWsw@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <029be61d-43e7-bec4-0a8c-16c37906a997@suse.de>
Date: Thu, 10 Jun 2021 11:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GGr50x8XQOssOEVqPvE7Wq+=tpypirxT+rso+diCWsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 11:01 AM, Peter Maydell wrote:
> On Thu, 10 Jun 2021 at 09:45, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> On 6/5/21 10:50 PM, Richard Henderson wrote:
>>> I don't see the point in the excessive replication of header files, for exactly
>>> one declaration.  This is not the first example.
>>>
>>> What's wrong with internal.h?
>>
>> Doesn't mean anything and leads to a mess of unrelated code.
> 
> It is all related: it is "things that the target/arm code needs,
> which are not needed by anything outside target/arm".
> 
>> I think we should be better at creating meaningful modules
> 
> target/arm is a meaningful grouping of code :-)
> 

Well, seems a bit too large a grouping to me,

and it seems like more effort could be put into recognizing opportunities to split things into self-contained units when they show up,
with more clearly defined and commented interfaces about inputs/outputs and initialization dependencies,

instead of cramming everything together. Of course there is a balance to be had, but my impression is that using exclusively things like internal.h
leads to people adding anything new just piling unrelated things on top, and missing opportunities for doing things in a more self-contained way.

Just my 2c of course.

Ciao,

C.

