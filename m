Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C883A61F3E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1l8-0004dH-En; Mon, 07 Nov 2022 08:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1ko-0004Z0-4j
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:35 -0500
Received: from mr85p00im-zteg06021901.me.com ([17.58.23.194])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1kS-00021W-Td
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667826066; bh=/ESFzzkP6mHGND0cqItFaGCfupdYs+rk+gbj7Nb53NY=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=JyxXl4xnqpDcJgfpBA8Zd+30CnAKM9lrwSy0jc940GSLG1fw+WqdhpBhVUunArhFr
 l0Nwx3s/MhelH7if6niK2x6g1mM2y/ELVCy167mP4Z2l+X7hPDo2MD0LJdlUjZsm7C
 BEo/j66QQ8CHXP4anFRRFMAyQAOj+U/Re9Jwiq9+J3W4j3juhwMzFRVgoeE+ubo6vT
 Bm6RAbuAolQQ9JyndFgrUvZxK/303sEMPIeA/O3nu7WbMYitpezU2uF4EMUnXvdwcp
 xCqnCFEm/4DQDkLl7M/vJycDFvpEcD6c1uw5bAfc/IVFIBqTWugtgOLXyOw6yeTTXf
 s+k08OGwSZZeQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06021901.me.com (Postfix) with ESMTPSA id 08105740B2C;
 Mon,  7 Nov 2022 13:01:03 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-2-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 14:00:42 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: 7bit
Message-Id: <FB8D474A-61B8-4E88-A7A3-FAEFA5CF4C67@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: S5bEc1N1UWmEjErFLeO3R6An9L01VXCz
X-Proofpoint-ORIG-GUID: S5bEc1N1UWmEjErFLeO3R6An9L01VXCz
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=699
 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1030 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070106
Received-SPF: pass client-ip=17.58.23.194; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06021901.me.com
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


> On 4 Nov 2022, at 19.40, francesco.cagnin@gmail.com wrote:
> 
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl', this is just code motion.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
> target/arm/internals.h    |  50 +++++++
> target/arm/kvm64.c        | 276 --------------------------------------
> 3 files changed, 291 insertions(+), 276 deletions(-)

Looks good. I was going to do the exact same in my patchset.

Reviewed-by: Mads Ynddal <mads@ynddal.dk>

