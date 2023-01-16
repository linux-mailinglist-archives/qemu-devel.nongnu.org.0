Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459C66C419
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRYD-0001Lc-Tg; Mon, 16 Jan 2023 10:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRY7-0001J3-Ii; Mon, 16 Jan 2023 10:37:29 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRY4-0001I1-UL; Mon, 16 Jan 2023 10:37:27 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 822FB20DFE74;
 Mon, 16 Jan 2023 07:37:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 822FB20DFE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673883434;
 bh=y0nlBlXEtoiAjCeIGddAEJEbom40QaX7TQETc5IwyYw=;
 h=Date:To:Cc:From:Subject:From;
 b=dquJyh0NPLfz1lX0guNbRhozjRHxlRe9g2RcCBr9DR1oqeTYTMkSQcEZwi6LunYpW
 zJrfV1Xno7RIU2qdp5OLThvXTgXwjBulvyHItKtw6RMWE1vYHXP2c1kM7ZXivAgj62
 7luOGD62JSS4/OlKKBIc/9Ymvun+NUnrzE+y2r5s=
Message-ID: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
Date: Mon, 16 Jan 2023 16:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 eric.auger@redhat.com
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Subject: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi!


We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for 
arm. Besides some minor fixes that i have submitted over the last couple 
of weeks, one big compatibility item for us is SMMUv3 2-stage 
translations support. We can do fine without it right now, but having it 
would also allow us to test nested arm guests with SMMUv3, which is great.


One idea we have floating around is implementing 2-stage translations in 
SMMUv3 in Qemu. We can't make a commitment yet, but before we consider 
it i think it would be wise to ask the community about it, specifically:

* Do 2-stage translations sound like something qemu-arm would be keen on 
accepting? Are there any other use-cases for it besides an arguably wild 
corner case of nesting an EL2 hypervisor on software-emulated arm64?

* Is there anyone already working on it as we speak maybe?

* Were there any previous attempts to do this and if yes why they 
evidently didn't get through?


Thanks!


