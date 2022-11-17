Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC562DD7F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfSq-0006IM-E2; Thu, 17 Nov 2022 09:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ovfSk-0006HJ-6X
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:01:54 -0500
Received: from mr85p00im-zteg06011501.me.com ([17.58.23.182])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ovfSg-0006Ac-6b
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1668693700; bh=tYCNi8aTBNQGFX0N6hMYLcRuoK+1KrW9zCSzQ+V9Z1U=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=DL/8Id8bvEvuJtE5w/jVVUtvWA22DOMcoOJ8CT+gR4LVDV0xtx+E4HAF5GxxrZsyj
 n9S4p06eq44kwVZgzADgP8IvI25dsUNbbJz2NGhWf8s1kkoPBSYqjE7/ub9r3Mxh7H
 cRW9LKKCSEA369uT4S1VVHWy8qirWvC306NbfJE5nQ1s7StWJ7bWmlCY/w1YHCx+yK
 b2sfl8VHiq06uoTm3ZvIA0RWqgrKva7ABuTPjJneGt/M6e1zS9zykxU9DrFtEyTAAB
 Tu22d+fjES6HWTh7q6wmDA/2jj1gdOAjjk7sIbXGQkTb/BOD8MqHrmdOPJXREgs852
 /k+4IqhAmf1tA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06011501.me.com (Postfix) with ESMTPSA id F19E9480BEA;
 Thu, 17 Nov 2022 14:01:37 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v2 3/3] hvf: handle writes of MDSCR_EL1 and DBG*_EL1
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221116174749.65175-4-fcagnin@quarkslab.com>
Date: Thu, 17 Nov 2022 15:01:25 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F49251B5-72CD-47FD-AE00-E6F8DA1E9D03@ynddal.dk>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-4-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: FgiAPOLU39HsHLIUQwgzl9pJ7bmlDTYS
X-Proofpoint-ORIG-GUID: FgiAPOLU39HsHLIUQwgzl9pJ7bmlDTYS
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=331
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1030
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2211170106
Received-SPF: pass client-ip=17.58.23.182; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06011501.me.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


> On 16 Nov 2022, at 18.47, francesco.cagnin@gmail.com wrote:
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

Looks good to me.

Reviewed-by: Mads Ynddal <mads@ynddal.dk>

