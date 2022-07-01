Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BD563638
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 16:54:36 +0200 (CEST)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7I2U-0006RC-Py
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7I0z-0005Mp-1g; Fri, 01 Jul 2022 10:53:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7I0x-00016i-2L; Fri, 01 Jul 2022 10:53:00 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261EhUnm014201;
 Fri, 1 Jul 2022 14:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=F/Q3aYw8m4UBHDNJ7Cr+KDlXd6hbTZddhKg74U34j7k=;
 b=CGQTGqiyChvvRdyPZ4Uju0sN6cgh6tniEiSW/mvShRzfNN9QQTUoMCtfxCvu6OwgP+fc
 Wv3kEmDEwhavfgbOmxP3LiFDCyOVmAxZQhy4Sj66gRPwkWRk2qCyC55owlM43UguFsTo
 +bLy28mHNQACofAUrqw6Pab7j33f4DUCc3HEzZ2YetfMEnYzpxa+aiCXpPjJdsd3K2dX
 iu/z6vszN/Mvdx2LLFaQI9zGDsma0lu4Cn+WNfGRJImu2Hmrj//xdIfSsSmUyPrCKlKQ
 k/cEq6H7z3rmbqaV7FmFeqCpNvxhhONw0SFHOMd2NSYOzv5DUx5XRyJDG/YeyuK8AzLs eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h22xb0d08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:52:55 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261Ei2C3015577;
 Fri, 1 Jul 2022 14:52:54 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h22xb0cyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:52:54 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261EoAJ0030969;
 Fri, 1 Jul 2022 14:52:53 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3gwt0aab8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:52:53 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261EqqEi34996712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 14:52:52 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0A9CC606C;
 Fri,  1 Jul 2022 14:52:52 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01EA6C605B;
 Fri,  1 Jul 2022 14:52:52 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 14:52:51 +0000 (GMT)
Message-ID: <bff554758794f512252a4ee8cdacd1729c2b045f.camel@linux.ibm.com>
Subject: Re: [PATCH 01/12] pc-bios/s390-ccw: Add a proper prototype for main()
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 10:52:51 -0400
In-Reply-To: <20220628131032.213986-2-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-2-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1KhnzXIfz77vZ6TDKmRfvDpOm_gzeH9p
X-Proofpoint-GUID: Jim_JLMwcxtldvcwD4_PUyrgFktVJ_hG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010056
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Tue, 2022-06-28 at 15:10 +0200, Thomas Huth wrote:
> Older versions of Clang complain if there is no prototype for main().
> Add one, and while we're at it, make sure that we use the same type
> for main.c and netmain.c - since the return value does not matter,
> declare the return type of main() as "void".
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  pc-bios/s390-ccw/s390-ccw.h | 1 +
>  pc-bios/s390-ccw/main.c     | 3 +--
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-
> ccw.h
> index 79db69ff54..b88e0550ab 100644
> --- a/pc-bios/s390-ccw/s390-ccw.h
> +++ b/pc-bios/s390-ccw/s390-ccw.h
> @@ -57,6 +57,7 @@ void write_subsystem_identification(void);
>  void write_iplb_location(void);
>  extern char stack[PAGE_SIZE * 8]
> __attribute__((__aligned__(PAGE_SIZE)));
>  unsigned int get_loadparm_index(void);
> +void main(void);
>  
>  /* sclp.c */
>  void sclp_print(const char *string);
> diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
> index 5d2b7ba94d..835341457d 100644
> --- a/pc-bios/s390-ccw/main.c
> +++ b/pc-bios/s390-ccw/main.c
> @@ -281,7 +281,7 @@ static void probe_boot_device(void)
>      sclp_print("Could not find a suitable boot device (none
> specified)\n");
>  }
>  
> -int main(void)
> +void main(void)
>  {
>      sclp_setup();
>      css_setup();
> @@ -294,5 +294,4 @@ int main(void)
>      }
>  
>      panic("Failed to load OS from hard disk\n");
> -    return 0; /* make compiler happy */
>  }


