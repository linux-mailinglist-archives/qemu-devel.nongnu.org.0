Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A404BD9DE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:17:05 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Yq-0003jo-UD
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nM7mJ-0002Ty-Va; Mon, 21 Feb 2022 07:26:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nM7mF-0005ms-Df; Mon, 21 Feb 2022 07:26:53 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LBlfWS023408; 
 Mon, 21 Feb 2022 12:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=U5IOU4qbOm1Mi7v9E81brHyZYnmfljB6UUiWZ24r9/g=;
 b=DucOlmvxTM/D9is+j5n4TWt8aTAvrg4G9ZNw+5qiqLtQi7w57KfCA1LCzDOHDIQbxp6L
 xIN1qggPWVsJminGUZobquVKs3TPV+RJL5zvbuj5bBqO8CR37cLgHY0dFFHO5Qc6HH45
 HroldOq0IWCV47aHu7XUtYGuB4Dvkv/0y73pgdm2B5eD5cFQ9TkB/goOglWheSW3V+r7
 msCUcikkghAgnrH/+5PsGSw0dSqU8Id28akq/M1ASmXYG9vh/3B/bYTWo/vtKo+CaLwW
 iuc1idsa/lcoisQbVhgiPc+VM34wAZt0MV1U4zh4QkZ6VpeL3MyVU6nPTKPFy9VVh8GQ oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eca668s5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 12:26:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LCOZTl031783;
 Mon, 21 Feb 2022 12:26:39 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eca668s4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 12:26:39 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LCIxlK017069;
 Mon, 21 Feb 2022 12:26:36 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ear68tbf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 12:26:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LCQUSC29753738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 12:26:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 575BF4C040;
 Mon, 21 Feb 2022 12:26:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAD054C044;
 Mon, 21 Feb 2022 12:26:29 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.53.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Feb 2022 12:26:29 +0000 (GMT)
Date: Mon, 21 Feb 2022 13:26:27 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado/machine_s390_ccw_virtio: Adapt test to
 new default resolution
Message-ID: <20220221132627.78bbe5f2.pasic@linux.ibm.com>
In-Reply-To: <20220221101933.307525-1-thuth@redhat.com>
References: <20220221101933.307525-1-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yp4S2RsD89YqbQpiv_M7P9Z-XnGGSW-m
X-Proofpoint-ORIG-GUID: VeUPE13aD-hnXrjECEBGoqiJReX4BTpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_06,2022-02-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210072
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Farman <farman@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 11:19:33 +0100
Thomas Huth <thuth@redhat.com> wrote:

> QEMU's default screen resolution recently changed to 1280x800, so the
> resolution in the screen shot header changed of course, too.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: de72c4b7cd ("edid: set default resolution to 1280x800 (WXGA)")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Looks good!

Acked-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  tests/avocado/machine_s390_ccw_virtio.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
> index bd03d7160b..438a6f4321 100644
> --- a/tests/avocado/machine_s390_ccw_virtio.py
> +++ b/tests/avocado/machine_s390_ccw_virtio.py
> @@ -248,7 +248,7 @@ def test_s390x_fedora(self):
>              line = ppmfile.readline()
>              self.assertEqual(line, b"P6\n")
>              line = ppmfile.readline()
> -            self.assertEqual(line, b"1024 768\n")
> +            self.assertEqual(line, b"1280 800\n")
>              line = ppmfile.readline()
>              self.assertEqual(line, b"255\n")
>              line = ppmfile.readline(256)


