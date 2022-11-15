Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB70629375
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 09:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ourVv-0006u6-G2; Tue, 15 Nov 2022 03:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1ourVo-0006tu-JC; Tue, 15 Nov 2022 03:41:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1ourVm-0003By-KA; Tue, 15 Nov 2022 03:41:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AF8QrNV032193; Tue, 15 Nov 2022 08:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2BlyJSShgsbVtaeDribgRnV1+X0LLOV998cktPSjMAs=;
 b=F9h8Bl9Nr64QdntCHjrtzHU8WzTNPYsBhH2gXapmoYxlLD3FuIs4EhIk68jFEPnp7hC8
 RqoM9QiuIBN5tTSQHV3Mof0rhZEC5JxF/ww/HgqPUxuibWJNO0X3dMq/C7xfqUYNj/nq
 pwAkdhuTYPUuRtQ/Cw3efmc22dqb72iQ3UdOFrdg6GHOeXLMpNRWpXcVjCbdvnHJfo0w
 tkU3FpJOkh2Oi+I8nfX8Z2w6HM7acO/klrCYeCbSgmyuRpybUWzE1qQIENZb0+Z05VrA
 P9gLR4ONr1rGB5TdAc6lWxaMqZcoU1ee5m7tmE3KpGzVMJmjr2YvzwKUDFq8yll5H8SY Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kv792gehb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 08:41:39 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AF8SgAJ036582;
 Tue, 15 Nov 2022 08:41:38 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kv792geg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 08:41:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AF8aGO1029313;
 Tue, 15 Nov 2022 08:41:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3ktbd9jm3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 08:41:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AF8ZZCM48169418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Nov 2022 08:35:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F28B9A405B;
 Tue, 15 Nov 2022 08:41:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9079BA4054;
 Tue, 15 Nov 2022 08:41:32 +0000 (GMT)
Received: from [9.171.74.64] (unknown [9.171.74.64])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Nov 2022 08:41:32 +0000 (GMT)
Message-ID: <a6b76605-b599-1666-293a-4fc70f9ffcdb@linux.ibm.com>
Date: Tue, 15 Nov 2022 09:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] docs/system/s390x: Document the "loadparm" machine
 property
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Collin Walling <walling@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, "Jason J . Herne"
 <jjherne@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20221114132502.110213-1-thuth@redhat.com>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <20221114132502.110213-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GURA-EOPEOl8Gnwe_N2Rnryvpg3rFKPz
X-Proofpoint-ORIG-GUID: edgx5M3KMMg4dxZOBniT3tXxS3_wqRaM
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_04,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211150058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/14/22 14:25, Thomas Huth wrote:
> The "loadparm" machine property is useful for selecting alternative
> kernels on the disk of the guest, but so far we do not tell the users
> yet how to use it. Add some documentation to fill this gap.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2128235
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/system/s390x/bootdevices.rst | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/docs/system/s390x/bootdevices.rst b/docs/system/s390x/bootdevices.rst
> index b5950133e8..40089c35a9 100644
> --- a/docs/system/s390x/bootdevices.rst
> +++ b/docs/system/s390x/bootdevices.rst
> @@ -53,6 +53,32 @@ recommended to specify a CD-ROM device via ``-device scsi-cd`` (as mentioned
>   above) instead.
>   
>   
> +Selecting kernels with the ``loadparm`` property
> +------------------------------------------------
> +
> +The ``s390-ccw-virtio`` machine supports the so-called ``loadparm`` parameter
> +which can be used to select the kernel on the disk of the guest that the
> +s390-ccw bios should boot. When starting QEMU, it can be specified like this::
> +
> + qemu-system-s390x -machine s390-ccw-virtio,loadparm=<string>
> +
> +The first way to use this parameter is to use the word ``PROMPT`` as the
> +``<string>`` here. In that case the s390-ccw bios will show a list of
> +installed kernels on the disk of the guest and ask the user to enter a number
> +to chose which kernel should be booted -- similar to what can be achieved by
> +specifying the ``-boot menu=on`` option when starting QEMU. Note that the menu
> +list will only show the names of the installed kernels when using a DASD-like
> +disk image with 4k byte sectors, on normal SCSI-style disks with 512-byte
> +sectors, there is not enough space for the zipl loader on the disk to store
> +the kernel names, so you only get a list without names here.

I'd suggest splitting the last sentence into two so there's a clear 
separation between DASD and SCSI.

> +
> +The second way to use this parameter is to use a number in the range from 0
> +to 31. The numbers that can be used here correspond to the numbers that are
> +shown when using the ``PROMPT`` option, and the s390-ccw bios will then try
> +to automatically boot the kernel that is associated with the given number.
> +Note that ``0`` can be used to boot the default entry.
> +
> +
>   Booting from a network device
>   -----------------------------
>   


