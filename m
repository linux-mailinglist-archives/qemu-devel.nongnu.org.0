Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4B48E4D8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:24:14 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GwX-0008Dn-Do
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1n8GKa-0005pL-HX; Fri, 14 Jan 2022 01:45:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48842
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1n8GKY-0006CD-Au; Fri, 14 Jan 2022 01:45:00 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20E5pADN004909; 
 Fri, 14 Jan 2022 06:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HL40AwSIHjq/3A/maSXVjmrtAyAqTyBkR8eJka3EpfA=;
 b=AIPmQi66JKeSq8KvzAAAf0mF990i7H47FjUfp9WHJNAwkxUn5rYZGwRfm1L7rch1mG+a
 4qGNv/xeP3cWOlanOd129EX9WWl00x77gaAmyfidnhwrqK4nGzItF0+iREPJ54arqO0W
 X1S+vXsibSiUndgi94nWcFksoHcXapfBR5IXhQrm/VW9RS9ll6yUpB3C0uRQQEsi6ufn
 DNVrlBQZQCQZnXQH9shy71EDbVZ0ldUlCaUIxRnA8OOtOEwffaCPwxNoR4MA13/xbLn9
 pV/YPs5Vk1FVUaZgKozepCuI/QjRxcrXgHhNFBMhn5H0wrlm1VxQ0FolRdRqP+KVTGOq 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dk3d30sge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 06:44:53 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20E6fWI0019492;
 Fri, 14 Jan 2022 06:44:53 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dk3d30sfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 06:44:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20E6coBr012674;
 Fri, 14 Jan 2022 06:44:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3df28abwf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 06:44:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20E6ZfXv36569454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 06:35:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B65EA4051;
 Fri, 14 Jan 2022 06:44:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF0AAA404D;
 Fri, 14 Jan 2022 06:44:47 +0000 (GMT)
Received: from [9.171.88.24] (unknown [9.171.88.24])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jan 2022 06:44:47 +0000 (GMT)
Message-ID: <2aa30d2d-4b6d-c022-f21e-2e877387e244@linux.ibm.com>
Date: Fri, 14 Jan 2022 07:44:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH] MAINTAINERS: Add myself to s390 I/O areas
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211222105548.356852-1-cohuck@redhat.com>
 <20220112164044.2210508-1-farman@linux.ibm.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220112164044.2210508-1-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n79m73P250EAmimLTGLWcxFYDnzWObe4
X-Proofpoint-ORIG-GUID: ZKEbSk2Hq18jJfdUm4lG-EaaD2GcsupR
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_02,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201140045
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 12.01.22 um 17:40 schrieb Eric Farman:
> After the recent restructuring, I'd like to volunteer to help
> in some of the s390 I/O areas.
> 
> Built on "[PATCH RFC v2] MAINTAINERS: split out s390x sections"
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>

Thanks a lot Eric
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d37b0eec5..343f43e83d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1521,6 +1521,7 @@ S390 Machines
>   S390 Virtio-ccw
>   M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/
>   F: include/hw/s390x/
> @@ -1551,6 +1552,7 @@ L: qemu-s390x@nongnu.org
>   S390 channel subsystem
>   M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/ccw-device.[ch]
>   F: hw/s390x/css.c
> @@ -1975,6 +1977,7 @@ T: git https://github.com/stefanha/qemu.git block
>   virtio-ccw
>   M: Cornelia Huck <cohuck@redhat.com>
>   M: Halil Pasic <pasic@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/virtio-ccw*.[hc]
>   F: hw/s390x/vhost-vsock-ccw.c

