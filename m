Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8607064A3B4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4k62-0005TK-0H; Mon, 12 Dec 2022 09:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4k5m-0005Kc-2I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:47:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4k5j-0006RV-W4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:47:41 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCEgcsA008516
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2kwOeLurWSvnZG/fyj3UIpysxYc/DTRC4Y+/gWOLdP4=;
 b=VPHu7aFcxu21m89JOMEyUfgPvO9HFTLJc4eyEga4Gja6tY113jRzhEHwZkXnCMEDx8Nb
 rsocKVuDpBsVdJZ1tlwC66HB0Y7hg788D6FK2xekxn4EmYmced9auX6qeEt+F9Rx3hXt
 80NfxCwgQGX0eI+8Oy6DYd9BIr7t7AFOJjWFWh7jaZ1P/xQXrI2njwmGm9ERIlNvjFIY
 2k/eEzky54E50c8oH7vZr4cn2NpVJVHmq4uBFRHtVf/QvUJr+BQWs87DgvH1Ii/QZvK2
 WMWXM3S5u5vTTTRc58J0v3TMzh+EXa0SUAHKESTZeXmVY6j4F6Mt65ufZN+dv8hl8C6n gQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3xr3vmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:47:37 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCCV7nR014249
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:47:37 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mchr6rxvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:47:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCElZai42861216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 14:47:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55DFF7805E;
 Mon, 12 Dec 2022 16:04:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C76047805C;
 Mon, 12 Dec 2022 16:04:29 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 16:04:29 +0000 (GMT)
Message-ID: <43465b20acc0b120ed49330d2f985534d0b2fc60.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Date: Mon, 12 Dec 2022 09:47:33 -0500
In-Reply-To: <9cc63b28-6700-59b3-1d4d-b89a4744a09b@linux.ibm.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
 <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
 <b1cf9866-d28a-05c3-1f10-8745f9e43c44@linux.ibm.com>
 <4dae1219d816277085fcb82979cf6cded6a1bd6b.camel@linux.ibm.com>
 <9cc63b28-6700-59b3-1d4d-b89a4744a09b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L-WtFnXZgVe5cBWAAZG0TgkUEdSiNfa6
X-Proofpoint-ORIG-GUID: L-WtFnXZgVe5cBWAAZG0TgkUEdSiNfa6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=980 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Mon, 2022-12-12 at 09:44 -0500, Stefan Berger wrote:
> 
> 
> On 12/12/22 09:32, James Bottomley wrote:
> > On Mon, 2022-12-12 at 09:27 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/12/22 08:59, James Bottomley wrote:
> > > > On Mon, 2022-12-12 at 08:43 -0500, Stefan Berger wrote:
> > > > > 
> > > > > 
> > > > > On 12/10/22 12:10, James Bottomley wrote:
> > > > > > The Microsoft Simulator (mssim) is the reference emulation
> > > > > > platform
> > > > > > for the TCG TPM 2.0 specification.
> > > > > > 
> > > > > > https://github.com/Microsoft/ms-tpm-20-ref.git
> > > > > > 
> > > > > > It exports a fairly simple network socket baset protocol on
> > > > > > two
> > > > > 
> > > > > baset -> based.
> > > > > 
> > > > > > sockets, one for command (default 2321) and one for control
> > > > > > (default 2322).  This patch adds a simple backend that can
> > > > > > speak the mssim protocol over the network.  It also allows
> > > > > > the
> > > > > > host, and two ports to be specified on the qemu command
> > > > > > line.
> > > > > > The benefits are twofold: firstly it gives us a backend
> > > > > > that
> > > > > > actually speaks a standard TPM emulation protocol instead
> > > > > > of
> > > > > > the linux specific TPM driver format of the current
> > > > > > emulated
> > > > > > TPM backend and secondly, using the microsoft protocol, the
> > > > > > end
> > > > > > point of the emulator can be anywhere on the network,
> > > > > > facilitating the cloud use case where a central TPM ervice
> > > > > > can
> > > > > > be used over a control network.
> > > > > > 
> > > > > > The implementation does basic control commands like power
> > > > > > off/on, but doesn't implement cancellation or startup.  The
> > > > > > former because cancellation is pretty much useless on a
> > > > > > fast
> > > > > > operating TPM emulator and the latter because this emulator
> > > > > > is
> > > > > > designed to be used with OVMF which itself does TPM startup
> > > > > > and
> > > > > > I wanted to validate that.
> > > > > 
> > > > > How did you implement VM suspend/resume and snapshotting
> > > > > support?
> > > > 
> > > > TPM2 doesn't need to.  The mssim follows the reference model
> > > > which
> > > 
> > > 
> > > You mean TPM2 doesn't need to resume at the point where the VM
> > > resumes (I am not talking about ACPI resume but virsh
> > > save/restore)
> > > after for example a host reboot?
> > > What does this have to do with the mssim reference model and
> > > TPM2_Shutdown protocol?
> > 
> > Running S3 suspend/resume before doing VM save/restore could fix a
> > lot of issue with passthrough PCI and when QEMU gets around to
> > doing that a TPM following the standard model should just work. 
> > It's useful to have a driver supporting this work.
> Did you test it with virsh save / restore with the mssim TPM? Does it
> work? Does it work if you reboot the host in between?

I don't actually use virsh in my harness.  I'm mostly interested in the
running the kernel TPM selftests against the reference model.  But I
anticipate it wouldn't currently work because I don't believe virsh
triggers a S3 event which is why snapshot and migration doesn't always
work with PCI passthrough.

James


