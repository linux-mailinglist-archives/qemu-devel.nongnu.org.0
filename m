Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818886E4084
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:17:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJ5j-00056v-VN; Mon, 17 Apr 2023 03:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJ5f-00055y-Ar; Mon, 17 Apr 2023 03:15:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJ5c-0005Dg-K9; Mon, 17 Apr 2023 03:15:55 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H60i0j032477; Mon, 17 Apr 2023 07:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=59f23pkNxju214uep7G1ALCRVvXtZRs2B0+hpx/j7uo=;
 b=SN6iWjKnxJKPid9dGzUa2ckbBQs79zuVR2XJl/YAGpIo2XE+ywj0lyIP6sZntarLZR9Q
 in4xAI7/YEWT5qAE9JHambDjJ/JQgDDjBsvIFgXQmwEqQI5jtFei74ROha79SDVDH0P/
 UxJqsCQ09Bbxr26wys2Ddvq0yD51ioXBaVScG7TNvivy64Jz2vRDr4MLScFnlp78i22z
 rgFbibVKT4afrR+dZ6yUytJ7uxV2X38Jn0kjJwRnW+lpTIAvXifBT6obpRg12BjY1Gyc
 w8XxZuc5jZCbfwBxqw4d4w9AOgM0nP1XIlbIuLbow+94GlmKGQOMblaBGKLIbgvoDZn+ sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0f3m1exc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:15:49 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H6NdJo032164;
 Mon, 17 Apr 2023 07:15:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0f3m1ex5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:15:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H3UPgP024283;
 Mon, 17 Apr 2023 07:15:48 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3pykj79pg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:15:48 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H7FlDp20775498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 07:15:47 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C4775805F;
 Mon, 17 Apr 2023 07:15:47 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD30D58053;
 Mon, 17 Apr 2023 07:15:45 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Apr 2023 07:15:45 +0000 (GMT)
Message-ID: <e8fd0543-c87b-1cb0-8d65-4101c98186b2@linux.ibm.com>
Date: Mon, 17 Apr 2023 12:45:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] ppc: spapr: assert early rather late in
 h_enter_nested()
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-4-harshpb@linux.ibm.com> <87sfd2ispa.fsf@suse.de>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87sfd2ispa.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nv90r2lptFac6MwQxxc5qOCYxqNhACpo
X-Proofpoint-GUID: c-bJTjhrh3y654ziAosOF-khnnDb8NcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_03,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=845 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/14/23 17:25, Fabiano Rosas wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
> 
>> Currently, it asserts very late in the code flow if lpid is already initialized.
> 
> That's not about initializing. It is about making sure the LPIDR is
> 0. Which has a specific meaning according to the ISA.
> 
Yes, I could rephrase the commit log, but I am okay with your below 
suggestion for now.

>> Ideally, it should assert in the beginning if that is the case. This patch
>> brings assert check in the beginning alongwith the related initialization.
>>
> 
> Maybe just leave it where it is. There's not much to gain from moving this.
> 
Will drop this change for now as value-add is relatively lesser.

