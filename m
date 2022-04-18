Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8788505DEF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 20:15:51 +0200 (CEST)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngVug-00049c-IR
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 14:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ngVtI-0003Ut-Pi
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 14:14:24 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:51328
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ngVtG-0003IV-LB
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 14:14:24 -0400
Received: from [192.168.178.59] (p5b1510d9.dip0.t-ipconnect.de [91.21.16.217])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 1B9FEDA06B6;
 Mon, 18 Apr 2022 20:14:19 +0200 (CEST)
Message-ID: <7f327c01-40e6-720e-860f-bc5d70ce07de@weilnetz.de>
Date: Mon, 18 Apr 2022 20:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <164981069655.421503.5359017463823038503@amd.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [ANNOUNCE] QEMU 7.0.0-rc4 is now available
In-Reply-To: <164981069655.421503.5359017463823038503@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.04.22 um 02:44 schrieb Michael Roth:
> A note from the maintainer:
> 
>    rc4 contains three fixes for late-breaking security bugs. The plan
>    is to make the final 7.0 release in a week's time on the 19th April,
>    with no further changes, unless we discover some last-minute
>    catastrophic problem.
> 
> You can help improve the quality of the QEMU 7.0 release by testing this
> release and reporting bugs using our GitLab issue tracker:

QEMU 7.0 seems to trigger an issue with makensis which is used for 
building the QEMU installer for Windows: it terminates with different 
kinds to errors (SIGBUS, SIGSEGV and mmap related errors) depending on 
the details of the build environment.

I currently think that this is related to the total size of the 
installed components which exceeds 2 GiB. Maybe a 32 bit int value is 
used somewhere in makensis.

A simple workaround is removing /SOLID in qemu.nsi, but that increases 
the size of the installer significantly.

Stripping the executables might also help to stay below the critical size.

I'm sorry that I missed sending patches to add qemu-storage-daemon.exe 
to qemu.nsi and for some format strings in calls of vu_panic. I don't 
think those are critical for the release.

Kind regards,
Stefan


