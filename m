Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB6673531
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRYd-0005TP-AV; Thu, 19 Jan 2023 04:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pIRYb-0005Sd-F7
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:50:05 -0500
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pIRYZ-0002EX-Si
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1674121802; bh=u5gMT2bw7+a6l2mNPMYtmJZqCrjqHEhjfNWpsXV7rYw=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=dI8uEZvNCdo2kjXfLrr+sc2w10+4Q9tDgQPc1wVYHrSJzB82kV1u0atYeafVgFOaN
 sH+k/fZ4sOylKdH3WBq9qZ9ZLIT39KHOy1bYFER2hZxa1zVTubFZ2vYqixHA4dcWfn
 gXhiR5xFqjYkCX7U2VL5JmqpxlImbz+nztP7FTuIxH5GCl5gNT4wB+ZR5weHPORBAp
 phe52XEpmTV60dW6Yhy6NdNSb3pF7a8/XlMYPCbKsSQpX91XcnLHHsyO/e9rrwcKg6
 Wbx71vHuJtSD3PvfuBLCDH0EXB5VQDF65jwQ9eskg3ULlEZZykN2hccdcdiQTslRpl
 4UNv7CUwLyIlA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id 3EDEE80E33;
 Thu, 19 Jan 2023 09:49:59 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
Date: Thu, 19 Jan 2023 10:49:47 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
 <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: 0qHokcueEKGioRftouPYTpLRtg6ynoIQ
X-Proofpoint-GUID: 0qHokcueEKGioRftouPYTpLRtg6ynoIQ
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=474 mlxscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2301190078
Received-SPF: pass client-ip=17.58.23.180; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021101.me.com
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


> It seems v3 has a regression in regards to BRK instructions that I =
cannot
> reproduce with v2.

I've now observed the same messages on v2 on a co-worker's computer. =
Maybe it's
happening in combination with another commit on master. If I can find =
the time,
I'll try to bisect it.

=E2=80=94
Mads Ynddal


