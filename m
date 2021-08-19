Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B03F22CF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 00:11:39 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGqGA-00069u-D4
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 18:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mGqF9-0005PV-Un
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 18:10:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mGqF8-0004bA-5L
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 18:10:35 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JM3UMq073374; Thu, 19 Aug 2021 18:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=s9oQOAi1oMeLWbk2SGSqnGs5buytPLYhHtKMOaBIb6A=;
 b=aM14whoIUSVhsMuqIdU5/2qLydGj9CPyPAK8w6xAZDsQ5OaRDPa4wMqll3fcLI2UJiQu
 64WyMSA3LGRpcWrurZbKkPMJNT8wb2tzl2ldhFOgIJRAiTBh6/n33Re5HAKYPyxz6Osx
 XeHG2HdHkZwiMmNpCJeqMg5J29fIEiBNw9MamP5NQoETjSQLxk3UGrjVT4zhpoDKAGHJ
 GCSxHEPtr4VksPfcTOjwMjNEWEPqPG/4+yHTvOuy9qqGeFcnpGb7QpXAZ55MaI0VqhZc
 RWOWYDzYTRmvhYDw0zaD3K6YwvjdSV3hKwBbaN33lZWJsmTXxnLUeecL7f3vuGP9nsjq Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ahk0yr6j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 18:10:29 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17JM5UAk086447;
 Thu, 19 Aug 2021 18:10:28 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ahk0yr6hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 18:10:28 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JM3T03021949;
 Thu, 19 Aug 2021 22:10:27 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 3ahu0ta8yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 22:10:27 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JMAPCL34865546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 22:10:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7474878063;
 Thu, 19 Aug 2021 22:10:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A97567805E;
 Thu, 19 Aug 2021 22:10:22 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.160.128.138])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Aug 2021 22:10:22 +0000 (GMT)
Message-ID: <d6eb8f7ff2d78296b5ba3a20d1dc9640f4bb8fa5.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Thu, 19 Aug 2021 15:10:21 -0700
In-Reply-To: <YR5qka5aoJqlouhO@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
 <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
 <YR4U11ssVUztsPyx@work-vm>
 <538733190532643cc19b6e30f0eda4dd1bc2a767.camel@linux.ibm.com>
 <YR5qka5aoJqlouhO@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KeEQZ4f5mgVctXjPAxt3LZpPoLy6mHZn
X-Proofpoint-ORIG-GUID: 22mbp_qpwaXsEiVgdQPm2zFx57CDAg1s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_07:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190126
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
 frankeh@us.ibm.com, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-08-19 at 15:28 +0100, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
> > On Thu, 2021-08-19 at 09:22 +0100, Dr. David Alan Gilbert wrote:
[...]
> > > I think it really does have to cope with migration to a new
> > > version of host.
> > 
> > Well, you're thinking of OVMF as belonging to the host because of
> > the way it is supplied, but think about the way it works in
> > practice now, forgetting about confidential computing: OVMF is RAM
> > resident in ordinary guests, so when you migrate them, the whole of
> > OVMF (or at least what's left at runtime) goes with the migration,
> > thus it's not possible to change the guest OVMF by migration.  The
> > above is really just an extension of that principle, the only
> > difference for confidential computing being you have to have an
> > image of the current OVMF ROM in the target to seed migration.
> > 
> > Technically, the problem is we can't overwrite running code and
> > once the guest is re-sited to the target, the OVMF there has to
> > match exactly what was on the source for the RT to still
> > function.   Once the migration has run, the OVMF on the target must
> > be identical to what was on the source (including internally
> > allocated OVMF memory), and if we can't copy the MH code, we have
> > to rely on the target image providing this identical code and we
> > copy the rest.
> 
> I'm OK with the OVMF now being part of the guest image, and having to
> exist on both; it's a bit delicate though unless we have a way to
> check it (is there an attest of the destination happening here?)

There will be in the final version.  The attestations of the source and
target, being the hash of the OVMF (with the registers in the -ES
case), should be the same (modulo any firmware updates to the PSP,
whose firmware version is also hashed) to guarantee the OVMF is the
same on both sides.  We'll definitely take an action to get QEMU to
verify this ... made a lot easier now we have signed attestations ...

James



