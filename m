Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8964A2C5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jM2-0001GQ-S7; Mon, 12 Dec 2022 09:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4jLO-0001CH-RH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:59:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4jLK-00082j-3A
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:59:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCCkpKT014083
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7o+9kxM1U0HJjfv9AyzUuKj+DRQX4lfa2Vw0OJQIOFg=;
 b=mFyGfobG3MPLJt5qq6H94KTgtrxrZ8uuc53NnjDnprA5qePu5YoJSaqjpVAlWT1BY8kc
 GTqEdYEIN5m7njcaIrBwQgNTicZgTQfSJaLHege/w2HANBgPm6CKu8m4mDCH2m32T1dP
 szYfOlh3h0JpPcwIrL/UefLEv8O45UBfwAXSteE91sMqzXMXmzXKscSrK/pquRCuAIvD
 lXkINiVEDxj626H0w3w0eII3EkE3eNJcwwoFhNs96LnTWqD2yTKxHDJ8VfrvUCqwO8a3
 0KSi8BBUqLJIKbf+0+KvFyPa10G5kxyOE/yPXjUy3OApLhc9wqCjCJgMAE40krPAp/f0 YA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md469athb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:59:35 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCAvwGO011497
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:59:34 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6dary-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:59:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCDxWZI5243596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 13:59:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49BB17805E;
 Mon, 12 Dec 2022 15:16:26 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBBA77805C;
 Mon, 12 Dec 2022 15:16:25 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 15:16:25 +0000 (GMT)
Message-ID: <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Date: Mon, 12 Dec 2022 08:59:28 -0500
In-Reply-To: <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OCbni8cNyQOlAxthIN6kf8La2-ZhUqWi
X-Proofpoint-ORIG-GUID: OCbni8cNyQOlAxthIN6kf8La2-ZhUqWi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=717 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120125
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

On Mon, 2022-12-12 at 08:43 -0500, Stefan Berger wrote:
> 
> 
> On 12/10/22 12:10, James Bottomley wrote:
> > The Microsoft Simulator (mssim) is the reference emulation platform
> > for the TCG TPM 2.0 specification.
> > 
> > https://github.com/Microsoft/ms-tpm-20-ref.git
> > 
> > It exports a fairly simple network socket baset protocol on two
> 
> baset -> based.
> 
> > sockets, one for command (default 2321) and one for control
> > (default 2322).  This patch adds a simple backend that can speak
> > the mssim protocol over the network.  It also allows the host, and
> > two ports to be specified on the qemu command line.  The benefits
> > are twofold: firstly it gives us a backend that actually speaks a
> > standard TPM emulation protocol instead of the linux specific TPM
> > driver format of the current emulated TPM backend and secondly,
> > using the microsoft protocol, the end point of the emulator can be
> > anywhere on the network, facilitating the cloud use case where a
> > central TPM ervice can be used over a control network.
> > 
> > The implementation does basic control commands like power off/on,
> > but doesn't implement cancellation or startup.  The former because
> > cancellation is pretty much useless on a fast operating TPM
> > emulator and the latter because this emulator is designed to be
> > used with OVMF which itself does TPM startup and I wanted to
> > validate that.
> 
> How did you implement VM suspend/resume and snapshotting support?

TPM2 doesn't need to.  The mssim follows the reference model which
obeys the TPM2_Shutdown protocol, so the software does a power off with

TPM2_Shutdown(TPM_SU_STATE)

This allows poweroff to preserve the PCR state, provided the startup
does

TPM2_Startup(TPM_SU_STATE).

the edk2 SecurityPackage does this in OVMF on S3 Resume, so using this
backend allows us to check the OVMF startup for correctness.

Now getting QEMU to go through S3 suspend is another issue, but when it
does, the TPM should just work.

James


