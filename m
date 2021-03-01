Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC74327974
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:43:05 +0100 (CET)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGe8u-0002CB-9L
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGe7T-0001h9-IJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:41:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:36316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGe7R-0000xW-IZ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:41:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13A37AA4F;
 Mon,  1 Mar 2021 08:41:31 +0000 (UTC)
Subject: Re: [PATCH v25 14/20] i386: separate fpu_helper into user and sysemu
 parts
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226175143.22388-1-cfontana@suse.de>
 <20210226175143.22388-15-cfontana@suse.de>
 <d08e847d-8332-5526-7b92-04ed7379f2fd@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <28f1e68d-cbf7-dc06-e352-fe0f218b0dea@suse.de>
Date: Mon, 1 Mar 2021 09:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d08e847d-8332-5526-7b92-04ed7379f2fd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 7:42 PM, Richard Henderson wrote:
> On 2/26/21 9:51 AM, Claudio Fontana wrote:
>> +/* fpu_helper.c */
>> +
>> +void do_fsave(CPUX86State *env, target_ulong ptr, int data32, uintptr_t ra);
>> +void do_frstor(CPUX86State *env, target_ulong ptr, int data32, uintptr_t ra);
>> +void do_fxsave(CPUX86State *env, target_ulong ptr, uintptr_t ra);
>> +void do_fxrstor(CPUX86State *env, target_ulong ptr, uintptr_t ra);
> 
> Is this really worth it?

No, probably not. Will respin without these parts,
and leaving the small ifdefs in the global tcg/fpu_helper.c

Thanks,

Claudio


> It means that we unnecessarily expose these functions
> in system mode, where they are still not safe.
> 
> I had thought about doing something like
> 
> #ifdef CONFIG_USER_ONLY
> #define SYSEMU_STATIC
> #else
> #define SYSEMU_STATIC static
> #endif
> 
> SYSEMU_STATIC void
> cpu_x86_fsave(...)
> {
>   ...
> }
> 
> void helper_fsave(...)
> {
>     cpu_x86_fsave(..., GETPC());
> }
> 
> but I thought the existing example of "do_" functions within that file to be
> compelling.  I think small sections of this CONFIG within a file should be
> fine, especially where it interacts with other functions like this.
> 
> I guess either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 


