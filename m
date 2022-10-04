Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BE5F40BD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:28:11 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1off9m-0007dF-NK
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1off7X-00052P-6p
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:25:51 -0400
Received: from pv50p00im-ztdg10021901.me.com ([17.58.6.55]:49968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1off7P-0004fO-JP
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1664879142; bh=Mc9SKPjS+zJA0G5WEib9D/fYuCld+4eFmEHniPH1AIc=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=ADuW/2dGCtIsUlhClvTTUFmcV1GMxbkD5WXLkgLQcWEvjb8DbBC+u/wmFz9FiXQ58
 vB+F1+UUKi5/po8ZNHmc4h0HnnFaBayqlEJU7rP27rCqLpFn9i6ZvBFjZngtCk/fjb
 0Hql0MGitqD/pRQwYnPO6LOk1EKlESkGhILmMIuCbCsQMFZ358mti8nmVJZzFGUo6R
 rSQtumJO0eFcudhes71BbAkQQSV9KzxOL8tEY4JSUqgL0JiWnYFP4V8MqzCSVw4QfH
 ke4T8ZECnUVnVQpjiSjL7v+ftxb5K/DCzIK3IVTPpICG4dx8Knp6ie5rfzXwmwRjhZ
 FNn27SXSv2iWw==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id CD9EF8197B;
 Tue,  4 Oct 2022 10:25:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 14/15] gdbstub: move guest debug support check to ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-15-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:33 +0200
Cc: qemu-devel@nongnu.org, "open list:ARM cores" <qemu-arm@nongnu.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F256D6E-40B8-49F8-99E7-70B60127E7D6@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-15-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: QDvbfUURPPEqV9J9o6cbN-_cddP3bhUS
X-Proofpoint-ORIG-GUID: QDvbfUURPPEqV9J9o6cbN-_cddP3bhUS
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=959 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1030
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040067
Received-SPF: pass client-ip=17.58.6.55; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-ztdg10021901.me.com
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


> This removes the final hard coding of kvm_enabled() in gdbstub and
> moves the check to an AccelOps.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
> accel/kvm/kvm-cpus.h       | 1 +
> gdbstub/internals.h        | 1 +
> include/sysemu/accel-ops.h | 1 +
> include/sysemu/kvm.h       | 7 -------
> accel/kvm/kvm-accel-ops.c  | 1 +
> accel/kvm/kvm-all.c        | 6 ++++++
> accel/tcg/tcg-accel-ops.c  | 6 ++++++
> gdbstub/gdbstub.c          | 5 ++---
> gdbstub/softmmu.c          | 9 +++++++++
> gdbstub/user.c             | 6 ++++++
> 10 files changed, 33 insertions(+), 10 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

