Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBA30BC03
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:28:24 +0100 (CET)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sv1-0002qp-Jm
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6stn-0002LB-Py
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:27:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:58140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6stk-0002Eg-O5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:27:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08841AD29;
 Tue,  2 Feb 2021 10:27:03 +0000 (UTC)
Subject: Re: [PATCH v14 15/22] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-16-cfontana@suse.de>
 <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
 <e25fdb87-3b5d-65c5-3269-003bb768fff2@suse.de>
Message-ID: <a92ceb87-a7d8-980e-de47-b4587acbd79b@suse.de>
Date: Tue, 2 Feb 2021 11:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e25fdb87-3b5d-65c5-3269-003bb768fff2@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 11:01 AM, Claudio Fontana wrote:
> On 1/29/21 1:31 AM, Richard Henderson wrote:
>> On 1/27/21 11:28 PM, Claudio Fontana wrote:
>>> +    /*
>>> +     * NB: this should be covered by CONFIG_TCG, but it is unsafe to do it here,
>>> +     * as this header is included by both ss_specific and ss_common code,
>>> +     * leading to potential differences in the data structure between modules.
>>> +     * We could always keep it last, but it seems safer to just leave this
>>> +     * pointer NULL for non-TCG.
>>> +     */
>>> +    struct TCGCPUOps *tcg_ops;
>>
>> Sorry, I'm going to unqueue the patch set.
>>
>> I first thought this was fixing up something done already, fixing an existing bug.
>>
>> But it's something done in patch 1, and therefore the patch set needs to be
>> re-worked to use this pointer to begin, for the exact reasons detailed above.
>> Otherwise it would appear this breaks bisection.
>>
>>
>> r~
>>
> 
> Hello Richard,
> 
> I reworked this as suggested by Eduardo:, by not making the fields conditional at all in the first part of the series.
> 
> This should remove any doubt about potential issues. In no case is bisection compromised.
> 
> Are you ok with this?
> 
> Thanks,
> 
> Claudio
> 

Respinned with this change as v15:

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00045.html

Thanks,

Claudio

