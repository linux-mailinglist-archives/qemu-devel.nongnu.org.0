Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C42F4DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:54:36 +0100 (CET)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhXf-0008Qi-9t
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1kzhVY-0007Zc-Im; Wed, 13 Jan 2021 09:52:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60186
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1kzhVW-0006v6-KT; Wed, 13 Jan 2021 09:52:24 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10DEVqdG087779; Wed, 13 Jan 2021 09:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=0hXtwqYjmeFE05CKyDaZmQZWwuJupPxxDfu6SRW9yMs=;
 b=dNzCYCv/rOcLXuEhW6pIkp0jjk0fbaL9mFcMbyXe1MPJcVTJq+2UhqwOUq/kq70EDLGa
 JU7qAUF8Y1Z+HUaL8UpgFP/Ywb+PKEwz+NafFocJViGFZYFmMyxJLIv1nzhlR+MIFmoT
 boX19PM1I/96Xi/w+QsV7dZG8J7fwfcZRYqOkIr/ffS8yFMIcRRLTlM0mt5kjuRVer9u
 7PWDY98CH+DJ+w7BtyfQdkYFJP9nAlHRc4cSCVC+fWl2STUFhCLYtDdlT2TDtZ5a8ztS
 FXWz8vViNCQIJAsnsvzHvPVVhP+1K8iRIJj1rM38RAlp92sB+cviG7uUFvDpuXK+yaFZ YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3621ypt7js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 09:52:14 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10DEXAqS096368;
 Wed, 13 Jan 2021 09:52:14 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3621ypt7j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 09:52:13 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10DElJw3018060;
 Wed, 13 Jan 2021 14:52:12 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 35y447w5an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 14:52:12 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10DEqAAB35389872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 14:52:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FF7B52054;
 Wed, 13 Jan 2021 14:52:10 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.105.236])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 0464152051;
 Wed, 13 Jan 2021 14:52:08 +0000 (GMT)
Date: Wed, 13 Jan 2021 20:22:06 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210113145206.GA2421313@in.ibm.com>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
 <2fbd70fa-17a0-2776-e4ae-a4b128713921@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fbd70fa-17a0-2776-e4ae-a4b128713921@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_07:2021-01-13,
 2021-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130087
Received-SPF: pass client-ip=148.163.158.5; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: bharata@linux.ibm.com
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 10:16:30AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 1/6/21 5:59 AM, Bharata B Rao wrote:
> > If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> > 
> > - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
> >    ibm,hypertas-functions property.
> > - Enable the hcall
> > 
> > Both the above are done only if the new sPAPR machine capability
> > cap-rpt-invalidate is set.
> > 
> > Note: The KVM implementation of the hcall has been posted for upstream
> > review here:
> > https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t
> > 
> > Update to linux-headers/linux/kvm.h here is temporary, will be
> > done via header updates once the kernel change is accepted upstream.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> 
> Code LGTM.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> A few questions about the logic:
> 
> - does it work only on Power 9 like you mentioned in the error message
> down below? If it's supported on Power 10 as well then we would want the
> error message to read "H_RPT_INVALIDATE only supported on POWER9 and newer"
> to contemplate it.

Making it conditional to Power 9 was an oversight, will remove in the
next iteration.

> 
> - Does it make sense to expose "rpt-invalidate" to Libvirt? I see that the
> capability is turned off by default, which may indicate that even if kernel
> and QEMU support is present the user might want to not enable it. Is there
> some sort of drawback/compromise when activating this cap?

I have added this to take care of migration compatibility between
source and target when hcall is present in target and not present
in source or vice versa. I wonder if there is any other preferred
method than introducing a new machine capability like cap-rpt-invalidate.

Regards,
Bharata.




