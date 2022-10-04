Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3215F40EE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:40:28 +0200 (CEST)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offLf-00088d-K9
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1offIu-0005OU-LL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:37:36 -0400
Received: from pv50p00im-ztdg10021801.me.com ([17.58.6.56]:32812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1offIr-0001mG-FJ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1664879851; bh=QlSvwC0FZZH5RpxI3IuBMhXIoFMoTqI4zfjc2S1+OV0=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=D1V9Yggm9nh8f1zUmW5Wywq3JAnJ8ONUdGQxndkyTGLn9QxAxSrPWWdugXjlK2l8B
 90HAiVl18V0JLftlgnLZd8qF9OYGhEDORi3F+5qFEB9tlqqYbS3m2mbB4Sl+KaOkLr
 RgSjQCB4be+knpIQEEUwSGpUpvy3no8h8p0cOOsTyOYcUwqtYZfb1/lO6/yADaBzRF
 TTET6sU2X5MABE1ytTHo2YsOh3gFWl9aWQnJnra15FjDjTthZjv6DXzjIR9eYizRZw
 7Xt3L00aPTPBHkupyKRhGKc/Fyy0q2PF7IwKglq+4m1NT9/k/iIQ1kB8lWflRmvMAP
 ccUpqzyi5gD1Q==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 26CA01609A3;
 Tue,  4 Oct 2022 10:37:27 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 13/15] gdbstub: move breakpoint logic to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-14-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:32 +0200
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <340E64CE-3798-4671-9C51-510E28216E1E@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-14-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: sexTsaKf4iJ8y5gI7xPpZWij0kVGfh8k
X-Proofpoint-ORIG-GUID: sexTsaKf4iJ8y5gI7xPpZWij0kVGfh8k
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=964
 bulkscore=0
 clxscore=1030 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040068
Received-SPF: pass client-ip=17.58.6.56; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-ztdg10021801.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> As HW virtualization requires specific support to handle breakpoints
> lets push out special casing out of the core gdbstub code and into
> AccelOpsClass. This will make it easier to add other accelerator
> support and reduces some of the stub shenanigans.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
> accel/kvm/kvm-cpus.h       |   3 +
> gdbstub/internals.h        |  16 +++++
> include/sysemu/accel-ops.h |   6 ++
> include/sysemu/cpus.h      |   3 +
> include/sysemu/kvm.h       |   5 --
> accel/kvm/kvm-accel-ops.c  |   8 +++
> accel/kvm/kvm-all.c        |  24 +------
> accel/stubs/kvm-stub.c     |  16 -----
> accel/tcg/tcg-accel-ops.c  |  92 +++++++++++++++++++++++++++
> gdbstub/gdbstub.c          | 127 +++----------------------------------
> gdbstub/softmmu.c          |  42 ++++++++++++
> gdbstub/user.c             |  62 ++++++++++++++++++
> softmmu/cpus.c             |   7 ++
> gdbstub/meson.build        |   8 +++
> 14 files changed, 259 insertions(+), 160 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

