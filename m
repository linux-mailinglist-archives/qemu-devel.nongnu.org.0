Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1933127C8
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:11:55 +0100 (CET)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8sHZ-0005xU-Ca
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8s74-0006xJ-F8
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 17:01:02 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:36160
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8s72-00013i-2c
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 17:01:02 -0500
Received: from [192.168.178.24] (p5b1511bf.dip0.t-ipconnect.de [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 2828BDA1368;
 Sun,  7 Feb 2021 23:00:58 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <02ad8dba-48a5-b547-05ba-d7fa1150b1d0@weilnetz.de>
 <95d0b17b-b1ed-6b4f-f26a-69ec6a2e6e03@linaro.org>
 <e5c2d572-f4dc-62a7-8bac-c5968c3b6da7@weilnetz.de>
 <343aa3ac-e8c5-48ca-7c50-dc8f6141f789@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Increased execution time with TCI in latest git master (was: Re:
 [PULL 00/46] tcg patch queue)
Message-ID: <9ab63804-b882-81d8-91a8-ca4298a545b4@weilnetz.de>
Date: Sun, 7 Feb 2021 23:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <343aa3ac-e8c5-48ca-7c50-dc8f6141f789@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.02.21 19:37, Richard Henderson wrote:
> On 2/7/21 2:50 AM, Stefan Weil wrote:
>> Your latest code from the rth7680/tci-next branch is twice as fast as my code
>> with BIOS boot and qemu-x86_64 on sparc64. That's great.
>>
>> With that code I don't get any BIOS output at all when running qemu-i386.
>> That's not so good.
>>
>> Did I test the correct branch? If yes, I could try the same test on amd64 and
>> arm64 hosts.
> 
> Yes, tci-next is the correct branch.  I've just rebased it against master,
> which includes the first 30-odd patches.
> 
> What host do you not see bios output from qemu-system-i386 (I assume that's a
> typo above)?  I see correct output on x86_64, sparc64, ppc64le, and aarch64 hosts.

Right, the TCI test was done with qemu-system-i386 of course.

I repeated the TCI test with qemu-system-i386 and qemu-system-x86_64 and
the rebased branch.

The system emulation for a BIOS boot works on Apple M1 arm64 with less
that 5 s user time (similar fast as before the latest TCI changes):

./qemu-system-i386 --nographic
  4,28s user 0,03s system 37% cpu 11,398 total
./qemu-system-x86_64 --nographic
  4,39s user 0,03s system 34% cpu 12,982 total

The same test shows similar timings on an AMD64 server:

./qemu-system-i386 --nographic
 user 0m4,958s before tcg-next, 0m5,115s after tcg-next

./qemu-system-x86_64 --nographic
 user 0m4,967s before tcg-next, 0m5,263s after tcg-next

Here tci-next is slightly slower than the old code.

The results on sparc64 did not change with the rebased tci-next:
qemu-system-i386 still fails to run, and qemu-system-x86_64 takes about
20 s user time.

Stefan

