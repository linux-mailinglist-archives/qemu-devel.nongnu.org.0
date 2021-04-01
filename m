Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD835108A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:04:41 +0200 (CEST)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsJk-0004mM-Bj
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRsCO-0006IQ-Oc
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:57:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57130
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRsCN-0005Vw-1F
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:57:04 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRsCQ-0004Mi-LB; Thu, 01 Apr 2021 08:57:12 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
 <dffedca1-d7e1-206b-3260-6b9d88ac7d54@redhat.com>
 <f5ed9741-0f2b-313f-fc66-82f939b24d63@ilande.co.uk>
 <d33de3a4-0ec6-0506-b19a-1e6043615980@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6f91d44f-297a-72ef-bd47-198533f8a4eb@ilande.co.uk>
Date: Thu, 1 Apr 2021 08:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d33de3a4-0ec6-0506-b19a-1e6043615980@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/6] esp: fix asserts/segfaults discovered by fuzzer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

On 30/03/2021 10:59, Paolo Bonzini wrote:

> Hi,
> 
> I also had some failures of the tests on CI, which is why I hadn't incorporated these 
> changes yet.  Thanks for the advance warning, I'll wait for your v3.
> 
> Paolo

Hi Paolo,

I've just posted the latest v3 which passes all my local boot tests and the extra 
test cases posted to LP. There is one failure on Gitlab CI but that is for the 
clang-user build for tcg-tests-s390x-linux-user which is an existing issue.

Apologies it took a bit longer than expected: my laptop isn't the fastest in the 
world and booting everything will full debug and ASAN across several targets is 
tremendously slow :/

Also it seems there is something wrong with the qtest dependencies: for my current 
build of ~2900 files, the final commit to add the qtest for am53c974 which adds the 
test to test/qtest/meson.build causes ~2100 of those files to be rebuilt :(


ATB,

Mark.

