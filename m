Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5362282B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osi4t-0002Y3-1f; Wed, 09 Nov 2022 05:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1osi4p-0002XY-Gk
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:12:59 -0500
Received: from mr85p00im-zteg06011601.me.com ([17.58.23.186])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1osi4n-0003x2-KS
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667988770; bh=BFNhYGg9PQArRQyA69WUp2ISuGC+rzVLCTn1PuAYVks=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=cYncNX1YQ5bHDBZO+re4DwbNUGuueTNOUHxLwNf5fgfYC4A8Sw9Scof8IakSI6MjW
 T6FuCLjvvq7nZB83AcX1bWkT2khVR6KWtA3GSZYDofjTUygfKazfuBTej2Fn9CoKcy
 F5RiCa5O0KQODIHpK+bwHdbQ1VuoT8uqn9ur7hCdhS6v3ZHt7/yUWYP6c0+YCpxrVt
 A09asNHawe2u5d3JlZ2wMWcC0Ka4t1AsFCzIGh4hSA+oe6nUp+cjRUH1KFV1QvMupS
 4zzFkrFmE9zblrOStmBm9p9ui83wPYETvXpfXo+U6+2FhTML8r1Jt7FvcWkdo7aazz
 VXxyRVjG+MiGQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06011601.me.com (Postfix) with ESMTPSA id 8AD1C180CA0;
 Wed,  9 Nov 2022 10:12:48 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
Date: Wed, 9 Nov 2022 11:12:36 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF30A57C-C82F-41C0-A8B2-047DFF696A7C@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
 <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
 <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: pBGoCoOX0g80k4yA6J_mK0C_gHeTkaRV
X-Proofpoint-ORIG-GUID: pBGoCoOX0g80k4yA6J_mK0C_gHeTkaRV
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=462
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211090078
Received-SPF: pass client-ip=17.58.23.186; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06011601.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


> On 8 Nov 2022, at 12.51, Mads Ynddal <mads@ynddal.dk> wrote:
>=20
> I also noticed you are adding 1 to the WRPs and BRPs. As I interpret =
the
> documentation, you should subtract 1 instead, given the value 0 is =
reserved:

I tested it, and you do have to add 1. I guess it's implied that you =
cannot have
less than 2 WRPs/BRPs then.=

