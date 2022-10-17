Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB096010E3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:14:56 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQtL-0002im-EV
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1okQie-0003Bd-SR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:03:54 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:44494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1okQid-0000Zh-7c
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:03:52 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1okQiR-0000pB-4n; Mon, 17 Oct 2022 16:03:39 +0200
Message-ID: <b7f64ff2-cf8d-6200-3a8d-eace44c9e07a@maciej.szmigiero.name>
Date: Mon, 17 Oct 2022 16:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] hw/hyperv/hyperv.c: Use device_cold_reset() instead of
 device_legacy_reset()
Content-Language: en-US, pl-PL
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221013171817.1447562-1-peter.maydell@linaro.org>
 <6fa916a8-7415-3398-d213-71bd506d82bb@maciej.szmigiero.name>
In-Reply-To: <6fa916a8-7415-3398-d213-71bd506d82bb@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 13.10.2022 21:39, Maciej S. Szmigiero wrote:
> On 13.10.2022 19:18, Peter Maydell wrote:
>> The semantic difference between the deprecated device_legacy_reset()
>> function and the newer device_cold_reset() function is that the new
>> function resets both the device itself and any qbuses it owns,
>> whereas the legacy function resets just the device itself and nothing
>> else.  In hyperv_synic_reset() we reset a SynICState, which has no
>> qbuses, so for this purpose the two functions behave identically and
>> we can stop using the deprecated one.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> NB: tested only with 'make check' and 'make check-avocado', which
>> may well not exercise this.
>>
> 
> In general the patch LGTM, but I will runtime-test it on Monday
> just to be sure.
> 

Tested and works fine on QEMU with SynIC reset fix [1] applied, so:
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Thanks,
Maciej

[1]: https://lore.kernel.org/qemu-devel/cb57cee2e29b20d06f81dce054cbcea8b5d497e8.1664552976.git.maciej.szmigiero@oracle.com/


