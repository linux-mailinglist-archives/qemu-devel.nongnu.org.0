Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0D39E498
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:57:22 +0200 (CEST)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIYz-00066q-F1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lqIWH-0003gM-2y; Mon, 07 Jun 2021 12:54:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4228
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lqIWD-0006OO-D8; Mon, 07 Jun 2021 12:54:32 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157Gip7j105277; Mon, 7 Jun 2021 12:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=C1Avky/BuPwD5XRMCWWrvP5lsobvpOAGiY9AKss3SfI=;
 b=JTk+F197IOSNzHi4XMoSkXZsym/3cbhpLGVz4PHT//QHO3U5ZbhxmADWxJ0ghIIe/tU9
 Rqr6xsKXF1RyC1ADOc60uybIOpN1jKP23EdrN54xmofMe8L3GKwdA1SZX+va22tsfPqP
 /0TpXUsKhGitFCMSTHM7QQVRntFYwXeNpjD0rHdW9QveYN+bO5nEizPp/t10vOjv0Irl
 D65zKJw4QNMpoHCoFci5OLkoHGDPovWEAvQxNh5Am1+Hm+RIA1XpXSL52zgxMNOvysWp
 AjMPBH91Fq4NcVOqHHqdhfl8ZB4U1L35I6HoQMVLC+5zndvnOrcIKBRty8g8TsAHwWU6 iA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 391q8907vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 12:54:19 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 157GmnM7025558;
 Mon, 7 Jun 2021 16:54:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3900w8rrsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 16:54:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 157GsIYJ29098486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 16:54:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 436997805F;
 Mon,  7 Jun 2021 16:54:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ED8B7805C;
 Mon,  7 Jun 2021 16:54:17 +0000 (GMT)
Received: from localhost (unknown [9.211.96.193])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  7 Jun 2021 16:54:17 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 5/5] target/ppc: powerpc_excp: Move interrupt
 raising code to QOM
In-Reply-To: <YL2ZdhfEojgOCYIR@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-6-farosas@linux.ibm.com> <YL2ZdhfEojgOCYIR@yekko>
Date: Mon, 07 Jun 2021 13:54:15 -0300
Message-ID: <87zgw1vcnc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bAZYxCZwc05M1aBHCxugQCXjcSElNMDQ
X-Proofpoint-ORIG-GUID: bAZYxCZwc05M1aBHCxugQCXjcSElNMDQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_14:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=918 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070117
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Jun 01, 2021 at 06:46:49PM -0300, Fabiano Rosas wrote:
>> +typedef void (*ppc_intr_fn_t)(PowerPCCPU *cpu, PPCInterrupt *intr,
>> +                              int excp_model, ppc_intr_args *regs,
>> +                              bool *ignore);
>
> Hmm.  Using this signature kind of enforces that we dispatch based on
> which exception *then* then the exception model.  I think that's
> backwards: since what vectors exist and make sense depends on the
> exception model, I think we should ideally be splitting on model
> first, then exception type.
>
> Now, a lot of the existing code is exception-then-model and changing
> that is a long term project, but I don't think we should lock
> ourselves further into doing it the backwards way.

Ok, so assuming one C file per exception model, I see three options:

 i) exception --> model (current):

 Interrupt code separate from models. One implementation for each
 interrupt that takes the model as argument. Models opt-in which
 interrupts they want (according to the ISA).

 ii) model --> exception:

 Interrupt code inside each model file. The model implements only the
 interrupts which exist (according to ISA). There would be duplication
 since several models would implement the same system reset, machine
 check, program, etc.

 iii) model --> exception w/ generic interrupts:

 Generic interrupt code separate from models. One implementation for
 each generic interrupt. Models opt-in which interrupts they want
 (according to the ISA). Models override generic implementation with
 model-specific ones.

Option (i) leads to the most code reuse; (ii) makes each model and its
interrupts into one comprehensive unit; (iii) avoids duplication of the
generic code.

>> +
>> +struct ppc_intr_args {
>> +    target_ulong nip;
>> +    target_ulong msr;
>> +    target_ulong new_nip;
>> +    target_ulong new_msr;
>> +    int sprn_srr0;
>> +    int sprn_srr1;
>> +    int sprn_asrr0;
>> +    int sprn_asrr1;
>> +    int lev;
>> +};
>> +
>> +struct PPCInterrupt {
>
> Having an info/dispatch structure for each vector makes sense..
>
>> +    Object parent;
>
> ..but making it a QOM object really seems like overkill.  In fact
> making it a QOM object at least somewhat exposes the internal
> structure to the user via QMP, which I really don't think we want to
> do.

I'm using QOM code mainly to facilitate the id->function mapping. I'll
remove the QOM layer and implement my own.

>> +
>> +    int id;
>> +    const char *name;
>> +    target_ulong addr;
>> +    ppc_intr_fn_t setup_regs;
>> +};

