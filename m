Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A530CFEA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:37:42 +0100 (CET)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l75Er-0005lz-Vz
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l75D8-0004xZ-1Y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:35:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l75D5-0003Fw-Cc
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:35:53 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112NXlvx076296; Tue, 2 Feb 2021 18:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=dzc8cCOCbcc0RK+wMYJdM4g/NYYbEtqFfE06tGY5Nd0=;
 b=E5hSyK77NSuAfYgFBErN5gEi6ItA8bpMWe/A8Y4GDWFZXBkSCGT5ejLTadAlhlU7QDob
 3yovAbrHVZlMRLGHEZ4Ip8iw6IR1Ah6cQ1LPl07bvHT8Wjovuw2/WFeTLg6h272SqD9c
 CbocgWQ+aC8uY+nOCO0Wp9B0pWL8Cv5h46Zlsnr1mwx/Pe44DIrHbYF7zb2WbH5ggHSZ
 YkjEZsPHwGKr1VJqEJ7X1dTKWFMH3LoGRuxxmkcdZeUGbC3LlIPjTFlS03cHf+gVMc5y
 cAw8blU4aSwGF2RLTttuGUUKS8WS4PDfqFGtsljRYP+wz9Fej0cWPFiJZLUXjGa7ffs2 dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fga0ra1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 18:35:46 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112NXuMh076578;
 Tue, 2 Feb 2021 18:35:46 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fga0ra1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 18:35:45 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112NMCnu018783;
 Tue, 2 Feb 2021 23:30:45 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 36eu8qhnvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 23:30:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112NUgsj25297262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 23:30:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C6D07805E;
 Tue,  2 Feb 2021 23:30:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DCBC78060;
 Tue,  2 Feb 2021 23:30:39 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.153.205])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 23:30:39 +0000 (GMT)
Message-ID: <5bb73ef97b40eda029c54c9443274d5227372f8d.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] pc: add parser for OVMF reset block
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Tue, 02 Feb 2021 15:30:38 -0800
In-Reply-To: <20210126122207.GA4221@work-vm>
References: <20201214154429.11023-1-jejb@linux.ibm.com>
 <20201214154429.11023-2-jejb@linux.ibm.com> <20210126122207.GA4221@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_13:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020150
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, berrange@redhat.com, jon.grimm@amd.com, tobin@ibm.com,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, Dov.Murik1@il.ibm.com,
 pbonzini@redhat.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-01-26 at 12:22 +0000, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
> > OVMF is developing a mechanism for depositing a GUIDed table just
> > below the known location of the reset vector.  The table goes
> > backwards in memory so all entries are of the form
> > 
> > <data>|len|<GUID>
> > 
> > Where <data> is arbtrary size and type, <len> is a uint16_t and
> > describes the entire length of the entry from the beginning of the
> > data to the end of the guid.
> > 
> > The foot of the table is of this form and <len> for this case
> > describes the entire size of the table.  The table foot GUID is
> > defined by OVMF as 96b582de-1fb2-45f7-baea-a366c55a082d and if the
> > table is present this GUID is just below the reset vector, 48 bytes
> > before the end of the firmware file.
> > 
> > Add a parser for the ovmf reset block which takes a copy of the
> > block,
> > if the table foot guid is found, minus the footer and a function
> > for
> > later traversal to return the data area of any specified GUIDs.
> > 
> > Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> > 
> > ---
> > 
> > v2: fix brace warnings and return values
> > ---
> >  hw/i386/pc_sysfw.c   | 106
> > +++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/i386/pc.h |   4 ++
> >  2 files changed, 110 insertions(+)
> > 
> > diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> > index 92e90ff013..436b78c587 100644
> > --- a/hw/i386/pc_sysfw.c
> > +++ b/hw/i386/pc_sysfw.c
> > @@ -124,6 +124,107 @@ void
> > pc_system_flash_cleanup_unused(PCMachineState *pcms)
> >      }
> >  }
> >  
> > +#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-
> > a366c55a082d"
> > +
> > +static uint8_t *ovmf_table;
> > +static int ovmf_table_len;
> > +
> > +static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, int
> > flash_size)
> 
> Maybe size_t for flash_size?

Heh, sure, who knows how big OVMF will get ...  but I get the point
about an int overflow attack.

> > +{
> > +    uint8_t *ptr;
> > +    QemuUUID guid;
> > +    int tot_len;
> > +
> > +    /* should only be called once */
> > +    if (ovmf_table) {
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * if this is OVMF there will be a table footer
> > +     * guid 48 bytes before the end of the flash file.  If it's
> > +     * not found, silently abort the flash parsing.
> > +     */
> > +    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
> > +    guid = qemu_uuid_bswap(guid); /* guids are LE */
> > +    ptr = flash_ptr + flash_size - 48;
> 
> I think since flash_size is coming from memory_region_size it's
> probably rounded to a page size by now, but perhaps we should always
> check we have enough space before we start moving pointers around

I think OVMF must be at least a page, so I can add that check.

> (Given that the OVMF binary might be provided by the guest owner, we
> have to consider it might be a vector to attack the hypervisor).
> 
> > +    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
> > +        return;
> > +    }
> > +
> > +    /* if found, just before is two byte table length */
> > +    ptr -= sizeof(uint16_t);
> > +    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) -
> > sizeof(uint16_t);
> > +
> > +    if (tot_len <= 0) {
> > +        return;
> > +    }
> > +
> > +    ovmf_table = g_malloc(tot_len);
> > +    ovmf_table_len = tot_len;
> > +
> > +    /*
> > +     * ptr is the foot of the table, so copy it all to the newly
> > +     * allocated ovmf_table and then set the ovmf_table pointer
> > +     * to the table foot
> > +     */
> > +    memcpy(ovmf_table, ptr - tot_len, tot_len);
> > +    ovmf_table += tot_len;
> > +}
> > +
> > +bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
> > +                               int *data_len)
> > +{
> > +    uint8_t *ptr = ovmf_table;
> > +    int tot_len = ovmf_table_len;
> > +    QemuUUID entry_guid;
> > +
> > +    if (qemu_uuid_parse(entry, &entry_guid) < 0) {
> > +        return false;
> > +    }
> > +
> > +    if (!ptr) {
> > +        return false;
> > +    }
> > +
> > +    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
> > +    while (tot_len > 0) {
> > +        int len;
> > +        QemuUUID *guid;
> > +
> > +        /*
> > +         * The data structure is
> > +         *   arbitrary length data
> > +         *   2 byte length of entire entry
> > +         *   16 byte guid
> > +         */
> > +        guid = (QemuUUID *)(ptr - sizeof(QemuUUID));
> > +        len = le16_to_cpu(*(uint16_t *)(ptr - sizeof(QemuUUID) -
> > +                                        sizeof(uint16_t)));
> 
> Again I think we need to be checking tot_len > (sizeof(QemuUUID) +
> sizeof(uint16_t)) before doing this dereference.

I can make the loop start

  while (tot_len > sizeof(QemuUUID) + sizeof(uint16_t))

> > +        /*
> > +         * just in case the table is corrupt, wouldn't want to
> > spin in
> > +         * the zero case
> > +         */
> > +        if (len < sizeof(QemuUUID) + sizeof(uint16_t)) {
> > +                return false;
> > +        }
> > +
> > +        ptr -= len;
> > +        tot_len -= len;
> 
> and that len is smaller or equal to tot_len here.

OK.



