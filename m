Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A664C93D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 13:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5RAj-0004MZ-W7; Wed, 14 Dec 2022 07:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5RAf-0004JJ-6p
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 07:47:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5RAd-0007pz-CK
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 07:47:36 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BECaq5d003435
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=AgmYvfyHqhxreHZQ422DfJCvkcUloQPevp+zzVsUOlU=;
 b=cn1JjnATOM89WlbZpupog4GcVLr3CGVeLQnEbuSEWXlr/imMDdu8yENkZF0kOVB776Dn
 Gn2WfeVIHXZ5/nPikGJU8Bd5SaE/vJJjFl8VKWKf9/XfXrcq2ZfgXjMvXUEKk0X+NmrI
 WZfLqMzPLfegt6pcj57JxwGHZ51m3ZnbVla5BeEUJHJSdLpXlMekS/cV99w0OcDx5bl/
 RRveTAGs7IGsQ5NTGchjwDkDTyiAIbcRrHgfjqruLodO9OrHXH1+D3RiVtpMIiu9y0OK
 7wit5DdJO1RXl83aZdEyLFRs/+4/1NvU5gfYTT5ObQDonV3cqhib9wgECVs4WJX5yEo3 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mfen7r8hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:47:33 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BECcPIK010182
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:47:33 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mfen7r8gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 12:47:33 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BEBti8D024112;
 Wed, 14 Dec 2022 12:47:32 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3meypk4mta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 12:47:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BEClUtl39911950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Dec 2022 12:47:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6C1A7805E;
 Wed, 14 Dec 2022 14:05:45 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0AA77805C;
 Wed, 14 Dec 2022 14:05:44 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Dec 2022 14:05:44 +0000 (GMT)
Message-ID: <5a91ffbd8fa01d8f60df4cc14bcc53eeb3cc93e4.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Wed, 14 Dec 2022 07:47:28 -0500
In-Reply-To: <Y5mz96wJN9+nxLs8@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <bbe14f32fcf19ba4c800953c7db6486a340d5b14.camel@linux.ibm.com>
 <Y5mz96wJN9+nxLs8@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: evG_fThR3LNwYFHGVUl-6O5qkJ-E3p-t
X-Proofpoint-ORIG-GUID: 5xxv83moTrvCycaYHjqpa_AqtWIYxZ4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140097
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

On Wed, 2022-12-14 at 11:31 +0000, Daniel P. Berrangé wrote:
> On Mon, Dec 12, 2022 at 05:06:05PM -0500, James Bottomley wrote:
> > On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
> > > Copy'ing Markus for QAPI design feedback.
> > > 
> > > On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
> > [...]
> > > > +##
> > > > +# @TPMmssimOptions:
> > > > +#
> > > > +# Information for the mssim emulator connection
> > > > +#
> > > > +# @host: host name or IP address to connect to
> > > > +# @port: port for the standard TPM commands
> > > > +# @ctrl: control port for TPM state changes
> > > > +#
> > > > +# Since: 7.2.0
> > > > +##
> > > > +{ 'struct': 'TPMmssimOptions',
> > > > +  'data': {
> > > > +      'host': 'str',
> > > > +      'port': 'str',
> > > > +      'ctrl': 'str' },
> > > > +  'if': 'CONFIG_TPM' }
> > > 
> > > We don't want to be adding new code using plain host/port combos,
> > > as that misses extra functionality for controlling IPv4 vs IPv6
> > > usage.
> > > 
> > > The existing 'emulator' backend references a chardev, but I'm
> > > not especially in favour of using the chardev indirection either,
> > > when all we should really need is a SocketAddress
> > > 
> > > IOW, from a QAPI design POV, IMHO the best practice would be
> > > 
> > >  { 'struct': 'TPMmssimOptions',
> > >    'data': {
> > >        'command': 'SocketAddress',
> > >        'control': 'SocketAddress' },
> > >    'if': 'CONFIG_TPM' }
> > > 
> > > 
> > > The main wrinkle with this is that exprssing nested struct fields
> > > with QemuOpts is a disaster zone, and -tpmdev doesn't yet support
> > > JSON syntax.
> > > 
> > > IMHO we should just fix the latter problem, as I don't think it
> > > ought to be too hard. Probably a cut+paste / search/replace job
> > > on the chanmge we did for -device in:
> > > 
> > >   commit 5dacda5167560b3af8eadbce5814f60ba44b467e
> > >   Author: Kevin Wolf <kwolf@redhat.com>
> > >   Date:   Fri Oct 8 15:34:42 2021 +0200
> > > 
> > >     vl: Enable JSON syntax for -device
> > > 
> > > This would mean we could use plain -tpmdev for a local instance
> > > 
> > >    -tpmdev mssim,id=tpm0 \
> > >     -device tpm-crb,tpmdev=tpm0 \
> > > 
> > > but to use a remote emulator we would use
> > > 
> > >     -tpmdev "{'backend': 'mssim', 'id': 'tpm0',
> > >               'command': {
> > >                  'type': 'inet',
> > >                  'host': 'remote',
> > >                  'port': '4455'
> > >                },
> > >               'control': {
> > >                  'type': 'inet',
> > >                  'host': 'remote',
> > >                  'port': '4456'
> > >                }}"
> > > 
> > > (without the whitepace/newlines, which i just used for sake of
> > > clarity)
> > 
> > Just on this, might it not be easier for the commandline to do what
> > gluster does?  just use the '.' as a separator and subqdict
> > extraction, so you'd specify
> > 
> > -tpmdev
> > mssim,id=tpm0,command.type=inet,command.host=remote,command.port=44
> > 55,control.type=inet,control.host=remote,control.port=4456
> > 
> > With the added bonus that X.type could be defaulted to inet and
> > control.host could follow command.host and so on?
> 
> These days, we have a policy of not tyring to map nested data onto
> the flat QemuOpts. This has been done in several areas and we've
> ended up with a mess of ever so slightly different impls each with
> their own flaws. This is why our preferred approach these days is to
> add support for JSON syntax to enable non-flat config.

Well, OK, but I've got to say on behalf of shell script writers
everywhere that using json for command line arguments is a textbook
definition of cruel and unusual punishment.

James


