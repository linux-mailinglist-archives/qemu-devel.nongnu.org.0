Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE084B635C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 07:23:12 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJrF0-0008WP-Qb
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 01:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nJrDa-0007kC-CO
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 01:21:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nJrDY-0004lG-0c
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 01:21:42 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21F5foxH008564; 
 Tue, 15 Feb 2022 06:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0HRUI5HqedeBZn+9QlSPQYKJ5nzOc4KHgM6xqnJvXZw=;
 b=NqFXfJ40cejb0CL3yhAmvqOUrxiO7TfPB0wnFYqNtkEJD5LME8s6OY0qTY0fOjdPh0AP
 3nSM63k4/csIrEUam/Iwgc65FVsugorpQfog8Fld4eHL39LXHJKS0O/kjcEHk5npSgaj
 eNWDFf0Ed5xFGuB9H2gxEy6NFkvxyrRSdAYBwrL3R9RvzF1cwfJyiDqtVcw4RzeBHFjE
 /bQk+6T4faCxVTnlHifc0zRrwC5MngrVXa2hYVF7JRZwkCEZuusTldYGJbdaagGqRyQu
 AxVbR13mjuZUELhkj8uCJMiqMVPuSBQHUKPthEsXe53eTo3Ca8QPUWZDZiqvQn+7yEPx 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e868mgtjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:21:33 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21F6I5Qb015842;
 Tue, 15 Feb 2022 06:21:33 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e868mgtj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:21:33 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21F6EAPU013740;
 Tue, 15 Feb 2022 06:21:32 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3e64ha91hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:21:32 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21F6LVpp40763818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 06:21:31 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B025124058;
 Tue, 15 Feb 2022 06:21:31 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CADA124052;
 Tue, 15 Feb 2022 06:21:29 +0000 (GMT)
Received: from [9.160.23.162] (unknown [9.160.23.162])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 06:21:28 +0000 (GMT)
Message-ID: <acbcbb8a-3b50-a380-ad58-0d1545c8715a@linux.ibm.com>
Date: Tue, 15 Feb 2022 08:21:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] [RESEND] docs: Add spec of OVMF GUIDed table for SEV
 guests
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220103091413.2869-1-dovmurik@linux.ibm.com>
 <YdSM8wFu4xiRcKMt@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YdSM8wFu4xiRcKMt@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3rOx9n7dXMh0_jNhIWSF_jh-hbAr5Cbg
X-Proofpoint-GUID: 7tIMpSCbFX9jQyCICBwSxDNEl0iK8ujV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_02,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150035
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/01/2022 20:07, Daniel P. Berrangé wrote:
> On Mon, Jan 03, 2022 at 11:14:13AM +0200, Dov Murik wrote:
>> Add docs/specs/sev-guest-firmware.rst which describes the GUIDed table
>> in the end of OVMF's image which is parsed by QEMU, and currently used
>> to describe some values for SEV and SEV-ES guests.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  docs/specs/index.rst              |   1 +
>>  docs/specs/sev-guest-firmware.rst | 125 ++++++++++++++++++++++++++++++
>>  2 files changed, 126 insertions(+)
>>  create mode 100644 docs/specs/sev-guest-firmware.rst
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 

Phil,

Can you please add this to your queue? (I assume this is yours
because this is documentation of OVMF-QEMU interface)

The patch itself:
https://lore.kernel.org/qemu-devel/20220103091413.2869-1-dovmurik@linux.ibm.com/
(I see I didn't CC you then. Sorry.)

Thanks,
Dov

