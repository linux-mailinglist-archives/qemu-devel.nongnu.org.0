Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE6466BB2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 22:33:13 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msthX-00080h-Ib
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 16:33:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mstev-0005Xg-Ar; Thu, 02 Dec 2021 16:30:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31286
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mstep-0005rN-VS; Thu, 02 Dec 2021 16:30:29 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2LHeFr006214; 
 Thu, 2 Dec 2021 21:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=XbG1S5w77oaDiEvUiVtHjSObJMmFGxuux9i+a9BpjGA=;
 b=ZyO574RedtvMeK0pt/GqpGicOQ/1LeUk0CuBgnB0wui3RFMI+CTkpGwvCLU/qZDhW3Nc
 8tbhMk3Wtsp7hwV23R1BpMVdrYcWRhtT50ezwJuq+5UcCfHfvuFQpFSt8irAMHXifYMY
 Qlx6Drg4NK+nxdgGhPVQ8QPkk7KTOGDzVk7hmGWyMAT1YV2f8JVWdb2/ZnSJl6azHJL7
 3boNq7rPqQ369RCQO6QCv3GhUDkaITFPZV0xAzGHFPMJ0NwE1+bdaSsLrzpOR7FsodEo
 h2B98rCHQ7E/FPbk/NbcdweoIiV0OX5sriFcc+/b4alH+DAvcfw2GE9Ov/hsJmBavUWE 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq5xcr9gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:30:19 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2LHk4u006470;
 Thu, 2 Dec 2021 21:30:19 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq5xcr9g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:30:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2LOKFX003551;
 Thu, 2 Dec 2021 21:30:17 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3cn3k3evbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:30:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2LUGqb55706042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 21:30:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2DAAE064;
 Thu,  2 Dec 2021 21:30:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7041AE068;
 Thu,  2 Dec 2021 21:30:13 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.70.80])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 21:30:13 +0000 (GMT)
Message-ID: <ca4dc1b5b8e7f737337381609e4b44fb62f8f3eb.camel@linux.ibm.com>
Subject: Re: [PATCH 3/4] s390x/pci: use the passthrough measurement update
 interval
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 02 Dec 2021 16:30:12 -0500
In-Reply-To: <20211202164110.326947-4-mjrosato@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-4-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XmWRzwr86LRP9ttxNpzd_ojRznt9HN9Q
X-Proofpoint-GUID: JjNLdQ8roamWdZtKQAOJ7HsmLoiz5oiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_14,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-12-02 at 11:41 -0500, Matthew Rosato wrote:
> We may have gotten a measurement update interval from the underlying
> host
> via vfio -- Use it to set the interval via which we update the
> function
> measurement block.
> 
> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  hw/s390x/s390-pci-inst.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 11b7f6bfa1..07bab85ce5 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -1046,7 +1046,7 @@ static void fmb_update(void *opaque)
>                        sizeof(pbdev->fmb.last_update))) {
>          return;
>      }
> -    timer_mod(pbdev->fmb_timer, t + DEFAULT_MUI);
> +    timer_mod(pbdev->fmb_timer, t + pbdev->pci_group-
> >zpci_group.mui);
>  }
>  
>  int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba,
> uint8_t ar,
> @@ -1204,7 +1204,8 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t
> r1, uint64_t fiba, uint8_t ar,
>          }
>          pbdev->fmb_addr = fmb_addr;
>          timer_mod(pbdev->fmb_timer,
> -                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
> DEFAULT_MUI);
> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
> +                                    pbdev->pci_group-
> >zpci_group.mui);
>          break;
>      }
>      default:


