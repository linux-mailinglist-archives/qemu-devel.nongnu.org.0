Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB664A368
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:33:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jrI-00020H-VZ; Mon, 12 Dec 2022 09:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4jrF-0001wY-VY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:32:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4jr4-0002NH-Ij
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:32:32 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCEGtRn000516
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/VbnEixlu1Wn3/9FNPVcPCWcdpP77obPMxtJ74qK4h0=;
 b=DgemhOxlaH6eukPSTpF0oEKm4qJ+uarAI4RN0FiAJllCsyMkdauKa/DlL+jZ0oo0BYMN
 QbVD/wTxi5AomUZH2alAMQcO/3atxamc4Ql1jbk3HAj5tAcA/KvVwHq2lqdgXhYUpMo8
 wYBQt/yykVtDPhuFSX/GKEck69sikpcCjVlEuC8nosBt9rmBK81RnB/EjD1Tti6zfoDA
 KkTS2+Tg+vbwnJ7X5k4jozWWYzNFIajPTwAJ9qCx6pOx9vZwV68LcaOWNwH8n+xJ3+gu
 sH2kH+WGcQeN9ehA36A4xm0F6pTCrtIvc0VSHEHwIzkuktimupAXOc4PqbDAORemRw+8 LQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me5x38bx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:32:24 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCCeHJY014270
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:32:24 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mchr6rv9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:32:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCEWLrW66388292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 14:32:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F7597805E;
 Mon, 12 Dec 2022 15:49:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A65A7805C;
 Mon, 12 Dec 2022 15:49:15 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 15:49:15 +0000 (GMT)
Message-ID: <4dae1219d816277085fcb82979cf6cded6a1bd6b.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Date: Mon, 12 Dec 2022 09:32:19 -0500
In-Reply-To: <b1cf9866-d28a-05c3-1f10-8745f9e43c44@linux.ibm.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
 <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
 <b1cf9866-d28a-05c3-1f10-8745f9e43c44@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nu4_Ljq4cefF0dtI_BXGIMmDaV_ucuwT
X-Proofpoint-GUID: nu4_Ljq4cefF0dtI_BXGIMmDaV_ucuwT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=824 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120133
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

On Mon, 2022-12-12 at 09:27 -0500, Stefan Berger wrote:
> 
> 
> On 12/12/22 08:59, James Bottomley wrote:
> > On Mon, 2022-12-12 at 08:43 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/10/22 12:10, James Bottomley wrote:
> > > > The Microsoft Simulator (mssim) is the reference emulation
> > > > platform
> > > > for the TCG TPM 2.0 specification.
> > > > 
> > > > https://github.com/Microsoft/ms-tpm-20-ref.git
> > > > 
> > > > It exports a fairly simple network socket baset protocol on two
> > > 
> > > baset -> based.
> > > 
> > > > sockets, one for command (default 2321) and one for control
> > > > (default 2322).  This patch adds a simple backend that can
> > > > speak the mssim protocol over the network.  It also allows the
> > > > host, and two ports to be specified on the qemu command line. 
> > > > The benefits are twofold: firstly it gives us a backend that
> > > > actually speaks a standard TPM emulation protocol instead of
> > > > the linux specific TPM driver format of the current emulated
> > > > TPM backend and secondly, using the microsoft protocol, the end
> > > > point of the emulator can be anywhere on the network,
> > > > facilitating the cloud use case where a central TPM ervice can
> > > > be used over a control network.
> > > > 
> > > > The implementation does basic control commands like power
> > > > off/on, but doesn't implement cancellation or startup.  The
> > > > former because cancellation is pretty much useless on a fast
> > > > operating TPM emulator and the latter because this emulator is
> > > > designed to be used with OVMF which itself does TPM startup and
> > > > I wanted to validate that.
> > > 
> > > How did you implement VM suspend/resume and snapshotting support?
> > 
> > TPM2 doesn't need to.  The mssim follows the reference model which
> 
> 
> You mean TPM2 doesn't need to resume at the point where the VM
> resumes (I am not talking about ACPI resume but virsh save/restore)
> after for example a host reboot?
> What does this have to do with the mssim reference model and
> TPM2_Shutdown protocol?

Running S3 suspend/resume before doing VM save/restore could fix a lot
of issue with passthrough PCI and when QEMU gets around to doing that a
TPM following the standard model should just work.  It's useful to have
a driver supporting this work.

James


