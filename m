Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5012649BB9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4fjM-0001Mm-Sq; Mon, 12 Dec 2022 05:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p4fjK-0001MO-Lv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:08:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p4fjI-0005YD-Tn
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670839691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDMUKz/SYdxm9bFiKLsyxuCMucn4LZbrznWLwI716us=;
 b=HZ+bY0pfzHrSLhRQiQdTc4DNjoLk5GV68SSU6eoD0g+HuuHl27L3LYVPzcZqd8+VlEEsab
 OYW54zM1id2HWoOG8j2FKvDBO6ybgGBo8hfPQzxGtrlutuUcoyj/BQMVX2C24jAWFUCrPd
 DXarSCbIpjBBVNetZsnhF4ZQvrJQkOY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-HlGr6F2wO5i4WxX7p9EpaQ-1; Mon, 12 Dec 2022 05:08:10 -0500
X-MC-Unique: HlGr6F2wO5i4WxX7p9EpaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E7685A59D;
 Mon, 12 Dec 2022 10:08:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E85281121331;
 Mon, 12 Dec 2022 10:08:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D048321E6900; Mon, 12 Dec 2022 11:08:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,  dgilbert@redhat.com,  berrange@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v2 11/14] ui: Move HMP commands from monitor to new
 ui/ui-hmp-cmds.c
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-12-armbru@redhat.com>
Date: Mon, 12 Dec 2022 11:08:06 +0100
In-Reply-To: <20221202100512.4161901-12-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 2 Dec 2022 11:05:09 +0100")
Message-ID: <87sfhl6ik9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> writes:

> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "Graphics".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

[...]

> diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
> new file mode 100644
> index 0000000000..c26a1f00d0
> --- /dev/null
> +++ b/ui/ui-hmp-cmds.c
> @@ -0,0 +1,361 @@
> +/*
> + * Human Monitor Interface commands

Make this

    * HMP commands related to UI

> + *
> + * Copyright IBM, Corp. 2011
> + *
> + * Authors:
> + *  Anthony Liguori   <aliguori@us.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */

[...]


