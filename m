Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC783D8CEA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 13:40:52 +0200 (CEST)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8hvf-0005Xp-5C
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 07:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1m8hsM-0004JF-Tb
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:37:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1m8hsL-0001EX-3U
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:37:26 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SBZL7Y142241; Wed, 28 Jul 2021 07:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JmcSy3fnHrna0aOQbfXOLePQBJGeaA568WkmOAC5fA4=;
 b=slPp/ZJjAXEfjRD8ekEaiF0t43MqIHNV+zTrFIBbNkCSDbIXrtX1k4p7s5YKhQTmgVRh
 mlhoP+O0ETe4ee7wEe+W56jVknVEr749WQx2frNZe0cCDRgGUVjO0J/F508Dt8phTlH5
 eEj8AQ8tlGmaxamPag8dx46H16iw/ZyhN36F/YPzvWWTEaP3HO+UMyGNX0oOMHXSQBMK
 vpmUeDYM1jJeVGLoziQojUNEKy0qx6XMeWOe09XQHFEPAFpzfmTTC7LH+RMdoYdFGfio
 3XI5bBpWExqy+HNt8Yi0hhDlup2wA2+3eWy5qEoSAQ6EPCZ/euKCfc/dpNUBj59yTu1g 7g== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a36g8851y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 07:37:16 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SBUJZm009155;
 Wed, 28 Jul 2021 11:37:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3a235krnnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 11:37:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16SBYSX222544830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 11:34:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9062842042;
 Wed, 28 Jul 2021 11:37:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FC4C4204B;
 Wed, 28 Jul 2021 11:37:07 +0000 (GMT)
Received: from sig-9-145-77-113.uk.ibm.com (unknown [9.145.77.113])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Jul 2021 11:37:07 +0000 (GMT)
Message-ID: <9f0b0c165529b972566948b3a1484f3c35a4e343.camel@linux.ibm.com>
Subject: Re: [PATCH PING] tests/tcg/linux-test: Fix random hangs in test_socket
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>
Date: Wed, 28 Jul 2021 13:37:06 +0200
In-Reply-To: <20210601142030.3129967-1-iii@linux.ibm.com>
References: <20210601142030.3129967-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oQQRzHHV6mnx_-q4wF0m8MdrQZri3bdH
X-Proofpoint-ORIG-GUID: oQQRzHHV6mnx_-q4wF0m8MdrQZri3bdH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_07:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280064
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-01 at 16:20 +0200, Ilya Leoshkevich wrote:
> test_socket hangs randomly in connect(), especially when run without
> qemu. Apparently the reason is that linux started treating backlog
> value of 0 literally instead of rounding it up since v4.4 (commit
> ef547f2ac16b).
> 
> So set it to 1 instead.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/multiarch/linux-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/multiarch/linux-test.c
> b/tests/tcg/multiarch/linux-test.c
> index eba07273f7..3b256f6c02 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -263,7 +263,7 @@ static int server_socket(void)
>      sockaddr.sin_port = htons(0); /* choose random ephemeral port)
> */
>      sockaddr.sin_addr.s_addr = 0;
>      chk_error(bind(fd, (struct sockaddr *)&sockaddr,
> sizeof(sockaddr)));
> -    chk_error(listen(fd, 0));
> +    chk_error(listen(fd, 1));
>      return fd;
>  
>  }

Hello,

I would like to ping this patch.

Best regards,
Ilya


