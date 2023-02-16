Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C270698FDD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSae9-0004D3-Vn; Thu, 16 Feb 2023 04:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSae7-0004Co-13
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:33:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSae3-0003Qo-Fy
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:33:42 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31G8BtEo020050; Thu, 16 Feb 2023 09:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cafaRvbNIk7x12qDcWQJ38ZWAWg6glUurvYmZfLKWDY=;
 b=qBTHlgZjeYtwfnc+DtUST8EDVLlE0h0mJ2D9Qga3s/4nXejO9SvsWIlZalhd7g5Vckvh
 wq+86a39s59kBh3UdkHmuN9hNCr/mnYL9pJX6hXLPoHeM7ztHl+ePfBznfj1VcOuy/fO
 0trejhLkMflqwYI9Guz8qPc0rzugjmisEgPi+FuSns1NKXLciRmfyF6XBjZy4bg1nnj0
 CPv7Hj9DI3dRjShgw4PTo9i6A3GevoG8MYSX4zf46dsXXnGaOH02JqU7YuScJoXle5CT
 Jje0mIzdZWLqJH/kxAGFfSdEz6SEDux9UQ9UcK+wOFtR5hqWh5iQp+9eq7sGEhdck+IE fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsg4gtrjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 09:33:34 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G8tXt0030806;
 Thu, 16 Feb 2023 09:33:34 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsg4gtrhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 09:33:34 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G8EsIM021534;
 Thu, 16 Feb 2023 09:33:33 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3np2n7htft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 09:33:32 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31G9XVhI5571130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 09:33:31 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F6FA5805C;
 Thu, 16 Feb 2023 09:33:31 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9DA58059;
 Thu, 16 Feb 2023 09:33:27 +0000 (GMT)
Received: from [9.77.150.161] (unknown [9.77.150.161])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Feb 2023 09:33:27 +0000 (GMT)
Message-ID: <bcb416f7-2e64-16de-f4db-e8206bbdc368@linux.ibm.com>
Date: Thu, 16 Feb 2023 11:33:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH v2 1/2] qapi, i386: Move kernel-hashes to
 SevCommonProperties
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Mario Smarduch
 <mario.smarduch@amd.com>, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Dov Murik <dovmurik@linux.ibm.com>
References: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
 <20230216084913.2148508-2-dovmurik@linux.ibm.com>
 <87wn4irmif.fsf@pond.sub.org>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <87wn4irmif.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MdsSO0HqiZS6YzZRDFJOtw5nAimOFbS_
X-Proofpoint-ORIG-GUID: _KGTIlSjVtjYT4T8aQ1BANmmJKjnFfjJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=730
 clxscore=1015 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160080
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257, SPF_HELO_NONE=0.001,
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

Hello Markus,

On 16/02/2023 11:24, Markus Armbruster wrote:
> Dov Murik <dovmurik@linux.ibm.com> writes:
> 
>> In order to enable kernel-hashes for SNP, pull it from
>> SevGuestProperties to its parent SevCommonProperties so
>> it will be available for both SEV and SNP.
> 
> Missing
> 
>   Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 

Oops, thanks. I'll fix.

> Patch does not apply for me.
> 

This patch series is based on AMD's upmv10-snpv3 tree:

  https://github.com/mdroth/qemu/tree/upmv10-snpv3

Have you tried to apply it on top of that tree?

-Dov

