Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423037186C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:49:10 +0200 (CEST)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaom-0000We-VD
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1ldana-00086K-AM; Mon, 03 May 2021 11:47:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23794
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1ldanW-0006Rq-7A; Mon, 03 May 2021 11:47:53 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143FXqEo053181; Mon, 3 May 2021 11:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Pk5oRGbQoy1YfZul6QTHaVytry1cE8r38/RvLQvhU4c=;
 b=ryhxiIkQXvdooDml3mN3NOdaCNo3bbRrVt9v1BQc1JBD4qqKrSIyHQMQJebAZ9Ze7jYT
 dk4mx2nhKDlWK0ht+qRdp9heLJvuubC5UIggnib95c5E4MuUC9hvWTcErIKo6rWHXzfZ
 4PH4IZ8Wk4dcGGfQWvhY76Fy/sU9dKrVcNrwfkYzY9GKjSrhTzDipMKFMh82g89mDK/Z
 zXNbjtcLtsiDJEITUPXpWZVQlI21G/4bYjT+TDsZ0WXFIEWN3qYFzQfqfrLt96wdwfea
 QIaYZptEkIWO1IK9hJlFqWTASoueMIpaXmz8gTiJ8KuwboYa14XQLrBDF6KqnzBqOzFX pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ahy4va08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 11:47:48 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 143FY6uv053833;
 Mon, 3 May 2021 11:47:47 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ahy4v9yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 11:47:47 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143Fcjdn026201;
 Mon, 3 May 2021 15:47:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 388xm88ebj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 15:47:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143FlhZ016449814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 15:47:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEFAD4C04A;
 Mon,  3 May 2021 15:47:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD51B4C044;
 Mon,  3 May 2021 15:47:42 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.58.128])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  3 May 2021 15:47:42 +0000 (GMT)
Date: Mon, 3 May 2021 21:17:40 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
Message-ID: <20210503154740.jsnysqofpy5ph4kr@in.ibm.com>
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
 <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
 <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
 <CAOSf1CG21nZOzAXt8SohHxPq4KW1BrwCje_qEYyPvfF59q4=kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CG21nZOzAXt8SohHxPq4KW1BrwCje_qEYyPvfF59q4=kg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lSdrlnC-oWDWYHWQIzn_w43Kppa9ZWgU
X-Proofpoint-GUID: TFZmW5hVjAd739WvCWl1VFsAS0Li3LJv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_10:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030105
Received-SPF: pass client-ip=148.163.158.5; envelope-from=mahesh@linux.ibm.com;
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
Reply-To: mahesh@linux.ibm.com
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-04-30 11:53:24 Fri, Oliver O'Halloran wrote:
> On Thu, Apr 29, 2021 at 7:02 PM Mahesh J Salgaonkar
> <mahesh@linux.ibm.com> wrote:
> >
> > On 2021-04-28 22:33:45 Wed, Oliver O'Halloran wrote:
> > > On Tue, Apr 27, 2021 at 9:56 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> > > >
> > > > With upstream kernel, especially after commit 98ba956f6a389
> > > > ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> > > > guest isn't able to enable EEH option for PCI pass-through devices anymore.
> > >
> > > How are you passing the devices through to the guest?
> >
> > I am using libvirt with below xml section to add pass-through:
> >
> >     <hostdev mode='subsystem' type='pci' managed='yes'>
> >       <driver name='vfio'/>
> >       <source>
> >         <address domain='0x0033' bus='0x01' slot='0x00' function='0x0'/>
> >       </source>
> >       <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x0' multifunction='on'/>
> >     </hostdev>
> >     <hostdev mode='subsystem' type='pci' managed='yes'>
> >       <driver name='vfio'/>
> >       <source>
> >         <address domain='0x0033' bus='0x01' slot='0x00' function='0x1'/>
> >       </source>
> >       <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x1' multifunction='on'/>
> >     </hostdev>
> >
> > Looks like libvirt does not allow pass through device in slot zero, and
> > throws following error.
> >
> > error: XML error: Invalid PCI address 0000:01:00.0. slot must be >= 1
> > Failed. Try again? [y,n,i,f,?]:
> 
> That's pretty odd and I have no idea why that's happening. I seem to
> remember being able to use slot 0 for vfio devices when doing the
> passthru manually with the qemu command line so this might be a
> libvirt quirk.
> 
> > *snip*
> >
> > Agree. I realize my fix is not correctly handling this. The current code
> > under ibm,set-eeh-option is checking for individual PCI device presence.
> > Better fix should be to check if there is any PCI device (vfio-pci)
> > present under specified bus and enable the EEH if found. And no change
> > in return value of get-config-addr-info2. What do you say ?
> 
> That sounds reasonable. You would however need to verify that all the
> devices on that bus are within the same PE on the hypervisor side.

I see that the spapr_phb_eeh_available(sphb) check in ibm,set-eeh-option
already makes sure that all the devices on that bus are from same iommu
group (within same PE) before going ahead with enabling EEH.

---------
rtas_ibm_set_eeh_option():
    ...
    if (!spapr_phb_eeh_available(sphb)) {          <---
        goto param_error_exit;
    }

    ret = spapr_phb_vfio_eeh_set_option(sphb, addr, option);
    rtas_st(rets, 0, ret);
    return;

param_error_exit:
    rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
----------

I verified that, if we add devices from two different PHB under same
sphb then spapr_phb_eeh_available(sphb) returns false and we fail to
enable EEH. Hence we are good here, we fail very early if devices on
that bus are not within same PE.

So, I just need to check for presence of any vfio-pci device under the
specified bus and enable the EEH. Let me know your views on this.

Thanks,
-Mahesh.

-- 
Mahesh J Salgaonkar

