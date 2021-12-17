Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB04794E1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 20:34:31 +0100 (CET)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myIzu-0000A0-Jg
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 14:34:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1myIuN-0005Tg-Bz; Fri, 17 Dec 2021 14:28:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1myIuK-0005XQ-T5; Fri, 17 Dec 2021 14:28:46 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHIYNd5022731; 
 Fri, 17 Dec 2021 19:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=gRZvr7zlGkqILHQCAgqsQ2nDdw9ndW4OVyroErn/IEw=;
 b=iJiQbS8poeyhRDqjZU5XUkvh67Y0ZJPgxWP4oGT7VoOiD8/kaP6srlDtEIjtfW25Ms20
 9CRtXpFPV7cJAnD8jRlowEMOMKCRytXeHN1JHTQLPlmaIJKEcAc0kFnQLXrRHD0pmqWF
 znV1NoCL/FKCLvg6GqjvN26IN3W1oBd0WJUxe0l0JXi2peFiatm+ueAym/dzd2mSCs5h
 9CcJWG2L1x7Yr3njaf1PsfU5pIo0pA5iop71gSUrakKt6ppbKq6Q9UNi1aUxrAIqzAE0
 kvJ2uEF+9US0LrQopAhAXM3FMorKq0nzZUHs8s76AMz9whaeWdu5zZRPN1z/t6o/F+83 dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d0j1vtwyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 19:28:42 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BHJ9pNQ006662;
 Fri, 17 Dec 2021 19:28:42 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d0j1vtwy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 19:28:41 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BHIb7rj029255;
 Fri, 17 Dec 2021 19:28:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78hua17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 19:28:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BHJSVRI45547994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 19:28:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 348ADA404D;
 Fri, 17 Dec 2021 19:28:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7E53A4040;
 Fri, 17 Dec 2021 19:28:30 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.63.32])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 17 Dec 2021 19:28:30 +0000 (GMT)
Date: Fri, 17 Dec 2021 20:28:18 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
Message-ID: <20211217202818.7e843a1d.pasic@linux.ibm.com>
In-Reply-To: <7143886b-ffa2-e5f7-e7fe-b06212522824@linux.ibm.com>
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
 <20211217145811.71dd0a70.pasic@linux.ibm.com>
 <7143886b-ffa2-e5f7-e7fe-b06212522824@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 57-yYX5lieEz6gyiUR561kDSuyuOru1Y
X-Proofpoint-ORIG-GUID: w2yeHFRp5qKmOqxmSZPVctE3u0Afh6Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_07,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Nico Boehr <nrb@linux.ibm.com>, frankja@linux.ibm.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Dec 2021 18:13:47 +0100
Pierre Morel <pmorel@linux.ibm.com> wrote:

> >> Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
> >> as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
> >> 1, 6 and 7 need to be zero.  
> > 
> > On a second thought, don't we have to make sure then that bit 5 is
> > ignored?
> > 
> > static void copy_pmcw_from_guest(PMCW *dest, const PMCW *src)
> > {
> >      int i;
> > 
> >      dest->intparm = be32_to_cpu(src->intparm);
> >      dest->flags = be16_to_cpu(src->flags);
> >      dest->devno = be16_to_cpu(src->devno);
> > 
> > Here we seem to grab flags as a whole, but actually we would have to
> > mask of bit 5.  
> 
> Why?
> If this bit is ignored by the machine shouldn't we just ignore it?
> Forcing it to 0 or to 1 is purely arbitrary no?

We do the masking later on:
IOInstEnding css_do_msch(SubchDev *sch, const SCHIB *orig_schib)
{
[..]
    /* Only update the program-modifiable fields. */
    schib->pmcw.intparm = schib_copy.pmcw.intparm;
    oldflags = schib->pmcw.flags;
    schib->pmcw.flags &= ~(PMCW_FLAGS_MASK_ISC | PMCW_FLAGS_MASK_ENA |
                  PMCW_FLAGS_MASK_LM | PMCW_FLAGS_MASK_MME |
                  PMCW_FLAGS_MASK_MP);
    schib->pmcw.flags |= schib_copy.pmcw.flags &
            (PMCW_FLAGS_MASK_ISC | PMCW_FLAGS_MASK_ENA |
             PMCW_FLAGS_MASK_LM | PMCW_FLAGS_MASK_MME |
             PMCW_FLAGS_MASK_MP);
[..]

I just didn't read far enough. We do that for a while now.

The PoP says that the machine shall ignore other fields
of the PMCW when an MSCH is performed. I.e. we should not update
"our" pmcw.flags bit 5 from 0 to 1 even if 1 was supplied, and
thus STSCH should keep storing the bit 5 as 0 even if there was
a MSCH with bit 5 set.

Regards,
Halil

