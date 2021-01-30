Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA830938F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 10:41:45 +0100 (CET)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5mlE-0006uX-2e
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 04:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l5mjr-0006Ms-MZ
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 04:40:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:47628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l5mjq-0002aF-5i
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 04:40:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E37DFAD62;
 Sat, 30 Jan 2021 09:40:14 +0000 (UTC)
Subject: Re: [PATCH v14 15/22] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-16-cfontana@suse.de>
 <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
 <c0b59810-98b1-5de2-3077-6521cc68f673@suse.de>
 <33c1da5b-6f35-6540-becc-5d4e8a4703c8@linaro.org>
 <20210129193630.GU1227584@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <11030a9a-468e-3149-b866-af4edb743a51@suse.de>
Date: Sat, 30 Jan 2021 10:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129193630.GU1227584@habkost.net>
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 8:36 PM, Eduardo Habkost wrote:
> On Fri, Jan 29, 2021 at 09:19:00AM -1000, Richard Henderson wrote:
>> On 1/28/21 11:00 PM, Claudio Fontana wrote:
>>> Do you think I should redo the series anyway? I would have started this way
>>> in the first place, but I tried not to redo Eduardo's work.
>> I think that would be a good idea, yes.
> 
> Maybe just removing the #ifdefs from patch 01 (which were not
> present in the patch I wrote) could be a way to avoid redoing the
> whole series.
> 

That's a good point, I'll give it a try,

thanks!

Claudio

