Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2DD662FAD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:00:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExN2-0001rd-GS; Mon, 09 Jan 2023 13:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pExN0-0001rD-4w
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:59:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pExMy-00009f-5a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:59:41 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309HNxum007468
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 18:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=OocGyUsHg7V3hp/YMpspAGYKZ2Qsl2dgUhNLKrhYmMc=;
 b=nRUnwnvQ7HiDNKB6EMZ1vqOS4m0hOGV3bKrB0wtOT9rAp/7N9FGf+iY59ilvDccreiQe
 lquLjVWZsaEYmXt2e5/ZtN/AgjbXUF4+cFmUEsS5yf/ul7N8CIiUWpsj52Rbo8jJPyxS
 Cc3lYQO7qqhYnwEwpbiPlAi2sMM+3nK6p9jqnF0xoTgy0QmBBB6C6O6A3hgZGtHCla5g
 a/wNPXIXhBxcZBFm8AvB+g36mvicmPlkqA5goDKg2i/HuDivRG2byInXGv2O26Jeu1eb
 KFim8Sr2CvWdFf8ycKkkEO0jzU6yNmje0Hc4Dl1NqRyVWrANoEkfsCh4msGvH9fj0czs Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjw3nug1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 18:59:38 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309Iqsi3027691
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 18:59:38 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjw3nufr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 18:59:38 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309Iv6Wr029230;
 Mon, 9 Jan 2023 18:59:37 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3my0c7gpvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 18:59:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309IxZZl38011290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 18:59:36 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0E967805C;
 Mon,  9 Jan 2023 20:36:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8390E7805F;
 Mon,  9 Jan 2023 20:36:08 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 20:36:08 +0000 (GMT)
Message-ID: <30c728d0c624cfab4eff57dbae80422d7cc52748.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Mon, 09 Jan 2023 13:59:33 -0500
In-Reply-To: <Y7xi9uoa0Ql0YnEC@work-vm>
References: <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
 <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
 <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
 <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
 <Y7xi9uoa0Ql0YnEC@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HzuBR_RzdZoD4eo2cX5lkXVcOZ7Li_4Y
X-Proofpoint-GUID: nUPqQfSX9ck68ow44_j_AuK6sKb9RN67
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_12,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=424 phishscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301090132
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2023-01-09 at 18:54 +0000, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
> > On Mon, 2023-01-09 at 13:34 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 1/9/23 12:55, James Bottomley wrote:
> > > > On Mon, 2023-01-09 at 17:52 +0000, Dr. David Alan Gilbert
> > > > wrote:
> > > > > * James Bottomley (jejb@linux.ibm.com) wrote:
> > > > [...]
> > > > > > external MSSIM TPM emulator has to be kept running to
> > > > > > preserve
> > > > > > the state.  If you restart it, the migration will fail.
> > > > > 
> > > > > Document that and we're getting there.
> > > > 
> > > > 
> > > > The documentation in the current patch series says
> > > > 
> > > > ----
> > > > The mssim backend supports snapshotting and migration, but the
> > > > state of the Microsoft Simulator server must be preserved (or
> > > > the
> > > > server kept running) outside of QEMU for restore to be
> > > > successful.
> > > > ----
> > > > 
> > > > What, beyond this would you want to see?
> > > 
> > > mssim today lacks the functionality of marshalling and
> > > unmarshalling
> > > the permanent and volatile state of the TPM 2, which are both
> > > needed
> > > for snapshot support. How does this work with mssim?
> > 
> > You preserve the state by keeping the simulator running as the
> > above
> > says.  As long as you can preserve the state, there's no maximum
> > time
> > between snapshots.  There's no need of marshal/unmarshal if you do
> > this.
> 
> So I think I can understand how that works with a suspend/resume; I'm
> less sure about a live migration.
> 
> In a live migration, you normally start up the destination VM
> qemu process and other processes attached to it, prior to the inwards
> live migration of state.  Then you live migrate the state, then kill
> the source.
> 
> With this mssim setup, will the start up of the destination attempt
> to change the vtpm state during the initialisation?

The backend driver contains state checks to prevent this, so if you
follow the standard migration in

https://www.qemu.org/docs/master/devel/migration.html

it detects that you have done a migration on shutdown and simply closes
the TPM socket.  On start up it sees you're in migrate and doesn't do
the power on reset of the TPM.

James


