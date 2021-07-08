Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B43BF789
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:26:01 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QIC-0006in-VN
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1QH9-00062i-Te
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1QH8-0004PY-9T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625736293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=InbTtbhjUOAuNIt0cbXzASaS2gaEn03cQbtk/doY6I8=;
 b=VyTRpqsjFiNLDN+OwRszNNZNWmh72xZ7WCR1liItvyOLbgFdRMHFMUEpfrQAASLlGa8qS1
 hqnbjcNmyM3556Yyn3JAy1JxO4boO0MTYZY2mU9kY1PQFL38OpBCmyFo09/RDw6P2SEZjT
 zT7CtJySXZvwA+TpynMyZyF7y4K669Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-OGPTNzC8NM-aPtWHXjHXwg-1; Thu, 08 Jul 2021 05:24:50 -0400
X-MC-Unique: OGPTNzC8NM-aPtWHXjHXwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 740388015F5;
 Thu,  8 Jul 2021 09:24:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E4F55C1C2;
 Thu,  8 Jul 2021 09:24:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 926AB1132B52; Thu,  8 Jul 2021 11:24:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qemu-config: never call the callback after an error,
 fix leak
References: <20210707121545.361829-2-pbonzini@redhat.com>
Date: Thu, 08 Jul 2021 11:24:47 +0200
In-Reply-To: <20210707121545.361829-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 7 Jul 2021 14:15:45 +0200")
Message-ID: <87eec99mzk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Ensure that the callback to qemu_config_foreach is never called upon
> an error, by moving the invocation before the "out" label and ensuring
> all error cases jump to the label.  The qobject_unref however needs
> to be done in all cases (which Coverity is already complaining about).
>
> The leak is basically impossible to reach, since the only common way
> to get ferror(fp) is by passing a directory to -readconfig.  In that
> case, the error occurs before qdict is set to anything non-NULL.
> However, it's theoretically possible to get there after an EIO.
>
> Cc: armbru@redhat.com
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-config.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 84ee6dc4ea..6c4373e8fb 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -412,16 +412,15 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
>          goto out;
>      }
>      if (ferror(fp)) {
> -        loc_pop(&loc);
>          error_setg_errno(errp, errno, "Cannot read config file");

I'm afraid we now report the error with the wrong location when @errp is
&error-fatal.

> -        return res;
> +        goto out;
>      }
>      res = count;
> -out:
>      if (qdict) {
>          cb(group, qdict, opaque, errp);
> -        qobject_unref(qdict);
>      }
> +out:
> +    qobject_unref(qdict);
>      loc_pop(&loc);
>      return res;
>  }

Looks like the patch fixes two separate issues:

1. Memory leak on ferror()
   Fixes: f7544edcd32e602af1aae86714dc7c32350d5d7c

2. Callback can run on error.
   Fixes: 37701411397c7b7d709ae92abd347cc593940ee5

   I *think* this happens when the cb() further up fails, and when a
   line following the [...] section header cannot be parsed.

Worth fixing the separate bugs in separate patches?


