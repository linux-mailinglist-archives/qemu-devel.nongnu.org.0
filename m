Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485934AF4A3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:02:55 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoUg-0000e5-37
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHnhz-0000Bf-Ai
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHnhw-0004gm-R3
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644415951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SwZOrc4vGAoyn5Ss2MfmHmkCv6MC1tzVHZqrYrXtyTc=;
 b=E+OXcLdJVy+bseOKxJy9Hsk1j2Z08GuxkwvLjz+BPmhfLX5oZNB/uR42T+dFYnfpYRZXzM
 6T0qUQV4Uh20l7o8LLDrTnoCGUvC4KKaJChlYxQU4IWEnGMmZ2lczH7GL19x7f+Iqt4wJ+
 WZCEPvEQbiZCPUrbBX1nz9nQLUwhYUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-V9Gut_BhN5KOSa3xYchJuA-1; Wed, 09 Feb 2022 09:12:28 -0500
X-MC-Unique: V9Gut_BhN5KOSa3xYchJuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48DB43E744;
 Wed,  9 Feb 2022 14:12:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CCFD7D3D0;
 Wed,  9 Feb 2022 14:12:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD3C421E6A00; Wed,  9 Feb 2022 15:12:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v8 1/3] monitor/hmp: add support for flag argument with
 value
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-2-f.ebner@proxmox.com>
Date: Wed, 09 Feb 2022 15:12:11 +0100
In-Reply-To: <20220204101220.343526-2-f.ebner@proxmox.com> (Fabian Ebner's
 message of "Fri, 4 Feb 2022 11:12:18 +0100")
Message-ID: <87tud8f7t0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> From: Stefan Reiter <s.reiter@proxmox.com>
>
> Adds support for the "-xV" parameter type, where "-x" denotes a flag
> name and the "V" suffix indicates that this flag is supposed to take
> an arbitrary string parameter.
>
> These parameters are always optional, the entry in the qdict will be
> omitted if the flag is not given.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> [FE: fixed typo pointed out by Eric Blake]
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
>  monitor/hmp.c              | 19 ++++++++++++++++++-
>  monitor/monitor-internal.h |  3 ++-
>  2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index b20737e63c..fd4f5866c7 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -981,6 +981,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>              {
>                  const char *tmp = p;
>                  int skip_key = 0;
> +                int ret;
>                  /* option */
>  
>                  c = *typestr++;
> @@ -1003,11 +1004,27 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>                      }
>                      if (skip_key) {
>                          p = tmp;
> +                    } else if (*typestr == 'V') {
> +                        /* has option with string value */
> +                        typestr++;
> +                        tmp = p++;
> +                        while (qemu_isspace(*p)) {
> +                            p++;
> +                        }
> +                        ret = get_str(buf, sizeof(buf), &p);
> +                        if (ret < 0) {
> +                            monitor_printf(mon, "%s: value expected for -%c\n",
> +                                           cmd->name, *tmp);
> +                            goto fail;
> +                        }
> +                        qdict_put_str(qdict, key, buf);
>                      } else {
> -                        /* has option */
> +                        /* has boolean option */
>                          p++;
>                          qdict_put_bool(qdict, key, true);
>                      }
> +                } else if (*typestr == 'V') {
> +                    typestr++;
>                  }
>              }
>              break;
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 3da3f86c6a..a4cb307c8a 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -63,7 +63,8 @@
>   * '.'          other form of optional type (for 'i' and 'l')
>   * 'b'          boolean
>   *              user mode accepts "on" or "off"
> - * '-'          optional parameter (eg. '-f')
> + * '-'          optional parameter (eg. '-f'); if followed by a 'V', it
> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
>   *
>   */

For what it's worth, getopt() uses ':' after the option character for
"takes an argument".

Happy to make that tweak in my tree.  But see my review of PATCH 3
first.


