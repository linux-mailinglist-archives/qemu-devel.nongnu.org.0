Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062E7249EB7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 14:52:39 +0200 (CEST)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Na1-0005uB-Hy
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 08:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1k8NZM-0005TP-JF
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 08:51:56 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:37420)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1k8NZK-0003vK-CJ
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 08:51:56 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id 31A2442752;
 Wed, 19 Aug 2020 22:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1597841512;
 bh=NWea+jjZEBuFmujF+Tjj9eqmfzqRYtf4V2hSKDdR2Ug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLqxOBtd2DQf5sYwYsVqPyxoG54Py3uyzAQtlLUgu8WBKgTzqO6aA7xRTxbe2988D
 pK03HX3XE9HfRWGrCDAPJNhlSwOakW700f4ZhwHlU4Q0WmkTKk4OblJGcQ0eG9jMEW
 CDovaQ0PRp9hewBjytIaj+hja6XrMoqzB7v/Dzno=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id 1FD779EA91;
 Wed, 19 Aug 2020 22:51:52 +1000 (AEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Aug 2020 22:51:52 +1000
From: Geoffrey McRae <geoff@hostfission.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [PATCH] audio/jack: fix use after free segfault
In-Reply-To: <1858869.V9CTJjVLrA@silver>
References: <20200818131206.BB75F3A0B9F@moya.office.hostfission.com>
 <2255329.JDkKyqenvo@silver>
 <fdec112034e900c2d8408a634aa184b6@hostfission.com>
 <1858869.V9CTJjVLrA@silver>
Message-ID: <1690c001c97df6bf0024519363d089a1@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.3.8
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 07:45:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020-08-19 22:41, Christian Schoenebeck wrote:
> On Mittwoch, 19. August 2020 13:45:33 CEST Geoffrey McRae wrote:
>> > I still don't quite get how this correlates. So you are forcing a
>> > restart of
>> > jackd on host side in between, for what purpose? To simulate the
>> > Windows
>> > client being kicked by jackd?
>> 
>> For many reasons jack may need to be stopped and started again, such 
>> as
>> hardware changes when switching to a USB audio device, or tuning the
>> period size, etc. QEMU should be able to recover if the jack server 
>> goes
>> away, it's that simple.
> 
> Most of that could be done without jackd restart, but yeah I got your 
> point.
> Thanks!
> 
>> The following sequence is what triggers this fault.
>> 
>>    client1 = jack_client_open();
>>    client2 = jack_client_open();
>> 
>> client1 gets a shutdown signal
>> 
>>    jack_client_close(client1);
>>    client1 = jack_client_open();
>> 
>> client2 gets a shutdown signal
>> 
>>    jack_client_close(client2);
>>    client2 = jack_client_open();
>> 
>> One would expect this sequence to work fine as it conforms to the JACK
>> documentation and common design practice, however, the call to
>> `jack_client_open` notices that there is the 2nd session and frees it
>> out from under the application.
>> 
>> This has been resolved in the v5 patch as suggested by Gerd by
>> scheduling a QEMUBH to perform the closures so they occur in order
>> before an attempt to open again. Even still this is clearly a design
>> flaw in the Jack2 library.
> 
> Agreed.
> 
> I look at your v5 a bit later.
> 
>> > What latencies do you achieve BTW with Windows guests?
>> 
>> Never tested, it's not the reason why I use jack.
> 
> Surpring that you never checked the min. latency there, as you nailed 
> quite an
> ambitous jack driver into QEMU which I just realize now. Must have been
> splipped my awareness due to traffic.

Sorry, I should have been clearer. I have tested windows and the latency 
is excellent, but I have never performed any empirical measurements.

> 
>> Suffice to say it's far better than PulseAudio,
> 
> Of course! :) I was shaking my head when distros started to pick 
> PulseAudio as
> standard sound server. I never got that decision as JACK was always way
> superior than PA.
> 
> Probably the only issue for consumer use cases is JACK's habit to kick
> unreliable clients out of the graph. Even though this could be handled 
> of
> course.
> 
>> I get no stuttering issues like is commonly
>> reported for ALSA and PA, and allows for a high degree of
>> reconfigurability. The guest VM overall performs far better also as
>> windows is never waiting on the audio device due to the decoupling
>> provided by the ring buffer in my implementation.
> 
> Yeah, looks good indeed!
> 
>> >> I am aware and since these libraries are interchangeable I had assumed
>> >> that
>> >> JACK1 will have the same fault. If not I suppose we need to detect
>> >> which
>> >> is in
>> >> use and change this code appropriately.
>> >
>> > I haven't checked this in the JACK1 code base yet, but I assume JACK1
>> > does not
>> > behave like JACK2 here, because the JACK API is very clear that it is
>> > the
>> > client's responsibility to free itself.
>> >
>> > So it looks like a JACK2-only-bug to me.
>> 
>> Confirmed, this was investigated today.
>> 
>> > Very weird that there is no jack_client_version() in the shared weak
>> > API (i.e.
>> > missing on JACK1 side).
>> 
>> I raised this as an issue today:
>> https://github.com/jackaudio/jack2/issues/628
>> The developer there seems to feel that allowing the application to 
>> know
>> the jack client version is a bad thing.
> 
> Yeah, I raised my voice there as well now.

I noticed, thanks! :D

> 
> Best regards,
> Christian Schoenebeck

