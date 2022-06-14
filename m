Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3C54B16B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:50:26 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1601-0002tf-Jx
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o15v7-0007OX-9r; Tue, 14 Jun 2022 08:45:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o15un-0004VR-Qf; Tue, 14 Jun 2022 08:45:15 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ECXs86022328;
 Tue, 14 Jun 2022 12:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5+gPu3bRmn5LibxaNtyW+3VK/tB2AApmh2DS1+/j2oc=;
 b=GtCAcCe31KUnl1p0Y2ZzHih0nha+OCZ2OWlUAmKrX+XczU+zk63yQ9FzyyXsP9NRHrco
 6p/zOVPmFmQ8WRecE2DD1VM8VrmQFgZavkxTfVscE+t8tKLf07nf18mtb0+vgf/wBOJc
 cWwzbvFWaidGZXa5lYVEN0wph0++GwPQvwJFAuxDfFLk2T911YEUU0gY4/nz9gBnLFuD
 SnfR54lr4RZx03+JvSBfwHLTlKfIqwmbwcg10qFxf6K0C5IcGqUGOmbzHrSDRMgDQWB4
 BFEH+oaZptCEkwGOU6zGixa3bf99e8pnaCUhEymYixXz/R6hvcsFiEO6iSnXadatKLEl Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpr31v0qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 12:44:56 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25ECX69K024413;
 Tue, 14 Jun 2022 12:44:56 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpr31v0qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 12:44:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ECR5TT028431;
 Tue, 14 Jun 2022 12:44:54 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3gmjp9caue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 12:44:54 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25ECisGM39911928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:44:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D6B5AE05C;
 Tue, 14 Jun 2022 12:44:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62C1AE05F;
 Tue, 14 Jun 2022 12:44:53 +0000 (GMT)
Received: from localhost (unknown [9.160.61.78])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Jun 2022 12:44:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: cpu_init: Clean up stop state on cpu reset
In-Reply-To: <20220614082912.378355-1-fbarrat@linux.ibm.com>
References: <20220614082912.378355-1-fbarrat@linux.ibm.com>
Date: Tue, 14 Jun 2022 09:44:52 -0300
Message-ID: <87y1xzqurf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mW_4nhJ_6Oz57LEzQj3vkDZFHjVRvKdS
X-Proofpoint-ORIG-GUID: jGQ2MHcxZr59hrneGAZlTIBVHp0sm_h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_04,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=648
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140050
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Frederic Barrat <fbarrat@linux.ibm.com> writes:

> The 'resume_as_sreset' attribute of a cpu can be set when a thread is
> entering a stop state on ppc books. It causes the thread to be
> re-routed to vector 0x100 when woken up by an exception. So it must be
> cleaned on reset or a thread might be re-routed unexpectedly after a
> reset, when it was not in a stop state and/or when the appropriate
> exception handler isn't set up yet.
>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>


