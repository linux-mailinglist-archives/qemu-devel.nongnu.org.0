Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D96FE440
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:55:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoxn-0006fd-Gu; Wed, 10 May 2023 14:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pwoxk-0006fB-P3
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:54:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pwoxi-0001z6-UZ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:54:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AAF894F17;
 Wed, 10 May 2023 21:54:52 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3A14738F0;
 Wed, 10 May 2023 21:54:51 +0300 (MSK)
Message-ID: <df848403-385b-c5e6-0a0a-581dd398d90b@msgid.tls.msk.ru>
Date: Wed, 10 May 2023 21:54:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] e1000e: Fix tx/rx counters
Content-Language: en-US
To: timothee.cocault@gmail.com, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
 <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

10.04.2023 18:27, timothee.cocault@gmail.com wrote:
> The bytes and packets counter registers are cleared on read.
> 
> Copying the "total counter" registers to the "good counter" registers has
> side effects.
> If the "total" register is never read by the OS, it only gets incremented.
> This leads to exponential growth of the "good" register.
> 
> This commit increments the counters individually to avoid this.

Smells like a -stable material, is it not?

Thanks,

/mjt

