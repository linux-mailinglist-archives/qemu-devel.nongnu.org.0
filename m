Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7742D1BE8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:21:03 +0100 (CET)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNwM-0002MK-1u
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmNsu-000167-4t
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:17:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:58330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmNss-000164-K4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:17:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36E7DAC90;
 Mon,  7 Dec 2020 21:17:25 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <CAFEAcA_X3Lhc0Pmea78fboTr_5kUjM4x4QbEXC2VWFXX=a98uQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <3f7121c8-6969-0812-0164-bde0207dd091@suse.de>
Date: Mon, 7 Dec 2020 22:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_X3Lhc0Pmea78fboTr_5kUjM4x4QbEXC2VWFXX=a98uQ@mail.gmail.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 10:12 PM, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 21:06, Claudio Fontana <cfontana@suse.de> wrote:
>> As I understand it, for the purpose of code separation,
>> we could:
>>
>> 1) skip do_interrupt move to the separate tcg_ops structure, wait until KVM/ARM uses another approach (if ever)
>> 2) do the move, and just call arm_cpu_do_interrupt() directly, since for KVM64 it is the only one that can be assigned to cc->do_interrupt().
>>
>> Which way would you suggest?
> 
> So what's the intention here? To put tcg-only methods in their
> own struct so that on a KVM-only QEMU they're compiled out
> and attempts to use them are a compile error?

Yes.

> In that case
> I guess if Arm really is the only user of do_interrupt outside
> TCG then we should do what this patch does and do a direct call.
> 
> thanks
> -- PMM
> 

Thanks, will do!

Claudio

