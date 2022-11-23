Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1A635CCF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 13:27:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxopT-00088I-6n; Wed, 23 Nov 2022 07:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1oxopO-00087x-Ii
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 07:26:10 -0500
Received: from mr85p00im-zteg06021601.me.com ([17.58.23.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1oxopM-0002KF-Ux
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 07:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1669206367; bh=lJVg3ZxnRm681egfIyRW+IsGtQn9gz8w4LBHD7jLcPE=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=F2bJXTHsWBHn0Iec7wZADHHqmhzwKVu2p29dOV0HvnPhY8jijHhlAMoNfIc4Vqzs2
 6CGa/E3Vj8XjEdkyEX11X0traT7QqtPg6HLzuoKhqWWAlS3d1D+rl8QLffipkIy88j
 UrrL1NPXmvPtqXAR5dGOenngoNNpQk6vAGp9KzQ190NpdcYabYPD/v1V4b22GoQctq
 HiF9z0yAjSDSX0CqWWz7e7VWKgWVtrb/2hvrzioG7r09/N+E8ZYCC0nkpTMrawjD3M
 R/Ue5jezhcPz06bHGd+OovJhE6aX36oCVfqzubT5Ajj9brlx3Pp8QCuviRsWYoHYDs
 /5mp9ArktwwWA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06021601.me.com (Postfix) with ESMTPSA id 42F0A404DD;
 Wed, 23 Nov 2022 12:26:05 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221123121712.72817-1-mads@ynddal.dk>
Date: Wed, 23 Nov 2022 13:25:53 +0100
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <030ED145-9BC0-4B16-A0FD-A7F5E0F4EA85@ynddal.dk>
References: <20221123121712.72817-1-mads@ynddal.dk>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-ORIG-GUID: SJMrlgdhjI1cJwv3jZxliVHc5Am-SPPQ
X-Proofpoint-GUID: SJMrlgdhjI1cJwv3jZxliVHc5Am-SPPQ
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-14=5F01:2022-01-14=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1030 spamscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=878 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211230092
Received-SPF: pass client-ip=17.58.23.187; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06021601.me.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


> On 23 Nov 2022, at 13.17, Mads Ynddal <mads@ynddal.dk> wrote:
>=20
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> Continuing the refactor of a48e7d9e52 (gdbstub: move guest debug =
support
> check to ops) by removing hardcoded kvm_enabled() from generic cpu.c
> code, and replace it with a property of AccelOpsClass.
>=20
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
> accel/kvm/kvm-accel-ops.c  |  1 +
> cpu.c                      | 10 +++++++---
> include/sysemu/accel-ops.h |  1 +
> 3 files changed, 9 insertions(+), 3 deletions(-)
>=20

+CC Alex Benn=C3=A9e=

