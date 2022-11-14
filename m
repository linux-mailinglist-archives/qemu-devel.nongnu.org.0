Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EF628DD5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouio5-0000AP-Os; Mon, 14 Nov 2022 18:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1ouifO-0004ue-Us; Mon, 14 Nov 2022 18:15:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1ouZiS-00021T-LG; Mon, 14 Nov 2022 08:41:38 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2AEBomij012036; Mon, 14 Nov 2022 13:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BTAa0mhrEuu9Se28cAj3tQbiUMlIA91v1LxOyvc/j4k=;
 b=ZCHkeYgzZ+Hm4eZlp8d+KxZkEBrPHF/LH06FivacoNAcGinD/JKv9dGq0I9dIfefvFCh
 WQXQeXxPalBT/Xt96P4+eeFY0E75HY/NQ5INvSxYaoPEKpAuLtrNjbrF+z2vKrldD42b
 /cClQSqO9fpQlRWY8yW4jWuj2nXo7Sr3IYp+42zLVqDkgrwehyBhpyhfOZ5kkI8WLq+l
 ezlHZO8BwHEKQNfziQNNXkQZ/T0VEu1AjL1zrg5adtvp4O0W+5RIniNIgTwaY57RRWvT
 OIU+M04pVg3G77dfvwReSG7M+HPF4nqOC+ccbrJHkY7MfFT7/9MCb9U5oKQfYZPCTj4o Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kun5dashn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 13:41:30 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEBrgwt024593;
 Mon, 14 Nov 2022 13:41:29 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kun5dash3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 13:41:29 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEDaJ0G031911;
 Mon, 14 Nov 2022 13:41:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ktbd9hkr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 13:41:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AEDfOEA8847874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Nov 2022 13:41:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E1005204F;
 Mon, 14 Nov 2022 13:41:24 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 400F85204E;
 Mon, 14 Nov 2022 13:41:24 +0000 (GMT)
Date: Mon, 14 Nov 2022 14:41:23 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, Collin Walling <walling@linux.ibm.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, "Jason J . Herne"
 <jjherne@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH] docs/system/s390x: Document the "loadparm" machine
 property
Message-ID: <20221114144123.675e3914@p-imbrenda>
In-Reply-To: <20221114132502.110213-1-thuth@redhat.com>
References: <20221114132502.110213-1-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q93M1jbLXKI6e65orsPa8AR-mraO9ACE
X-Proofpoint-ORIG-GUID: gol_yc9XTAOd7ABntQuCMiWKJ33cszWv
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_11,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140096
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 14 Nov 2022 14:25:02 +0100
Thomas Huth <thuth@redhat.com> wrote:

> The "loadparm" machine property is useful for selecting alternative
> kernels on the disk of the guest, but so far we do not tell the users
> yet how to use it. Add some documentation to fill this gap.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2128235
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  docs/system/s390x/bootdevices.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/docs/system/s390x/bootdevices.rst b/docs/system/s390x/bootdevices.rst
> index b5950133e8..40089c35a9 100644
> --- a/docs/system/s390x/bootdevices.rst
> +++ b/docs/system/s390x/bootdevices.rst
> @@ -53,6 +53,32 @@ recommended to specify a CD-ROM device via ``-device scsi-cd`` (as mentioned
>  above) instead.
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
> +
> +The second way to use this parameter is to use a number in the range from 0
> +to 31. The numbers that can be used here correspond to the numbers that are
> +shown when using the ``PROMPT`` option, and the s390-ccw bios will then try
> +to automatically boot the kernel that is associated with the given number.
> +Note that ``0`` can be used to boot the default entry.
> +
> +
>  Booting from a network device
>  -----------------------------
>  


