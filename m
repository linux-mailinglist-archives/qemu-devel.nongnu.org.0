Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C166A035
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNOh-0005KV-Du; Fri, 13 Jan 2023 11:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pGNOf-0005K8-9v; Fri, 13 Jan 2023 11:59:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pGNOd-0004k3-HU; Fri, 13 Jan 2023 11:59:17 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DGe5ir030596; Fri, 13 Jan 2023 16:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VLgISn7ch33gDgOFpKQ2+aOg4gs+g/cxF2hclMC3Uws=;
 b=tO1CSJl3MjnYW/nK3pVRLYS4uUMpmceD+yFbQvk6SLkz7ReDa5c/0WqDfcmpvmksyP9o
 hODGhXMuZWuDrehodRtIuhKixWZvbTURYDrUt2sL3rBohTGV+xLIy0Helv9Kpn/zuECg
 DSYwCWr8IMCCuR6McpfKs9QTvlkH6Y0NFsJMKvxHgywpjZZRhBqIe+5Dg0CTExZ0Xpk1
 YqkGBca/hStQY0KWMPJxFIwahQQ4xTi5XBHn0ARyFsLgbEhVBPk62QMri0zwhDTKxByX
 QSjxW0I2GaDba0aTmvP9jjb6iurgeKquYA4JgCFj4hew3+Kip6sVEZTw2QdUG6aBETHt cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n3a1yt0px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 16:59:06 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30DGescg001273;
 Fri, 13 Jan 2023 16:59:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n3a1yt0p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 16:59:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30D7jbEA004640;
 Fri, 13 Jan 2023 16:59:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n1kkyv7bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 16:59:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30DGwxSh47776010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Jan 2023 16:59:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAFDD2004E;
 Fri, 13 Jan 2023 16:58:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79EE420040;
 Fri, 13 Jan 2023 16:58:59 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.201.249])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 13 Jan 2023 16:58:59 +0000 (GMT)
Message-ID: <87039aeec020afbd28be77ad5f8d022126aba7bf.camel@linux.ibm.com>
Subject: Re: [PATCH v14 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Fri, 13 Jan 2023 17:58:59 +0100
In-Reply-To: <20230105145313.168489-2-pmorel@linux.ibm.com>
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EkO-reBsw_HvuSqxYzKdjZQ38B1s0OaO
X-Proofpoint-ORIG-GUID: fDAQPYYS4vP_lV2OAVYsAK71pibvpqSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301130110
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
> S390 adds two new SMP levels, drawers and books to the CPU
> topology.
> The S390 CPU have specific toplogy features like dedication
> and polarity to give to the guest indications on the host
> vCPUs scheduling and help the guest take the best decisions
> on the scheduling of threads on the vCPUs.
>=20
> Let us provide the SMP properties with books and drawers levels
> and S390 CPU with dedication and polarity,
>=20
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  qapi/machine.json               | 14 ++++++++--
>  include/hw/boards.h             | 10 ++++++-
>  include/hw/s390x/cpu-topology.h | 23 ++++++++++++++++
>  target/s390x/cpu.h              |  6 +++++
>  hw/core/machine-smp.c           | 48 ++++++++++++++++++++++++++++-----
>  hw/core/machine.c               |  4 +++
>  hw/s390x/s390-virtio-ccw.c      |  2 ++
>  softmmu/vl.c                    |  6 +++++
>  target/s390x/cpu.c              | 10 +++++++
>  qemu-options.hx                 |  6 +++--
>  10 files changed, 117 insertions(+), 12 deletions(-)
>  create mode 100644 include/hw/s390x/cpu-topology.h
>=20
[...]

> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7d6d01325b..39ea63a416 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -131,6 +131,12 @@ struct CPUArchState {
> =20
>  #if !defined(CONFIG_USER_ONLY)
>      uint32_t core_id; /* PoP "CPU address", same as cpu_index */
> +    int32_t socket_id;
> +    int32_t book_id;
> +    int32_t drawer_id;
> +    int32_t dedicated;
> +    int32_t polarity;

If I understood the architecture correctly, the polarity is a property of t=
he configuration,
not the cpus. So this should be vertical_entitlement, and there should be a=
 machine (?) property
specifying if the polarity is horizontal or vertical.

> +    int32_t cpu_type;
>      uint64_t cpuid;
>  #endif
> =20

[...]

