Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF9B64E223
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 21:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5uWc-0004GH-GP; Thu, 15 Dec 2022 15:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5uWX-0004Fo-Lr
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:08:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5uWT-0004Wc-Ji
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:08:07 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFIBlHv023388
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=x62R46Bx4zhefMY04EpfR1kWboTtcqshXJEGVKJETqc=;
 b=g1247QzfQl6Dxs+gVKpMHBokYO2PqcXBqu8UmrFVKsS2kF59X192m7QbGMPRtdehOW4h
 QhXGaASjd81vE3FmSVPR4f1vPznVCZhUX7ETQjsOl9sp0odJQrD3Z5H75tk/GwR1mElh
 Z4tn79vBgDdFGPq6yD7PKcp8w4b+7elB5t10rVyTtva9KWbO0HftKKgXib/DdhWe58Yj
 H4maG+1cOkJHV8iOOqJfBc6hxgtfsQsnTZ84GtlowrbaTev4//zcsMlP49j09bA+VsSy
 YfrUI9nUGCly5VWvw43z8SDpsmZef2P43GzUydaYr3puk9gJZug9Qfe3wcNomFKX3GpE aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg8n5tjta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:08:03 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFJt9jc002703
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:08:03 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg8n5tjsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 20:08:02 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFJ5mfN017680;
 Thu, 15 Dec 2022 20:08:01 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3meyqkne5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 20:08:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFK80Sd38339216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 20:08:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80B0A7805E;
 Thu, 15 Dec 2022 21:27:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B96CB7805C;
 Thu, 15 Dec 2022 21:27:08 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 21:27:08 +0000 (GMT)
Message-ID: <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 15 Dec 2022 15:07:57 -0500
In-Reply-To: <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s2u4W5LNrOyWdhbEFsNdqPvUzSo-7rRw
X-Proofpoint-GUID: GNsfpnKVh4zkQQ5tbT9zQVBw15GCOt9z
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212150168
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
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

On Thu, 2022-12-15 at 14:57 -0500, Stefan Berger wrote:
> On 12/15/22 14:40, James Bottomley wrote:
> > On Thu, 2022-12-15 at 14:35 -0500, Stefan Berger wrote:
[...]
> > > You should also add a description to docs/specs/tpm.rst.
> > 
> > Description of what?  It functions exactly like passthrough on
> 
> Please describe all the scenarios so that someone else can repeat
> them when trying out **your** device.
> 
> There are sections describing how things for swtpm and you should add
> how things work for the mssim TPM.
> 
> https://github.com/qemu/qemu/blob/master/docs/specs/tpm.rst#the-qemu-tpm-emulator-device
> https://github.com/qemu/qemu/blob/master/docs/specs/tpm.rst#migration-with-the-tpm-emulator

The passthrough snapshot/restore isn't described there either.  This
behaves exactly the same in that it's caveat emptor.  If something
happens in the interim to upset the TPM state then the restore will
have unexpected effects due to the externally changed TPM state.  This
is actually a feature: I'm checking our interposer defences by doing
external state manipulation.

> > migration.  Since the TPM state is retained in the server a
> > reconnection just brings everything back to where it was.
> 
> So it's remote. And the ports are always open and someone can just
> connect to the open ports and power cycle the device?

in the same way as you can power off the hardware and have issues with
a passthrough TPM on vm restore, yes.

> This may not be the most important scenario but nevertheless I
> wouldn't want to deal with bug reports if someone does 'VM
> snapshotting' -- how this is correctly handled would be of interest.

I'd rather say nothing, like passthrough, then there are no
expectations beyond it might work if you know what you're doing.  I
don't really have much interest in the migration use case, but I knew
it should work like the passthrough case, so that's what I tested.

James


