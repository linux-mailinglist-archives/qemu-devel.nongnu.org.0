Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53B3712E0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:15:36 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUfv-0006sS-Ba
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1ldUKH-0002WZ-3n; Mon, 03 May 2021 04:53:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1ldUKD-0000ts-8b; Mon, 03 May 2021 04:53:12 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1438XSQR012463; Mon, 3 May 2021 04:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=GH47K02FrE7gYU5xwhga2Cb3lAFtIeoPpzcksngV1oQ=;
 b=aJUjwlKlZ/43HRC/PX3uaDKrXMKLJSzly9zFRTMTHN0lgsETyBUXZi0Ub/nbRlfRBZHY
 Ik7Co2wDm0+bNivhi87ylYpUH2smCajTPpsTd/17qPDS/RFIxDw9aQXhS6Jtr2r7/8r2
 D2YuCW8uyAOmqVq+Jij0MR1TBmz+2jNWyj7l6hbS2EQw2lVm7n5sX3HOtqq06KFAqISv
 yOuoyTwkIasAFaDiOJDEa9tXtJP/4H5QEQEKJ/l4vCiyXqrxZhdcYHqlL13+ai6ytdxb
 dDzNjK2RMyMLsUhPjocR3r0iDKTd6pWmLu0m+mwnNNUjcfcgDB81fA/QL25DP8NE1abQ /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ad1x1jgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 04:53:03 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1438YD6X018044;
 Mon, 3 May 2021 04:53:03 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ad1x1jg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 04:53:02 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1438r0Zg031405;
 Mon, 3 May 2021 08:53:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8rm68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 08:53:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1438qwch46399938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 08:52:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27078A4A8B;
 Mon,  3 May 2021 08:52:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1803DA4A8A;
 Mon,  3 May 2021 08:52:57 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.58.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  3 May 2021 08:52:56 +0000 (GMT)
Date: Mon, 3 May 2021 14:22:54 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
Message-ID: <20210503085254.l23kcv6iaeupbrm7@in.ibm.com>
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
 <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
 <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
 <88cbb94c-33a1-642a-009a-133ffb51ea9d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88cbb94c-33a1-642a-009a-133ffb51ea9d@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uTg2q8lXFhM58grgUl7zZv8_50B4Yd55
X-Proofpoint-ORIG-GUID: 45SovsVY76MzJls8pip-gicD3JcsxOEE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_04:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=mahesh@linux.ibm.com;
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Qemu-ppc <qemu-ppc@nongnu.org>,
 Oliver O'Halloran <oohall@gmail.com>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-04-30 07:52:58 Fri, Daniel Henrique Barboza wrote:
> 
> 
> On 4/29/21 6:02 AM, Mahesh J Salgaonkar wrote:
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
> >      <hostdev mode='subsystem' type='pci' managed='yes'>
> >        <driver name='vfio'/>
> >        <source>
> >          <address domain='0x0033' bus='0x01' slot='0x00' function='0x0'/>
> >        </source>
> >        <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x0' multifunction='on'/>
> >      </hostdev>
> >      <hostdev mode='subsystem' type='pci' managed='yes'>
> >        <driver name='vfio'/>
> >        <source>
> >          <address domain='0x0033' bus='0x01' slot='0x00' function='0x1'/>
> >        </source>
> >        <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x1' multifunction='on'/>
> >      </hostdev>
> > 
> > Looks like libvirt does not allow pass through device in slot zero, and
> > throws following error.
> 
> There's no such restriction in Libvirt, at least as far as I remember.
> 
> > 
> > error: XML error: Invalid PCI address 0000:01:00.0. slot must be >= 1
> > Failed. Try again? [y,n,i,f,?]:
> 
> 
> This looks odd. The error message is complaining about 0000:01:00.0 but
> your XML up there is declaring 0000:01:01.0.

Above XML snipphet is working one. I see the XML error when I change slot
value to zero.

> 
> Also, the 'multifunction' bool is usually used only in the function 0
> passthrough, indicating that the guest will configure all other functions as
> the the multifunction device. You can ignore this bool in the XML for
> PCI passthrough if you don't care about the guest seeing this device as
> multifunction (i.e. all functions in the same IOMMU group and so on).
> 

Thanks,
-Mahesh.

