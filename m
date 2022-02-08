Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31254ADB4C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:36:38 +0100 (CET)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRbf-0000qQ-0k
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:36:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHQD6-0001tm-8s
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:07:12 -0500
Received: from [2001:41c9:1:41f::167] (port=51744
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHQD4-0000Ge-Ir
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:07:07 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHQCY-0007IJ-LM; Tue, 08 Feb 2022 13:06:35 +0000
Message-ID: <f2114228-2243-2b4f-1869-a50d78a5a8d7@ilande.co.uk>
Date: Tue, 8 Feb 2022 13:06:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
 <YgJmz6neLsF2n2u3@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YgJmz6neLsF2n2u3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 12:49, Daniel P. Berrangé wrote:

>> I was under the impression that monitor_register_hmp_info_hrt() does all the
>> magic here i.e. it declares the underlying QMP command with an x- prefix and
>> effectively encapsulates the text field in a way that says "this is an
>> unreliable text opaque for humans"?
> 
> The monitor_register_hmp_info_hrt only does the HMP glue side, and
> that's only needed if you must dynamically register the HMP command.
> For statically registered commands set '.cmd_info_hrt' directly in
> the hml-commands-info.hx for the HMP side.
> 
>> If a qapi/ schema is needed could you explain what it should look like for
>> this example and where it should go? Looking at the existing .json files I
>> can't immediately see one which is the right place for this to live.
> 
> Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
> there. The QAPI bit is fairly simple.
> 
> if you want to see an illustration of what's different from a previous
> pure HMP impl, look at:
> 
>    commit dd98234c059e6bdb05a52998270df6d3d990332e
>    Author: Daniel P. Berrangé <berrange@redhat.com>
>    Date:   Wed Sep 8 10:35:43 2021 +0100
> 
>      qapi: introduce x-query-roms QMP command

I see, thanks for the reference. So qapi/machine.json would be the right place to 
declare the QMP part even for a specific device?

Even this approach still wouldn't work in its current form though, since as mentioned 
in my previous email it seems that only the target CONFIG_* defines and not the 
device CONFIG_* defines are present when processing hmp-commands-info.hx.


ATB,

Mark.

