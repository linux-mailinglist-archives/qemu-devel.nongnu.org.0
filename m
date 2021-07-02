Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F33BA06C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:32:25 +0200 (CEST)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzILI-0005D0-HC
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lzIIv-0004OE-HC
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:29:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60676
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lzIIs-0006Qu-MW
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:29:57 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162CEJ8Q155928; Fri, 2 Jul 2021 08:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=I9MxyPK8Nb2RZ7/azsZjHOLcKZcJdiU2z65S4/7a15s=;
 b=l42rz+7Jlva5fMM2NLnRZWg7WFnVMLsORuUzG1tuTuidDED8zba6IkcRhTBqlQ/cEcvJ
 9NaEGmLySJqoI1UYY9vzvudKbf5UcJWQjxUA1RkgsdAgFzfyuV0hnEGyCmXLUgupqPYp
 VeaIFoIsxuKjTJTEpOKiODjQMii2aW0klQmJuC/1YcxorVD41iH8iMGmDiJQon5ego6q
 NW8zpt2r+Nk5W8l7+5GZ7lxA67LogUoZQrQd0Y8h5ewPGLM+13xnxuMLQl+SCNi/bLOI
 Qrvr8UeSiPJLweg3JjXNCy1OzV6V2CwM2bgJOHDmmQszX4PUvWQqOs2Yd3i5lyZLjOcG ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39j2mdgdky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 08:29:50 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 162CRZCF025934;
 Fri, 2 Jul 2021 08:29:50 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39j2mdgdka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 08:29:49 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162CTmWZ019592;
 Fri, 2 Jul 2021 12:29:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 39duv8hh4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 12:29:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162CTipv26935676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 12:29:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD289A405E;
 Fri,  2 Jul 2021 12:29:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2733FA4055;
 Fri,  2 Jul 2021 12:29:40 +0000 (GMT)
Received: from [9.65.220.2] (unknown [9.65.220.2])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 12:29:39 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <20210624102040.2015280-2-dovmurik@linux.ibm.com>
 <a8af0753-9344-37ee-bf90-cc093680d6f9@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <498834f7-c0e5-dbbe-8097-0920eb4ed55a@linux.ibm.com>
Date: Fri, 2 Jul 2021 15:29:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a8af0753-9344-37ee-bf90-cc093680d6f9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mC74h-9JYOjcISsQq6GiVrlViH5v-oyU
X-Proofpoint-GUID: ZWMLLMMcF5dG4AVwrOmcvjb6wCoqjftf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_04:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020065
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 01/07/2021 20:23, Connor Kuehl wrote:
> On 6/24/21 3:20 AM, Dov Murik wrote:
>> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
>> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
>> table area.  For this to work, OVMF must support an encrypted area to
>> place the data which is advertised via a special GUID in the OVMF reset
>> table.
>>
>> The hashes of each of the files is calculated (or the string in the case
>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>> table is GUID identified and since they're passed through the
>> sev_encrypt_flash interface, the hashes will be accumulated by the PSP
>> measurement (SEV_LAUNCH_MEASURE).
>>
>> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> 

Thanks, Connor!

-Dov

