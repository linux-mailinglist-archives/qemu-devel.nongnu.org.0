Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B658A9C8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:55:13 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuz2-0000Ct-5f
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJuuz-0003OB-2J; Fri, 05 Aug 2022 06:51:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJuux-0004rp-9B; Fri, 05 Aug 2022 06:51:00 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275AlGVW021540;
 Fri, 5 Aug 2022 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jkaaY6Vp7Y9URbZ3YVJV4fGEScuTCgS81ILU0P2NEmc=;
 b=NQrdZ6vhaBLdpNgOVZwWRi+su2+u0S2SkLPsHKNumc7MKartrKAayCR00vg7kSleYkGF
 HaAkG0/HlkrptDLMtU0CWf/4xMs7TxIAUZ5UPe8yeno4ORVL10wcIgU65LGEa5Zxq4w0
 F28vS04YAJWUK5h7xBRUvpYYyZE4e3+CXDE64N+fP0Po/Z+HzFuy6nHaJMX8kJ15+Ug7
 NuqClBNpifccejV13L00wRaWby2SHmm9bXrTvaKq3yc3zberWuqD0aaDYvqZyz/kLXAQ
 3C536FEG8v9tW6LjcffZhQliav5rCMUvxyfSwre0x+XDOaKGX+LkvX7n6xe0cvkfa253 gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1rk81ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:50:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275Aojrg001106;
 Fri, 5 Aug 2022 10:50:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1rk81jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:50:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275Aa8uV027102;
 Fri, 5 Aug 2022 10:50:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3hmuwhya8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:50:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275Aohqh30474600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 10:50:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B58BC11C04A;
 Fri,  5 Aug 2022 10:50:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDB3011C05B;
 Fri,  5 Aug 2022 10:50:42 +0000 (GMT)
Received: from [9.171.39.100] (unknown [9.171.39.100])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 10:50:42 +0000 (GMT)
Message-ID: <5f3a7053-ebfe-ef3d-093a-d5a593ad88e5@linux.ibm.com>
Date: Fri, 5 Aug 2022 12:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 06/10] ppc/pnv: enable user created pnv-phb for
 powernv8
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-7-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220803134459.2633902-7-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8eFHazsQvRISfgp7C8Kw8e5oZhqTHXfr
X-Proofpoint-GUID: LPI5sA-iYD0y-TqbNO9T1TwUuMyScWBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050052
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



> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 077f391d59..953c384bf6 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -17,6 +17,7 @@
>   #include "hw/ppc/pnv.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "sysemu/sysemu.h"
>   
>   
>   /*
> @@ -171,6 +172,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> +    if (phb->version == 3 && !defaults_enabled()) {
> +        return;
> +    }
> +
>       pnv_phb_attach_root_port(pci);
>   }


So we skip the call to pnv_phb_attach_root_port() for the user created PHBs.

I seem to remember that when the user creates a PHB on the command line, 
they also need to create the root port and we can't just create one by 
default with the PHB. It seems heavy when just using the qemu CLI but 
that was a requirement from libvirt. Did I get that right?

In any case, I can see a problem. pnv_phb_attach_root_port() creates the 
root port object, so if the above is correct, we want to skip that. But 
it also creates the PHB->root port relationship in QOM. That we don't do 
anywhere for the user-created case.

Calling qemu with "-nodefaults -device pnv-phb -device 
pnv-phb-root-port", here is what I see in QOM, which shows the wrong 
parenting of the root port:
   /peripheral-anon (container)
     /device[1] (pnv-phb-root-port)
       /bus master container[0] (memory-region)
       /bus master[0] (memory-region)
       /pci_bridge_io[0] (memory-region)
       /pci_bridge_io[1] (memory-region)
       /pci_bridge_mem[0] (memory-region)
       /pci_bridge_pci[0] (memory-region)
       /pci_bridge_pref_mem[0] (memory-region)
       /pci_bridge_vga_io_hi[0] (memory-region)
       /pci_bridge_vga_io_lo[0] (memory-region)
       /pci_bridge_vga_mem[0] (memory-region)
       /pcie.0 (PCIE)


With the full series, same problem on P8/P9/P10

   Fred






