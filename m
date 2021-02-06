Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1A311FB7
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 20:39:50 +0100 (CET)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8TQr-00037e-51
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 14:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8TQ0-0002TK-4e
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:38:56 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:51418
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8TPx-0007wL-In
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:38:55 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id E2CFCDA1625;
 Sat,  6 Feb 2021 20:38:49 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Increased execution time with TCI in latest git master (was: Re:
 [PULL 00/46] tcg patch queue)
Message-ID: <02ad8dba-48a5-b547-05ba-d7fa1150b1d0@weilnetz.de>
Date: Sat, 6 Feb 2021 20:38:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.02.21 um 23:56 schrieb Richard Henderson:

> The following changes since commit d0dddab40e472ba62b5f43f11cc7dba085da=
be71:
>
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into st=
aging (2021-02-05 15:27:02 +0000)
>
> are available in the Git repository at:
>
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210205
>
> for you to fetch changes up to fb6916dd6ca8bb4b42d44baba9c67ecaf2279577=
:
>
>    accel: introduce AccelCPUClass extending CPUClass (2021-02-05 10:24:=
15 -1000)
>
> ----------------------------------------------------------------
> TCGCPUOps cleanups (claudio)
> tcg/s390 compare fix (phil)
> tcg/aarch64 rotli_vec fix
> tcg/tci cleanups and fixes


Hi Richard,

I tested pull-tcg-20210205 on a sparc64 machine.

Timing results for BIOS booting ("./qemu-system-x86_64", no image):

Before pull-tcg-20210205 with my latest patches for TCI:

TCG native: 8 s user time, TCG interpreter: 40 s user time

With pull-tcg-20210205 and=20
https://patchwork.kernel.org/project/qemu-devel/patch/20210127123446.2037=
721-1-sw@weilnetz.de/:

TCG native: 8 s user time, TCG interpreter: 50 s user time

So for this test case TCI was about 5 times slower than native TCG, but=20
the latest changes increased the execution time by about 25 %.

I am still searching what caused this detoriation. My first suspect was=20
thread local storage, but that wasn't it. Do you have any idea?

Stefan



