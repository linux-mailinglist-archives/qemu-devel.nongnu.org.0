Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2762DD80
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfSj-0006Gi-U9; Thu, 17 Nov 2022 09:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ovfSd-0006GO-3t
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:01:47 -0500
Received: from mr85p00im-ztdg06011901.me.com ([17.58.23.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ovfSb-0006Ax-GJ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1668693701; bh=OvGnz51jVYD/BB2OS/rakVFjGPrvVn6qd5YZip8TVb8=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=ZubXFGJWokoKwI9GLp+sWyQkklgTHE0ldEOzefyzJD+8P0w16kWHlHyTE8YC5MyqI
 Mt1fNHLiq2yN9EKmkWuaan4G3Ck6pfTVAEWlpaSmvGerVOb3OA84dVFGN8VVM21q7r
 M5CR+BsuYv1oZvtrrM40UpD/3mXqBpXGZ557yYWZh7mAXa9OgVTeKl+F6SW+7ninf9
 TL1v0r3KRlOOY5W6mLrOvFjiYRF4xvUR8JSUfDdwdYaQm3znub3EEY8/rrBbaOMayr
 2w8Rnq2KvFbKuCeTJS+GpYbMpQ19uFr4JMCtGmuHzjHEalb++45B6v70kEloWd/hDL
 r1i4i38WiSWSQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id C32FC900C1D;
 Thu, 17 Nov 2022 14:01:39 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221116174749.65175-3-fcagnin@quarkslab.com>
Date: Thu, 17 Nov 2022 15:01:27 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <412ED80C-27AE-462F-A123-DA14CD9704D5@ynddal.dk>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: KumqZfe-pRlVpCGBMm9jfOZmvbNF2oVN
X-Proofpoint-ORIG-GUID: KumqZfe-pRlVpCGBMm9jfOZmvbNF2oVN
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=507
 phishscore=0
 clxscore=1030 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211170106
Received-SPF: pass client-ip=17.58.23.198; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011901.me.com
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


> On 16 Nov 2022, at 18.47, francesco.cagnin@gmail.com wrote:
>=20
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>=20
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>=20
> Guests can be debugged through the gdbstub.
>=20
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> accel/hvf/hvf-accel-ops.c | 123 ++++++++++++++++++++++++
> accel/hvf/hvf-all.c       |  24 +++++
> cpu.c                     |   3 +
> include/sysemu/hvf.h      |  29 ++++++
> include/sysemu/hvf_int.h  |   1 +
> target/arm/hvf/hvf.c      | 194 +++++++++++++++++++++++++++++++++++++-
> 6 files changed, 372 insertions(+), 2 deletions(-)

Looks good. I've tested hw/sw breakpoints, hw watchpoints and =
single-stepping.

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

