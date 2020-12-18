Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347AF2DDC55
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 01:16:08 +0100 (CET)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq3RG-0007q2-PS
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 19:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq3Q9-0007PZ-F7
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 19:14:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:47562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq3Q5-0007XH-Pc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 19:14:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B3D8ACF5;
 Fri, 18 Dec 2020 00:14:51 +0000 (UTC)
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
 <ceb9f00e-2fdf-7534-b811-aa6cbd771b4e@suse.de>
 <CAFEAcA9iw4rGOZwwLmBqf70s8jh0g10hNRT4Y5aUujZDZhL0cQ@mail.gmail.com>
 <a58980ee-ae86-d3e0-8a5d-5e1fffee1b85@suse.de>
Message-ID: <c0f57e27-f0f3-8a99-ef06-ae17663b5878@suse.de>
Date: Fri, 18 Dec 2020 01:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a58980ee-ae86-d3e0-8a5d-5e1fffee1b85@suse.de>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Alex Bennee <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:47 AM, Claudio Fontana wrote:
> On 12/17/20 11:49 PM, Peter Maydell wrote:
>> On Thu, 17 Dec 2020 at 22:45, Claudio Fontana <cfontana@suse.de> wrote:
>>>
>>> On 12/17/20 9:15 PM, Peter Maydell wrote:
>>>> On Thu, 17 Dec 2020 at 19:46, Claudio Fontana <cfontana@suse.de> wrote:
>>>> Yeah, don't try to ifdef out struct fields in common-compiled code...
>>>
>>> or should I? Using
>>>
>>> #ifdef NEED_CPU_H
>>> #ifdef CONFIG_SOFTMMU
>>>
>>> seems to do what I expect. Is it wrong?
>>
>> I think that gives you two versions of the struct:
>> - one seen by compiled-once files and by compiled-per-target softmmu files
>> - one seen by compiled-per-target user-only files
>>
>> Since the user-only target executables link both compiled-per-target
>> and compiled-once files I think they end up with different C files
>> thinking the same struct has a different layout/size which seems
>> like it's going to cause problems.
>>
>> thanks
>> -- PMM
>>
> 
> It doesn't with
> 
> #ifdef NEED_CPU_H
> #ifdef CONFIG_SOFTMMU
> 
> just double checked the pointers from both files compiled per target and "common"; also all tests are ok.
> 
> It immediately breaks if I replace those two defines with #ifndef CONFIG_USER_ONLY and recompile.
> 
> I thought it was by design, but I guess this is just a "lucky" accident?

By lucky accident I mean that CONFIG_SOFTMMU is a check in the positive instead of the #if !defined(CONFIG_USER_ONLY), so it ends up working..

> 
> Ciao,
> 
> Claudio
> 


