Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8623BACD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 14:58:33 +0200 (CEST)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2wWW-00019k-Ld
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 08:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k2wVd-0000ej-3J
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 08:57:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32139
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k2wVb-000364-Bw
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 08:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596545854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Xd08oRCCEza7E5pZbxRjg1xSgLInYiwBZPZbNCVCbM=;
 b=KsqcPaoCaLkBqnjDa6jA4OLMWwBT8079+undZ1fVY33Yo6el1Zubqqf69IY4CK228r941R
 WQ/s9eN0i4jeAwX7a0HK3GhqKsoEp7UZHxBErmlVrPb/aeQHqWjhEMDVPnZiJ/cGo3UXJH
 dCVK+EHZEhDAwvW3mYxHA112VazgQuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-uZs-z2b3MU6gW3xNZjouGw-1; Tue, 04 Aug 2020 08:57:32 -0400
X-MC-Unique: uZs-z2b3MU6gW3xNZjouGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A084800685;
 Tue,  4 Aug 2020 12:57:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AF0919C58;
 Tue,  4 Aug 2020 12:57:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E12211141D60; Tue,  4 Aug 2020 14:57:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v6 04/12] qmp: Assert that no other monitor is active
References: <20200528153742.274164-1-kwolf@redhat.com>
 <20200528153742.274164-5-kwolf@redhat.com>
Date: Tue, 04 Aug 2020 14:57:29 +0200
In-Reply-To: <20200528153742.274164-5-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 28 May 2020 17:37:34 +0200")
Message-ID: <87d046bmbq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> monitor_qmp_dispatch() is never supposed to be called in the context of
> another monitor, so assert that monitor_cur() is NULL instead of saving
> and restoring it.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  monitor/qmp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 5e9abd4711..a04c512e3a 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -135,16 +135,15 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDict *rsp)
>  
>  static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
>  {
> -    Monitor *old_mon;
>      QDict *rsp;
>      QDict *error;
>  
> -    old_mon = monitor_cur();
> +    assert(monitor_cur() == NULL);

I'd write !monitor_cur().  Matter of taste.

>      monitor_set_cur(&mon->common);
>  
>      rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon));
>  
> -    monitor_set_cur(old_mon);
> +    monitor_set_cur(NULL);
>  
>      if (mon->commands == &qmp_cap_negotiation_commands) {
>          error = qdict_get_qdict(rsp, "error");

Reviewed-by: Markus Armbruster <armbru@redhat.com>


