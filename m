Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C602B4EE8D2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 09:08:25 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naBOS-0005Wx-AX
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 03:08:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1naBI8-00026L-MD; Fri, 01 Apr 2022 03:01:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1naBI6-0004GV-AJ; Fri, 01 Apr 2022 03:01:52 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23144hWc027515; 
 Fri, 1 Apr 2022 07:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=svIk39Mk5JrJEriUGN/iwUhXnX6rKUwgL0DU00orHrg=;
 b=fBnx+cY4s1JtDux3QGZpUcWfhej0GmhPIK68AIUSOtohKrrgX4ZDxCB+LxVxyGcyW8Dg
 8xJ3zRQS9TwNXdCR2cfnOPfLjjW0QdfPt+dxnKZxc7gHI7+GJWjH5MX0cNsBdM1JIUyz
 yG2tmCVivgdIfrWAsUnGAH9ey8w57KmgVUPsGwVGj2c9FwsPGAEMCtJ8yr4sfoTntJqF
 n2OXsljTGGPBUT9yyP8bdtXuMNimguCaAdvsJmYLw7C4ALg+5K1PYz80MA+2s9tW6pxH
 NsjVilqCMsiU5YeabF0OsNe6NhWlrZ4cTZLhS5Q30JIujaGsGxHvQ0o+7+72PkwP/hbT uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f54eq5u4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 07:01:41 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2316wgBB022693;
 Fri, 1 Apr 2022 07:01:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f54eq5u42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 07:01:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2316w9jU026694;
 Fri, 1 Apr 2022 07:01:40 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3f1tfaanwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 07:01:40 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23171dIY30277956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 07:01:39 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68FF1124052;
 Fri,  1 Apr 2022 07:01:39 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AB7612405B;
 Fri,  1 Apr 2022 07:01:36 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.110.217])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 07:01:36 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
In-Reply-To: <YkUuLyQTZUthvJb4@yekko>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
 <YixlR+rLNZCsAA50@yekko> <87ee346v99.fsf@linux.ibm.com>
 <YkUuLyQTZUthvJb4@yekko>
Date: Fri, 01 Apr 2022 12:31:28 +0530
Message-ID: <87mth5i8xj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qHPHlak2-Pl3R6R2647XNPFegMuYD_SW
X-Proofpoint-ORIG-GUID: n62kGuvMwdPTmsnGLw6AC845AYhUHGYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010033
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=aneesh.kumar@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Mar 14, 2022 at 07:10:10PM -0300, Fabiano Rosas wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>> 
>> > On Tue, Mar 08, 2022 at 10:23:59PM -0300, Fabiano Rosas wrote:
>>

...

>> To satisfy TCG we could keep a spapr capability as ON and usually the
>> guest would pass cap-gtse=off when running with KVM. However this
>> doesn't work because this crash happens precisely because the nested
>> guest doesn't know that it needs to use cap-rpt-invalidate=on. Another
>> cap wouldn't help.
>> 
>> So I think the only way to have a spapr capability for this is if TCG
>> always defaults to ON and KVM always defaults to OFF. But then we would
>> be changing guest visible behaviour depending on host properties.
>
> Ok, I'd forgotten we already have cap-rpt-invalidate.  It still
> defaults to OFF for now, which might help us.
>
> What's clear is that we should never disable GTSE if
> cap-rpt-invalidate is off - qemu should enforce that before even
> starting the guest if at all possible.
>
> What's less clear to me is if we want to enable GTSE by default or
> not, in the cases where we're able to choose.  Would always disabling
> GTSE when cap-rpt-invalidate=on be ok?  Or do we want to be able to
> control GTSE separately.  In that case we might need a second cap, but
> it would need inverted sense, so e.g. cap-disable-gtse.


GTSE and cap-rpt-invalidate can be looked at as independent such that we
can do GTSE=1 or GTSE=0 with cap-rpt-invalidate=on. But GTSE=0 with
cap-rpt-invalidate=off is not allowed/possible. GTSE value is what is
negotiated via CAS so we should let the hypervisor inform the guest whether it
can do GTSE 0 or 1. The challenge IIUC is Qemu always assumed GTSE=1
which is not true in the case of nested virt where L1 guest that is booted
with GTSE=0.

with cap-disable-gtse how would one interpret that? Whether hypervisor
have the capability to disable gtse? 

>
> I believe a guest that is expecting GTSE==0 should work if
> LPCR[GTSE]==1, just not optimally (as long as H_RPT_INVALIDATE is
> still available, of course).  Is that right?

That is correct.

-aneesh

