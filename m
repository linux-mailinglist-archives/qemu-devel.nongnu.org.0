Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ACB68EF02
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjdQ-00052l-96; Wed, 08 Feb 2023 07:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPjdN-00051f-By
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPjdL-00089K-Ec
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675859585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glIywPtFwffHuqiCg/TDcjTaVYc9iuj6yW9W/yVIYX4=;
 b=hF+8e29LOmPJMm8/xpDmTSrs+eISDTEhcDjsLo5cwO4NF0sGbFxRSccxs1D+n0VnuDLvdH
 Cwsi0/dO4K8K+F9w7so05sGwBkwHM0/dM03/dXusBXA9v3lTRPNQy7rtPQMPuelyJRAgp+
 vEjBOLQIvPiovycdlITSLPHKW3zoYCM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-DtfDa0QrMoOkcAjKa6eOpw-1; Wed, 08 Feb 2023 07:33:02 -0500
X-MC-Unique: DtfDa0QrMoOkcAjKa6eOpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A18B802314;
 Wed,  8 Feb 2023 12:33:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3641235454;
 Wed,  8 Feb 2023 12:33:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F109121E6A1F; Wed,  8 Feb 2023 13:33:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  joe.jin@oracle.com
Subject: Re: [PATCH 1/1] readline: fix hmp completion issue
References: <20230207045241.8843-1-dongli.zhang@oracle.com>
Date: Wed, 08 Feb 2023 13:33:00 +0100
In-Reply-To: <20230207045241.8843-1-dongli.zhang@oracle.com> (Dongli Zhang's
 message of "Mon, 6 Feb 2023 20:52:41 -0800")
Message-ID: <87ttzwgww3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Dongli Zhang <dongli.zhang@oracle.com> writes:

> The auto completion does not work in some cases.
>
> Case 1.
>
> 1. (qemu) info reg
> 2. Press 'Tab'.
> 3. It does not auto complete.
>
> Case 2.
>
> 1. (qemu) block_resize flo
> 2. Press 'Tab'.
> 3. It does not auto complete 'floppy0'.
>
> Since the readline_add_completion_of() may add any completion when
> strlen(pfx) is zero, we remove the check with (name[0] == '\0') because
> strlen() always returns zero in that case.
>
> Fixes: 52f50b1e9f8f ("readline: Extract readline_add_completion_of() from monitor")
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  monitor/hmp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 2aa85d3982..fee410362f 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1189,9 +1189,7 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
>          }
>          memcpy(cmd, pstart, len);
>          cmd[len] = '\0';
> -        if (name[0] == '\0') {
> -            readline_add_completion_of(mon->rs, name, cmd);
> -        }
> +        readline_add_completion_of(mon->rs, name, cmd);
>          if (*p == '\0') {
>              break;
>          }

Yes, this fixes a silly logic error in my patch.

Before my patch:

        if (name[0] == '\0' || !strncmp(name, cmd, strlen(name))) {
            readline_add_completion(mon->rs, cmd);
        }

The left operand of || implies the right operand: it's true when name is
"", and strncmp("", ..., 0) is 0.  Therefore, this could simply be

        if (!strncmp(name, cmd, strlen(name))) {
            readline_add_completion(mon->rs, cmd);
        }

My patch combined with yours factors this out.

> @@ -1335,9 +1333,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>              /* block device name completion */
>              readline_set_completion_index(mon->rs, strlen(str));
>              while ((blk = blk_next(blk)) != NULL) {
> -                if (str[0] == '\0') {
> -                    readline_add_completion_of(mon->rs, str, blk_name(blk));
> -                }
> +                readline_add_completion_of(mon->rs, str, blk_name(blk));
>              }
>              break;
>          case 's':

Likewise.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

I'll take this through my tree.  Thanks!


