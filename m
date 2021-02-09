Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC70315907
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:57:54 +0100 (CET)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9b17-0003Bv-Gt
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l9ay2-0001it-AI
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:54:43 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:53584
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l9axu-0003RX-EZ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:54:41 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 276E6DA0C08;
 Tue,  9 Feb 2021 22:54:30 +0100 (CET)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
 <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
 <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
 <61a56eac-8afc-fa52-1681-21607b5294fd@linaro.org>
 <9f4e07d9-be5c-8bf4-f54a-424a844e8e7e@weilnetz.de>
 <4ad3bbc7-20ef-974c-668e-260dfb81ee8b@linaro.org>
 <4edd397f-da3f-e19b-7a5c-ff92ce18f187@linaro.org>
 <fe600efd-20ef-9292-4c72-79b9ceaee83d@weilnetz.de>
Message-ID: <14f3242c-4418-e16d-c9dd-40ad612ab0cb@weilnetz.de>
Date: Tue, 9 Feb 2021 22:54:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fe600efd-20ef-9292-4c72-79b9ceaee83d@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.21 um 22:15 schrieb Stefan Weil:

>
> Thanks for solving this. The patch works for me.
>
> BIOS boot time with qemu-system-i386 is about 41 s (with my code which 
> lacks thread support and ffi it was 40 s).
>
> With qemu-system-x86_64 it is twice as fast, so it looks like in my 
> last report where I said that the new code had doubled the speed I 
> compared different system emulations.


Update: with Richard's latest tci-next branch which includes the fixed 
code both qemu-system-x86_64 and qemu-system-i386 require about 20 s 
user time for the BIOS boot.

Stefan



