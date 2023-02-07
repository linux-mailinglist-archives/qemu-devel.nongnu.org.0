Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6E68D616
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMcX-000065-8F; Tue, 07 Feb 2023 06:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pPMcT-00005s-Se
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:58:41 -0500
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pPMcS-00016M-GR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1675771118; bh=Cn0qz0bMHB6vxV8Q4ejxdppqOEkAynR/SkSPXu1IlvI=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=Xr4x63GAslHmhREJ5ScX0ShUVTWttvXUdV+P0RRokExZ+BiNGGhAJQr532uOfCXj1
 ZqkDVc9iOGpGjBHjWVFxgIwpjsracshofIVX3/1c8bFteBwMssKElDCSl9Wq++grLs
 1YE8czPPd15jiviooew03Evu38xofTXifMKQYw62JHNKzwacVgifJS64xzMIdmZbsS
 L6WveY1JxmlZ2fpSB/ClKH8gn6QiJUvvvgt/NdWQKM1L6rXc4EKkV9GtRNNiDcuJoi
 NCukyy9rq6vHv5GsbMTMqRRH9NhBvTcjFByiC8xHexFZoeyjAggq/BQ0XVsdm38Gnv
 dBh9CuU3l811g==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id DA007357B5F6;
 Tue,  7 Feb 2023 11:58:35 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <871qn2rjd2.fsf@linaro.org>
Date: Tue, 7 Feb 2023 12:58:23 +0100
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <35145587-C279-46A1-A2C5-3261A646F225@ynddal.dk>
References: <20221123121712.72817-1-mads@ynddal.dk>
 <af92080f-e708-f593-7ff5-81b7b264d587@linaro.org>
 <C8BC6E24-F98D-428D-80F8-98BDA40C7B15@ynddal.dk> <87h6xyjcdh.fsf@linaro.org>
 <4B19094C-63DC-4A81-A008-886504256D5D@ynddal.dk> <871qn2rjd2.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-GUID: SyIWDj8aX2WDaQWMsXo-TNJimMYxIvbX
X-Proofpoint-ORIG-GUID: SyIWDj8aX2WDaQWMsXo-TNJimMYxIvbX
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1030
 suspectscore=0 mlxlogscore=660 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302070107
Received-SPF: pass client-ip=17.58.23.191; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-hyfv06011401.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


>=20
> Sorry this dropped of my radar. Yes I think the ifdef will do. Are you
> going to post a v2 with all the various updates?
>=20

No worries, I'll make a v2 with the changes.

=E2=80=94
Mads Ynddal


