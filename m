Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED32BA0A3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 03:52:55 +0100 (CET)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfwXd-0000PY-PA
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 21:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kfwWA-0008Ly-77; Thu, 19 Nov 2020 21:51:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kfwW7-000161-Bs; Thu, 19 Nov 2020 21:51:22 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AK2W0ej172413; Thu, 19 Nov 2020 21:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ub5+bb3nS3aoVM+aL2mrHuyD5Igi2FKmZFiEg86mNS4=;
 b=BYHf4J57d7wk+blJ0q4bdjbeEv0E+z8d2pRfutCTd0Z9PYuk/Q14mEKaWT5XqgLMXCic
 nzcKAZ18WC/WjYqpaA7aXDm7Y8okrtrE/uQeQ/JhZQIi9kVuWEFInKJfLBc6c3FcNfBJ
 UyuNs7rB60+V77heWpYVCfw0i3Ji0U3XZ6+oT5iEYhYtxM9lm6Zhn+Q6EsFTrNWZhBPJ
 BHKiMwJRBIuZpFuEj1owOB0hOsElI9hGRpH1lQY9jqzuY5htgRdh3sldq2sVCXHcJSz6
 dXgYWncSqGjfdYBgu15coVm4s5IvebYfr4+MkS6KbbhInBzUb0/OIWgNWu9KWEkI+aMT KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34x4kvh28m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 21:51:15 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AK2W64G172792;
 Thu, 19 Nov 2020 21:51:15 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34x4kvh27u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 21:51:15 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AK2bkMv023077;
 Fri, 20 Nov 2020 02:51:12 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 34weby189j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 02:51:12 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AK2p9ke9175784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 02:51:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86A00A405C;
 Fri, 20 Nov 2020 02:51:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D546A4054;
 Fri, 20 Nov 2020 02:51:09 +0000 (GMT)
Received: from oc2783563651 (unknown [9.171.7.71])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 20 Nov 2020 02:51:08 +0000 (GMT)
Date: Fri, 20 Nov 2020 03:51:07 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] vfio-ccw: Connect the device request notifier
Message-ID: <20201120035107.30688e2f.pasic@linux.ibm.com>
In-Reply-To: <20201117032605.56831-3-farman@linux.ibm.com>
References: <20201117032605.56831-1-farman@linux.ibm.com>
 <20201117032605.56831-3-farman@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_14:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200013
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Marc Hartmayer <mhartmay@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 04:26:05 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Now that the vfio-ccw code has a notifier interface to request that
> a device be unplugged, let's wire that together.

I'm aware of the fact that performing an unplug is what vfio-pci does,
but I was not aware of this before, and I became curious with regards
to how is this going to mesh with migration (in the future).

The sentence 'For this to work, QEMU has to be launched with the same
arguments the two times.' form docs/devel/migration.rst should not
be taken literally, I know, but the VM configuration changing not because
it was changed via a management interface, but because of events that
may not be under the control of whoever is managing the VM does
make thinks harder to reason about.

I suppose, we now basically mandate that whoever manages the VM, either
a) maintains his own model of the VM and listens to the events, to
update it if such a device removal happens, or
b) inspects the VM at some appropriate point in time, to figure out how
the target VM is supposed to be started.

I think libvirt does a).

I also suppose, such a device removal may not happen during device
migration. That is, form the QEMU perspective I  believe taken care
by the BQL.

But I'm in the dark regarding the management software/libivrt view. For
example what happens if we get a req_notification on the target while
pre-copy memory migration? At that point the destination is already
receiving pages, thus it is already constructed.

My questions are not necessarily addressed to you Eric. Maybe the
folks working on vfio migration can help us out. I'm also adding
our libvirt guys.

Regards,
Halil

