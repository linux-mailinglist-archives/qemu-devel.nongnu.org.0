Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD425FAD36
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 09:07:55 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi9Mm-0001cD-K2
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 03:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1oi929-0000Bb-AH
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 02:46:41 -0400
Received: from mail.ispras.ru ([83.149.199.84]:56152)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1oi925-0003jN-DT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 02:46:32 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 61AA44075263;
 Tue, 11 Oct 2022 06:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 61AA44075263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1665470762;
 bh=ly5qXkKlrQZyBOpFla9P73LjQaRv7MKwy0GbpXVezMQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cRQAlqWsGes6FwW3v2K6r6krILIvGpp/QmuoiyxOZpV9aPQzRI4HgVpA1KEC7JcVy
 VIJfX1Nv5R+478aztm76K/UthBPPOZADyn2xOK1hmIMYJFGMzh9Bz+hXcXbFbf5zyX
 1nBJ7QS58IOzRZ/6TwCwvvFWBtk58sdoBBQk74jw=
Message-ID: <13302545-b542-dc43-820f-2fb46fa85cd8@ispras.ru>
Date: Tue, 11 Oct 2022 09:46:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
 <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
 <Y0Q4Vugq+d0vaF97@zx2c4.com>
 <CAFEAcA9h05S=MmUgKWA2cg9H8Rn7aiRrSDBJAO8yTyFvC7FQ2w@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <CAFEAcA9h05S=MmUgKWA2cg9H8Rn7aiRrSDBJAO8yTyFvC7FQ2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.10.2022 18:32, Peter Maydell wrote:
> On Mon, 10 Oct 2022 at 16:21, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> On Mon, Oct 10, 2022 at 11:54:50AM +0100, Peter Maydell wrote:
>>> The error is essentially the record-and-replay subsystem saying "the
>>> replay just asked for a random number at point when the recording
>>> did not ask for one, and so there's no 'this is what the number was'
>>> info in the record".
>>>
>>> I have had a quick look, and I think the reason for this is that
>>> load_snapshot() ("reset the VM state to the snapshot state stored in the
>>> disk image or migration stream") does a system reset. The replay
>>> process involves a lot of "load state from a snapshot and play
>>> forwards from there" operations. It doesn't expect that load_snapshot()
>>> would result in something reading random data, but now that we are
>>> calling qemu_guest_getrandom() in a reset hook, that happens.
>>
>> Hmm... so this seems like a bug in the replay code then? Shouldn't that
>> reset handler get hit during both passes, so the entry should be in
>> each?
> 
> No, because record is just
> "reset the system, record all the way to the end stop",
> but replay is
> "set the system to the point we want to start at by using
> load_snapshot, play from there", and depending on the actions
> you do in the debugger like reverse-continue we might repeatedly
> do "reload that snapshot (implying a system reset) and play from there"
> multiple times.

The idea of the patches is fdt randomization during reset, right?
But reset is used not only for real reboot, but also for restoring the 
snapshots.
In the latter case it is like "just clear the hw registers to simplify 
the initialization".
Therefore no other virtual hardware tried to read external data yet. And 
random numbers are external to the machine, they come from the outer world.

It means that this is completely new reset case and new solution should 
be found for it.

Pavel Dovgalyuk

