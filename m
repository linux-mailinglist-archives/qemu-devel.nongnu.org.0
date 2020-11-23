Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503332C00BB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 08:41:43 +0100 (CET)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh6Tk-0005NK-HE
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 02:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kh6Rk-0004uj-Ky; Mon, 23 Nov 2020 02:39:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kh6Ri-0004ob-GC; Mon, 23 Nov 2020 02:39:36 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AN7WjJ4151864; Mon, 23 Nov 2020 02:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tFNLDboKIDxCJKt0YCDy6XglL+IyPA2QMTMybfGhTdY=;
 b=RL4QM5BKQh0xAFvEy1WSKUJjcSlNZddNy03OFwzFBNKRyM/wAytRl4uw3nMrM9/wGNk9
 P8qgeiJ/2QazvnlafhTFs9Gv6kHOTlkOZuD3RtIMmYx5rcD4+JdU+nlOiBdsj5ENBq51
 jO8AaZniFRPBuyeI7Eb1c9jXqloxbMQMzrtXSCr5+95cegY1z45VNzwcAaDGuvksDIXs
 o7esJJUC4YHjSwm3juovsXiPsSq7zQLi4+IzhEKsidZgJ/Hnk4+j5f1WhhM18SYLQwqA
 RR9i23jqfKRi43MjdqtmhUQi7eKXL5qwkRlL9pg4kQ5X7zgVVDckpp4P2xzTuMv470kE 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34yvnrddx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 02:39:28 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AN7XaPo157163;
 Mon, 23 Nov 2020 02:39:28 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34yvnrddw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 02:39:28 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AN7WWjf026829;
 Mon, 23 Nov 2020 07:39:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 34xt5ha828-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 07:39:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AN7dNMF60555524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 07:39:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A16B4C04E;
 Mon, 23 Nov 2020 07:39:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE064C044;
 Mon, 23 Nov 2020 07:39:22 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.54.238])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Nov 2020 07:39:22 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] pc-bios: s390x: Clear out leftover S390EP string
To: Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20201120160117.59366-1-farman@linux.ibm.com>
 <20201120160117.59366-3-farman@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e29df739-baca-cd0a-d1d9-a690c0238ca4@de.ibm.com>
Date: Mon, 23 Nov 2020 08:39:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201120160117.59366-3-farman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-20,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230052
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Jason Herne <jjherne@linux.ibm.com>, qemu-s390x@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.11.20 17:01, Eric Farman wrote:
> A Linux binary will have the string "S390EP" at address 0x10008,
> which is important in getting the guest up off the ground. In the
> case of a reboot (specifically chreipl going to a new device),
> we should defer to the PSW at address zero for the new config,
> which will re-write "S390EP" from the new image.
> 
> Let's clear it out at this point so that a reipl to, say, a DASD
> passthrough device drives the IPL path from scratch without disrupting
> disrupting the order of operations for other boots.
> 
> Rather than hardcoding the address of this magic (again), let's
> define it somewhere so that the two users are visibly related.


Hmmm, this might have side effects, e.g. if you do something like a kdump
or kexec to a non-Linux binary that happens to have code at 0x10008, no?

As far as I can tell, the problem should only happen for a ccw type IPL
so why not

[...]
> --- a/pc-bios/s390-ccw/main.c
> +++ b/pc-bios/s390-ccw/main.c
> @@ -178,6 +178,12 @@ static void boot_setup(void)
>      memcpy(lpmsg + 10, loadparm_str, 8);
>      sclp_print(lpmsg);
>  
> +    /*
> +     * Clear out any potential S390EP magic (see jump_to_low_kernel()),
> +     * so we don't taint our decision-making process during a reboot.
> +     */
> +    memset((char *)S390EP, 0, 6);


move this into find_subch
in here:
------------- snip ---------------
            case CU_TYPE_DASD_3990:
            case CU_TYPE_DASD_2107:
                return true;
------------- snip ---------------


