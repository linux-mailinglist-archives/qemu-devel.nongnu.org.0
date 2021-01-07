Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078022ECF8E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:24:53 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxULU-00052n-4J
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kxUKF-0004LX-9P
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:23:35 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59118
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kxUKC-00056A-6R
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:23:35 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kxUKB-0006Ag-VS; Thu, 07 Jan 2021 12:23:36 +0000
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210106114159.981538-1-berrange@redhat.com>
 <20210106133622.GM976881@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7018bf8c-fba5-4025-df58-02da091eebf8@ilande.co.uk>
Date: Thu, 7 Jan 2021 12:23:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106133622.GM976881@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] cirrus: don't run full qtest on macOS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.267,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2021 13:36, Daniel P. Berrangé wrote:

>> The Cirrus CI macOS build hosts have exhibited a serious performance
>> degradation in recent months. For example the "qom-test" qtest takes
>> over an hour for only the qemu-system-aarch64 binary. This is as much
>> 20-40 times slower than other environments. The other qtests all show
>> similar performance degradation, as do many of the unit tests.
>>
>> This does not appear related to QEMU code changes, since older git
>> commits which were known to fully complete in less than 1 hour on
>> Cirrus CI now also show similar bad performance. Either Cirrus CI
>> performance has degraded, or an change in its environment has exposed
>> a latent bug widely affecting all of QEMU. Debugging the qom-test
>> showed no easily identified large bottleneck - every step of the
>> test execution was simply slower.
> 
> It appears I might be mistaken here. On IRC it was reported that
> going back furrther to v5.1.0 shows good performance in Cirrus
> still.
> 
> I had only gone back as far as 2a5a79d1b57280edd72193f6031de3feb682154e
> which I thought was fast originally.
> 
> So somewhere between v5.1.0 and 2a5a79 we apparently regressed.

I tested a few macos cirrus-ci builds after the meson conversion and found that they 
were working fine, so whatever is affecting the macos build must be related to a QEMU 
change.

A full bisect proved to be too tricky due to the instability of the tree at that 
point in time, however reading through "git log" and attempting some builds at merges 
I thought might be related I discovered that the slowness was introduced by this PR:


commit b7092cda1b36ce687e65ab1831346f9529b781b8
Merge: 497d415d76 eb94b81a94
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Oct 9 13:20:46 2020 +0100

     Merge remote-tracking branch 'remotes/armbru/tags/pull-monitor-2020-10-09' into 
staging

     Monitor patches for 2020-10-09

     # gpg: Signature made Fri 09 Oct 2020 06:16:51 BST
     # gpg:                using RSA key 354BC8B3D7EB2A6B68674E5F3870B400EB918653
     # gpg:                issuer "armbru@redhat.com"
     # gpg: Good signature from "Markus Armbruster <armbru@redhat.com>" [full]
     # gpg:                 aka "Markus Armbruster <armbru@pond.sub.org>" [full]
     # Primary key fingerprint: 354B C8B3 D7EB 2A6B 6867  4E5F 3870 B400 EB91 8653

     * remotes/armbru/tags/pull-monitor-2020-10-09:
       block: Convert 'block_resize' to coroutine
       block: Add bdrv_lock()/unlock()
       block: Add bdrv_co_enter()/leave()
       util/async: Add aio_co_reschedule_self()
       hmp: Add support for coroutine command handlers
       qmp: Move dispatcher to a coroutine
       qapi: Add a 'coroutine' flag for commands
       monitor: Make current monitor a per-coroutine property
       qmp: Call monitor_set_cur() only in qmp_dispatch()
       qmp: Assert that no other monitor is active
       hmp: Update current monitor only in handle_hmp_command()
       monitor: Use getter/setter functions for cur_mon
       monitor: Add Monitor parameter to monitor_get_cpu_index()
       monitor: Add Monitor parameter to monitor_set_cpu()

     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Fortunately that PR could be bisected and that led me this commit:


9ce44e2ce267caf5559904a201aa1986b0a8326b is the first bad commit
commit 9ce44e2ce267caf5559904a201aa1986b0a8326b
Author: Kevin Wolf <kwolf@redhat.com>
Date:   Mon Oct 5 17:58:50 2020 +0200

     qmp: Move dispatcher to a coroutine

     This moves the QMP dispatcher to a coroutine and runs all QMP command
     handlers that declare 'coroutine': true in coroutine context so they
     can avoid blocking the main loop while doing I/O or waiting for other
     events.

     For commands that are not declared safe to run in a coroutine, the
     dispatcher drops out of coroutine context by calling the QMP command
     handler from a bottom half.

     Signed-off-by: Kevin Wolf <kwolf@redhat.com>
     Reviewed-by: Markus Armbruster <armbru@redhat.com>
     Message-Id: <20201005155855.256490-10-kwolf@redhat.com>
     Reviewed-by: Markus Armbruster <armbru@redhat.com>
     Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
     Signed-off-by: Markus Armbruster <armbru@redhat.com>


Given that Peter can run the tests manually, I'm not exactly sure why the cirrus-ci 
environment is different - all I can think of is that it could be related to running 
in a headless terminal.

For reference running cirrus-ci on the last good commit 04f22362f1 "qapi: Add a 
'coroutine' flag for commands" gave me a total runtime of 35 mins.


ATB,

Mark.

