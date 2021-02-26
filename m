Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7C326651
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:29:14 +0100 (CET)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgvR-00038Z-Eo
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFgtT-0001TK-1H
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:27:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:37008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFgtR-0008KG-AL
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:27:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98415AC6E;
 Fri, 26 Feb 2021 17:27:07 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: target/arm: "define_arm_cp_regs" and similar for KVM
Message-ID: <7360ab6a-0613-8300-ef8d-b0c641fbaed1@suse.de>
Date: Fri, 26 Feb 2021 18:27:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

I am trying to find out how to split properly KVM and TCG in target/arm, among other things.

I skipped or stubbed all define_arm_cp_regs and similar functions,

and made a cpregs module that is TCG-only.

Thought it is fine, as we have a kvm_arm_init_cpreg_list that throws away everything TCG-related anyway later:

target/arm/kvm.c:

/* Initialize the ARMCPU cpreg list according to the kernel's                                                                               
 * definition of what CPU registers it knows about (and throw away                                                                          
 * the previous TCG-created cpreg list).                                                                                                    
 */
int kvm_arm_init_cpreg_list(ARMCPU *cpu)

Can you confirm that it is ok to do so?

But I found something peculiar in hw/intc/arm_gicv3_kvm.c:

here we have explictly for a "kvm" module a reginfo definition, and a call to

define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);

/*                                                                                                                                          
 * CPU interface registers of GIC needs to be reset on CPU reset.                                                                           
 * For the calling arm_gicv3_icc_reset() on CPU reset, we register                                                                          
 * below ARMCPRegInfo. As we reset the whole cpu interface under single                                                                     
 * register reset, we define only one register of CPU interface instead                                                                     
 * of defining all the registers.                                                                                                           
 */
static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {



Is this actually an exception, and possibly the only use of define_arm_cp_regs that would be required on KVM too?

Am I under some wrong assumption?

Thank you for any help in clarifying this..

commit 07a5628cb89f13b98fe526117fd07e5e273b5a52
Author: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Date:   Thu Feb 23 17:21:13 2017 +0530

Thanks,

Claudio


-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

