Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385533A276A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:49:58 +0200 (CEST)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGNx-0002j1-Aa
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrGMX-0001s2-7n
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrGMR-0002oJ-S5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623314902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9cxu3pXOwzEj4RfYUzcUojcTsnwJdcBdTftWPq1pMs=;
 b=MIllbw8svI4pRP0x/yv5kvi1btRmOb1auybybbPCL1GpvC6/0bNPvmo8vQmE/ygyWNw8Jk
 BtV3s+speWa2NGxkZoeBAQOgMYvjMev2gVbbFL0Dr1omD38EgAcz7E4e33X2tUoG6OOz9q
 NaV5U5rXJuccBoOgL+FaXYpwkt8e9q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-BWNqJeiGM1uOfGWyZNN3Qw-1; Thu, 10 Jun 2021 04:48:20 -0400
X-MC-Unique: BWNqJeiGM1uOfGWyZNN3Qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAD22100C609;
 Thu, 10 Jun 2021 08:48:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DF7860C05;
 Thu, 10 Jun 2021 08:48:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 155C3113865F; Thu, 10 Jun 2021 10:48:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qemu-config: use qemu_opts_from_qdict
References: <20210609123931.553449-1-pbonzini@redhat.com>
Date: Thu, 10 Jun 2021 10:48:18 +0200
In-Reply-To: <20210609123931.553449-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 9 Jun 2021 14:39:31 +0200")
Message-ID: <87o8ceds19.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Using qemu_opts_absorb_qdict, and then checking for any leftover options,
> is redundant because there is already a function that does the same,
> qemu_opts_from_qdict.  qemu_opts_from_qdict consumes the whole dictionary
> and therefore can just return an error message if an option fails to validate.

I missed this when I reviewed the series...

> This also fixes a bug, because the "id" entry was retrieved in
> qemu_config_do_parse and then left there by qemu_opts_absorb_qdict.
> As a result, it was reported as an unrecognized option.
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Fixes: 3770141139 ("qemu-config: parse configuration files to a QDict")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-config.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
>
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 374f3bc460..84ee6dc4ea 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -429,29 +429,14 @@ out:
>  void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
>  {
>      QemuOptsList **lists = opaque;
> -    const char *id = qdict_get_try_str(qdict, "id");
>      QemuOptsList *list;
> -    QemuOpts *opts;
> -    const QDictEntry *unrecognized;
>  
>      list = find_list(lists, group, errp);
>      if (!list) {
>          return;
>      }
>  
> -    opts = qemu_opts_create(list, id, 1, errp);
> -    if (!opts) {
> -        return;
> -    }
> -    if (!qemu_opts_absorb_qdict(opts, qdict, errp)) {
> -        qemu_opts_del(opts);
> -        return;
> -    }
> -    unrecognized = qdict_first(qdict);
> -    if (unrecognized) {
> -        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);
> -        qemu_opts_del(opts);
> -    }
> +    qemu_opts_from_qdict(list, qdict, errp);
>  }
>  
>  int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)

Creation of @opts is now in qemu_opts_from_qdict().  Works the same as
before.  Good.  Let's compare the remainder.

Before the patch:

    qemu_opts_absorb_qdict() absorbs entries with keys the QemuOpts accepts.
    It either accepts a (non-empty) list of keys, or any key.

    It fails when any of the absorbed entries fails
    qemu_opts_from_qdict_entry().

    qemu_config_do_parse() additionally fails when unabsorbed keys remain.

After the patch:

    qemu_opts_from_qdict() feeds all entries to
    qemu_opts_from_qdict_entry().  Which silently ignores entry "id",
    and fails for keys the QemuOpts doesn't accept.

Good.  The part 'ignores entry "id"' fixes the bug.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Tangent: we silently ignore entries whose value is a QTYPE_QNULL,
QTYPE_QDICT, or QTYPE_QLIST, because qemu_opts_from_qdict_entry() does.
Not changed by this patch, I believe.


