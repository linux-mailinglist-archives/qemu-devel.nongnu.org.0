Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C34673E4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:24:53 +0100 (CET)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4oG-0008Rc-Fk
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:24:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4nL-0007jE-4x; Fri, 03 Dec 2021 04:23:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34400
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4n8-0003h8-Dc; Fri, 03 Dec 2021 04:23:54 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B37MpKT015404; 
 Fri, 3 Dec 2021 09:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IMn4frJ9q5yKx6UkgffvrVXrMM7L6hBD3ZfDDdNozFw=;
 b=gA5TUHDejAvRQpr6Qqjq0WmQlOgNhM+AIG5CVo3Nwp6960yCgSgSznRFfZ8amxswKFz0
 LYXuMimENJGj9lbt8ownSWst9QjN4DDGj4tFS2E+NjxalxwWg5cR07THIGBItOlsumVy
 8gqtaFWNg8dTelUCRDraFVmFQkmyTFS0kr1XDrS3N2VQ5EwbmWWl+iF6XnkrJy3S+jft
 l5GxuslpHGuTkyG/+r5Q9Z5d1E739fNlTcP07fMdgKQX2KFzK3SzwYzM5cOswiDYjoU4
 L0c+duaSK0QOxJwSP6CGWf4lIB/sPS5o1Cv3XldQR7uTbtqyrihPiu2xoCD5WK+6NEoY sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqet2a4jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:23:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B38KPJU026448;
 Fri, 3 Dec 2021 09:23:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqet2a4hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:23:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B39Napc013707;
 Fri, 3 Dec 2021 09:23:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3ckcaac7r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:23:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B39NYET24379858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 09:23:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A31854C052;
 Fri,  3 Dec 2021 09:23:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A1524C044;
 Fri,  3 Dec 2021 09:23:34 +0000 (GMT)
Received: from [9.171.47.125] (unknown [9.171.47.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 09:23:33 +0000 (GMT)
Message-ID: <4cac00b0-f162-f0a9-0ba5-45a968fec949@linux.ibm.com>
Date: Fri, 3 Dec 2021 10:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211202164110.326947-2-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VrYSOTZ2f5HTjCMclNiboufCI2pta0Ij
X-Proofpoint-ORIG-GUID: 3qWgiqlDWfnl2HEEGcRFI69Wt-60HO4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030057
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 17:41, Matthew Rosato wrote:
> The current default PCI group being used can technically collide with a
> real group ID passed from a hostdev.  Let's instead use a group ID that comes
> from a special pool that is architected to be reserved for simulated devices.

NIT: May be add that PCIFG between 0xF0 and 0xFF is specified for this 
reserved pool.


> 
> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   include/hw/s390x/s390-pci-bus.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
> index aa891c178d..2727e7bdef 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -313,7 +313,7 @@ typedef struct ZpciFmb {
>   } ZpciFmb;
>   QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
>   
> -#define ZPCI_DEFAULT_FN_GRP 0x20
> +#define ZPCI_DEFAULT_FN_GRP 0xFF
>   typedef struct S390PCIGroup {
>       ClpRspQueryPciGrp zpci_group;
>       int id;
> 

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>


-- 
Pierre Morel
IBM Lab Boeblingen

