Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80BB2B317A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 00:46:52 +0100 (CET)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ke5Fs-00048L-1H
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 18:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ke5Df-0002eH-CG
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 18:44:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58880
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ke5Dd-0005EB-6o
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 18:44:35 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AENW9wu145375; Sat, 14 Nov 2020 18:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Zj/MktW8gtnGIysDP8YmYzZHMyDSir8RZcFVXYuR3/E=;
 b=Qk6G1utls8mKMapIiaLPCY2fZH+xOtxmyH1kMqxselB73ABR/GYnRgT1nSU2Ju5SNqHA
 C898liMbwx7u9ws/ZmVbvoG3rPQfQ83DRkt7CMZao8gA8MUt3SDQtarhY7C5DzVoVAHH
 Z6ZHkuzKq1zjHD2bS6s58jOwcSeFDIS6KzeKGIhpX9LT1UG7TUOJtU8qTAqaR6qJrujd
 3DD6Gs3VMN7c9AleE0XlpFUPrTqNI0qiA+gfSAnMdhbyPs1is8feg7f+bYIo9AaepXOx
 7CeLZCOhy+wyXX8z+8GqwO6OFU6uv9cup2C0wWVfpS7tWgrA+wsvso85dpBZki53vNMJ 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34tc8hcdvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 18:44:30 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AENiUum173227;
 Sat, 14 Nov 2020 18:44:30 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34tc8hcdvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 18:44:30 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AENgavL003918;
 Sat, 14 Nov 2020 23:44:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 34t6v9e0ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 23:44:29 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AENiMB543778358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Nov 2020 23:44:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47589BE053;
 Sat, 14 Nov 2020 23:44:28 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DB87BE04F;
 Sat, 14 Nov 2020 23:44:27 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 14 Nov 2020 23:44:27 +0000 (GMT)
Subject: Re: [PATCH 1/4] configure: Fix the _BSD_SOURCE define for the Haiku
 build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-2-thuth@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <60928711-0d58-7dd4-7c41-0951793ca2fe@linux.ibm.com>
Date: Sat, 14 Nov 2020 18:44:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201114165137.15379-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-14_09:2020-11-13,
 2020-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011140156
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 18:43:21
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>, kraxel@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/20 11:51 AM, Thomas Huth wrote:
> The Haiku VM that we are going to add is using _BSD_SOURCE instead
> of BSD_SOURCE (without initial underscore)... according to David
> Carlier, the BSD_SOURCE without underscore was likely a typo, so
> let's simply add the underscore there now.
> This fixes the build failure with the bswapXX() macros not being
> defined after including <endian.h>.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 4cef321d9d..a273a93377 100755
> --- a/configure
> +++ b/configure
> @@ -790,7 +790,7 @@ SunOS)
>   ;;
>   Haiku)
>     haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -DBSD_SOURCE $QEMU_CFLAGS"
> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
>   ;;
>   Linux)
>     audio_drv_list="try-pa oss"

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com


