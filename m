Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37132D11BA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:22:49 +0100 (CET)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGTY-0006oV-Tj
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmF7u-0006Nm-L6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:56:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:43064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmF7o-0004PO-TZ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:56:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD369AD1E;
 Mon,  7 Dec 2020 11:56:14 +0000 (UTC)
Subject: Re: Why do we have both CONFIG_SOFTMMU and CONFIG_USER_ONLY?
To: Peter Maydell <peter.maydell@linaro.org>
References: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
 <CAFEAcA9xLZCmjmBnPUN52wSDYdk2qd14RFXPyU0vWeW53Vg5aA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <08bd879e-66db-0fe0-522d-0a378f36f763@suse.de>
Date: Mon, 7 Dec 2020 12:56:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xLZCmjmBnPUN52wSDYdk2qd14RFXPyU0vWeW53Vg5aA@mail.gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:50 PM, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 11:39, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> As in Subject,
>>
>> am I understanding correctly that the one or the other is redundant?
>>
>> Should we keep only one of them?
> 
> I think that perhaps the idea at one point was that we
> might have a version of linux-user which used a softmmu
> (this would allow better control of the guest's view of
> its address space, so guest mmap() to fixed addresses
> would work better, for instance). But nobody's ever actually
> tried to implement that, so I imagine that if we ever did
> we'd find that some CONFIG_SOFTMMU and some CONFIG_USER_ONLY
> defines were the wrong way around...
> 
> thanks
> -- PMM
> 

Hi Peter,

thanks for the background,

indeed I am seeing some of these cases, target/XXX/cpu.c is protecting code with #ifndef CONFIG_USER_ONLY,

but the header files in include/hw/core/cpu.h and others use #ifdef CONFIG_SOFTMMU.

Ciao,

CLaudio

