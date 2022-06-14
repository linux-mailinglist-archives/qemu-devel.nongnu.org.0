Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15B54B529
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:56:28 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o18u3-0005cg-K7
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o18qf-0004fk-8y; Tue, 14 Jun 2022 11:52:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o18qd-0002d5-JS; Tue, 14 Jun 2022 11:52:56 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EFqiml023064;
 Tue, 14 Jun 2022 15:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DZ6NqJlbFWPZUUr6qoMgkZ7FnbToBYJtV2l2G1OOmso=;
 b=IBMu6r0GD5BcxWImRZCd9+WRA7YVLTKC7TuviKnsxbRSO6Wc1LeG961xNkR98Gy/GWyJ
 +JmD9/3ka86Szkz8XF0l5d+t8g7X5Xwt+hKy00xAaGStzfsVx1hyG6P7tDBLId1imFyS
 onrQsviITg97115l+vVLJVxDmBEExm6BD+nkDKx1Ydf7f0QoUlnPi/HoiDbyJCwEwAyo
 uBJxr20umQpnlIDl3fndev+EknJ18ckkp7D/91aImP0kwaJTMrj1XAZ7X/HNPTE7BfL0
 hTSHvBxxs0LVmVZRQDOGgkGg/NR3ib7ULzNuQl0O7PZgJ5fLRTqfVJrius7eVrUtl339 sQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gppa65yy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 15:52:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EFmPrZ017242;
 Tue, 14 Jun 2022 15:52:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3gmjajckpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 15:52:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25EFqd9V20906408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 15:52:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 938C0A405F;
 Tue, 14 Jun 2022 15:52:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47BBFA405B;
 Tue, 14 Jun 2022 15:52:39 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 15:52:39 +0000 (GMT)
Message-ID: <6beae711-eba8-5e62-efb9-30e2c5c6f12d@linux.ibm.com>
Date: Tue, 14 Jun 2022 17:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 08/11] ppc/pnv: turn chip8->phbs[] into a PnvPHB3* array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-9-danielhb@linux.ibm.com>
 <d220e41c-a171-7263-a32c-3fc0d6c22ebd@linux.ibm.com>
 <3638290a-8bcb-699a-5304-e397853957b4@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <3638290a-8bcb-699a-5304-e397853957b4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QViyu7Djw8oHkNUnro2_xX_bGfr-OmsV
X-Proofpoint-ORIG-GUID: QViyu7Djw8oHkNUnro2_xX_bGfr-OmsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_06,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=929 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/06/2022 17:39, Daniel Henrique Barboza wrote:
> I've been thinking about it and I guess I could do better with this
> and the proxy pnv-phb series that is already in v2. What I'm thinking
> is:
> 
> - crop patches 8-11 from this series. Patches 1-7 would be the prep cleanup
> series;
> 
> - split the pnv-phb series in two:
> 
>    - first series will just introduce the pnv-phb devices and 
> consolidate the
> root ports. We're going to deal just with default devices. No consideration
> about future user-created devices will be made;
> 
>    - a second series would then re-introduce user creatable phbs and 
> root ports.
> Patches 8-11 of this series would be handled in this second patch set 
> since it's
> closely related to user devices.
> 
> 
> Does that sound fair?


Sounds good to me. That should keep series smaller and easier to review 
and merge.

   Fred

