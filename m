Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF92AEF5F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:15:34 +0100 (CET)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kco69-0007d4-Pe
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kco57-0006Vx-Hl
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:14:29 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44908
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kco54-0004Cw-TZ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:14:28 -0500
Received: from host31-50-182-136.range31-50.btcentralplus.com ([31.50.182.136]
 helo=[192.168.1.110]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kco5H-0002g0-26; Wed, 11 Nov 2020 11:14:39 +0000
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
 <20201111105353.GE906488@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6b9d3c56-afb7-ef11-019c-5272b21457b5@ilande.co.uk>
Date: Wed, 11 Nov 2020 11:14:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111105353.GE906488@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.50.182.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2020 10:53, Daniel P. Berrangé wrote:

> On Wed, Nov 11, 2020 at 05:45:20AM -0500, Paolo Bonzini wrote:
>> This is used with the weirdly-named device "SUNFD,two", so accepting it
>> is also a preparatory step towards keyval-ifying -device and the
>> device_add monitor command.  But in general it is an unexpected wart
>> of the keyval syntax and leads to suboptimal errors compared to QemuOpts:
> 
> If "SUNFD,two" is the only wierdly named device, can we just rename
> it to get rid of the comma, and then put validation in QOM to forbid
> commas entirely.  eg rename it to "SUNFD-two"
> 
> Just have a targetted hack in vl.c to replace any use of "SUNFD,two"
> with the new name before parsing in keyval, if we care enough about
> back compat for this niche hardware device.

There's also SUNW,tcx I can think of immediately, plus there's a few others mentioned 
in hw/sparc/sun4m.c. The reason these names have commas is simply because that's the 
name of the corresponding node in the PROM device tree.

A quick grep suggests that all these devices are in-built: the selection between 
SUNW,tcx and cg3 framebuffers is decided with the -vga command line option, so 
potentially these could be renamed without any user-visible changes.


ATB,

Mark.

