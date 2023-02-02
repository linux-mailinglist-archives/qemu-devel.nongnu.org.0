Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E76879B7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:04:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWRQ-0005Sb-2e; Thu, 02 Feb 2023 05:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pNWRO-0005RQ-2R
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:03:38 -0500
Received: from ms11p00im-qufo17281601.me.com ([17.58.38.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pNWRM-0007mp-Gl
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1675332212; bh=yR0y+MSgxpHs1wct0+/mwH7E0d7naoviLcqyb2z2qXE=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=GBxe+s50e6D2x94NWvGyz1/ygWsj6IdZB8uJoukfI9N76FJMvIRd9QPFVOO6/Oio6
 Rnk2tdjju31vpWYpz/FvWlUGD+6/1an6DCbqvmCXdlHKdeBlwU+OrwLrNhLzmj8E2j
 XyDd/CzSjcLyBZRQ2ChGmfcygOqwoEEcYFwVmfp6WLGrmTScD6NPLr4EOUtLY4zcvo
 eGbzZzWFr2mLIXYk1roEtbU7fEZ/e0qLdRq140ciuHPBEhKamtiZ9dFYB8YWXS9sAa
 nw6gDi+dbMQ5pnhaViD/+0uWp4hMffxvCNSVISPt2ENeknxvV9dszoE+wC6qUm1Xjx
 bTlJ/d3ao8lHA==
Received: from smtpclient.apple (ms11p00im-dlb-asmtpmailmevip.me.com
 [17.57.154.19])
 by ms11p00im-qufo17281601.me.com (Postfix) with ESMTPSA id 82357AA0645;
 Thu,  2 Feb 2023 10:03:29 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <CAF8_6K=7qhJc7jo2jrzYJ6_SjKnbxOd_6_6CtdKJXwfJj5onQg@mail.gmail.com>
Date: Thu, 2 Feb 2023 11:03:16 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4002D932-B7A3-4166-BA8A-5A323CD87096@ynddal.dk>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
 <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
 <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
 <CAF8_6K=7qhJc7jo2jrzYJ6_SjKnbxOd_6_6CtdKJXwfJj5onQg@mail.gmail.com>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: ASxqZ596wDjN4dGR2eMLtR-jlO0pc8Vu
X-Proofpoint-GUID: ASxqZ596wDjN4dGR2eMLtR-jlO0pc8Vu
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=572 clxscore=1030 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302020093
Received-SPF: pass client-ip=17.58.38.53; envelope-from=mads@ynddal.dk;
 helo=ms11p00im-qufo17281601.me.com
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


> Are you running the Linux guest on multiple cores? If yes, could you
> check if the issue persists also when using a single core?

Yes, I was running with 2 cores. I just tested with 1 and 2 several =
times. I
haven't reproduced the bug with 1 core, but happens around 70% of the =
time with
2 cores.

=E2=80=94
Mads Ynddal


