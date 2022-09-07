Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADEE5B01F0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 12:31:05 +0200 (CEST)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVsKl-0001Ew-S0
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 06:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oVsHF-0007SO-Ak; Wed, 07 Sep 2022 06:27:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oVsH8-0004SC-U3; Wed, 07 Sep 2022 06:27:24 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287AA150036854;
 Wed, 7 Sep 2022 10:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=AOywXLq0iV7yfhYsspll1FkavWSQyPFawC/Jx/IEmjg=;
 b=jtadHzgKBvEhhgK17dKhEdbtI11mDpBtDFFo/9RcoC+dh5pDKobgBFMU1U1hPip7c1TF
 N2pcRxI2WEsWxmcKXG2nGRlv/GOI5dTNTnekrNW/wZPbm+87jXwqfVQ0WEytLkt0iP1L
 23M0A9qxX6VZk8cuL7p+10I+auIHcIScfjXZb6luSrfJc5ZK4ebI3cKYWwb8yoYm2fDY
 8yFvhMXvzgLwJUUV4A5IK+qBPKjT8gVxae3SW6btsnKUsn/b1cf6lTlTUSBhLFW92i7g
 3CVirbSaCd4A2L7eMV62V472lNFHuK1x3lnPdP2CdAViPOJN8jKWXrQoggSg1CKLPyBh Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jerxa0yh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 10:27:02 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 287AARvX037688;
 Wed, 7 Sep 2022 10:27:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jerxa0yfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 10:27:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 287A8BHq029610;
 Wed, 7 Sep 2022 10:26:58 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3jbxj8uppn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 10:26:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 287AQtvO34275726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Sep 2022 10:26:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A62455204F;
 Wed,  7 Sep 2022 10:26:55 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.17.128])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id ED70C5204E;
 Wed,  7 Sep 2022 10:26:54 +0000 (GMT)
Message-ID: <683c1c82673c065a9ab679fd019774365677a619.camel@linux.ibm.com>
Subject: Re: [PATCH v9 03/10] s390x/cpu topology: reporting the CPU topology
 to the guest
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
Date: Wed, 07 Sep 2022 12:26:54 +0200
In-Reply-To: <20220902075531.188916-4-pmorel@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NdBMiToyhY4YACryg00SJ-V7e6J57KBt
X-Proofpoint-GUID: WT3cDc3cDfr1Vzklvpf33ahPNvW4Rq4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_06,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209070040
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
> The guest can use the STSI instruction to get a buffer filled
> with the CPU topology description.
> 
> Let us implement the STSI instruction for the basis CPU topology
> level, level 2.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  hw/s390x/cpu-topology.c         |   4 ++
>  include/hw/s390x/cpu-topology.h |   5 ++
>  target/s390x/cpu.h              |  49 +++++++++++++++
>  target/s390x/cpu_topology.c     | 108 ++++++++++++++++++++++++++++++++
>  target/s390x/kvm/kvm.c          |   6 +-
>  target/s390x/meson.build        |   1 +
>  6 files changed, 172 insertions(+), 1 deletion(-)
>  create mode 100644 target/s390x/cpu_topology.c
> 
[...]

> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c

[...]

> +static char *fill_tle_cpu(char *p, uint64_t mask, int origin)
> +{
> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
> +
> +    tle->nl = 0;
> +    tle->dedicated = 1;
> +    tle->polarity = S390_TOPOLOGY_POLARITY_H;
> +    tle->type = S390_TOPOLOGY_CPU_TYPE;
> +    tle->origin = origin * 64;

origin is a multibyte field too, so needs a conversion too.

> +    tle->mask = be64_to_cpu(mask);
> +    return p + sizeof(*tle);
> +}
> +
[...]

