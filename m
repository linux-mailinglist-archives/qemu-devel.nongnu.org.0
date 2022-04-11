Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD74FC034
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:19:37 +0200 (CEST)
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvpI-0000th-8r
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ndvhV-00030w-RH; Mon, 11 Apr 2022 11:11:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32494
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ndvhU-00038G-6U; Mon, 11 Apr 2022 11:11:33 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BDlsh2015706; 
 Mon, 11 Apr 2022 15:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=EyFtsqehe6vgXqW8H7Fm5/yajFNDRrywbXOnv/tmOQk=;
 b=N4YFGUx2J1be+xTlo6UwL0cplqRj4lkqr1aDtEhZnjbHAFrQqom7d8aVv1whP9MChtsB
 NiK+9rFUvAoouJu+hTLbPdSAPDjHNp0b6pIU0Tl1Zoj04iQLkVSbIVgI57+GyOyljrTu
 L8LUX8NXwp5gBc0b5y1TnhLewE7T6N/Gu2jMAhFsJtsCSkzQyNSYvdRUZkYLIKtpT1AV
 H5T0Mb14QSQgprR1fm7s3PrMLQg2x+kPNBrUmUcjqeIMSOBf4njzEjnevLdhpu7PCj8S
 GtJ35fcPYtQAneVY5y012CZDldEcuWs0WXb+ahFwtWh8jZCrewZ1JnhQY42Dv5fG0MyC GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fcnhh9xkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 15:11:28 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BE6UKb019726;
 Mon, 11 Apr 2022 15:11:27 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fcnhh9xkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 15:11:27 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BEvkWm018833;
 Mon, 11 Apr 2022 15:11:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 3fb1s9cnmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 15:11:27 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BFBQZn39977354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 15:11:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17B29AE060;
 Mon, 11 Apr 2022 15:11:26 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A195AE06B;
 Mon, 11 Apr 2022 15:11:25 +0000 (GMT)
Received: from localhost (unknown [9.160.73.163])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 11 Apr 2022 15:11:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Add two missing register callbacks on POWER10
In-Reply-To: <20220411125900.352028-1-fbarrat@linux.ibm.com>
References: <20220411125900.352028-1-fbarrat@linux.ibm.com>
Date: Mon, 11 Apr 2022 12:11:07 -0300
Message-ID: <87wnfvy7sk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9KOrhW9WSO5HLTBFxcQSt6uRG0w5CRi6
X-Proofpoint-ORIG-GUID: Zj9mfNIrQThQjJIcgMwvidKLEuFweLa4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_05,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Frederic Barrat <fbarrat@linux.ibm.com> writes:

> This patch adds tcg accessors for 2 SPRs which were missing on P10:
>
> - the TBU40 register is used to write the upper 40 bits of the
> timebase register. It is used by kvm to update the timebase when
> entering/exiting the guest on P9 and above. The missing definition was
> causing erratic decrementer interrupts in a pseries/kvm guest running
> in a powernv10/tcg host, typically resulting in hangs.
>
> - the missing DPDES SPR was found through code inspection. It exists
> unchanged on P10.
>
> Both existed on previous versions of the processor and a bit of git
> archaeology hints that they were added while the P10 model was already
> being worked on so they may have simply fallen through the cracks.
>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu_init.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 073fd10168..2e9a3ded54 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6457,6 +6457,7 @@ static void init_proc_POWER10(CPUPPCState *env)
>      register_power5p_common_sprs(env);
>      register_power5p_lpar_sprs(env);
>      register_power5p_ear_sprs(env);
> +    register_power5p_tb_sprs(env);
>      register_power6_common_sprs(env);
>      register_power6_dbg_sprs(env);
>      register_power8_tce_address_control_sprs(env);
> @@ -6467,6 +6468,7 @@ static void init_proc_POWER10(CPUPPCState *env)
>      register_power8_pmu_user_sprs(env);
>      register_power8_tm_sprs(env);
>      register_power8_pspb_sprs(env);
> +    register_power8_dpdes_sprs(env);
>      register_vtb_sprs(env);
>      register_power8_ic_sprs(env);
>      register_power8_book4_sprs(env);

