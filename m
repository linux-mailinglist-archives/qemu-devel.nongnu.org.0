Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2F662F8C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:52:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExF8-00064I-9n; Mon, 09 Jan 2023 13:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pExF4-00062l-TY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:51:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pExF2-0004ti-Qu
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:51:30 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309HRGBp025504
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 18:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=UYGLyvgVfO+V2FmxhI4FxwNEiIKbyIszH6GTT+KWD1c=;
 b=jehIZHpLK/dV5H2yWUkq/ln4V202BbFGytIOh7jnQE6/5aFqnxLu53up+XT9m1RwghKO
 xkRWTfzm3bon9epXvlczuiBsYxvTI67DmRdJJZZ01GSGTCsxBEmPVrpRP9z/bhJQqlDa
 Dl9Jg03eBx32zHfEq2ZZCsU+/gECn55sccWIwZ8I1mafczSfdC6judZnV0b0LtAw048T
 m4PDl1/LT1kCSRDRGRgFqhNXnRO1zwplxS4F+uuKxAZm9FZ9e4APvWO5+tcMQWZEDUeU
 GbO612H+nTbyVT1SoeadJQ+sVYlwtkm7fbPHXKOv7AXwLFGaysI/TrxGdd3z+UA747+9 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjhtpnfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 18:51:26 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309Hf7XT009712
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 18:51:26 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjhtpnev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 18:51:26 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309I4l89006532;
 Mon, 9 Jan 2023 18:51:25 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3my0c75b4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 18:51:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309IpNj639912078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 18:51:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C5F78064;
 Mon,  9 Jan 2023 20:27:57 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A5677805E;
 Mon,  9 Jan 2023 20:27:55 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 20:27:55 +0000 (GMT)
Message-ID: <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Mon, 09 Jan 2023 13:51:20 -0500
In-Reply-To: <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
References: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
 <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
 <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g8v-nSJjlKrr6BG1_P8Uc9Ha8i0-c1kk
X-Proofpoint-GUID: 9o4nBb6T6-HPZddI5pZ4WGXRBbs0a5oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_12,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=706
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090132
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 2023-01-09 at 13:34 -0500, Stefan Berger wrote:
> 
> 
> On 1/9/23 12:55, James Bottomley wrote:
> > On Mon, 2023-01-09 at 17:52 +0000, Dr. David Alan Gilbert wrote:
> > > * James Bottomley (jejb@linux.ibm.com) wrote:
> > [...]
> > > > external MSSIM TPM emulator has to be kept running to preserve
> > > > the state.  If you restart it, the migration will fail.
> > > 
> > > Document that and we're getting there.
> > 
> > 
> > The documentation in the current patch series says
> > 
> > ----
> > The mssim backend supports snapshotting and migration, but the
> > state of the Microsoft Simulator server must be preserved (or the
> > server kept running) outside of QEMU for restore to be successful.
> > ----
> > 
> > What, beyond this would you want to see?
> 
> mssim today lacks the functionality of marshalling and unmarshalling
> the permanent and volatile state of the TPM 2, which are both needed
> for snapshot support. How does this work with mssim?

You preserve the state by keeping the simulator running as the above
says.  As long as you can preserve the state, there's no maximum time
between snapshots.  There's no need of marshal/unmarshal if you do
this.

James


