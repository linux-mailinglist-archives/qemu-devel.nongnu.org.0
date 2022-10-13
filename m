Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61BB5FE2CF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 21:41:24 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj452-0003mc-90
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 15:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1oj43N-0002FF-DT
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 15:39:37 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1oj43L-0002Ax-P8
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 15:39:37 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1oj43A-0001N0-EZ; Thu, 13 Oct 2022 21:39:24 +0200
Message-ID: <6fa916a8-7415-3398-d213-71bd506d82bb@maciej.szmigiero.name>
Date: Thu, 13 Oct 2022 21:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <20221013171817.1447562-1-peter.maydell@linaro.org>
Content-Language: en-US, pl-PL
Cc: qemu-devel@nongnu.org
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH] hw/hyperv/hyperv.c: Use device_cold_reset() instead of
 device_legacy_reset()
In-Reply-To: <20221013171817.1447562-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.25,
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

On 13.10.2022 19:18, Peter Maydell wrote:
> The semantic difference between the deprecated device_legacy_reset()
> function and the newer device_cold_reset() function is that the new
> function resets both the device itself and any qbuses it owns,
> whereas the legacy function resets just the device itself and nothing
> else.  In hyperv_synic_reset() we reset a SynICState, which has no
> qbuses, so for this purpose the two functions behave identically and
> we can stop using the deprecated one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: tested only with 'make check' and 'make check-avocado', which
> may well not exercise this.
> 

In general the patch LGTM, but I will runtime-test it on Monday
just to be sure.

Thanks,
Maciej


