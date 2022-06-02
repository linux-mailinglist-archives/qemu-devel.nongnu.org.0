Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD753BC20
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:10:58 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnPT-0002UH-TN
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwnND-0000i3-Vl; Thu, 02 Jun 2022 12:08:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwnNB-0001fb-V9; Thu, 02 Jun 2022 12:08:35 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252ElW8J030451;
 Thu, 2 Jun 2022 16:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IQJH67qCcNK5qCNf1YB1M1pItMG7ia1vNFwFmwPUvNc=;
 b=deBCKZwlSSdoxnXTjGz6F44S0xcoZk6NNBXqi1LR7Wv7d2x0lPK7WO+FhUx6ecQBR3M3
 GV3CmsbQTKUVggZ2qyELQgoZP0G4xu7AYtPjz5LRS3/QXlg03vU1DTBLaw5dYs/r3QKX
 AOg0kqrpwEy8phVfsLXLlhyx7uUHu4rOymKsSZ5XwaZM7/IdlCiyvt6jOJRvwPup+m4/
 rugrbGFDw0UreF+Rl9Em6Qww8mhldAImU16pqmtsXJRG/I5CEmenle+71zkruzw0oX6D
 aggURg4HAqVricvcUhOh9TRbgb1A6QRrDOXG2wVrzmWuUORFGDXFff5WWf3l+3TGzYQr eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gey959h9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:08:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252FqYc8016513;
 Thu, 2 Jun 2022 16:08:12 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gey959h8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:08:12 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252G6L5u007207;
 Thu, 2 Jun 2022 16:08:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3gdnettxbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:08:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252G870d22938064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 16:08:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8112EAE04D;
 Thu,  2 Jun 2022 16:08:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E9A9AE055;
 Thu,  2 Jun 2022 16:08:07 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jun 2022 16:08:07 +0000 (GMT)
Message-ID: <acb06247-63a0-9a0f-28ec-913c3e930e3a@linux.ibm.com>
Date: Thu, 2 Jun 2022 18:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 00/16] powernv: introduce pnv-phb base/proxy devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oX6EVBQcNr6NEUwyNRGISjtoRArWYULR
X-Proofpoint-ORIG-GUID: boSmaBz08JrQCHfQR8J1xCpbnMruaS8s
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_04,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206020067
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
> Hi,
> 
> This v2 is considerable different from the first version due to the
> review provided by Mark Cave-Ayland.
> 
> We're now preserving all PnvPHB3/4/5 implementations already in place.
> The PnvPHB device now acts as a base/proxy of the existing PHBs, which
> are turned into backends of the base PnvPHB device.
> 
> QOM is being more used this time by passing through properties to the
> PHB backends from the base device, and by setting the phb->version
> via global machine properties in each machine.
> 
> The changes made impact both user creatable and default devices, meaning
> that now the powernv machines are using the PnvPHB base device in all
> circunstances.
> 
> The one thing that I didn't change from v1 is the root port revamp. I
> didn't find enough reason to do the same thing we did with the PnvPHBs,
> given that all that differs them is the reset() callback of
> phb4_root_port. This means that patches 14-17 from v1 are still mostly
> the same.
> 
> 
> Changes from v1:
> - lots of changes in patches 1-6 and 7 due to the change of direction
> - patch 10 from v1: removed
> - PnvPHB.version is now being removed in patch 16
> - several other minor changes due to changes in the initial patches
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01410.html


Hi Daniel,

I have a few mostly minor comments coming but that series looks pretty 
good already! And you did a pretty good job splitting it, making the 
review easier. Thanks!

   Fred



> Daniel Henrique Barboza (16):
>    ppc/pnv: add PHB3 bus init helper
>    ppc/pnv: add pnv_get_phb3_child()
>    ppc/pnv: add PnvPHB base/proxy device
>    ppc/pnv: change PnvPHB3 to be a PnvPHB backend
>    ppc/pnv: user created pnv-phb for powernv8
>    ppc/pnv: add PHB4 bus init helper
>    ppc/pnv: change PnvPHB4 to be a PnvPHB backend
>    ppc/pnv: user created pnv-phb for powernv9
>    ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>    ppc/pnv: user creatable pnv-phb for powernv10
>    ppc/pnv: add pnv-phb-root-port device
>    ppc/pnv: remove pnv-phb3-root-port
>    ppc/pnv: remove pnv-phb4-root-port
>    ppc/pnv: remove 'phb_rootport_typename' in pnv_phb_realize()
>    ppc/pnv: remove pecc->rp_model
>    ppc/pnv: remove PnvPHB4.version
> 
>   hw/pci-host/meson.build        |   3 +-
>   hw/pci-host/pnv_phb.c          | 219 ++++++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb.h          |  56 ++++++++
>   hw/pci-host/pnv_phb3.c         | 144 ++++++++-------------
>   hw/pci-host/pnv_phb4.c         | 226 ++++++++++++++-------------------
>   hw/pci-host/pnv_phb4_pec.c     |  14 +-
>   hw/ppc/pnv.c                   |  78 ++++++++++--
>   include/hw/pci-host/pnv_phb3.h |  12 +-
>   include/hw/pci-host/pnv_phb4.h |  18 +--
>   include/hw/ppc/pnv.h           |   4 +-
>   10 files changed, 512 insertions(+), 262 deletions(-)
>   create mode 100644 hw/pci-host/pnv_phb.c
>   create mode 100644 hw/pci-host/pnv_phb.h
> 

