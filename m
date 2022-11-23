Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826C63621E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:43:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqwT-0003OC-T8; Wed, 23 Nov 2022 09:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1oxqwR-0003Nv-0K
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:41:35 -0500
Received: from mr85p00im-ztdg06021801.me.com ([17.58.23.195])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1oxqwP-0002Z8-Ae
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1669214491; bh=YoTnueSOm5nRNUCyNMaLCXhvOGUqLJOkEgAT4C74spQ=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=A/G5kqbROZhHsUruc+wabTCDnpJWLessMk0Qq+bYbaWnjYJqDyEyqTnR7H+g5L3NM
 tCXritpo9bLDzz1nPSBzozSp5G+G09TcU/3nc74NBp7vxGfpm/mKXtbA/ccSsIgTX4
 WlTYfZ4DFUVkpUSuqR3omE9Wl66AJXF+nvjvUCPp3cuFKzvrfcoQLK3maHmYc9Sg/+
 WQ2IU541fMMRRX8H7wN7HW7R74ZluaOwYQoHq2WtOkb+H+eJYnoof9/3TW9OTGpBdp
 mTJqrroICyKNSk3jZ5LEw665Ne7mmyXKaU+6LXycKIP6bgW+4Ve/j3nw3MTTjadXsN
 5PbEjcIn6kqOw==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id 6B008D00941;
 Wed, 23 Nov 2022 14:41:29 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <87k03lbwaz.fsf@linaro.org>
Date: Wed, 23 Nov 2022 15:41:17 +0100
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <460BA831-0D46-482A-A647-8C6E1C70CF52@ynddal.dk>
References: <20221123121712.72817-1-mads@ynddal.dk> <87k03lbwaz.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: _L0Su5wXsImx2G-_Ibexfbi7zIDlVTp_
X-Proofpoint-ORIG-GUID: _L0Su5wXsImx2G-_Ibexfbi7zIDlVTp_
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 phishscore=0
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=810 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211230109
Received-SPF: pass client-ip=17.58.23.195; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021801.me.com
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



> On 23 Nov 2022, at 15.05, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
> Nice. Looks good to me but I'll have a proper look when I go through =
my
> gdbstub/next queue. I don't think this is critical for 7.2.
>=20

Thanks, and I agree. It can easily wait.=

