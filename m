Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC42442DCF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:26:14 +0100 (CET)
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsrl-0005Dh-Bm
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhsJ1-0008Bq-0x
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:50:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhsIv-0000GD-Cg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:50:18 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A29aHUu012753; 
 Tue, 2 Nov 2021 11:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JCn5XT8SyysPXoeFCiOGB7D+zJvvPcOSvpZp3Kisv5w=;
 b=lLKTVlPHBqfCeO9c6v5dareYCpd3gOSLP0foHitqP1xtQSaniDL3OuZaxDc732n28Meu
 iBPVDaafSCWM0ZpZPMADUUZCKNtLYET9K4VUwT3l26ttHVEyiE2MsXQgbMod+YQ/sSDi
 eQa0Y/HrKRh5zm3G4/+kpCym27qgYZxB6f5bnk9a65X68UC4GlGS0NaLwS601TZCRQUX
 dIc9T6MxAoxLFt9kGY3oPXgQ6iC5PIiEKcYNUSblEeU7pqwu43XfixOpBbc8XW+lpab1
 XG6sHQvEw1Sbbh6on3JKdZkK5YHe4mBtFu4O4N9okWZ7Dar9WwiTO3bOJS6thxk/55hB RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c30byp7m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:50:06 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2BGQEJ021089;
 Tue, 2 Nov 2021 11:50:06 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c30byp7kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:50:06 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BgAoL016175;
 Tue, 2 Nov 2021 11:50:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3c0wpb13g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:50:04 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2Bo3RV12780428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 11:50:03 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8B8112405A;
 Tue,  2 Nov 2021 11:50:03 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727B6124052;
 Tue,  2 Nov 2021 11:50:01 +0000 (GMT)
Received: from [9.65.202.213] (unknown [9.65.202.213])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Nov 2021 11:50:01 +0000 (GMT)
Message-ID: <1f8b2150-b200-e862-be36-1e2b280fcac7@linux.ibm.com>
Date: Tue, 2 Nov 2021 13:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 3/3] sev/i386: Perform padding calculations at compile-time
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-4-dovmurik@linux.ibm.com> <YYEiyJ73TCg2AFOl@work-vm>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYEiyJ73TCg2AFOl@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -5dOAZaLOaVw-NPNJASvLWgqa9jJhtS0
X-Proofpoint-GUID: ayINoSgJU64BLoDD4JTMEsl3FSjOyyGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020068
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/11/2021 13:36, Dr. David Alan Gilbert wrote:
> * Dov Murik (dovmurik@linux.ibm.com) wrote:
>> In sev_add_kernel_loader_hashes, the sizes of structs are known at
>> compile-time, so calculate needed padding at compile-time.
>>
>> No functional change intended.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 

Thanks Dave.

-Dov


