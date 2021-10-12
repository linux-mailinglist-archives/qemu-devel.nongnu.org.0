Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551142B07D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 01:41:43 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maROw-000573-Jh
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 19:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1maRLo-0004Oh-A7; Tue, 12 Oct 2021 19:38:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1maRLl-0000lw-9Y; Tue, 12 Oct 2021 19:38:27 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CN1WK8021116; 
 Tue, 12 Oct 2021 19:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EEM6zTkW1SWinoubHuYVugCPiwC5tF9kVuNAAizU7n8=;
 b=FcgInuR8rYSztUfzSF8F3PHsmHJ++Z6qCiIKiDU7lvNwor0kRM/ODG0PyY0oc+5NUrvk
 EeX4Cp7ZwBtmGTQxl7/hIb4bj2wVhe0lep8R11LKmEXiSSEFSyw1OOPSndSn0Sagjzqd
 0vcZhG+q1jtSrVrUQ+sxCR/puxiOGqH21cqUUaJpcKxtfWpjALEZDR06UIui26rNs2zv
 BttgGB1Z3MEv+MoIlieLf3RuTAPD1fqGJlc3umJ9BFtfsPXhZ+C0hQQWFEUHteIGWyH1
 L3YnIIgNQKy9aDnck9uRY3zM7O4Cxeh/guos84f60tsyqNMeNPbiCVj7yE6EqoyXufPE Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnkp28kbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 19:38:19 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19CNcJH5007327;
 Tue, 12 Oct 2021 19:38:19 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnkp28kbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 19:38:19 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19CNbPC5015058;
 Tue, 12 Oct 2021 23:38:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3bk2qbvqqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 23:38:18 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19CNcHuC26739126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 23:38:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80314AC05B;
 Tue, 12 Oct 2021 23:38:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD6CEAC05F;
 Tue, 12 Oct 2021 23:38:15 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com (unknown
 [9.163.14.117]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Oct 2021 23:38:15 +0000 (GMT)
Subject: Re: [PATCH 1/3] vfio-ccw: step down as maintainer
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20211012144040.360887-1-cohuck@redhat.com>
 <20211012144040.360887-2-cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <c0100043-8e95-c2b8-5791-6a56e6500c10@linux.ibm.com>
Date: Tue, 12 Oct 2021 19:38:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211012144040.360887-2-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vk1LEqcvx4gE2ZOUX4PKVHBQv2PlGo7U
X-Proofpoint-GUID: SRYGvadh6JDRTijCve_mHyzHVwgAxXh9
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_07,2021-10-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120126
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 10:40 AM, Cornelia Huck wrote:
> I currently don't have time to act as vfio-ccw maintainer anymore,
> so remove myself there.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Once again, thanks for all of your work on vfio-ccw.

Acked-by: Matthew Rosato <mjrosato@linux.ibm.com>

> ---
>   MAINTAINERS | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f50..14d131294156 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1862,7 +1862,6 @@ F: docs/igd-assign.txt
>   F: docs/devel/vfio-migration.rst
>   
>   vfio-ccw
> -M: Cornelia Huck <cohuck@redhat.com>
>   M: Eric Farman <farman@linux.ibm.com>
>   M: Matthew Rosato <mjrosato@linux.ibm.com>
>   S: Supported
> @@ -1870,7 +1869,6 @@ F: hw/vfio/ccw.c
>   F: hw/s390x/s390-ccw.c
>   F: include/hw/s390x/s390-ccw.h
>   F: include/hw/s390x/vfio-ccw.h
> -T: git https://gitlab.com/cohuck/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
>   
>   vfio-ap
> 


