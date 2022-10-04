Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA75F40BE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:28:40 +0200 (CEST)
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offAF-0007dO-Ap
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1off7X-00052O-6L
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:25:51 -0400
Received: from pv50p00im-ztdg10021901.me.com ([17.58.6.55]:49702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1off7N-0004NQ-Ka
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1664879139; bh=+B7IsfEP9clHsLTHWL2KWswD6d2kq73Gw6oQ20/UQNk=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=AWuaI8lKNKUTbhPnHbaT5AEqO7XSQjiNxJ9j6IJcYT/I4HKyNvNhoLzeYzPeUeM0c
 ABaD/Py3DrStVCa9Jij39wnjnQkSkGgDcjpKXQxKXBGCTpx3yWFUmqJTAlT2WkJ/WQ
 sQOZAo3xKzMxpmCnO9c2+Gn47/qKzo0QcIbYFop68vx8s6dOeaJoy9iptFHtHOJXui
 tFvhmNrDlEY9qp/r+xehMwZueD5rdAKovi7YaxoX2l8HVrRvVmxJ/HySZjFgYWrai7
 gx3b3iFdXXRNZBIT/SdV7AmBeD41o3EPtomX+xwGoQZntnQ8QqgbMcNv5RT61lYMZm
 cdmMUA0BOd2lQ==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id E175D81BDD;
 Tue,  4 Oct 2022 10:25:36 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 03/15] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-4-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:31 +0200
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B685DFF5-137E-4CA0-B360-CF9D340FDC1A@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-4-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: FzCPH9dG4XbLN-ypDyy6djJ4KuHeTzJy
X-Proofpoint-ORIG-GUID: FzCPH9dG4XbLN-ypDyy6djJ4KuHeTzJy
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=635 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1030
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
>=20
> Acked-by: Alexander Graf <agraf@csgraf.de>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
>=20
> ---
> v2
>  - update MEMTXATTRS macro
> ---
> target/arm/hvf/hvf.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

