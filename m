Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A833935F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:28:42 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkeX-0000aE-5M
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKkXr-00033M-9e
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKkXo-0003h3-7d
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615566102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fEnHmDQVtrIPjtFQWRCvttPiQEvfI4qnjR10TK4rTU=;
 b=Dykgzt5gqXpKSS75n2TC8NMU4i2OlA5gu6IYYEjzkeRornYT/PKvt6eMAl2YNIhHEoRzip
 RkhrwmaZHzDWirNY2Y3sn4SyRCfd3jbYPE8xz/d86D1Iv6kVvrzSsCSD/9Cn5HhVV0a3Q6
 4phsBRupobpMvo5alI+OFIj3UVuASeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-f4w-i5YqN_i2vp-6WDRWbQ-1; Fri, 12 Mar 2021 11:21:39 -0500
X-MC-Unique: f4w-i5YqN_i2vp-6WDRWbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74CC3760C0;
 Fri, 12 Mar 2021 16:21:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8B75D9CC;
 Fri, 12 Mar 2021 16:21:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB0D31132C12; Fri, 12 Mar 2021 17:21:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v6 3/3] qmp: add new qmp display-reload
References: <20210312103106.1368-1-changzihao1@huawei.com>
 <20210312103106.1368-4-changzihao1@huawei.com>
Date: Fri, 12 Mar 2021 17:21:33 +0100
In-Reply-To: <20210312103106.1368-4-changzihao1@huawei.com> (Zihao Chang's
 message of "Fri, 12 Mar 2021 18:31:06 +0800")
Message-ID: <878s6s1gxe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com, yebiaoxiang@huawei.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zihao Chang <changzihao1@huawei.com> writes:

> This patch provides a new qmp to reload display configuration
> without restart VM, but only reloading the vnc tls certificates
> is implemented.
> Example:
> {"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}
>
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  monitor/qmp-cmds.c | 15 +++++++++++
>  qapi/ui.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index c7df8c0ee268..cd5bc477345e 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -334,3 +334,18 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
>  
>      return mem_info;
>  }
> +
> +void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
> +{
> +    switch (arg->type) {
> +    case DISPLAY_RELOAD_TYPE_VNC:
> +        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
> +            vnc_display_reload_certs(NULL, errp);
> +        }
> +        break;
> +
> +    default:
> +        error_setg(errp, "unsupported DisplayReloadType");
> +

Misuse of error_setg() for a programming error.  Use abort().

> +    }
> +}
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d08d72b43923..298267bf96d2 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1179,3 +1179,65 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @DisplayReloadType:
> +#
> +# Available DisplayReload types.
> +#
> +# @vnc: VNC display
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'enum': 'DisplayReloadType',
> +  'data': ['vnc'] }
> +
> +##
> +# @DisplayReloadOptionsVNC:
> +#
> +# Specify the VNC reload options.
> +#
> +# @tls-certs: reload tls certs or not.
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'struct': 'DisplayReloadOptionsVNC',
> +  'data': { '*tls-certs': 'bool' } }
> +
> +##
> +# @DisplayReloadOptions:
> +#
> +# Options of the display configuration reload.
> +#
> +# @type: Specify the display type.
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'union': 'DisplayReloadOptions',
> +  'base': {'type': 'DisplayReloadType'},
> +  'discriminator': 'type',
> +  'data': { 'vnc': 'DisplayReloadOptionsVNC' }}
> +
> +##
> +# @display-reload:
> +#
> +# Reload display configuration.
> +#
> +# Returns: Nothing on success.
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "display-reload",
> +#      "arguments": { "type": "vnc", "tls-certs": true  } }
> +# <- { "return": {}  }
> +#
> +##
> +{ 'command': 'display-reload',
> +  'data': 'DisplayReloadOptions',
> +  'boxed' : true }
> +

Trim the blank line at the end of the file, please.

With these tidied up:
Acked-by: Markus Armbruster <armbru@redhat.com>


