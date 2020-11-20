Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C152BAAD4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:11:30 +0100 (CET)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6CH-0003tC-HH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg6AD-0003Cz-Le
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg6AB-0001Mx-Vk
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5WTxvgM+AEhEWQ7JlLNzLT7bfC+Oon8QkwBkFW6RCxA=;
 b=OqMvlQleKLswWn4k1X6gswNZjQ81xNE0OghWhGLEJboizhSPeS8xde8TM3pf1Gl0P9kD9d
 jeQxo2AqAUshgNWnrznZxePlubZO1F5lbvhQLbMS2/KHGxcsmC/bXCfziTr3aV0QqZkA7O
 y3T39W9+mxBo711LrHY0MQTWbyM9YqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-46Q6s0gYMdafYNTb67elBw-1; Fri, 20 Nov 2020 08:09:14 -0500
X-MC-Unique: 46Q6s0gYMdafYNTb67elBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90921842159
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9DC5D6AD;
 Fri, 20 Nov 2020 13:09:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1574211358BA; Fri, 20 Nov 2020 14:09:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qtest: do not return freed argument vector from qtest_rsp
References: <20201120073149.99079-1-pbonzini@redhat.com>
Date: Fri, 20 Nov 2020 14:09:12 +0100
In-Reply-To: <20201120073149.99079-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 20 Nov 2020 08:31:49 +0100")
Message-ID: <87zh3c41l3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kamil Dudka <kdudka@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> If expected_args is 0, qtest frees the argument vector and then returns it
> nevertheless.  Coverity complains; in practice this is not an issue because
> expected_args == 0 means that the caller is not interested in the argument
> vector, but it would be a potential problem if somebody wanted to add
> commands with optional arguments to qtest.
>
> Suggested-by: Kamil Dudka <kdudka@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qtest/libqtest.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index be0fb430dd..e49f3a1e45 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -545,6 +545,7 @@ redo:
       if (expected_args) {
           for (i = 0; i < expected_args; i++) {
               g_assert(words[i] != NULL);
>          }
>      } else {
>          g_strfreev(words);
> +        words = NULL;
>      }
>  
>      return words;

The patch is okay, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Odd: we require at least @expected_args, but more is fine.  Not what the
name @expected_args made me expect.

We treat expected_args == 0 as special case to save callers the trouble
to free @words.  Okay, but I'd try a more regular interface:

* one function that takes @expected_args and returns @words, always.

* a simple wrapper around it that passes zero @expected_args and frees
  @words.


