Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85773F1B39
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:08:18 +0200 (CEST)
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiiP-0007rS-UQ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mGihF-0006Cg-Kj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:07:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mGihD-0002ak-Gi
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:07:05 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JE2kjZ126271; Thu, 19 Aug 2021 10:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=cJ/S1M1hg9zd6qWUv0l7ZRLFUiNJv5/lYnSw0pINsSA=;
 b=ak8LhFRtnfgH87kVqWeRblsnLMpVDy6L6Vn72pJ8x//Jo7QhuvOkSxv4jdL/Ejv/qrEp
 0NeNlEDTMqQRe6iwPsw6UQLoKn8bOt44XtYmadEqKI6uSUWhxVRt4irgrj0knVOAKSXM
 W+zibSP4/FSo0vr28vDJHAvL+u5wl9S3s1YFVCxbUZrJKQA7u7KQVBA0SWNUI8h3lvM4
 vI9rNvtX2ZAH9hYGKSU3ycEOePCqKvSeuaDkLfZvZ2FeYSOfo+VjjXMH0r7hj9+cQR/G
 k6lr59rcpcYUvOwOy2mCkUW9glPlKbvKt8JpR0tte/sLS2jpwRBhoaw25OyrRYQfUeBM +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agkvnrw2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 10:06:57 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17JE3ah1130177;
 Thu, 19 Aug 2021 10:06:57 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agkvnrw2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 10:06:57 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JDv3jM015857;
 Thu, 19 Aug 2021 14:06:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3ae5fexwft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 14:06:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JE6smx43712998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 14:06:54 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65F3B78076;
 Thu, 19 Aug 2021 14:06:54 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7C7D7808C;
 Thu, 19 Aug 2021 14:06:51 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.160.128.138])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Aug 2021 14:06:51 +0000 (GMT)
Message-ID: <538733190532643cc19b6e30f0eda4dd1bc2a767.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Tobin Feldman-Fitzthum
 <tobin@linux.ibm.com>
Date: Thu, 19 Aug 2021 10:06:50 -0400
In-Reply-To: <YR4U11ssVUztsPyx@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
 <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
 <YR4U11ssVUztsPyx@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vnuA3H72Yed_XiAueAWi-AudofFAPh8v
X-Proofpoint-GUID: uJBNORBi0RtY44VsHzuVydBprpPJ_Zv-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190083
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, Steve Rutherford <srutherford@google.com>,
 richard.henderson@linaro.org, tobin@ibm.com, qemu-devel@nongnu.org,
 frankeh@us.ibm.com, Paolo Bonzini <pbonzini@redhat.com>,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-08-19 at 09:22 +0100, Dr. David Alan Gilbert wrote:
> * Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
> > On 8/18/21 3:04 PM, Dr. David Alan Gilbert wrote:
> > > * Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
> > > > On 8/17/21 6:04 PM, Steve Rutherford wrote:
> > > > > Ahh, It sounds like you are looking into sidestepping the
> > > > > existing AMD-SP flows for migration. I assume the idea is to
> > > > > spin up a VM on the target side, and have the two VMs attest
> > > > > to each other. How do the two sides know if the other is
> > > > > legitimate? I take it that the source is directing the LAUNCH
> > > > > flows?
> > > >  
> > > > Yeah we don't use PSP migration flows at all. We don't need to
> > > > send the MH code from the source to the target because the MH
> > > > lives in firmware, which is common between the two.
> > >  
> > > Are you relying on the target firmware to be *identical* or
> > > purely for it to be *compatible* ?  It's normal for a migration
> > > to be the result of wanting to do an upgrade; and that means the
> > > destination build of OVMF might be newer (or older, or ...).
> > > 
> > > Dave
> > 
> > This is a good point. The migration handler on the source and
> > target must have the same memory footprint or bad things will
> > happen. Using the same firmware on the source and target is an easy
> > way to guarantee this. Since the MH in OVMF is not a contiguous
> > region of memory, but a group of functions scattered around OVMF,
> > it is a bit difficult to guarantee that the memory footprint is the
> > same if the build is different.
> 
> Can you explain what the 'memory footprint' consists of? Can't it
> just be the whole of the OVMF rom space if you have no way of nudging
> the MH into it's own chunk?

It might be possible depending on how we link it. At the moment it's
using the core OVMF libraries, but it is possible to retool the OVMF
build to copy those libraries into the MH DXE.

> I think it really does have to cope with migration to a new version
> of host.

Well, you're thinking of OVMF as belonging to the host because of the
way it is supplied, but think about the way it works in practice now,
forgetting about confidential computing: OVMF is RAM resident in
ordinary guests, so when you migrate them, the whole of OVMF (or at
least what's left at runtime) goes with the migration, thus it's not
possible to change the guest OVMF by migration.  The above is really
just an extension of that principle, the only difference for
confidential computing being you have to have an image of the current
OVMF ROM in the target to seed migration.

Technically, the problem is we can't overwrite running code and once
the guest is re-sited to the target, the OVMF there has to match
exactly what was on the source for the RT to still function.   Once the
migration has run, the OVMF on the target must be identical to what was
on the source (including internally allocated OVMF memory), and if we
can't copy the MH code, we have to rely on the target image providing
this identical code and we copy the rest.

James



