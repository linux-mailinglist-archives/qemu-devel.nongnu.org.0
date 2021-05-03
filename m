Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390A37233B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:51:55 +0200 (CEST)
Received: from localhost ([::1]:56580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhPu-0001na-I3
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ldgwY-00032c-7Z; Mon, 03 May 2021 18:21:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ldgwR-0003gG-FP; Mon, 03 May 2021 18:21:33 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143MF6dC105384; Mon, 3 May 2021 18:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=T+ySzngijlW9qrg4yJzzo+XNpbgwCvIT8dU7YLFqljI=;
 b=eoEJLiU5r02c3tJirlPYNoWTDSWoTqhLqtGD6QO4sBeixwWjbTlL/9MqoiQJit53b8Dr
 7lfD7iQdCan8crRHCOFZB5mALDxpKZh+AzUr8sn/xrnoQoTdMEPVYS/AZG2pHem0BMOA
 R80yeE0pesF0wa0GmfGlOMWaJhStItdR2cugymEINmUrRk+leW0puQ9XVw2mhnCTKxMc
 /OX/YULLrldpYibfI/C5OvJ66BdqT9NborbUwkZMA/693KkUcbaYpo1JQSuW58rcPcXg
 Fpt1OfRZuazeeNxwW+G5u5ijkFR0csflCqYaf8933JubWnKdr76sScw4EGT4DQjxu599 DA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ast0g3wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 18:21:16 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143M3uTL020262;
 Mon, 3 May 2021 22:21:15 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 388xm9denj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 22:21:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143MLEpT35062228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 22:21:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 960D2C6059;
 Mon,  3 May 2021 22:21:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA3A3C6055;
 Mon,  3 May 2021 22:21:13 +0000 (GMT)
Received: from localhost (unknown [9.211.119.245])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  3 May 2021 22:21:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG
In-Reply-To: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
Date: Mon, 03 May 2021 19:21:11 -0300
Message-ID: <87sg331mso.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OdApgTp_XnAW-mBkUiY2jJY0ffo-uJ67
X-Proofpoint-GUID: OdApgTp_XnAW-mBkUiY2jJY0ffo-uJ67
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_19:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030150
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:

> After the feedback from v1 I reworked the patch with suggested ideas and
> this version has less duplicated code and is overall simpler.
>
> This patch series is still a WIP, there are still 2 main problems I am
> trying to solve, I'll mention them in their respective patches.
>
> The aim of these patches is to progress toward enabling disable-tcg on
> PPC by solving errors in hw/ppc with that option.
>
> As a WIP comments are welcome.
>
> Lucas Mateus Castro (alqotel) (2):
>   target/ppc: Moved functions out of mmu-hash64
>   hw/ppc: Moved TCG code to spapr_hcall_tcg
>
>  hw/ppc/meson.build       |   3 +
>  hw/ppc/spapr.c           |   1 +
>  hw/ppc/spapr_caps.c      |   1 +
>  hw/ppc/spapr_cpu_core.c  |   1 +
>  hw/ppc/spapr_hcall.c     | 301 ++--------------------------------
>  hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
>  hw/ppc/spapr_rtas.c      |   1 +
>  target/ppc/meson.build   |   1 +
>  target/ppc/mmu-hash64.c  |  81 +--------
>  target/ppc/mmu-hash64.h  |   6 -
>  target/ppc/mmu-misc.c    |  86 ++++++++++
>  target/ppc/mmu-misc.h    |  22 +++
>  12 files changed, 478 insertions(+), 369 deletions(-)
>  create mode 100644 hw/ppc/spapr_hcall_tcg.c
>  create mode 100644 target/ppc/mmu-misc.c
>  create mode 100644 target/ppc/mmu-misc.h

This is the list of hypercalls registered with spapr_register_hypercall
and whether they are implemented by KVM HV, KVM PR or none. I also list
whether the KVM hcall uses the QEMU implementation as a fallback. Maybe
it will be helpful to this discussion.

(This is from just looking at the code, so take it with a grain of salt)

H_ADD_LOGICAL_LAN_BUFFER  - not impl. by KVM
H_CHANGE_LOGICAL_LAN_MAC  - not impl. by KVM
H_ENABLE_CRQ              - not impl. by KVM
H_FREE_CRQ                - not impl. by KVM
H_FREE_LOGICAL_LAN        - not impl. by KVM
H_GET_CPU_CHARACTERISTICS - not impl. by KVM
H_GET_TERM_CHAR           - not impl. by KVM
H_HOME_NODE_ASSOCIATIVITY - not impl. by KVM
H_INT_ESB                 - not impl. by KVM
H_INT_GET_QUEUE_INFO      - not impl. by KVM
H_INT_GET_SOURCE_CONFIG   - not impl. by KVM
H_INT_GET_SOURCE_INFO     - not impl. by KVM
H_INT_RESET               - not impl. by KVM
H_INT_SET_QUEUE_CONFIG    - not impl. by KVM
H_INT_SET_SOURCE_CONFIG   - not impl. by KVM
H_INT_SYNC                - not impl. by KVM
H_JOIN                    - not impl. by KVM
H_LOGICAL_CACHE_LOAD      - not impl. by KVM
H_LOGICAL_CACHE_STORE     - not impl. by KVM
H_LOGICAL_DCBF            - not impl. by KVM
H_LOGICAL_ICBI            - not impl. by KVM
H_MULTICAST_CTRL          - not impl. by KVM
H_PUT_TERM_CHAR           - not impl. by KVM
H_REGISTER_LOGICAL_LAN    - not impl. by KVM
H_REGISTER_PROC_TBL       - not impl. by KVM
H_REG_CRQ                 - not impl. by KVM
H_RESIZE_HPT_COMMIT       - not impl. by KVM
H_RESIZE_HPT_PREPARE      - not impl. by KVM
H_SCM_BIND_MEM            - not impl. by KVM
H_SCM_READ_METADATA       - not impl. by KVM
H_SCM_UNBIND_ALL          - not impl. by KVM
H_SCM_WRITE_METADATA      - not impl. by KVM
H_SEND_CRQ                - not impl. by KVM
H_SEND_LOGICAL_LAN        - not impl. by KVM
H_SET_SPRG0               - not impl. by KVM
H_SIGNAL_SYS_RESET        - not impl. by KVM
H_VIO_SIGNAL              - not impl. by KVM

H_CAS                     - not impl. by KVM | called by SLOF only
H_LOGICAL_MEMOP           - not impl. by KVM | called by SLOF only
H_TPM_COMM                - not impl. by KVM | called by UV only
H_UPDATE_DT               - not impl. by KVM | called by SLOF only

H_INT_GET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/UV
H_INT_GET_QUEUE_CONFIG      - not impl. by KVM | not called by linux/SLOF/UV
H_INT_SET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/UV
H_SCM_UNBIND_MEM            - not impl. by KVM | not called by linux/SLOF/UV

H_GET_TCE      - HV | not impl. by PR | QEMU fallback
H_SET_MODE     - HV | not impl. by PR | QEMU fallback
H_CONFER       - HV | not impl. by PR
H_PAGE_INIT    - HV | not impl. by PR
H_PROD         - HV | not impl. by PR
H_RANDOM       - HV | not impl. by PR
H_READ         - HV | not impl. by PR
H_REGISTER_VPA - HV | not impl. by PR
H_SET_DABR     - HV | not impl. by PR
H_SET_XDABR    - HV | not impl. by PR

H_CPPR             - HV | PR | QEMU fallback
H_EOI              - HV | PR | QEMU fallback
H_IPI              - HV | PR | QEMU fallback
H_IPOLL            - HV | PR | QEMU fallback
H_LOGICAL_CI_LOAD  - HV | PR | QEMU fallback
H_LOGICAL_CI_STORE - HV | PR | QEMU fallback
H_PUT_TCE          - HV | PR | QEMU fallback
H_PUT_TCE_INDIRECT - HV | PR | QEMU fallback
H_RTAS             - HV | PR | QEMU fallback
H_STUFF_TCE        - HV | PR | QEMU fallback
H_XIRR             - HV | PR | QEMU fallback
H_XIRR_X           - HV | PR | QEMU fallback

H_BULK_REMOVE      - HV | PR
H_CEDE             - HV | PR
H_ENTER            - HV | PR
H_PROTECT          - HV | PR
H_REMOVE           - HV | PR

H_CLEAN_SLB      - never called/implemented, added along with H_REGISTER_PROC_TBL
H_INVALIDATE_PID - never called/implemented, added along with H_REGISTER_PROC_TBL

PS: we could perhaps use this information to annotate
qemu/include/spapr.h. I can send a patch if people find it useful.

