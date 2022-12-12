Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1164A9EF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qwD-0002KB-7Y; Mon, 12 Dec 2022 17:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4qwA-0002Jt-G4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:06:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4qw8-0000SE-Cz
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:06:13 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCKDmbZ027590
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=dpOoeDhT7Ckg2uRK9TTFNX/jZWoBTE7t46hi1hHhIHk=;
 b=RWLPZRvt7rdP4TU0cW3doEGw9/xMxOZzvj1Qvix6ZDEBqzz96M7mlagfirsnCibjqJSg
 Mdy+uOfwBhjM2tIhMxXEIhafpyufh0mtKs13j8wxQtl9d6ZiymF9mCpJOpzfH5XARswS
 Cl/GcGpmIDDnVnzLvsMHoF8ijaycIow5xW+Znj1UqDrDBXWmvshEHHPaf1G21xfJH6dT
 MXSIvmkXZrA9GdwzXHhnpOvg8yHDFftD+cY5Jw+0cH3kg3RbBFJS6uTTLT2taWcG39ED
 ejSM3PbReX1FaB2Zz8R+MwOAOVEuaG0VQs48Bg5tflHNalxEajS0LTHpmTuVlWX9ygKG Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3meb57a8s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:06:10 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCLum7W011308
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:06:10 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3meb57a8rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:06:09 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCL09w8004339;
 Mon, 12 Dec 2022 22:06:09 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6fjav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:06:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCM67Me56427002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 22:06:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 307B77805E;
 Mon, 12 Dec 2022 23:23:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A5537805C;
 Mon, 12 Dec 2022 23:23:14 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 23:23:13 +0000 (GMT)
Message-ID: <bbe14f32fcf19ba4c800953c7db6486a340d5b14.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Mon, 12 Dec 2022 17:06:05 -0500
In-Reply-To: <Y5dNC77CubqrfXku@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Su8y61C0f1R1rLUteOlOifokF0-BsjsT
X-Proofpoint-GUID: FPoZFZD3KPNF3vSGCtbNCg2L16bj_09c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=882 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212120189
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
> Copy'ing Markus for QAPI design feedback.
> 
> On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
[...]
> > +##
> > +# @TPMmssimOptions:
> > +#
> > +# Information for the mssim emulator connection
> > +#
> > +# @host: host name or IP address to connect to
> > +# @port: port for the standard TPM commands
> > +# @ctrl: control port for TPM state changes
> > +#
> > +# Since: 7.2.0
> > +##
> > +{ 'struct': 'TPMmssimOptions',
> > +  'data': {
> > +      'host': 'str',
> > +      'port': 'str',
> > +      'ctrl': 'str' },
> > +  'if': 'CONFIG_TPM' }
> 
> We don't want to be adding new code using plain host/port combos,
> as that misses extra functionality for controlling IPv4 vs IPv6
> usage.
> 
> The existing 'emulator' backend references a chardev, but I'm
> not especially in favour of using the chardev indirection either,
> when all we should really need is a SocketAddress
> 
> IOW, from a QAPI design POV, IMHO the best practice would be
> 
>  { 'struct': 'TPMmssimOptions',
>    'data': {
>        'command': 'SocketAddress',
>        'control': 'SocketAddress' },
>    'if': 'CONFIG_TPM' }
> 
> 
> The main wrinkle with this is that exprssing nested struct fields
> with QemuOpts is a disaster zone, and -tpmdev doesn't yet support
> JSON syntax.
> 
> IMHO we should just fix the latter problem, as I don't think it
> ought to be too hard. Probably a cut+paste / search/replace job
> on the chanmge we did for -device in:
> 
>   commit 5dacda5167560b3af8eadbce5814f60ba44b467e
>   Author: Kevin Wolf <kwolf@redhat.com>
>   Date:   Fri Oct 8 15:34:42 2021 +0200
> 
>     vl: Enable JSON syntax for -device
> 
> This would mean we could use plain -tpmdev for a local instance
> 
>    -tpmdev mssim,id=tpm0 \
>     -device tpm-crb,tpmdev=tpm0 \
> 
> but to use a remote emulator we would use
> 
>     -tpmdev "{'backend': 'mssim', 'id': 'tpm0',
>               'command': {
>                  'type': 'inet',
>                  'host': 'remote',
>                  'port': '4455'
>                },
>               'control': {
>                  'type': 'inet',
>                  'host': 'remote',
>                  'port': '4456'
>                }}"
> 
> (without the whitepace/newlines, which i just used for sake of
> clarity)

Just on this, might it not be easier for the commandline to do what
gluster does?  just use the '.' as a separator and subqdict extraction,
so you'd specify

-tpmdev mssim,id=tpm0,command.type=inet,command.host=remote,command.port=4455,control.type=inet,control.host=remote,control.port=4456

With the added bonus that X.type could be defaulted to inet and
control.host could follow command.host and so on?

James


