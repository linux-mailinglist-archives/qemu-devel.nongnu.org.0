Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF638B96D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 00:21:15 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljr2X-00085U-PE
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 18:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1ljr0e-0005uR-Dc
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:19:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1ljr0c-00078Y-EJ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:19:16 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KM4ONG032094
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 18:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=1N0/qlb5SDPBuueadVAcpfGL/Eu9BOQ8sR0Z5lvvsy8=;
 b=k0zL/2vadh48sKJqD5OcEpkLFEqymkdnpVEU7bUsQDOvWh4rVFMDDqVCESUpVeXVOE5y
 o0z6B+URS43PSzlCWZ00iOs7ZvhLZCICjdoCMr0aguBNiKPRVEQlN32fBcoD4Y9Qh8Bc
 LIX9lXjwJpWGWK3S/q9xUujmDTo3qOih+TGcFFWFVQpzpziPPHf2iQ1nMTEm85OZZtsg
 eIz7wFBWMThDmVgsG0y8/azzzyoFHOavTCEUssWGBKutYMvIUpA42zgQAWQIuZLdaY4e
 vKUVdYtHuN7p6i3quQYc4vJ9ekKu4Fav3FZ1kzLgZ+zCFDhd/DNPe5dTcRem4QprHWBw Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nyservxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 18:19:10 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14KM4nrT033003
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 18:19:10 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nyservx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 18:19:10 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KMH7JL028489;
 Thu, 20 May 2021 22:19:09 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 38j5xa5vj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 22:19:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KMJ8jU19267874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 22:19:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FC3478037;
 Thu, 20 May 2021 22:19:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3687078012;
 Thu, 20 May 2021 22:19:07 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.208.94])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 22:19:06 +0000 (GMT)
Message-ID: <25edd87f17b87db14b0b09b5dca1a41644ce4169.camel@linux.ibm.com>
Subject: Re: [PULL 02/19] sev: update sev-inject-launch-secret to make gpa
 optional
From: James Bottomley <jejb@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 20 May 2021 15:19:05 -0700
In-Reply-To: <66d0ca68-2f9f-1ae5-16ee-9dac4873dcbe@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <20210215131626.65640-3-pbonzini@redhat.com>
 <66d0ca68-2f9f-1ae5-16ee-9dac4873dcbe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lUJJkpbsnzIy_fe4LgOxDYs9oPjlsvfv
X-Proofpoint-ORIG-GUID: ErY0m8_cb8eVQD--HzkkYHrDYI6T6iuO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_07:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105200138
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-05-20 at 23:36 +0200, Philippe Mathieu-Daudé wrote:
> On 2/15/21 2:16 PM, Paolo Bonzini wrote:
> > From: James Bottomley <jejb@linux.ibm.com>
> > 
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
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Message-Id: <20210204193939.16617-3-jejb@linux.ibm.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  qapi/misc-target.json |  2 +-
> >  target/i386/monitor.c | 23 ++++++++++++++++++++++-
> >  2 files changed, 23 insertions(+), 2 deletions(-)
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
> > index 1bc91442b1..5994408bee 100644
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
> > @@ -730,9 +731,29 @@ SevCapability
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
> > +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data,
> > NULL)) {
> 
> FYI trying to build MicroVM standalone (--without-default-devices):
> 
> /usr/bin/ld: libqemu-i386-softmmu.fa.p/target_i386_monitor.c.o: in
> function `qmp_sev_inject_launch_secret':
> target/i386/monitor.c:749: undefined reference to
> `pc_system_ovmf_table_find'
> 
> I'm adding this to my TODO list.

I'm pretty clueless with the new meson build system but I think this is
something to do with CONFIG_PC not being defined ... can you verify? in
which case it could be fixed with a pc_sysfw-stub.c that builds it as a
function returning false.

James



