Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E95455C6F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:14:52 +0100 (CET)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhFb-0004Eu-KB
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mnhCl-0002uS-V0
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:11:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mnhCi-000739-Kb
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:11:55 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIClZHF004688; 
 Thu, 18 Nov 2021 13:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=khGsDiYdSpbxNlwbiwXaTWEWwifA9fFAZjeNB5y9Hv8=;
 b=GET24X+mrrQsi4m6/l0wlO67SK0wTmKFSJd6piN6rwgoI2EbJyk0cD6vA4WW2Z4eM9vK
 6mHY/w2SLXif+zxUR0KEgzKVRCAoeUhxA5w7tXRzBhfguPZf7jTZOhJ1C8mJo/AINam5
 iXlQzTADt0ukQHkPi4GFflvAnedfJRzBtikfyx7i2oaIfYZPx7XqJkGc75uCoiA/bK/g
 Dj/RV9KfqVjnd5Us2WSxnmeiM2RXnC2Ncy7AQJw3GOr4wjtgRivXnJV0y60vHBLKSEzV
 wsEkdMvKmUOeKGCZcQISLhmedLPSQ0DsKlPUjfpQuU03ZqdYOwOTTcwPYiiZZWWpZpZG 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdq580nc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 13:11:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AIClbWP004793;
 Thu, 18 Nov 2021 13:11:48 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdq580nbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 13:11:48 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AID2p46025747;
 Thu, 18 Nov 2021 13:11:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3ca50d3jfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 13:11:47 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AIDBjP931523320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 13:11:45 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBC98136074;
 Thu, 18 Nov 2021 13:11:45 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A6DC13607F;
 Thu, 18 Nov 2021 13:11:41 +0000 (GMT)
Received: from [9.160.188.78] (unknown [9.160.188.78])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 18 Nov 2021 13:11:41 +0000 (GMT)
Message-ID: <185bd974-40ae-5d25-ef6d-622eb57596f6@linux.ibm.com>
Date: Thu, 18 Nov 2021 15:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 0/6] SEV: add kernel-hashes=on for measured -kernel
 launch
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
 <ea55111b-85d9-c05a-7808-fcdcbe1e8bcc@linux.ibm.com>
 <81ab2e5c-630f-24e5-d04a-c2fb89e952ae@linux.ibm.com>
 <YZZO6jEbRISnW/Cv@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YZZO6jEbRISnW/Cv@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JD9DpXkcSrTA_g4wnM_L7Y4gStY8_UBu
X-Proofpoint-ORIG-GUID: kRhFJdwZrEXPgZq282a4rHDsqg61KU4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180075
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.084,
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



On 18/11/2021 15:02, Daniel P. Berrangé wrote:
> On Thu, Nov 18, 2021 at 02:21:09PM +0200, Dov Murik wrote:
>> Pinging again -- Daniel said this should be added to 6.2.
>>
>> Is there anything I should do?
> 
> I'm going to take care of sending a PULL to relieve Paolo's
> workload.
> 

Thanks Daniel.

-Dov


