Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7044EE981
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:09:10 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCLF-0004cw-Fu
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:09:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCDY-0000mS-67
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCDV-0004aC-RL
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5njIXtOWejftx88zs98xmB2hb0+4p7hOeXZM7yGQb8A=;
 b=YcEILi8SURmEpaf1E9Z1G0weg0Ah2gooUzOXvXn62vnZNyLNzZwL2LwX5uKBDx8Daj9+8E
 401GyQTrfsWOTDFcfKZnvgsxlQFAjoAHMJxUHS2FJFPDq8iS8Th0LL3ZJutxAauN/p832B
 xMh8R1M5i1bW4gXygk8RFGzpO22sU88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-vBp52ISBO-C6wNPNqmUN5A-1; Fri, 01 Apr 2022 04:01:08 -0400
X-MC-Unique: vBp52ISBO-C6wNPNqmUN5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D4A85A5A8
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 08:01:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D21CF401E7E;
 Fri,  1 Apr 2022 08:01:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C10BA21E691D; Fri,  1 Apr 2022 10:01:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v1 2/9] qapi: fix examples: replay-break and replay-seek
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220331190633.121077-3-victortoso@redhat.com>
Date: Fri, 01 Apr 2022 10:01:06 +0200
In-Reply-To: <20220331190633.121077-3-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 31 Mar 2022 21:06:26 +0200")
Message-ID: <87pmm1b5bx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Both examples outputs are using @data member for the arguments. This
> is wrong. The expected member for the QMP is @arguments. Fix it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/replay.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/replay.json b/qapi/replay.json
> index b4d1ba253b..351898f60d 100644
> --- a/qapi/replay.json
> +++ b/qapi/replay.json
> @@ -81,7 +81,7 @@
>  #
>  # Example:
>  #
> -# -> { "execute": "replay-break", "data": { "icount": 220414 } }
> +# -> { "execute": "replay-break", "arguments": { "icount": 220414 } }
>  #
>  ##
>  { 'command': 'replay-break', 'data': { 'icount': 'int' } }
> @@ -117,6 +117,6 @@
>  #
>  # Example:
>  #
> -# -> { "execute": "replay-seek", "data": { "icount": 220414 } }
> +# -> { "execute": "replay-seek", "arguments": { "icount": 220414 } }
>  ##
>  { 'command': 'replay-seek', 'data': { 'icount': 'int' } }

I should've flagged these when I reviewed commit b1ca53224a
"qapi/migration: Fix examples document wrong field name for arguments".

Reviewed-by: Markus Armbruster <armbru@redhat.com>


