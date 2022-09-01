Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082405A947A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:47 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThNN-0001vs-L0
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgTF-0006C9-ID; Thu, 01 Sep 2022 05:26:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgTD-00018u-QW; Thu, 01 Sep 2022 05:26:45 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2818oT8c007734;
 Thu, 1 Sep 2022 09:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=sOytjsqzfmEcObdz2FSM1YU0ErQZUJJ8KIFlTQyLpOs=;
 b=j5zJWoDU4EpFQneVdjOCwclAwY3YFeLqfRBu2CaHLIlI7qVCnw3MXlhHl6nr3QK0PKpm
 dgnkJ5qsTVQRVzgfcV5hdteZkgzT3HiQevBKn9h5T2pT0Fw9SooN4EJODw6VYGOht9WD
 4xg4IrtG/G14VPXkVrTb+oa8lJpct2sThxR+6l6XUP1PUE5HTclFdTdzEIbd5WJB/8K9
 T1aAYpjHjaq1/dvf7ushJZHtX/+ijWf4cIEwYUw+7OAexxM4K72j0lll4oCMBpJqCnYp
 vIhqFhEhAzwjW33c3RTq8kqB+UuUg5OIumzoXDlqoycBYU5gce05PuMdKieqqBJaVN7p gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jask198ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:26:42 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2818qIuH017881;
 Thu, 1 Sep 2022 09:26:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jask198bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:26:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2819LlnX028820;
 Thu, 1 Sep 2022 09:26:39 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3j7aw96h00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:26:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2819QaaL26083710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Sep 2022 09:26:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E73B1A4053;
 Thu,  1 Sep 2022 09:26:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C3F9A4040;
 Thu,  1 Sep 2022 09:26:35 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.6.152]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Sep 2022 09:26:35 +0000 (GMT)
Message-ID: <63a479b6992d87dea9dcee3d7badebcf21bd7753.camel@linux.ibm.com>
Subject: Re: [PATCH v5 16/18] s390x: Introduce PV query interface
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Thu, 01 Sep 2022 11:26:35 +0200
In-Reply-To: <20220811121111.9878-17-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-17-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tWCFtntqa45vD8KWIeTb6Zq-Psl0qQE6
X-Proofpoint-GUID: bZmS4UfMleTYxs8ZgE6qDwsWs0pj_-4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010040
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

On Thu, 2022-08-11 at 12:11 +0000, Janosch Frank wrote:
> Introduce an interface over which we can get information about UV data.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

With the below fixed:
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

> ---
>  hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
>  hw/s390x/s390-virtio-ccw.c |  6 ++++
>  include/hw/s390x/pv.h      | 10 +++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 401b63d6cb..2b892b45e8 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -20,6 +20,11 @@
>  #include "exec/confidential-guest-support.h"
>  #include "hw/s390x/ipl.h"
>  #include "hw/s390x/pv.h"
> +#include "target/s390x/kvm/kvm_s390x.h"
> +
> +static bool info_valid;
> +static struct kvm_s390_pv_info_vm info_vm;
> +static struct kvm_s390_pv_info_dump info_dump;
>  
>  static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
>  {
> @@ -56,6 +61,42 @@ static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
>      }                                  \
>  }
>  
> +int s390_pv_query_info(void)
> +{
> +    struct kvm_s390_pv_info info = {
> +        .header.id = KVM_PV_INFO_VM,
> +        .header.len_max = sizeof(info.header) + sizeof(info.vm),
> +    };
> +    int rc;
> +
> +    /* Info API's first user is dump so they are bundled */
> +    if (!kvm_s390_get_protected_dump()) {
> +        return 0;
> +    }
> +
> +    rc = s390_pv_cmd(KVM_PV_INFO, &info);
> +    if (rc) {
> +        error_report("KVM PV INFO cmd %x failed: %s",
> +                     info.header.id, strerror(rc));

Should be strerror(-rc).

> +        return rc;
> +    }
> +    memcpy(&info_vm, &info.vm, sizeof(info.vm));
> +
> +    info.header.id = KVM_PV_INFO_DUMP;
> +    info.header.len_max = sizeof(info.header) + sizeof(info.dump);
> +    rc = s390_pv_cmd(KVM_PV_INFO, &info);
> +    if (rc) {
> +        error_report("KVM PV INFO cmd %x failed: %s",
> +                     info.header.id, strerror(rc));

Same here.

> +        return rc;
> +    }
> +
> +    memcpy(&info_dump, &info.dump, sizeof(info.dump));
> +    info_valid = true;
> +
> +    return rc;
> +}
> +
> 
[...]


