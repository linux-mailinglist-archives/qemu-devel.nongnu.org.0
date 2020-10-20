Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1228D2FF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 19:18:18 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSNwH-0005CD-Mz
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 13:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kSNvC-0004MB-GY
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 13:17:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kSNvA-0000hc-Q5
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 13:17:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63781AC19;
 Tue, 13 Oct 2020 17:17:07 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] replay: do not build if TCG is not available
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201013143806.14321-1-cfontana@suse.de>
 <20201013143806.14321-4-cfontana@suse.de>
 <edc078b6-71b4-0650-1c23-fd437cd3fd25@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4dd4ba40-159c-d581-1dbb-93a79bb06b8b@suse.de>
Date: Tue, 13 Oct 2020 19:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <edc078b6-71b4-0650-1c23-fd437cd3fd25@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 7:12 PM, Paolo Bonzini wrote:
> On 13/10/20 16:38, Claudio Fontana wrote:
>> +void bdrv_bh_schedule_oneshot(AioContext *ctx, QEMUBHFunc *cb, void *opaque)
>> +{
>> +    if (replay_events_enabled()) {
>> +        replay_bh_schedule_oneshot_event(ctx, cb, opaque);
>> +    } else {
>> +        aio_bh_schedule_oneshot(ctx, cb, opaque);
>> +    }
>> +}
>> +
>> +void bdrv_bh_schedule(QEMUBH *bh)
>> +{
>> +    if (replay_events_enabled()) {
>> +        replay_bh_schedule_event(bh);
>> +    } else {
>> +        qemu_bh_schedule(bh);
>> +    }
>> +}
> 
> This is definitely better, but I'll defer to Kevin with respect to the
> naming of the function; having a bdrv_* function that has nothing to do
> with the block layer is still smelly of a sub-optimal API, and I'm not
> sure why the API change belongs in the series.
> 
> Paolo
> 

Hi Paolo,

I am not attached to the specific name, if someone has a better naming / proposes a better prefix I will replace of course.

Thank you,

Claudio

