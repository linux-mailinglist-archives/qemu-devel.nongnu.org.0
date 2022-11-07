Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF561F3EA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:04:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1l0-0004cm-Os; Mon, 07 Nov 2022 08:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1ko-0004Yx-40
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:35 -0500
Received: from mr85p00im-zteg06022001.me.com ([17.58.23.193])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1kQ-00021K-W3
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667826065; bh=yFc7AHHWZsXV7KKo5Me+Cltl7LLv1r4e5xRt7D3nZ38=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=YsFZJK58qe1SxS2bgVGv3l9K3bnBpzL+O9JtsXAwGEOkrwWUUNZdzhDpv9fxNq32R
 oTpHvjSzLMjcgeg34AYSVjS+uKX7ttGWTaJl1waL/j8jNyHXa20i1Vh53C2I/h+cav
 Lk6QJGCk93Qr9fffKdauDpl6JZlNpN3Ba78Q3L6JAvcgwi88oKzxblwjuQd+Ys/I93
 qO3+MGLgO9zZpBjXQ59Rk8t6AwV6qHK9QMFnDXDy175fapNKEe2jimuE9RxNwd4DbU
 ATSENd787oEjHDHXnGlRWTeeNEI+dxSjx1D8yN6gZpI4Hw/LjQCCPWOTh9jKXGEotq
 g9dm4G99iYmqA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06022001.me.com (Postfix) with ESMTPSA id 067BA8001E7;
 Mon,  7 Nov 2022 13:01:02 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 3/3] hvf: handle writes of MDSCR_EL1 and DBG*_EL1
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-4-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 14:00:50 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F938E58E-F2FF-40F5-86AC-E6026A9A4E46@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-4-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: Jbsz-duPWhQp2cdHippFKeQ2K_KEcxhg
X-Proofpoint-ORIG-GUID: Jbsz-duPWhQp2cdHippFKeQ2K_KEcxhg
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=328
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070106
Received-SPF: pass client-ip=17.58.23.193; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06022001.me.com
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


> On 4 Nov 2022, at 19.41, francesco.cagnin@gmail.com wrote:
> 
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> This proved to be required when debugging the Linux kernel's initial
> code, as the Hypervisor framework was triggering 'EC_SYSTEMREGISTERTRAP'
> VM exits after enabling trap exceptions with
> 'hv_vcpu_set_trap_debug_exceptions()'.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> target/arm/hvf/hvf.c | 140 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 140 insertions(+)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>

