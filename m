Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875B321A8E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:51:38 +0100 (CET)
Received: from localhost ([::1]:34428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECYj-0005pK-Lc
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1lECRL-00080t-Au
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:44:00 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1lECRJ-0004wH-2i
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:43:59 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1lECRG-001YGy-0m; Mon, 22 Feb 2021 15:43:54 +0100
Received: from p57bd9049.dip0.t-ipconnect.de ([87.189.144.73]
 helo=[192.168.178.139]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1lECRF-0035iR-Qe; Mon, 22 Feb 2021 15:43:53 +0100
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
 <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
Date: Mon, 22 Feb 2021 15:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.73
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 3:38 PM, Michael Tokarev wrote:
> 22.02.2021 13:58, John Paul Adrian Glaubitz wrote:
>> Hi Laurent!
>>
>> On 2/22/21 11:50 AM, Laurent Vivier wrote:
>>> Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
>>> flag.
>>>
>>> This patch allows to use new flag in AT_FLAGS to detect if
>>> preserve-argv0 is configured for this interpreter:
>>> argv[0] (the full pathname provided by binfmt-misc) is removed and
>>> replaced by argv[1] (the original argv[0] provided by binfmt-misc when
>>> 'P'/preserve-arg[0] is set)
>>
>> Would this patch finally fix the issue with the perl package in Debian? [1]
> 
> It's been fixed a week or so ago.

Doesn't the patch require a kernel fix which is only present in Linux 5.12?

@Laurent: Could you help clarify the difference of both fixes?

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


