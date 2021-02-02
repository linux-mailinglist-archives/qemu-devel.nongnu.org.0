Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257B930CFEB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:37:52 +0100 (CET)
Received: from localhost ([::1]:48222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l75F1-00061F-6k
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l75DL-000563-7U
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:36:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l75DI-0003Mg-5v
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:36:07 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112NVnwH068779; Tue, 2 Feb 2021 18:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=BokNJSIoN4ee7OhDIdl5Rks80cdRewqHpa+lZZbJDxU=;
 b=j5w3Gzj50Q8PswafV0W6cGXscbewIxgIIWDucinGwF1fGXMd4JtvIf6vUHtpIG7rXDv2
 PV00HcSBspnszvPkT6slGWUFTMnofyMRqlveISlpz/LFr9jnoazozrWKEBlwmvNR2ad+
 mnvkCySnBoHA/Y9JHOZSNh5ZAsiLkcwBOjfTrkv+JxGPnn5+XxX2W5Al1Ai9cWp0lp/L
 JpICxcrIe1bBhz2NiazouSnwEtELjiyaZwF4E20aiodT3M23lzlWzYO4QsIkwmCDHtle
 9w5U7gfwDAK9zW8PvJXqTeVOcZF4fKfoA1VQ1AZ/mgUysqrTmBiSEXOuVwfmZCgVR8Gi VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fgbsr7v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 18:36:01 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112NYAtY077165;
 Tue, 2 Feb 2021 18:36:01 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fgbsr7ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 18:36:01 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112NWcT2009238;
 Tue, 2 Feb 2021 23:36:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 36eyucp670-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 23:36:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112NZupa26804722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 23:35:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C01C77805C;
 Tue,  2 Feb 2021 23:35:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88EDE7805F;
 Tue,  2 Feb 2021 23:35:54 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.153.205])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 23:35:54 +0000 (GMT)
Message-ID: <16a33e2f34ee370be4bbecad017b5760b7d65e81.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Tue, 02 Feb 2021 15:35:53 -0800
In-Reply-To: <20210126123201.GB4221@work-vm>
References: <20201214154429.11023-1-jejb@linux.ibm.com>
 <20201214154429.11023-3-jejb@linux.ibm.com> <20210126123201.GB4221@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_13:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020146
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, berrange@redhat.com, jon.grimm@amd.com, tobin@ibm.com,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, Dov.Murik1@il.ibm.com,
 pbonzini@redhat.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-01-26 at 12:32 +0000, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
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
> > 
> > ---
> > 
> > v2: fix line length warning, add more comments about sev area
> > ---
> >  qapi/misc-target.json |  2 +-
> >  target/i386/monitor.c | 27 ++++++++++++++++++++++++++-
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 06ef8757f0..0c7491cd82 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -216,7 +216,7 @@
> >  #
> >  ##
> >  { 'command': 'sev-inject-launch-secret',
> > -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa':
> > 'uint64' },
> > +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa':
> > 'uint64' },
> >    'if': 'defined(TARGET_I386)' }
> >  
> >  ##
> > diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> > index 1bc91442b1..11bdb04155 100644
> > --- a/target/i386/monitor.c
> > +++ b/target/i386/monitor.c
> > @@ -34,6 +34,7 @@
> >  #include "sev_i386.h"
> >  #include "qapi/qapi-commands-misc-target.h"
> >  #include "qapi/qapi-commands-misc.h"
> > +#include "hw/i386/pc.h"
> >  
> >  /* Perform linear address sign extension */
> >  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> > @@ -730,9 +731,33 @@ SevCapability
> > *qmp_query_sev_capabilities(Error **errp)
> >      return sev_get_capabilities(errp);
> >  }
> >  
> > +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> > +struct sev_secret_area {
> > +    uint32_t base;
> > +    uint32_t size;
> > +};
> > +
> >  void qmp_sev_inject_launch_secret(const char *packet_hdr,
> > -                                  const char *secret, uint64_t
> > gpa,
> > +                                  const char *secret,
> > +                                  bool has_gpa, uint64_t gpa,
> >                                    Error **errp)
> >  {
> > +    if (!has_gpa) {
> > +        uint8_t *data;
> > +        struct sev_secret_area *area;
> > +
> > +        /*
> > +         * not checking length means that this area can't be
> > versioned
> > +         * by length and would have to be replaced if updated
> > +         */
> 
> Can you just explain that a bit more?

It's referring back to the original concept that the reset vector
length would tell you what version of the thing you were using.  So if
you were looking for a property at offset 10 and the length came in as
8 the version was too early.  If it was 18 you had a later version and
your property was present.

The current scheme uses guids which can be versioned by length if you
think you'll add extra properties to them.  This one I don't think
would ever get an extra property, so there's no point checking the
length.  Not checking the length means if I'm wrong and we do need an
extra property it will have to be attached to a new guid.

That's a bit confusing to add to the comment ... how about I just leave
out the comment entirely?

> > +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data,
> > NULL)) {
> > +            error_setg(errp, "SEV: no secret area found in OVMF,"
> > +                       " gpa must be specified.");
> > +            return;
> > +        }
> > +        area = (struct sev_secret_area *)data;
> > +        gpa = area->base;
> > +    }
> > +
> >      sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
> 
> Other than me not understanding that comment, I think we're fine:

Thanks.

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> >  }
> > -- 
> > 2.26.2
> > 
> > 



