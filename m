Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D58350A514
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:16:11 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZTW-0006GY-Cu
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhYgg-0003tG-Az
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhYge-0007nz-7x
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qrv8Q18G9bWjHDqvIOofL6UpaH6KxJfp6tjDfNvMh7Y=;
 b=WcciIZPEzoPQQwqf6LVXeTs/jnu0scvUv8vUIm/ft6iDHDyHj3RN6vR5lLgWgA+FsLJv1P
 c4+XCniVF3KsKtR1ZTRgNOXeHPC0E1mWy0Xx7V0x8ghs4RLe/G9rrCBJ5YDGizqPEIJaZc
 F0VQLjZC4Ivosx73yuuVevlKHcjyyLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-bQnlAmAZNkiJEoFPIQakQw-1; Thu, 21 Apr 2022 11:25:36 -0400
X-MC-Unique: bQnlAmAZNkiJEoFPIQakQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A936180418B;
 Thu, 21 Apr 2022 15:25:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 878D1C50949;
 Thu, 21 Apr 2022 15:25:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69BE321E6A1F; Thu, 21 Apr 2022 17:25:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] iotests/108: Fix when missing user_allow_other
References: <20220421142435.569600-1-hreitz@redhat.com>
Date: Thu, 21 Apr 2022 17:25:34 +0200
In-Reply-To: <20220421142435.569600-1-hreitz@redhat.com> (Hanna Reitz's
 message of "Thu, 21 Apr 2022 16:24:35 +0200")
Message-ID: <871qxqpifl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hanna Reitz <hreitz@redhat.com> writes:

> FUSE exports' allow-other option defaults to "auto", which means that it
> will try passing allow_other as a mount option, and fall back to not
> using it when an error occurs.  We make no effort to hide fusermount's
> error message (because it would be difficult, and because users might
> want to know about the fallback occurring), and so when allow_other does
> not work (primarily when /etc/fuse.conf does not contain
> user_allow_other), this error message will appear and break the
> reference output.
>
> We do not need allow_other here, though, so we can just pass
> allow-other=off to fix that.
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Tested-by: Markus Armbruster <armbru@redhat.com>

Thanks!


