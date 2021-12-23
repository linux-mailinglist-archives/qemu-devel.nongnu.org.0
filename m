Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9E47E1AB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:45:44 +0100 (CET)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0LbS-0003bi-U1
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:45:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n0LYG-0000v2-Ev; Thu, 23 Dec 2021 05:42:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n0LYE-0005Bq-Aa; Thu, 23 Dec 2021 05:42:24 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN9fh2B012763; 
 Thu, 23 Dec 2021 10:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=4RZrTLjSegO8C32W1Wyqqgc9Xc1ZJgMby0IsthWNgmQ=;
 b=PdNuBD0FIg11T0svZ7aogLP3JCNpXJYBt40j3PjBElgH+q21GhGK26l1iA/pAxX23+Pc
 19bOl5SGV0HBte6JgzNkaK0yudkYyWUV6msIF/tCbiw+wTA1HzX75L/mGjF6dwuT/exx
 9/or+hhsRQsQzTnz/YkD4Mys6GhR8FldzgaKoAWYUH5BhwPErjyqhgscNpEEF+hkfKEh
 i4U9YRBBiYYmP0FdxasfdJeT4OeqZo9PIYbxn8VGrIjqqm7PuPBixWgyNxwLZNtrOqN3
 3V7Lpc5En8H0QNGYZY1W6df0nePsIeO2eaSiYyPy7o7TGm+xKT6GNN61RlhEQ3vyFRSg gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4pq0ry82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 10:42:19 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN9jhwK024677;
 Thu, 23 Dec 2021 10:42:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4pq0ry7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 10:42:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BNAXbax021054;
 Thu, 23 Dec 2021 10:42:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3d179a5rq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 10:42:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BNAgB5o44433886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 10:42:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 928EFAE05A;
 Thu, 23 Dec 2021 10:42:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E54FAAE05F;
 Thu, 23 Dec 2021 10:42:10 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.57.19])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 23 Dec 2021 10:42:10 +0000 (GMT)
Date: Thu, 23 Dec 2021 11:41:57 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
Message-ID: <20211223114157.514496aa.pasic@linux.ibm.com>
In-Reply-To: <87h7b037vw.fsf@redhat.com>
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
 <87h7b037vw.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MhplyXkW_jhLb4ZooLEPM8MRr1QteLc9
X-Proofpoint-ORIG-GUID: m6sVMdyq05VAsN9mQ94deahcjOZjxWSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_02,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112230056
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
 pmorel@linux.ibm.com, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Dec 2021 17:46:11 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, Dec 16 2021, Nico Boehr <nrb@linux.ibm.com> wrote:
> 
> > Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
> > as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
> > 1, 6 and 7 need to be zero.
> >
> > As both PMCW_FLAGS_MASK_INVALID and ioinst_schib_valid() are only used
> > by ioinst_handle_msch(), adjust the mask accordingly.
> >
> > Fixes: db1c8f53bfb1 ("s390: Channel I/O basic definitions.")
> > Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> > Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> > Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
> > Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
> > ---
> >  include/hw/s390x/ioinst.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> > index 3771fff9d44d..ea8d0f244492 100644
> > --- a/include/hw/s390x/ioinst.h
> > +++ b/include/hw/s390x/ioinst.h
> > @@ -107,7 +107,7 @@ QEMU_BUILD_BUG_MSG(sizeof(PMCW) != 28, "size of PMCW is wrong");
> >  #define PMCW_FLAGS_MASK_MP 0x0004
> >  #define PMCW_FLAGS_MASK_TF 0x0002
> >  #define PMCW_FLAGS_MASK_DNV 0x0001
> > -#define PMCW_FLAGS_MASK_INVALID 0x0700
> > +#define PMCW_FLAGS_MASK_INVALID 0xc300  
> 
> Removing bit 5 from this mask makes sense, at it is simply ignored.
> 
> I'm a bit confused about bits 0 and 1, however. They are _QF and _W,
> respectively (just out of the context here), which are in the same class
> as _DNV (i.e. characteristics of the subchannel that cannot be modified
> via msch). Looking at the PoP, I don't see what is supposed to happen if
> the program tries to modify the dnv bit (maybe I'm simply overlooking
> it.) I would naively assume that the w bit should behave in the same way
> (as it does for message subchannels what dnv does for I/O subchannels,
> and the rest of the values are not meaningful if it is not set), and
> probably also the qf bit (as it doesn't make sense for the program to
> turn QDIO capabilities on and off.) The main question is whether trying
> to modify these bits causes an error or is ignored. The PoP suggests an
> error (no idea if the internal architecture agrees, it hopefully does);
> what happens for dnv?

"""
Bits 0, 1, 6, and 7 of word 1, and bits 0-28 of word 6
of the SCHIB operand must be zeros, and bits 9 and
10 of word 1 must not both be ones. When the
extended-I/O-measurement-block facility is installed
and a format-1 measurement block is specified, bits
26-31 of word 11 must be specified as zeros.
"""
(IBM z/Architecture Principles of Operation (SA22-7832-10), 14-8)

The internal architecture agrees.

DNV bit is ignored. Regarding why, I don't know. Probably for historic
reasons. The PoP tells us that whatever is not listed as significant
or checked and results in an operation exception if not appropriate
is ignored:
"""
The remaining
fields of the SCHIB are ignored and do not affect the
processing of MODIFY SUBCHANNEL. (For further
details, see “Subchannel-Information Block” on
page 2
"""
(same page)

Regarding word 1 of the SCHIB the alignment between PoP and AR is
perfect AFAICT.

> 
> We support neither message subchannels nor QDIO in QEMU, so it's
> probably not relevant right now; but it would still be good if we could
> clarify the expected behaviour here :)
> 
> >  
> >  #define PMCW_CHARS_MASK_ST 0x00e00000
> >  #define PMCW_CHARS_MASK_MBFC 0x00000004  
> 
> 


