Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F86583049
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:36:15 +0200 (CEST)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkxC-0008Ao-Ky
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkqM-0002Om-SI; Wed, 27 Jul 2022 13:29:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkqK-0007NL-Ke; Wed, 27 Jul 2022 13:29:10 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHBsVK018629;
 Wed, 27 Jul 2022 17:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=k/RyfhzET/qC3MYsUf2G9yNLIbhIDu+ITxvcBXmsOaw=;
 b=huuQbzf0tGlJdsqB68HKn0hBHI5aSfd1qnBOU3Fb5KWRi4rS+vsF9OVwiSR0kgUU9ZUb
 WRvALFnnVdNMWTUxr3dFR6Txr/DCZb2o73B2Ayb+4ivZhI3dHjVSL9L0c9OlQtgFUKPp
 +WJvw+E1AIwRQdrAsGJGpRt3GtY2goPnsPIg000mrNdsnjHpddrYZvWTIwttC7DarKkW
 U/BN+NAspRnfPzYyfcT1ib3Y2vm/KDqEwY+mWwuS4ItuLg95wEC/HsP6+bQMR2Ld2uZF
 YEvwbPZDI2yV7XILGZdxBrM8/bEHQNAQyOSmFTg6YubxAKsTe8TSJHER1RCFepjkt0t+ rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9j20h4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:02 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHDZVo028886;
 Wed, 27 Jul 2022 17:29:02 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9j20h3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:02 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHLwHk019517;
 Wed, 27 Jul 2022 17:29:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tdaqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:28:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHSv7917039828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:28:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 998E611C04C;
 Wed, 27 Jul 2022 17:28:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A2411C04A;
 Wed, 27 Jul 2022 17:28:57 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:28:57 +0000 (GMT)
Message-ID: <22b1124d-3c57-925f-56e7-1b85342be7ff@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/12] powernv: introduce pnv-phb base/proxy devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: csYMFA6eXO9lQJzld8nNlE5DgbsvQssd
X-Proofpoint-GUID: 7-r4SPv6nRZQSGLA3UnuLYfqH0KvObAa
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=957
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270071
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



On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
> Hi,
> 
> This is the version 3 of the pnv-phb proxy device which has the
> following main differences from v2:
> 
> - it's rebased on top of "[PATCH v3 0/8] pnv-phb related cleanups"
> - it doesn't have any patches related to user-created devices
> 
> There is no user visible change made here yet. We're making device
> changes that are effective using default settings.
> 
> Changes from v2:
> - all related changes made with the rebase on top of "[PATCH v3 0/8]
> pnv-phb related cleanups"
> - the following user devices patches were removed:
>    - ppc/pnv: user created pnv-phb for powernv8
>    - ppc/pnv: user created pnv-phb for powernv9
>    - ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>    - ppc/pnv: user creatable pnv-phb for powernv10
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html


This series look pretty good to me! I only have a couple of minor 
comments, which I don't think are worth a resend.

   Fred



> Daniel Henrique Barboza (12):
>    ppc/pnv: add PHB3 bus init helper
>    ppc/pnv: add PnvPHB base/proxy device
>    ppc/pnv: turn PnvPHB3 into a PnvPHB backend
>    ppc/pnv: add PHB4 bus init helper
>    ppc/pnv: turn PnvPHB4 into a PnvPHB backend
>    ppc/pnv: add pnv-phb-root-port device
>    ppc/pnv: remove pnv-phb3-root-port
>    ppc/pnv: remove pnv-phb4-root-port
>    ppc/pnv: remove root port name from pnv_phb_attach_root_port()
>    ppc/pnv: remove pecc->rp_model
>    ppc/pnv: remove PnvPHB4.version
>    ppc/pnv: move attach_root_port helper to pnv-phb.c
> 
>   hw/pci-host/meson.build        |   3 +-
>   hw/pci-host/pnv_phb.c          | 244 +++++++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb.h          |  55 ++++++++
>   hw/pci-host/pnv_phb3.c         | 106 ++++----------
>   hw/pci-host/pnv_phb4.c         | 144 ++++---------------
>   hw/pci-host/pnv_phb4_pec.c     |   5 +-
>   hw/ppc/pnv.c                   |  68 ++++-----
>   include/hw/pci-host/pnv_phb3.h |  12 +-
>   include/hw/pci-host/pnv_phb4.h |  18 +--
>   include/hw/ppc/pnv.h           |   5 +-
>   10 files changed, 401 insertions(+), 259 deletions(-)
>   create mode 100644 hw/pci-host/pnv_phb.c
>   create mode 100644 hw/pci-host/pnv_phb.h
> 

