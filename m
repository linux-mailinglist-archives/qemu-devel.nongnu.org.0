Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D63401BD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:18:19 +0100 (CET)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMonJ-00019t-LU
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMolE-000066-OS; Thu, 18 Mar 2021 05:16:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:49196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMolD-00044w-64; Thu, 18 Mar 2021 05:16:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44E05AD4A;
 Thu, 18 Mar 2021 09:16:05 +0000 (UTC)
Subject: Re: "make check" broken with everything but tools disabled
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <877dm7jkib.fsf@dusky.pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <42de1769-e1c3-0486-b434-88813aec8ef4@suse.de>
Date: Thu, 18 Mar 2021 10:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <877dm7jkib.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 2:28 PM, Markus Armbruster wrote:
> Watch this:
> 
>     $ mkdir bld-tools
>     $ cd bld-tools
>     $ ../configure --disable-system --disable-user --enable-tools
>     $ make check
>     [...]
>     make: *** No rule to make target 'tests/qemu-iotests/socket_scm_helper', needed by 'check-block'.  Stop.
> 
> 

Hi Markus,

I can reproduce this error too.

When looking at the sequence of commands I was almost sure it was due to a missing "make" before the "make check",
as my experience with the new build system (meson-based), is that I have to do:

make

first, and then

make check

later, or bugs start happening, build can end up doing the wrong things.
I thought this was a known limitation and I am currently just dealing with it.

But then I tried to apply this to your specific case, and I get the same error nevertheless.

make: *** No rule to make target 'tests/qemu-iotests/socket_scm_helper', needed by 'check-block'.  Stop.

Ciao,

CLaudio

