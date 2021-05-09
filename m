Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687FE377681
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 13:49:32 +0200 (CEST)
Received: from localhost ([::1]:45444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfhwA-0006IR-RP
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 07:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@codingfarm.de>)
 id 1lfhqf-0005F3-EL
 for qemu-devel@nongnu.org; Sun, 09 May 2021 07:43:49 -0400
Received: from donkey.codingfarm.de ([5.9.138.198]:34184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@codingfarm.de>)
 id 1lfhqb-0002MY-8T
 for qemu-devel@nongnu.org; Sun, 09 May 2021 07:43:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id 72EFC810C9;
 Sun,  9 May 2021 13:43:40 +0200 (CEST)
Subject: Re: [PATCH 1/2] input-linux: Delay grab toggle if keys are pressed
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210501190622.153901-1-raimue@codingfarm.de>
 <20210501190622.153901-2-raimue@codingfarm.de>
 <20210504091438.p7kk3heyowpduyzq@sirius.home.kraxel.org>
From: =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>
Message-ID: <2f01eb6a-7c69-e7a9-8340-b671b0b6c643@codingfarm.de>
Date: Sun, 9 May 2021 13:43:38 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.23)
 Gecko/20090925 Thunderbird/2.0.0.23 Mnenhy/0.7.5.0
MIME-Version: 1.0
In-Reply-To: <20210504091438.p7kk3heyowpduyzq@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.138.198; envelope-from=raimue@codingfarm.de;
 helo=donkey.codingfarm.de
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2021 11.14, Gerd Hoffmann wrote:
> On Sat, May 01, 2021 at 09:06:21PM +0200, Rainer Müller wrote:
>> When multiple keyboards are passed to the guest with input-linux, there
>> could still be keys pressed on the other keyboard when toggling grab.
>> Delay toggling grab on the other keyboard until all keys are released,
>> otherwise keys could be stuck on host without a key up event.
> 
> Hmm, if you have two keyboards plugged into your machine, why would you
> assign both to a virtual machine?  Instead of simply using one for the
> host and one for the guest?

Fair enough. I only noticed the possibility during testing. I plugged in
a second keyboard for development to avoid locking myself out and passed
only one. Then I became confident to pass them both, but mostly because
I already had them connected. I agree it does not seem like a typical
setup...

This was the only code path that did not check !il->keycount before
calling input_linux_toggle_grab(), so I added it here as well. Maybe it
would make sense to move the condition into the function?

Rainer

