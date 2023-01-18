Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11F671A70
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:21:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6UP-0006Xc-7Q; Wed, 18 Jan 2023 06:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pI6U6-0006RF-64
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:20:03 -0500
Received: from qs51p00im-qukt01080501.me.com ([17.57.155.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pI6U0-0001dN-1r
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1674040789; bh=fRkC/0Cj2kfhuZiOHcEapM3RPYUjSRfx6mOYXSWVLx8=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=fc5RTGPEpVehvGP5VX0xaXI04bSQZW3nENj9/Dpk+ND+fPPJCRcww2rnDpa6jN2w+
 dZUilszmuxyPA8YSL+BR9FSDuH3L7GGtgB1GE0T3wz7vbVK2RdeZmx1tGu1mJK0EUm
 2WI5kgNOINmr6Xdv18fdZ/dT0SzRl0uAcheRJAVhzn44+XLFkZ1UcjBQ5U6EjG4vkj
 fMJH5a6c81SZt7YklYCWNsA2c0Aofd9UtUQN8tPzm8T6HcR4mPLhgcl7HKhlb0e+bn
 HIqithR8GUdtWIJ9O5cBZqNBX+Lx8BYIXvaS43O2M1Pg7jp+lX9Gq52VdYRysjvksX
 01VzGPZrkjr9g==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01080501.me.com (Postfix) with ESMTPSA id 049E819809BD;
 Wed, 18 Jan 2023 11:19:47 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230114161302.94595-3-fcagnin@quarkslab.com>
Date: Wed, 18 Jan 2023 12:19:36 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: iexFohMw8sDjWxjBW_74pYdQEFpqc44e
X-Proofpoint-GUID: iexFohMw8sDjWxjBW_74pYdQEFpqc44e
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 bulkscore=0
 mlxscore=0 clxscore=1030 suspectscore=0 adultscore=0 mlxlogscore=430
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2301180098
Received-SPF: pass client-ip=17.57.155.22; envelope-from=mads@ynddal.dk;
 helo=qs51p00im-qukt01080501.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


> On 14 Jan 2023, at 17.13, francesco.cagnin@gmail.com wrote:
>=20
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>=20
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>=20
> Guests can be debugged through the gdbstub.
>=20
> While guest debugging is enabled, the guest can still read and write =
the
> DBG*_EL1 registers but they don't have any effect.
>=20
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> accel/hvf/hvf-accel-ops.c | 123 ++++++++
> accel/hvf/hvf-all.c       |  24 ++
> cpu.c                     |   3 +
> include/sysemu/hvf.h      |  29 ++
> include/sysemu/hvf_int.h  |   1 +
> target/arm/hvf/hvf.c      | 631 +++++++++++++++++++++++++++++++++++++-
> 6 files changed, 809 insertions(+), 2 deletions(-)
>=20

It seems v3 has a regression in regards to BRK instructions that I =
cannot
reproduce with v2. If I start QEMU and GDB with the Linux kernel =
(v6.0-rc5),
and set a software breakpoint at `bio_split` (probably not specific to =
this
function), I see messages in stdout like this:

[    4.663981] Unexpected kernel BRK exception at EL1
[    4.664650] Internal error: BRK handler: f2000000 [#1] PREEMPT SMP
...

Maybe the software breakpoints aren't removed/reapplied correctly in v3?

=E2=80=94
Mads Ynddal


