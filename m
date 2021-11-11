Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42044D4D0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:12:05 +0100 (CET)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml73s-0003gL-BS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:12:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6wO-0007Av-Cv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6wK-00011t-LL
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:18 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9hqVJ010203; 
 Thu, 11 Nov 2021 10:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=61i414Xzna8+NW7wC70mjsGJG1WpCGHc4EbKzVcL3qY=;
 b=ppiIk+42193GIaukSqP7Qy/3vVcPw2D5U1LcTO4MFlo09LVU4tg5yUmMslXdHNIHRMTF
 C+1DvRqExSJy7SGtgBqxPGP8rIiZFftH1Vy+DgLSZmBGUf84HMMNO2yXq56ygxzp0Rwq
 LY7HbuhmHPBAIqVcqVmYW5CJYca8+LcuyT7yiJn+EsBMOdHokw3KyoinRlTmyslarjAk
 D3YCePFWsK3YwS6sy9+Ghzt8aQyfHzPHY/mxYCN0dy8MPf6DOXdcBjD+HY+chcY1gvot
 qRCKRvVPI7iVMDv+i9irgjCchCq0s1soaE2mEotGTmw+68ycsb+wAgQKsIs2z50qqLmC HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c90t4rh2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:04:11 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ABA3lZU011312;
 Thu, 11 Nov 2021 10:04:10 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c90t4rh2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:04:10 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9vK0o013590;
 Thu, 11 Nov 2021 10:04:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3c5hbd10nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:04:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABA47cO58982866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:04:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5DA978084;
 Thu, 11 Nov 2021 10:04:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5D497805F;
 Thu, 11 Nov 2021 10:04:03 +0000 (GMT)
Received: from [9.160.77.174] (unknown [9.160.77.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 10:04:03 +0000 (GMT)
Message-ID: <ebbef3c2-62be-fb60-63b3-d364559c90fc@linux.ibm.com>
Date: Thu, 11 Nov 2021 12:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/6] SEV: add kernel-hashes=on for measured -kernel
 launch
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <YYzkxhd5+gK7wcTf@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYzkxhd5+gK7wcTf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sbJ4YhG_-4XLxsBIgVOVRlzXVDU0LAYh
X-Proofpoint-GUID: 4cHvKAAc8wiBR81ho6VhKpgr8f13gC1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111110060
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/11/2021 11:39, Daniel P. Berrangé wrote:
> On Mon, Nov 08, 2021 at 01:48:34PM +0000, Dov Murik wrote:
>> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
>> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
>> OVMF images are used.
>>
>> To fix these issues, these series "hides" the whole kernel hashes
>> additions behind a kernel-hashes=on option (with default value of
>> "off").  This allows existing scenarios to work without change, and
>> explicitly forces kernel hashes additions for guests that require that.
> 
> We need to to get this into 6.2 to adress the regression vs  previous
> QEMU releases.
> 
> There's just a couple of small review points. If you can repost
> with the easy fixes, then we can get this queued.
> 

Sent v3 now.

Patch 3/6 (error message rephrase) still misses Reviewed-by.

Thanks,
-Dov

