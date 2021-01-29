Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F4308730
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:04:08 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PhI-0005lo-0c
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l5Pdx-0003WI-5v
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:00:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:39622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l5Pdq-0005mT-O7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:00:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C000DAF7F;
 Fri, 29 Jan 2021 09:00:29 +0000 (UTC)
Subject: Re: [PATCH v14 15/22] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-16-cfontana@suse.de>
 <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c0b59810-98b1-5de2-3077-6521cc68f673@suse.de>
Date: Fri, 29 Jan 2021 10:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 1:31 AM, Richard Henderson wrote:
> On 1/27/21 11:28 PM, Claudio Fontana wrote:
>> +    /*
>> +     * NB: this should be covered by CONFIG_TCG, but it is unsafe to do it here,
>> +     * as this header is included by both ss_specific and ss_common code,
>> +     * leading to potential differences in the data structure between modules.
>> +     * We could always keep it last, but it seems safer to just leave this
>> +     * pointer NULL for non-TCG.
>> +     */
>> +    struct TCGCPUOps *tcg_ops;
> 
> Sorry, I'm going to unqueue the patch set.
> 
> I first thought this was fixing up something done already, fixing an existing bug.
> 
> But it's something done in patch 1, and therefore the patch set needs to be
> re-worked to use this pointer to begin, for the exact reasons detailed above.
> Otherwise it would appear this breaks bisection.
> 
> 
> r~
> 

Hi Richard,

I made sure that the previous patches actually work in practice,

ie the issue mentioned there does not actually happen in practice,
due to the purposeful placement of the field in the structure that might be seen by one module
and not the other at the end of the structure, so no problem happens, and bisection
is actually safe.

The warning and the change is due to the fact that changing things in the way this patch
suggests makes it safer from _future changes_,

in which someone might add a new field at the end of the structure, after the conditional fields,
which would actually break things.

Do you think I should redo the series anyway? I would have started this way in the first place,
but I tried not to redo Eduardo's work.

Let me know what you think,

Thanks,

Claudio

