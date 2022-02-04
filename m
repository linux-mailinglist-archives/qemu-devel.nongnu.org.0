Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F74A9CB8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:15:56 +0100 (CET)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1Fa-0005hK-KN
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG1BA-0003df-Li; Fri, 04 Feb 2022 11:11:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43724
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG1B6-0004C9-1e; Fri, 04 Feb 2022 11:11:20 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214ES2iA023912; 
 Fri, 4 Feb 2022 16:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=8rSHpL0opoPb56o0Fqfe5CxktCx1r4IL5qN87GYMhPc=;
 b=N6JvLzEU4CRGufygxRnxywihVxh8aJE1TXeuvG3B08dDnpsCNKhB13vLD7CaafPlxL66
 inutRjMxxKoyU9Fg/4XlLDElGfOvua5Jp/Ow99y0xNMjlooIQt8eNbRi74ew7PPW6rOR
 yNH/fd+jMrWjgS9CEL3jud1Q7XF+ljid2BHxz6QqrCflCDMgnlEEG160P3pfOOUxRNa9
 KRk0dNtxGj7K2omLPxTgyPgXCg8RvT1aoHxw80rqrm5FBnWtCK5RhgRbLcpIAbFNIw3N
 RjTOjRkVDFE+mJuXkPFN3ujjuSIpS3F2uaA07QgSxQIp4zHv+TN6TtAFIPzIS8pQVJ+L PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxg1au3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:11:01 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214Fji9r005493;
 Fri, 4 Feb 2022 16:11:01 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxg1atv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:11:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214G8oaO030225;
 Fri, 4 Feb 2022 16:11:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3e0r0psbdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:11:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214GAwBC34865452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 16:10:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B47DDAC05E;
 Fri,  4 Feb 2022 16:10:58 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9545CAC060;
 Fri,  4 Feb 2022 16:10:57 +0000 (GMT)
Received: from localhost (unknown [9.211.79.16])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Feb 2022 16:10:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 03/10] target/ppc: Simplify powerpc_excp_7xx
In-Reply-To: <b39f22a-d58f-1faa-3777-66ccbbc7b9dd@eik.bme.hu>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
 <20220203224246.1446652-4-farosas@linux.ibm.com>
 <b39f22a-d58f-1faa-3777-66ccbbc7b9dd@eik.bme.hu>
Date: Fri, 04 Feb 2022 13:10:54 -0300
Message-ID: <87o83m8ve9.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: knkhOKe2jABtEfbhM9x6zCBBxy7ImzJy
X-Proofpoint-ORIG-GUID: ackZ1XtAi8h9jiOOkPPLP1sdNVJC0WIm
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040092
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 3 Feb 2022, Fabiano Rosas wrote:
>> Differences from the generic powerpc_excp code:
>>
>> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
>> - No MSR_HV;
>> - No power saving states;
>> - No Hypervisor Emulation Assistance;
>
> The pegasos2 can run with -cpu G3 as the real hardware had a processor 
> card either with a G3 or a G4 so this will break VOF with that. I'm not 
> sure if it's worth keeping support for this though as long as the default 
> G4 works because most people would want to use a G4 anyway and those who 
> want a G3 for some reason could still use a firmware rom image instead but 

I'll bring 'sc 1' back then. I shouldn't mix the refactoring with
dropping support of things.

If you think we can drop support for the pegasos2 on the G3 let me know
and I'll send a follow up patch. Or you can send one yourself if you'd
like.

> I wonder if there's another better place where sc 1 could be handled so it 
> could work for these cpus without needing to change these excp helpers.

I spoke to Alexey and the way forward here is to have a MMIO address for
VOF to use and remove the sc 1 usage altogether. At least for the CPUs
that wouldn't support it otherwise. I created a GitLab issue to track
that: https://gitlab.com/qemu-project/qemu/-/issues/859


