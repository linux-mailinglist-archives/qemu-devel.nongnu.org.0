Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB39466BAD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 22:29:11 +0100 (CET)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mstdd-0003Ll-Mj
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 16:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mstbw-0002Mg-CH; Thu, 02 Dec 2021 16:27:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mstbu-00053m-HQ; Thu, 02 Dec 2021 16:27:24 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2Kl6hD028944; 
 Thu, 2 Dec 2021 21:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JvgE73Flod2vImF+1kHKZ1/ZQq+VrunwtuargogKmxg=;
 b=UQX5adWeqyKepbGiRWXKq0cKXhQksjeECH/6ooKC2ZpLwfnpKh1YpoDFBTm9EQlcLfqR
 uz/d+DwkQkJfLf6gx2xQM1ifPbFzuZptfSa9L+pFl/NcyVCtcWT//eK4AGpKSwz9/cMM
 1Gv0wB7mX5UJIKdZZxZXR9TBynMwNo97iRoar4N9YFTjqEfNzseGcR0vGauJK3ixfgvt
 opXs9yfSEHMTnzMFVIS/gRrPbTNHlOFvPKfAcO2qRIMSfcgRDYgoVKrzW+dSejgp9WAc
 +ltV3c/ffCyXfQ7p2o4wbwtbwi5FiMSjqH/fopb6DPWNsFMaYlANvPlokPgXWKLNfmqx bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq5g28x03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:27:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2L2HWZ028765;
 Thu, 2 Dec 2021 21:27:13 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq5g28wyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:27:13 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2LP65t010980;
 Thu, 2 Dec 2021 21:27:12 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3ckcadvgfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 21:27:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2LRAAN33817268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 21:27:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A42CB78060;
 Thu,  2 Dec 2021 21:27:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE1E67805E;
 Thu,  2 Dec 2021 21:27:09 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.70.80])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 21:27:09 +0000 (GMT)
Message-ID: <14cc9dd7d9421c8fbbf7eeb56162ceddcd83e918.camel@linux.ibm.com>
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 02 Dec 2021 16:27:08 -0500
In-Reply-To: <20211202164110.326947-2-mjrosato@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tfc_9ifwkbsKlXGpQGTVa9-AvJaHSCrW
X-Proofpoint-GUID: pnh_qEi_FqutPmO7I44xlH30LasUL6v5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_14,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
> The current default PCI group being used can technically collide with
> a
> real group ID passed from a hostdev.  Let's instead use a group ID
> that comes
> from a special pool that is architected to be reserved for simulated
> devices.
> 
> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Regardless of the question regarding virtio migration, this is good.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  include/hw/s390x/s390-pci-bus.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-
> pci-bus.h
> index aa891c178d..2727e7bdef 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -313,7 +313,7 @@ typedef struct ZpciFmb {
>  } ZpciFmb;
>  QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in
> ZpciFmb");
>  
> -#define ZPCI_DEFAULT_FN_GRP 0x20
> +#define ZPCI_DEFAULT_FN_GRP 0xFF
>  typedef struct S390PCIGroup {
>      ClpRspQueryPciGrp zpci_group;
>      int id;


