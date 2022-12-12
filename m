Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85664A464
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4l1n-0000WC-16; Mon, 12 Dec 2022 10:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p4l1l-0000Uv-9W
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p4l1i-0000Zg-Sy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670860053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=W7b+dsEKvMEkQ2XgfvI8OjOx69RTDWasnfqhjAlhON4=;
 b=Yp8Px3Kpet0T/oJm6p3IjbpcWoPETssR2zInkibymfbol7kLOtADDx7rlrryLZMVkNVDT4
 dZgr5/UhxG9d3xlOKbqpz6TjmIFJc+QZD1oodfMImTybcPLkL1SkHwwCZqhRSAEkQBIiYG
 7Kp2orJFmJ0uA6+TRyfrf8pryG8UsLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-4aJ7ngU2NpmoP3AFy7t1TQ-1; Mon, 12 Dec 2022 10:47:29 -0500
X-MC-Unique: 4aJ7ngU2NpmoP3AFy7t1TQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CF2E101A528;
 Mon, 12 Dec 2022 15:47:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 337C340C2004;
 Mon, 12 Dec 2022 15:47:28 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:47:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] tpm: add backend for mssim
Message-ID: <Y5dNC77CubqrfXku@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Copy'ing Markus for QAPI design feedback.

On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
> The Microsoft Simulator (mssim) is the reference emulation platform
> for the TCG TPM 2.0 specification.
> 
> https://github.com/Microsoft/ms-tpm-20-ref.git
> 
> It exports a fairly simple network socket baset protocol on two
> sockets, one for command (default 2321) and one for control (default
> 2322).  This patch adds a simple backend that can speak the mssim
> protocol over the network.  It also allows the host, and two ports to
> be specified on the qemu command line.  The benefits are twofold:
> firstly it gives us a backend that actually speaks a standard TPM
> emulation protocol instead of the linux specific TPM driver format of
> the current emulated TPM backend and secondly, using the microsoft
> protocol, the end point of the emulator can be anywhere on the
> network, facilitating the cloud use case where a central TPM service
> can be used over a control network.

What's the story with security for this ?  The patch isn't using
TLS, so talking to any emulator over anything other than localhost
looks insecure, unless I'm missing something.



> diff --git a/backends/tpm/tpm_mssim.c b/backends/tpm/tpm_mssim.c
> new file mode 100644
> index 0000000000..6864b1fbc0
> --- /dev/null
> +++ b/backends/tpm/tpm_mssim.c
> @@ -0,0 +1,266 @@
> +/*
> + * Emulator TPM driver which connects over the mssim protocol
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022

Copyright by whom ?  Presumably this line should have "IBM" present
if we're going to have it at all.

> + * Author: James Bottomley <jejb@linux.ibm.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/sockets.h"
> +
> +#include "qapi/clone-visitor.h"
> +#include "qapi/qapi-visit-tpm.h"
> +
> +#include "io/channel-socket.h"
> +
> +#include "sysemu/tpm_backend.h"
> +#include "sysemu/tpm_util.h"
> +
> +#include "qom/object.h"
> +
> +#include "tpm_int.h"
> +#include "tpm_mssim.h"
> +

> +static TPMBackend *tpm_mssim_create(QemuOpts *opts)
> +{
> +    TPMBackend *be = TPM_BACKEND(object_new(TYPE_TPM_MSSIM));
> +    TPMmssim *t = TPM_MSSIM(be);
> +    InetSocketAddress cmd_s, ctl_s;
> +    int sock;
> +    const char *host, *port, *ctrl;
> +    Error *errp = NULL;
> +
> +    host = qemu_opt_get(opts, "host");
> +    if (!host)
> +        host = "localhost";
> +    t->opts.host = g_strdup(host);
> +
> +    port = qemu_opt_get(opts, "port");
> +    if (!port)
> +        port = "2321";
> +    t->opts.port = g_strdup(port);
> +
> +    ctrl = qemu_opt_get(opts, "ctrl");
> +    if (!ctrl)
> +        ctrl = "2322";
> +    t->opts.ctrl = g_strdup(ctrl);
> +
> +    cmd_s.host = (char *)host;
> +    cmd_s.port = (char *)port;
> +
> +    ctl_s.host = (char *)host;
> +    ctl_s.port = (char *)ctrl;
> +
> +    sock = inet_connect_saddr(&cmd_s, &errp);
> +    if (sock < 0)
> +        goto fail;
> +    t->cmd_qc = QIO_CHANNEL(qio_channel_socket_new_fd(sock, &errp));
> +    if (errp)
> +        goto fail;
> +    sock = inet_connect_saddr(&ctl_s, &errp);
> +    if (sock < 0)
> +        goto fail_unref_cmd;
> +    t->ctrl_qc = QIO_CHANNEL(qio_channel_socket_new_fd(sock, &errp));
> +    if (errp)
> +        goto fail_unref_cmd;

We don't want to be using inet_connect_saddr, that's a legacy
API. All new code should be using the qio_channel_socket_connect*
family of APIs. This is trivial if the QAPI design uses SocketAddress
structs directly.

> +
> +    /* reset the TPM using a power cycle sequence, in case someone
> +     * has previously powered it up */
> +    sock = tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, &errp);
> +    if (sock != 0)
> +        goto fail_unref;
> +    sock = tpm_send_ctrl(t, TPM_SIGNAL_POWER_ON, &errp);
> +    if (sock != 0)
> +        goto fail_unref;
> +    sock = tpm_send_ctrl(t, TPM_SIGNAL_NV_ON, &errp);
> +    if (sock != 0)
> +        goto fail_unref;
> +
> +    return be;
> + fail_unref:
> +    object_unref(OBJECT(t->ctrl_qc));
> + fail_unref_cmd:
> +    object_unref(OBJECT(t->cmd_qc));
> + fail:
> +    error_prepend(&errp, ERROR_PREFIX);
> +    error_report_err(errp);
> +    object_unref(OBJECT(be));
> +
> +    return NULL;
> +}
> +
> +static const QemuOptDesc tpm_mssim_cmdline_opts[] = {
> +    TPM_STANDARD_CMDLINE_OPTS,
> +    {
> +        .name = "host",
> +        .type = QEMU_OPT_STRING,
> +        .help = "name or IP address of host to connect to (deault localhost)",
> +    },
> +    {
> +        .name = "port",
> +        .type = QEMU_OPT_STRING,
> +        .help = "port number for standard TPM commands (default 2321)",
> +    },
> +    {
> +        .name = "ctrl",
> +        .type = QEMU_OPT_STRING,
> +        .help = "control port for TPM commands (default 2322)",
> +    },
> +};
> +
> +static void tpm_mssim_class_init(ObjectClass *klass, void *data)
> +{
> +    TPMBackendClass *cl = TPM_BACKEND_CLASS(klass);
> +
> +    cl->type = TPM_TYPE_MSSIM;
> +    cl->opts = tpm_mssim_cmdline_opts;
> +    cl->desc = "TPM mssim emulator backend driver";
> +    cl->create = tpm_mssim_create;
> +    cl->cancel_cmd = tpm_mssim_cancel_cmd;
> +    cl->get_tpm_version = tpm_mssim_get_version;
> +    cl->get_buffer_size = tpm_mssim_get_buffer_size;
> +    cl->get_tpm_options = tpm_mssim_get_opts;
> +    cl->handle_request = tpm_mssim_handle_request;
> +}


>  
> +##
> +# @TPMmssimOptions:
> +#
> +# Information for the mssim emulator connection
> +#
> +# @host: host name or IP address to connect to
> +# @port: port for the standard TPM commands
> +# @ctrl: control port for TPM state changes
> +#
> +# Since: 7.2.0
> +##
> +{ 'struct': 'TPMmssimOptions',
> +  'data': {
> +      'host': 'str',
> +      'port': 'str',
> +      'ctrl': 'str' },
> +  'if': 'CONFIG_TPM' }

We don't want to be adding new code using plain host/port combos,
as that misses extra functionality for controlling IPv4 vs IPv6
usage.

The existing 'emulator' backend references a chardev, but I'm
not especially in favour of using the chardev indirection either,
when all we should really need is a SocketAddress

IOW, from a QAPI design POV, IMHO the best practice would be

 { 'struct': 'TPMmssimOptions',
   'data': {
       'command': 'SocketAddress',
       'control': 'SocketAddress' },
   'if': 'CONFIG_TPM' }


The main wrinkle with this is that exprssing nested struct fields
with QemuOpts is a disaster zone, and -tpmdev doesn't yet support
JSON syntax.

IMHO we should just fix the latter problem, as I don't think it
ought to be too hard. Probably a cut+paste / search/replace job
on the chanmge we did for -device in:

  commit 5dacda5167560b3af8eadbce5814f60ba44b467e
  Author: Kevin Wolf <kwolf@redhat.com>
  Date:   Fri Oct 8 15:34:42 2021 +0200

    vl: Enable JSON syntax for -device

This would mean we could use plain -tpmdev for a local instance

   -tpmdev mssim,id=tpm0 \
    -device tpm-crb,tpmdev=tpm0 \

but to use a remote emulator we would use

    -tpmdev "{'backend': 'mssim', 'id': 'tpm0',
              'command': {
	         'type': 'inet',
		 'host': 'remote',
		 'port': '4455'
               },
              'control': {
	         'type': 'inet',
		 'host': 'remote',
		 'port': '4456'
               }}"

(without the whitepace/newlines, which i just used for sake of clarity)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


