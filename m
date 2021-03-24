Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E283478E2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 13:54:08 +0100 (CET)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP31T-0000dn-Df
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 08:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoaili@kingsoft.com>)
 id 1lOuox-0000dL-SF
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 00:08:39 -0400
Received: from mail.kingsoft.com ([114.255.44.145]:11576)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yaoaili@kingsoft.com>) id 1lOuot-0000PS-WC
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 00:08:39 -0400
X-AuditID: 0a580157-47bff70000021a79-24-605ab0a9d13e
Received: from mail.kingsoft.com (localhost [10.88.1.32])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-1-NODE-87) with SMTP id 4E.94.06777.9A0BA506;
 Wed, 24 Mar 2021 11:23:21 +0800 (HKT)
Received: from alex-virtual-machine (172.16.253.254) by KSBJMAIL2.kingsoft.cn
 (10.88.1.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 24 Mar
 2021 11:53:20 +0800
Date: Wed, 24 Mar 2021 11:53:20 +0800
From: Aili Yao <yaoaili@kingsoft.com>
To: <qemu-devel@nongnu.org>, <jin.dongming@np.css.fujitsu.com>,
 <mtosatti@redhat.com>
Subject: Issue Report: When VM has multiple vCPU and receive SIGBUS for
 SRAR, qemu will inject broadcast MCE to VM, VM may exceed 1S MCE sync time,
 and Panic.
Message-ID: <20210324115320.0d880cac@alex-virtual-machine>
Organization: kingsoft
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.253.254]
X-ClientProxiedBy: KSBJMAIL1.kingsoft.cn (10.88.1.31) To KSBJMAIL2.kingsoft.cn
 (10.88.1.32)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsXCFcGooLtyQ1SCwcVfbBYNay4xWmzsmcRq
 cbx3B4sDs8eTa5uZPDoOHGD3eL/vKlsAcxSXTUpqTmZZapG+XQJXxpVTl9kLTnBVPP96jbWB
 cRJHFyMnh4SAicSEe2dZuxi5OIQEpjNJPJ6wjxEkISTwilHi2OtgEJtFQFXi18o2NhCbDcje
 dW8WK4gtIhAusfHBHbA4s0CmxKVnPWwgg4QFFjFKHN3yCqyIV8BK4uSek2A2v4CYRO+V/0wQ
 m+0l2rYsYoSoEZQ4OfMJC8QgHYkTq44xQ9jyEtvfzmGGOEhR4vCSX+wQvUoSR7pnsEHYsRLL
 5r1incAoOAvJqFlIRs1CMmoBI/MqRpbi3HTDTYyQEA3fwTiv6aPeIUYmDsZDjBIczEoivC3h
 EQlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEedW0gVIC6YklqdmpqQWpRTBZJg5OqQamJb575qYU
 92uoOVt/PZFVo3T6SeJh4/OverkvZupf3npo2edzFy2FFrl/1DJvZo09fkPf9Sn3jpP78+fN
 m3Ty74fXPU2fDXfJd3Par+6V92U4HnXmxXY9X4u0I80SiR9zF2xzSOJQfjDlg3r8/S6v5cUG
 hkWWz3c3O9tHygssVAjSNQ4/HvB+7cuA5DZZK4UnLPqFrdx+q+x7nNPeFW71Ma5duvgsk4y5
 2SLHkoCP1kZKPR9LMhgaPjc5LW143Oxxo5Lh3nffM8K97M7ZDtxL5zhsmqJb2tu39ZK/6+GS
 CM1jx1KSzibefbHy/SctTpk684tidx5434qQ0D7gs27dTrGHb4LXPpowp3BBkrkSS3FGoqEW
 c1FxIgDfVIbWwAIAAA==
Received-SPF: pass client-ip=114.255.44.145; envelope-from=yaoaili@kingsoft.com;
 helo=mail.kingsoft.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Mar 2021 08:50:04 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: sunhao2@kingsoft.com, yangfeng1@kingsoft.com, yaoaili@kingsoft.com,
 denglinwen@kingsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi:
When i do memory SRAR test for VM, I meet the following issue:

My VM has 16 vCPU, I will inject one UE error to memory which is accessed by VM,
Then host MCE is raised and SIGBUS is send to VM, and qemu take control.
Qemu will check the broadcast attribute by following  cpu_x86_support_mca_broadcast();  

Then Qemu may inject MCE to all vCPU, as vCPU is just one process for HOST, we can't guarantee
all the vCPUs will enter MCE hander in 1S sync time, and the VM may panic.

This issue will be easily fixed by expand monarch_timeout configuration, but the exact monarch_timeout can't be
easily got, as it will depand on the num of vCPUs and current system schedule status.

I am wondering why VM need broadcast attribute for MCE, When qeme process MCE event form host, it will always be
signaled for one vCPU? If so, why does qemu need boradcast the MCE event to all vCPUs?

Can weu just deliver LMCE to one specifc vCPU and make this behavior default?

If anything wrong, Please point out.

Thanks!
Aili Yao

/* Broadcast MCA signal for processor version 06H_EH and above */
int cpu_x86_support_mca_broadcast(CPUX86State *env)
{
    int family = 0;
    int model = 0;

    cpu_x86_version(env, &family, &model);
    if ((family == 6 && model >= 14) || family > 6) {
        return 1;
    }

    return 0;
}

