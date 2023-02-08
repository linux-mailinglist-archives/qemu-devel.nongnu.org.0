Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F568F26C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmkb-00056f-Aj; Wed, 08 Feb 2023 10:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPmkX-00056P-TY
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:52:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPmkW-0000LX-7D
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:52:45 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318FdtKh019536; Wed, 8 Feb 2023 15:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yYB/EUnxXfZs9uOyVmQbvVSjoLt8nNdu6R2x5B9b5lM=;
 b=dSRBHUhJPy3EKVeJyKuMYvPMZumF64Y6+GFkt/p10PrqZ9Pd9bC9Hn6e8V+XJDSUuxSS
 KanV0ne4E7SU421zRsKBUa0e7LtVTm8Cxj3vqy2dP4aKFUoVMuO5OhGIIQvxi9hw1/yP
 C1rl8ZiHshdVEpfx2v+cYlz9ljaPbMvLzxtk3qODcLZfL+rkoyilf/mooAmHFgLpvKxq
 rVuk0re7/wv2ZpQCqd4MdkS26j2biOq3ntS+hAoc8wU0sF01wYfUFITISmng7Oa344rj
 OvQD1q7Hg17iOTLI5Kd0RsrXXtMFnsePqMTaJ/v+bZuPMR1WoVRnrxwvt26yP0lDMmqX jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmdve1jbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:52:38 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318FeIXC020609;
 Wed, 8 Feb 2023 15:52:38 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmdve1jau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:52:38 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318F5LlJ001994;
 Wed, 8 Feb 2023 15:52:37 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3nhf07kfqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:52:36 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 318FqZVi10814094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Feb 2023 15:52:35 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83B6E5805E;
 Wed,  8 Feb 2023 15:52:35 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88E8E58052;
 Wed,  8 Feb 2023 15:52:32 +0000 (GMT)
Received: from [9.160.93.69] (unknown [9.160.93.69])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Feb 2023 15:52:32 +0000 (GMT)
Message-ID: <7ebb1a30-075c-d723-c66f-eaba82fcd578@linux.ibm.com>
Date: Wed, 8 Feb 2023 17:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Dov Murik <dovmurik@linux.ibm.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
 <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
 <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
 <7c4e3018-2f0f-1fd8-45b2-6d72221e9452@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <7c4e3018-2f0f-1fd8-45b2-6d72221e9452@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uij1UwerrJbVHYr1ieOEwCrzYsp4wBPY
X-Proofpoint-GUID: kq2Fp2QGhZtYSWRCUBbakiN_sJEDXev2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080138
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146, SPF_HELO_NONE=0.001,
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



On 08/02/2023 17:49, Dov Murik wrote:
> But I now think there's another bug with the current patches: 
> 
> 
>   /*
>    * Add the NUL terminator, some padding for the microvm cmdline fiddling
>    * hack, and then align to 16 bytes as a paranoia measure
>    */
>   cmdline_size = (strlen(machine->kernel_cmdline) + 1 +
>                   VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
>   /* Make a copy, since we might append arbitrary bytes to it later. */
>   kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
> 
> 
> This code at the beginning of x86_load_linux() will make the cmdline longer.
> So the measurement of the cmdline will change (currently we expect it to be
> the exactly value of the '-append' argument with a terminating '\0' byte).
> This means that the SHA256 that QEMU and OVMF calculate is not the same as
> what the Guest Owner will calculate for a given cmdline.

Tomorrow I'll add debug code that prints the hashes table that QEMU
builds for SEV measured boot, and I'll check whether the hashes stay the
same (for given values of -kernel/-initrd/-append) across the versions
of QEMU.

-Dov

