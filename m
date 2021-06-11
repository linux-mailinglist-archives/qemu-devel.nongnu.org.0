Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095473A420C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 14:33:52 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrgMB-0003gq-9i
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 08:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrgKm-000315-Oc
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 08:32:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37274
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrgKj-0005DR-R1
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 08:32:24 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BC4Xt7128024; Fri, 11 Jun 2021 08:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EBGsZwHLHSC3dpNl9izEXGcA4a9HOMVCn7u1EhbRink=;
 b=JGvjwvGdxCTmlvV+5lkMyeGOGKFZR2hUA2jp793M5mYEXgObU1An4tk3Xg6VcLIW7Kbk
 9S8mlmgKH+iUw4IEtBDBjBoYWUYyL9OQc3c2KokFG7pos1E9FJ8ZWrFaX+yNgGWuV2Fe
 Xuq5S16D+RcfrYVHOe+myzB8j1B6GcR0dcuKGdLjGtCLQJsEhBPtxs7F5LarqjIfWfvS
 pTwPAthWfWsaX3mMdusU9mP//7vRuCjUmA1IbUwPHwn61lMp/ZUHxAx+ZoI3w9Pdf9KI
 1Tt94c5fHKUNgnffV6ooGvCGJsD4pUyHb/uT1IFNbaoOC3YDSZ0dbtTM6oTfw51oyJud WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3947h40t8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 08:32:17 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15BC4hHZ128726;
 Fri, 11 Jun 2021 08:32:17 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3947h40t8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 08:32:17 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15BCTToW007453;
 Fri, 11 Jun 2021 12:32:16 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3900wa84dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 12:32:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15BCWG6G35455266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 12:32:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2726CAE073;
 Fri, 11 Jun 2021 12:32:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4647AE064;
 Fri, 11 Jun 2021 12:32:15 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 11 Jun 2021 12:32:15 +0000 (GMT)
Subject: Re: [RFC PATCH v2 1/2] qapi: Inline qmp_marshal_output() functions
To: Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-2-philmd@redhat.com>
 <20210609202952.r4nb2smrptyckvk2@redhat.com>
 <87eedadpxt.fsf@dusky.pond.sub.org>
 <4050a737-5539-c6a8-3d60-78fc9721a865@redhat.com>
 <87r1haasht.fsf@dusky.pond.sub.org>
 <76d76c8e-5c0a-d676-f3d7-2d256d033294@redhat.com>
 <87im2kvnfa.fsf@dusky.pond.sub.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <5c1245c1-83a2-41dc-6c12-fe957c020475@linux.ibm.com>
Date: Fri, 11 Jun 2021 08:32:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <87im2kvnfa.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 90B-sDPvpNVKU9Xau7tHAW_iERpr7yeW
X-Proofpoint-ORIG-GUID: fQZnLpyWNQKn16q8TalZjNr6UZ5Ps4Im
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_05:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/11/21 4:02 AM, Markus Armbruster wrote:
> Stefan, would you be willing to look into this?
>
Have a look at the 3 topmost patches: 
https://github.com/stefanberger/qemu-tpm/commits/tpm-eliminate-if-not-config-tpm



