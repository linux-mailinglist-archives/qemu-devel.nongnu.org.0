Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9E64A504
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:39:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lp6-0005bA-9I; Mon, 12 Dec 2022 11:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4lp3-0005W4-7I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:38:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4lp0-00069V-QF
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:38:32 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGMpvK000885
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=fRf/LzZ2f3Pqg1Pg7eyNaNPy+4kRXc7PNI48KjvV01g=;
 b=KxUjysgdmmciwWXdgATV5ATLz7GPIxuJh9CLsLgoPa59SpRCZsa5tzfpHCc9G6BFdMER
 q8ztHBd4Eaf07r8PSD9oP/q43amAm2knzfdxCHkPGZ59/wabEZa1uh75ezclRGK0o1iP
 EqCj0Obr/kGzhfcGskzTV5ERFPzpExJRdgnzYnh84fELQ1YPdDwRBCxkPzR1Er+Hs+n5
 ekhUDoGHI20m79M/jBndrlGPa9OeI2AWQw4hwhyvh7qNsvpwfHd1IW3YBD/Dxy6ABgiU
 zpdcyz1PMENaRuyorGQMXbAn6oR7cSsTmzvDhvYcNs0sojEc/CpSXgk70mCUIqz/LiQU 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me7rv8dxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:38:28 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCGNUR4003943
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:38:28 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me7rv8dx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 16:38:27 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCEgS5i004323;
 Mon, 12 Dec 2022 16:38:26 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6e3ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 16:38:26 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCGcPE158065350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 16:38:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 448167805E;
 Mon, 12 Dec 2022 17:55:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FA017805C;
 Mon, 12 Dec 2022 17:55:22 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 17:55:22 +0000 (GMT)
Message-ID: <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Mon, 12 Dec 2022 11:38:22 -0500
In-Reply-To: <Y5dNC77CubqrfXku@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yc4xgwxNhG9yhDUANfKsuvtBVAm4qSKK
X-Proofpoint-ORIG-GUID: mWgn7lQXxHlFrVFAJ_AyKjqOX4yVN0bG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120150
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

On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
> Copy'ing Markus for QAPI design feedback.
> 
> On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
> > The Microsoft Simulator (mssim) is the reference emulation platform
> > for the TCG TPM 2.0 specification.
> > 
> > https://github.com/Microsoft/ms-tpm-20-ref.git
> > 
> > It exports a fairly simple network socket baset protocol on two
> > sockets, one for command (default 2321) and one for control
> > (default 2322).  This patch adds a simple backend that can speak
> > the mssim protocol over the network.  It also allows the host, and
> > two ports to be specified on the qemu command line.  The benefits
> > are twofold: firstly it gives us a backend that actually speaks a
> > standard TPM emulation protocol instead of the linux specific TPM
> > driver format of the current emulated TPM backend and secondly,
> > using the microsoft protocol, the end point of the emulator can be
> > anywhere on the network, facilitating the cloud use case where a
> > central TPM service can be used over a control network.
> 
> What's the story with security for this ?  The patch isn't using
> TLS, so talking to any emulator over anything other than localhost
> looks insecure, unless I'm missing something.

Pretty much every TPM application fears interposers and should thus be
using the TPM transport security anyway. *If* this is the case, then
the transport is secure.  Note that this currently isn't the case for
the kernel use of the TPM, but I'm trying to fix that.  The standard
mssim server is too simplistic to do transport layer security, but like
everything that does this (or rather doesn't do this), you can front it
with stunnel4.

> > diff --git a/backends/tpm/tpm_mssim.c b/backends/tpm/tpm_mssim.c
> > new file mode 100644
> > index 0000000000..6864b1fbc0
> > --- /dev/null
> > +++ b/backends/tpm/tpm_mssim.c
> > @@ -0,0 +1,266 @@
> > +/*
> > + * Emulator TPM driver which connects over the mssim protocol
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Copyright (c) 2022
> 
> Copyright by whom ?  Presumably this line should have "IBM" present
> if we're going to have it at all.

It can either be me or IBM, we're joint owners, that's why I thought
just author.

> > + * Author: James Bottomley <jejb@linux.ibm.com>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/sockets.h"
> > +
> > +#include "qapi/clone-visitor.h"
> > +#include "qapi/qapi-visit-tpm.h"
> > +
> > +#include "io/channel-socket.h"
> > +
> > +#include "sysemu/tpm_backend.h"
> > +#include "sysemu/tpm_util.h"
> > +
> > +#include "qom/object.h"
> > +
> > +#include "tpm_int.h"
> > +#include "tpm_mssim.h"
> > +
> 
> > +static TPMBackend *tpm_mssim_create(QemuOpts *opts)
> > +{
> > +    TPMBackend *be = TPM_BACKEND(object_new(TYPE_TPM_MSSIM));
> > +    TPMmssim *t = TPM_MSSIM(be);
> > +    InetSocketAddress cmd_s, ctl_s;
> > +    int sock;
> > +    const char *host, *port, *ctrl;
> > +    Error *errp = NULL;
> > +
> > +    host = qemu_opt_get(opts, "host");
> > +    if (!host)
> > +        host = "localhost";
> > +    t->opts.host = g_strdup(host);
> > +
> > +    port = qemu_opt_get(opts, "port");
> > +    if (!port)
> > +        port = "2321";
> > +    t->opts.port = g_strdup(port);
> > +
> > +    ctrl = qemu_opt_get(opts, "ctrl");
> > +    if (!ctrl)
> > +        ctrl = "2322";
> > +    t->opts.ctrl = g_strdup(ctrl);
> > +
> > +    cmd_s.host = (char *)host;
> > +    cmd_s.port = (char *)port;
> > +
> > +    ctl_s.host = (char *)host;
> > +    ctl_s.port = (char *)ctrl;
> > +
> > +    sock = inet_connect_saddr(&cmd_s, &errp);
> > +    if (sock < 0)
> > +        goto fail;
> > +    t->cmd_qc = QIO_CHANNEL(qio_channel_socket_new_fd(sock,
> > &errp));
> > +    if (errp)
> > +        goto fail;
> > +    sock = inet_connect_saddr(&ctl_s, &errp);
> > +    if (sock < 0)
> > +        goto fail_unref_cmd;
> > +    t->ctrl_qc = QIO_CHANNEL(qio_channel_socket_new_fd(sock,
> > &errp));
> > +    if (errp)
> > +        goto fail_unref_cmd;
> 
> We don't want to be using inet_connect_saddr, that's a legacy
> API. All new code should be using the qio_channel_socket_connect*
> family of APIs. This is trivial if the QAPI design uses SocketAddress
> structs directly.

Heh, well I just copied this from the ssh block backend ...

I can easily find something more modern to update it.

[...]
> >  
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

Unfortunately chardev isn't a socket, it really is a character device
that fronts to the vtpm kernel proxy, so even if I convert mssim usage
to socket, you'll still have to keep chardev for the emulator backend.

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


OK, I'll look into doing this.

Regards,

James


