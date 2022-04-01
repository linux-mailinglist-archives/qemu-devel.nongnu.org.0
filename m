Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353B4EF638
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:53:22 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJaN-0002lC-58
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:53:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1naJYN-0000YP-Tm; Fri, 01 Apr 2022 11:51:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15798
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1naJYK-0005iG-6s; Fri, 01 Apr 2022 11:51:11 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231DVDTW013326; 
 Fri, 1 Apr 2022 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LMC5j8LLiOAHwVjCJjTINxt5tv9WWf4r32/rfcLUkbI=;
 b=LaANWDwXpzF0Npxx+/Djowdr1EqijsZ1T4mXk0bpXIk3TOTBfOTL6KyUF+h70eAoPbTA
 jEq9RiXOJ6L85jL6ZeX8zGMDK9f31x8vGq75FaVsr0K3w6fvdyXFubFeqR2CRQ01AgRz
 FRt12Hm1iKdn7e97uhtSJE2gP9wQhlwRbFwlPxYJ42zUa5HwTNXyrEK+423U4oMDurpv
 z9G8My3I8mpQB5UxKdmsBcdrT3AvYjAOjC5lAWxP488VXzqWsuLftezkOmeyjyIAXQAv
 rt56Qg75fnVYLCRESdinE61vum+QDGox4p0KzX8zYjlS/+mlClskMJmU4mQTzj9wo7tP gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f62bqb0gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 15:50:57 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 231FUM82001443;
 Fri, 1 Apr 2022 15:50:57 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f62bqb0gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 15:50:57 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 231FniGZ007861;
 Fri, 1 Apr 2022 15:50:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3f1tfas93s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 15:50:56 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 231FotCt14942966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 15:50:55 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6B9BBE058;
 Fri,  1 Apr 2022 15:50:55 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 298A3BE053;
 Fri,  1 Apr 2022 15:50:54 +0000 (GMT)
Received: from localhost (unknown [9.160.96.195])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  1 Apr 2022 15:50:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
In-Reply-To: <87mth5i8xj.fsf@linux.ibm.com>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
 <YixlR+rLNZCsAA50@yekko> <87ee346v99.fsf@linux.ibm.com>
 <YkUuLyQTZUthvJb4@yekko> <87mth5i8xj.fsf@linux.ibm.com>
Date: Fri, 01 Apr 2022 12:50:49 -0300
Message-ID: <87fsmwhkfa.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aYqGJz7s8yN3ji0YtnKGh8JziXOEEoW_
X-Proofpoint-ORIG-GUID: 41JSfW03QayC09MfC07flPEjPJsyM3OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204010074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> David Gibson <david@gibson.dropbear.id.au> writes:
>
>> On Mon, Mar 14, 2022 at 07:10:10PM -0300, Fabiano Rosas wrote:
>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>> 
>>> > On Tue, Mar 08, 2022 at 10:23:59PM -0300, Fabiano Rosas wrote:
>>>
>
> ...
>
>>> To satisfy TCG we could keep a spapr capability as ON and usually the
>>> guest would pass cap-gtse=off when running with KVM. However this
>>> doesn't work because this crash happens precisely because the nested
>>> guest doesn't know that it needs to use cap-rpt-invalidate=on. Another
>>> cap wouldn't help.
>>> 
>>> So I think the only way to have a spapr capability for this is if TCG
>>> always defaults to ON and KVM always defaults to OFF. But then we would
>>> be changing guest visible behaviour depending on host properties.
>>
>> Ok, I'd forgotten we already have cap-rpt-invalidate.  It still
>> defaults to OFF for now, which might help us.
>>
>> What's clear is that we should never disable GTSE if
>> cap-rpt-invalidate is off - qemu should enforce that before even
>> starting the guest if at all possible.
>>
>> What's less clear to me is if we want to enable GTSE by default or
>> not, in the cases where we're able to choose.  Would always disabling
>> GTSE when cap-rpt-invalidate=on be ok?  Or do we want to be able to
>> control GTSE separately.  In that case we might need a second cap, but
>> it would need inverted sense, so e.g. cap-disable-gtse.
>
>
> GTSE and cap-rpt-invalidate can be looked at as independent such that we
> can do GTSE=1 or GTSE=0 with cap-rpt-invalidate=on. But GTSE=0 with
> cap-rpt-invalidate=off is not allowed/possible. GTSE value is what is
> negotiated via CAS so we should let the hypervisor inform the guest whether it
> can do GTSE 0 or 1. The challenge IIUC is Qemu always assumed GTSE=1
> which is not true in the case of nested virt where L1 guest that is booted
> with GTSE=0.
>
> with cap-disable-gtse how would one interpret that? Whether hypervisor
> have the capability to disable gtse?

The spapr capability would mean "disable GTSE if KVM allows
it". Although I'd prefer using cap-gtse=<on/off> because it gives us
more flexibility if we ever want to change the default value.

On the KVM side I am testing a KVM_CAP_PPC_GTSE_DISABLE with the
semantics of "whether QEMU is allowed to disable GTSE". It reports the
inverse of MMU_FTR_GTSE. So if L1 runs with GTSE=0, then the capability
returns 1 and therefore QEMU can disable GTSE. If the capability is not
present, then QEMU is not allowed to disable GTSE.

With David's idea of disallowing cap-rpt-invalidate=off,cap-gtse=off we
can simply deny the nested guest command line if it doesn't include
cap-rpt-invalidate=on when KVM L1 reports KVM_CAP_PPC_GTSE_DISABLE. That
way cap-gtse can default to ON to keep TCG working.

On a first look, I think the above works. I'm still running some tests
with different QEMU/kernel versions.



