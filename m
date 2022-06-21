Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861C552F73
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:08:26 +0200 (CEST)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ao5-0008SP-N9
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3afr-0007UR-Td; Tue, 21 Jun 2022 05:59:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52934
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3afq-00011F-86; Tue, 21 Jun 2022 05:59:55 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L9iDSD001881;
 Tue, 21 Jun 2022 09:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=96JJ5yLbcImjxw3vX70+OTqVoqhsu+B1GB3UJuuf62o=;
 b=UGaowMs6gHOAHowYW668JLn65eUX5xqdPVVY3L98rOek7REzzbQ394YtEnboy+0HfG6R
 8qWLZltg79MF9ztiLXiRbqkBRGc6Zq5oLzn+r4wa317YzNZuY30OxYIrTcNGiJh1so1R
 mKLLW8WUN74frL8uAK1KhLB3FvB3/g0QmhQxeEfd6i+cuQmQW6niwcTNJXGDp4/jpopW
 /gGN31sKca98B3yc8MjgyGCxTSJQSuDzYqUnXSBfVWoN/ie0RohHVCP5RVhqGs2w2Ibe
 z4RHue5zdRwLGyTvsqbUNt5RBSMEWYj/dxpx49HmTN9vrMALHf5mOiV16hHmxFJYQGXh jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gubm3gb48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 09:59:44 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25L9wa8W031331;
 Tue, 21 Jun 2022 09:59:44 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gubm3gb3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 09:59:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25L9qCkd032492;
 Tue, 21 Jun 2022 09:59:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3gs6b93syg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 09:59:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25L9xdZ421758446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jun 2022 09:59:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2C6811C04C;
 Tue, 21 Jun 2022 09:59:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9468211C04A;
 Tue, 21 Jun 2022 09:59:39 +0000 (GMT)
Received: from [9.145.155.216] (unknown [9.145.155.216])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jun 2022 09:59:39 +0000 (GMT)
Message-ID: <ce768474-4da6-68b8-67bf-5cd17ee63f6c@linux.ibm.com>
Date: Tue, 21 Jun 2022 11:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 9/9] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4
 root bus
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-10-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220618110202.87735-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fQtUE-Z9YN0817NX5XtlT0QtOVAHurad
X-Proofpoint-GUID: iB6ysvz1h5qlVoSoHoTr1D8utVDfMJwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_04,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210041
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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



On 18/06/2022 13:02, Daniel Henrique Barboza wrote:
> It's unneeded. No other PCIE_BUS implements this interface.
> 
> Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb4.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 61b45fe33c..81f7c1fe8f 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1751,10 +1751,6 @@ static const TypeInfo pnv_phb4_root_bus_info = {
>       .name = TYPE_PNV_PHB4_ROOT_BUS,
>       .parent = TYPE_PCIE_BUS,
>       .class_init = pnv_phb4_root_bus_class_init,
> -    .interfaces = (InterfaceInfo[]) {
> -        { INTERFACE_PCIE_DEVICE },
> -        { }
> -    },
>   };
>   
>   static void pnv_phb4_root_port_reset(DeviceState *dev)

