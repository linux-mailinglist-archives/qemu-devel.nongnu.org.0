Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CD04A69D8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:09:43 +0100 (CET)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF55Z-0004NF-MZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@rpls.de>) id 1nF2N3-0002rx-Mk
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:15:43 -0500
Received: from dia.uberspace.de ([185.26.156.221]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@rpls.de>) id 1nF2My-0002eM-7R
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:15:32 -0500
Received: (qmail 17468 invoked by uid 989); 1 Feb 2022 23:15:25 -0000
Authentication-Results: dia.uberspace.de;
	auth=pass (plain)
From: Richard Petri <git@rpls.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/timer/armv7m_systick: Update clock source before
 enabling timer
In-Reply-To: <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
References: <20220201192650.289584-1-git@rpls.de>
 <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
Date: Wed, 02 Feb 2022 00:15:25 +0100
Message-ID: <87sft2rxf6.fsf@sit.fraunhofer.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-0.331549)
X-Rspamd-Score: -0.431549
Received: from unknown (HELO unkown) (::1)
 by dia.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Wed, 02 Feb 2022 00:15:25 +0100
Received-SPF: pass client-ip=185.26.156.221; envelope-from=git@rpls.de;
 helo=dia.uberspace.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01 2022, Peter Maydell <peter.maydell@linaro.org> wrote:
> Thanks, you've saved me a debugging session! I had a bug report about
> a problem with the systick timer a couple of days back, but I hadn't yet
> got round to investigating it, and now I don't have to, because this
> patch fixes the reported failure :-)

Oh, I didn't see the issue in the tracker. I guess someone else played
around with the new machines at the same time :-) A quick workaround on
the guest code side btw: set the clock source and then add the enable
flag with a separate write.

And if you still want to do a debug session: I think there is another
related problem. The `systick_reset` function sets the right clock
source, but I guess at the time of calling reset the `cpuclk` doesn't
have the right value (probably zero)? I was confused at first, because
the reset code suggests that everything is OK from the start, but that
doesn't seem to be the case. I don't have a good enough overview of the
qemu sources to know what is called when. But even if the reset would be
right, first setting the clock source and then en/disabling the timer is
the better order IMO.

/Richard

