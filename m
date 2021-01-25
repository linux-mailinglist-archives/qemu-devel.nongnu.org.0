Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790A302316
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:04:28 +0100 (CET)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xnP-0002um-99
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l3xk8-00020G-TJ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l3xk6-0007JF-De
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611565256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3jJpfyFjcwO5HCf8Rqlt7oltU02yn5O4UjJF4HjVUNI=;
 b=PoFX3yJAwFOXE6XCS5PyIqSC5WSfdfiMIuWwfctL8r9pHkV8PjUItm0wi8KJNFDbiKi2Kf
 pyFmO82ap5jOjiqNVNM8OTHZodLyHJGtfL3DxTXGmn8TGPKLZYeMkhDsMDK5MKqA22zo1n
 SbfY3au0YCdzkm+rIQXPpDxggU+HaLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-npKRrwctNhW4RLFWDsldcg-1; Mon, 25 Jan 2021 04:00:54 -0500
X-MC-Unique: npKRrwctNhW4RLFWDsldcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61B2F18C8C04
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:00:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36591F05F;
 Mon, 25 Jan 2021 09:00:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FE39113865F; Mon, 25 Jan 2021 10:00:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/25] hmp: replace "O" parser with keyval
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-9-pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 10:00:51 +0100
In-Reply-To: <20210118163113.780171-9-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:56 -0500")
Message-ID: <87zh0xo0fw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> HMP is using QemuOpts to parse free-form commands device_add,
> netdev_add and object_add.  However, none of these need QemuOpts
> for validation (these three QemuOptsLists are all of the catch-all
> kind), and keyval is already able to parse into QDict.  So use
> keyval directly, avoiding the detour from
> string to QemuOpts to QDict.
>
> The args_type now stores the implied key.  This arguably makes more
> sense than storing the QemuOptsList name; at least, it _is_ a key
> that might end up in the arguments QDict.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Switching from QemuOpts to keyval changes the accepted language.  We may
change it, because HMP is not a stable interface.  The commit message
should point out the change, though.  Maybe even release notes, not
sure.

Let's recap the differences briefly:

* Boolean sugar: deprecated in QemuOpts, nonexistent in keyval

* QemuOpts accepts a number of more or less crazy corner cases keyval
  rejects: invalid key, long key (silently truncated), first rather than
  last id= wins (unlike other keys), implied key with empty value.

* QemuOpts rejects anti-social ID such as id=666, keyval leaves this to
  the caller, because key "id" is not special in keyval.

  Are these still rejected with your patch?

> ---
>  hmp-commands.hx |  6 +++---
>  monitor/hmp.c   | 20 +++++++++-----------
>  2 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 73e0832ea1..6ee746b53e 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -669,7 +669,7 @@ ERST
>  
>      {
>          .name       = "device_add",
> -        .args_type  = "device:O",
> +        .args_type  = "driver:O",
>          .params     = "driver[,prop=value][,...]",
>          .help       = "add device, like -device on the command line",
>          .cmd        = hmp_device_add,
> @@ -1315,7 +1315,7 @@ ERST
>  
>      {
>          .name       = "netdev_add",
> -        .args_type  = "netdev:O",
> +        .args_type  = "type:O",
>          .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
>          .help       = "add host network device",
>          .cmd        = hmp_netdev_add,
> @@ -1343,7 +1343,7 @@ ERST
>  
>      {
>          .name       = "object_add",
> -        .args_type  = "object:O",
> +        .args_type  = "qom-type:O",
>          .params     = "[qom-type=]type,id=str[,prop=value][,...]",
>          .help       = "create QOM object",
>          .cmd        = hmp_object_add,
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 6c0b33a0b1..d2cb886da5 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -744,13 +744,9 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>              break;
>          case 'O':
>              {
> -                QemuOptsList *opts_list;
> -                QemuOpts *opts;
> +                Error *errp;
> +                bool help;
>  
> -                opts_list = qemu_find_opts(key);
> -                if (!opts_list || opts_list->desc->name) {
> -                    goto bad_type;
> -                }
>                  while (qemu_isspace(*p)) {
>                      p++;
>                  }
> @@ -760,12 +756,14 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>                  if (get_str(buf, sizeof(buf), &p) < 0) {
>                      goto fail;
>                  }
> -                opts = qemu_opts_parse_noisily(opts_list, buf, true);
> -                if (!opts) {
> -                    goto fail;
> +                keyval_parse_into(qdict, buf, key, &help, &errp);
> +                if (help) {

Uh...

> +                    if (qdict_haskey(qdict, key)) {

If we parsed a value for the implied key (sugared or not),

> +                        qdict_put_bool(qdict, "help", true);

then encode the help request by mapping key "help" to true,

> +                    } else {
> +                        qdict_put_str(qdict, key, "help");

else by mapping the implied key to "help".

> +                    }

Test cases:

* device_add help

  @qdict before the patch:

    {
        "driver": "help"
    }

  No change.

* device_add e1000,help

  @qdict before the patch:

    {
        "driver": "e1000",
        "help": "on"
    }

  Afterwards:

    {
        "driver": "e1000",
        "help": true
    }

  If this is okay, the commit message should explain it.

* device_add help,e1000

    {
        "e1000": "on",
        "driver": "help"
    }

  Afterwards:
  upstream-qemu: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

>                  }
> -                qemu_opts_to_qdict(opts, qdict);
> -                qemu_opts_del(opts);
>              }
>              break;
>          case '/':


