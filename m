Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B201628C99C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 09:57:51 +0200 (CEST)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSFBu-0004If-Gj
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 03:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kSFAe-0003Fh-Rv
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 03:56:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:47270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kSFAa-00084J-BX
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 03:56:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD289AD68;
 Tue, 13 Oct 2020 07:56:25 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] replay: do not build if TCG is not available
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201012214527.1780-1-cfontana@suse.de>
 <20201012214527.1780-4-cfontana@suse.de>
 <22f05da9-311b-d8e7-0052-2163f9e6c1e8@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0c9eb5ef-5817-06f6-f622-09cb9a22505e@suse.de>
Date: Tue, 13 Oct 2020 09:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <22f05da9-311b-d8e7-0052-2163f9e6c1e8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 10/13/20 12:29 AM, Paolo Bonzini wrote:
> On 12/10/20 23:45, Claudio Fontana wrote:
>> +    ctx = blk_get_aio_context(blk);
>> +    if (!replay_bh_schedule_oneshot_event(ctx, error_callback_bh, acb)) {
>> +        /* regular case without replay */
>> +        aio_bh_schedule_oneshot(ctx, error_callback_bh, acb);
>> +    }
> 
> Why can't the stub just call aio_bh_schedule_oneshot?  

Absolutely, it can, I just considered the option and dropped it in the end.

> This makes the
> API even more complicated.

In my view not really, the API just returns a boolean that tells you if the event was consumed or not.

> 
> I think you are doing this in order to avoid link errors in tools, but

Not really, I am preferring this alternative not for linking reasons, but to make it better,

I just see the problem of putting actual functional code in stubs, that is something that violates least-surprise principle for me.
Any change to actual production code dealing with events needs changes in .. stubs?

Also factoring in this choice is trying to obviate to the fact that the replay code funnels all (many) QEMU events
into itself, so any investigation of the code needs to involve the replay framework, whether replay is enabled or not,
and whether replay is even built-in or not, and I think this is not a good idea.

I also considered just wrapping every event "hook" code around the codebase around an if (replay_events_enabled()) or if (tcg_enabled),
but this lead to code duplication, where the same code would be repeated, once inside replay-events when replay is disabled,
and once in the general code when replay is not compiled in.

Changing the API to return bool is_event_consumed just seemed the best option right now to me.


> it's not necessary. you can have more than one stub file:
> 
> - replay/replay-stub.c for functions needed by emulators (added with
> "if_false:", it also includes the monitor commands);
> 
> - stubs/replay.c for functions needed by tools (including
> replay_bh_schedule_oneshot_event which is currently in
> stubs/replay-user.c for some reason).
> 
> Paolo
> 

I understand this is a temporary measure anyway, waiting for better isolation of the replay framework inside tcg, and maybe a better way to graft its hooks to events in the rest of the code,
in a way that is less invasive and more automated (maybe something similar to trace?)

If people feel strongly that this is a wrong step, we can do the alternative and put production code inside the stubs, but it just seems wrong.

Thanks!

Ciao,

Claudio

