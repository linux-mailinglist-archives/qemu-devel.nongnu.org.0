Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E42D82A1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:17:21 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrf5-0002G3-QM
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1knrAM-0005ZS-AG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:45:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1knrAK-0001cM-3Z
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:45:34 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BBMXUtL071695; Fri, 11 Dec 2020 17:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=T0rNOcZLKBC867TzhwoFZBpAmMsEO3JVZbCImoFCUqU=;
 b=f/UHF7zne1ynszLyv1WOsYR0t/i0YoPrNluZFVQYVyQS/rs1IHW5TsNXqfR/yDWnHKtL
 EkOgQl2mtqoWu8zDZDEwTyOoa30ih4W/O5NAsRdYDANpC9JC9MhR5jHru2Yi1X1J3i7i
 Ha8oOdGXTqhQW2Qz6lgWtOFNfu6/7rKqgLHVB91AzShgmvQDHqsshErV0aha7cOCVp/Q
 YX9FZvS1A3xJKdqQsnjyMxNDnw1WoMVIaSDZnZ4C9UWqO1jlDS3fJWDXI4EDJCkpf9wl
 rXO/pGIeMXVHHFg3bWIJw5L2MDCi7KLPJi2fdn7Xh0T1op5T8XlxY9JCjrhiY1X86qAM JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35chcr0gvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 17:45:26 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BBMXV9p071867;
 Fri, 11 Dec 2020 17:45:25 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35chcr0gvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 17:45:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BBMcZhl023830;
 Fri, 11 Dec 2020 22:45:25 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3581uaqq8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 22:45:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BBMjLbD14680502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 22:45:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 602C378067;
 Fri, 11 Dec 2020 22:45:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09B057805C;
 Fri, 11 Dec 2020 22:45:19 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.183.17])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Dec 2020 22:45:18 +0000 (GMT)
Message-ID: <aa8ebbb5b14821bcaf1d599511f75060d9dcc460.camel@linux.ibm.com>
Subject: Re: [PATCH 3/3] sev: update sev-inject-launch-secret to make gpa
 optional
From: James Bottomley <jejb@linux.ibm.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
Date: Fri, 11 Dec 2020 14:45:17 -0800
In-Reply-To: <afe66ae1-a1d9-c017-b05d-12247350338b@amd.com>
References: <20201209172334.14100-1-jejb@linux.ibm.com>
 <20201209172334.14100-4-jejb@linux.ibm.com>
 <afe66ae1-a1d9-c017-b05d-12247350338b@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_09:2020-12-11,
 2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110148
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Reply-To: jejb@linux.ibm.com
Cc: ashish.kalra@amd.com, brijesh.singh@amd.com, david.kaplan@amd.com,
 jon.grimm@amd.com, tobin@ibm.com, frankeh@us.ibm.com, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.vnet.ibm.com,
 Dov.Murik1@il.ibm.com, pbonzini@redhat.com, berrange@redhat.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2020-12-11 at 16:00 -0600, Tom Lendacky wrote:
> On 12/9/20 11:23 AM, James Bottomley wrote:
> > If the gpa isn't specified, it's value is extracted from the OVMF
> > properties table located below the reset vector (and if this
> > doesn't
> > exist, an error is returned).  OVMF has defined the GUID for the
> > SEV
> > secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format
> > of
> > the <data> is: <base>|<size> where both are uint32_t.  We extract
> > <base> and use it as the gpa for the injection.
> > 
> > Note: it is expected that the injected secret will also be GUID
> > described but since qemu can't interpret it, the format is left
> > undefined here.
> > 
> > Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> > ---
> >   qapi/misc-target.json |  2 +-
> >   target/i386/monitor.c | 22 +++++++++++++++++++++-
> >   2 files changed, 22 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 4486a543ae..1ee4e62f85 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -216,7 +216,7 @@
> >   #
> >   ##
> >   { 'command': 'sev-inject-launch-secret',
> > -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa':
> > 'uint64' },
> > +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa':
> > 'uint64' },
> >     'if': 'defined(TARGET_I386)' }
> >   
> >   ##
> > diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> > index 1bc91442b1..a99e3dd2b3 100644
> > --- a/target/i386/monitor.c
> > +++ b/target/i386/monitor.c
> > @@ -34,6 +34,7 @@
> >   #include "sev_i386.h"
> >   #include "qapi/qapi-commands-misc-target.h"
> >   #include "qapi/qapi-commands-misc.h"
> > +#include "hw/i386/pc.h"
> >   
> >   /* Perform linear address sign extension */
> >   static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> > @@ -730,9 +731,28 @@ SevCapability
> > *qmp_query_sev_capabilities(Error **errp)
> >       return sev_get_capabilities(errp);
> >   }
> >   
> > +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> > +struct sev_secret_area {
> > +    uint32_t base;
> > +    uint32_t size;
> > +};
> > +
> 
> Originally, the idea was to allow expanding of these GUID based
> structures by pre-pending data to them, but based on how
> pc_system_ovmf_table_find() returns the pointer to the start of the
> structure (based on the length found in the structure), I believe
> that expansion could be done by appending to the structure, which
> seems more logical. For example, if this structure is ever expanded,
> it can use the third parameter of pc_system_ovmf_table_find() to get
> the length and compare that to the size  of the structure to
> determine if new version of the structure is present in the firmware.

Actually, I don't think it much matters.  It looks like the len it
would return is wrong ... it should be the length of just the returned
data pointer (without the length or guid), so ptr+len would point to
the foot of the data if that's what you want.

> Otherwise you can't do the nice easy assignment below:
>    area = (struct sev_secret_area *)data;
> 
> You actually have to do some math:
>    area = (struct sev_secret_area *)(data + data_len -
>                                      sizeof(QemuUUID) -
> sizeof(uint16_t) -
> 				    sizeof(*area));
> 
> or add the QemuUUID and uint16_t fields to sev_secret_area and:
>    area = (struct sev_secret_area *)(data + data_len -
> sizeof(*area));

Right, that's why I think patch 2/3 should do

    *data_len = len - sizeof(QemuUUID) - sizeof(uint16_t)

> Or we make the decision that these GUID structs should never change,
> just add a new one to the table if more info is needed.

Actually, the fact that the only guid the table depends on is the table
footer GUID, you can always remove guids and add new ones.  So I think
it's up to whoever is using the GUID to decide the policy.

So for this one I'm not checking the length, which argues it wouldn't
be subject to the added length new data rule and I'd have to use a new
guid for new information.  However, I could also see situations where
you would check the length and thus would have the ability to add
fields (either at the beginning or the end).

> Whatever we decide should probably be documented in both the OVMF
> patches and the Qemu patches.

OK, I can add a comment about my use case and you can add one
documenting your length based use case.

James



