Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB95FF155
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 17:28:15 +0200 (CEST)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojMbe-0002Qk-FD
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 11:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojMLO-00080i-Bd; Fri, 14 Oct 2022 11:11:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojMLM-0007CB-NC; Fri, 14 Oct 2022 11:11:26 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EE0GQY014828;
 Fri, 14 Oct 2022 15:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=gFxyTDFETCNPXnuhRRO7KbDb2Yb2F0KCgJkWJ4+AYF8=;
 b=SV6EfKn7mOJtEsV8OLYR5SDkE7rEypIMtU/JAzTd8ffbXlMA8yWxBu9//Nyah9m8IFji
 U50JIlz3V5iXAIlj/ZCv1cXKtRybyMmQYg5N4/YgrfQQzrcdpyfmlQGSEedEN+YU4hWv
 8hh7QHx6P2Tk1GPTF65YDQM/Vhg0364zfMRKM5NeakOcn7EiiGQi9Dh/VJRfj2dIA+sa
 MQ+cyJ3k3nDapnnbIA1re4HkPbNU2Cx3MazDbG0xtpQsX0d98it4yNM5JibHQ2IYbBy2
 8ZG3G3KtktP4UYh7039D4qKq5jAgBECuXSRFZQsYE8c/dVewZrQ90jmKM/QJwc/v31+Y LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k7952jj6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:11:13 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EF8TJd027195;
 Fri, 14 Oct 2022 15:11:13 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k7952jj6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:11:13 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EF6HFT003262;
 Fri, 14 Oct 2022 15:11:12 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3k6kcmjyxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:11:12 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EFBAhq22544770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 15:11:10 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C816258056;
 Fri, 14 Oct 2022 15:11:10 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3373A5805E;
 Fri, 14 Oct 2022 15:11:10 +0000 (GMT)
Received: from localhost (unknown [9.77.138.198])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Oct 2022 15:11:09 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 20/29] target/ppc: remove unused interrupts from
 p7_next_unmasked_interrupt
In-Reply-To: <20221011204829.1641124-21-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-21-matheus.ferst@eldorado.org.br>
Date: Fri, 14 Oct 2022 12:11:08 -0300
Message-ID: <875ygm4f03.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bc5mvtpXhWQzJYZIn4-jWgiZ3d6Lt_TQ
X-Proofpoint-GUID: 9lE5kmd7RZmBlX6tiZ1-rJbStxjtShhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=872 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Remove the following unused interrupts from the POWER7 interrupt masking
> method:
> - PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
> - Hypervisor Virtualization: introduced in Power ISA v3.0;
> - Hypervisor Doorbell and Event-Based Branch: introduced in
>   Power ISA v2.07;
> - Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
>   for embedded CPUs;
> - Doorbell and Critical Doorbell Interrupt: processor does not implement
>   the Embedded.Processor Control category;
> - Programmable Interval Timer: 40x-only;
> - PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

