Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F814C65A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 07:07:45 +0100 (CET)
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwgVs-0007q3-CP
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 01:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iwgUy-0007LD-GE
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 01:06:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iwgUw-0002YB-FJ
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 01:06:47 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43293
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iwgUw-0002Xc-9y
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 01:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580278005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJou6EGWo6ROScCGVThZgzI2hVrY2o/uwf0Yl/feubo=;
 b=gFtWGLS41cChcNI7IJ1QAuOO70C8yG18E25bJs7D/BPHLfUAgxB+0NnZxVMOIupUDOjjvC
 km0gwfNxwo8/M2RxrHfb/+whLg8MEyeAeaLjSAtVbYg7lb3FZYzgL4dvI4kg4nEpcZQCmY
 i+TuQEM7mS1md4ALsPhZGpc4Zqt7AXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-blp5xjN5O52fLKV0XQUVIA-1; Wed, 29 Jan 2020 01:06:42 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E2C13E3;
 Wed, 29 Jan 2020 06:06:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE2538B;
 Wed, 29 Jan 2020 06:06:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5649E1138600; Wed, 29 Jan 2020 07:06:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/4] monitor: Move monitor option parsing to
 monitor/monitor.c
References: <20200128175211.30007-1-kwolf@redhat.com>
 <20200128175211.30007-2-kwolf@redhat.com>
Date: Wed, 29 Jan 2020 07:06:39 +0100
In-Reply-To: <20200128175211.30007-2-kwolf@redhat.com> (Kevin Wolf's message
 of "Tue, 28 Jan 2020 18:52:08 +0100")
Message-ID: <87wo9a4x00.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: blp5xjN5O52fLKV0XQUVIA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Both the system emulators and tools with QMP support (specifically, the
> planned storage daemon) will need to parse monitor options, so move that
> code to monitor/monitor.c, which can be linked into binaries that aren't
> a system emulator.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/monitor/monitor.h |  4 ++++
>  include/sysemu/sysemu.h   |  1 -
>  monitor/monitor.c         | 48 +++++++++++++++++++++++++++++++++++++++
>  vl.c                      | 45 +-----------------------------------
>  4 files changed, 53 insertions(+), 45 deletions(-)
>
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index a81eeff5f8..ecf6cce827 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -3,6 +3,7 @@
> =20
>  #include "block/block.h"
>  #include "qapi/qapi-types-misc.h"
> +#include "qemu/option.h"

Superfluous; qemu/typedefs.h already provides what you need.

>  #include "qemu/readline.h"
> =20
>  extern __thread Monitor *cur_mon;
> @@ -10,12 +11,15 @@ typedef struct MonitorHMP MonitorHMP;
> =20
>  #define QMP_REQ_QUEUE_LEN_MAX 8
> =20
> +extern QemuOptsList qemu_mon_opts;
> +
>  bool monitor_cur_is_qmp(void);
> =20
>  void monitor_init_globals(void);
>  void monitor_init_globals_core(void);
>  void monitor_init_qmp(Chardev *chr, bool pretty);
>  void monitor_init_hmp(Chardev *chr, bool use_readline);
> +int monitor_init_opts(QemuOpts *opts, Error **errp);
>  void monitor_cleanup(void);
> =20
>  int monitor_suspend(Monitor *mon);
[...]

With the superfluous #include dropped:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


