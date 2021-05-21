Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216D38CA0E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:25:58 +0200 (CEST)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk72D-00007Z-8H
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk70k-0005nf-Jl
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:24:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk70h-0006hl-9g
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621610662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZAvBNup0TSNdR0MxDBZDVGEvGpjnKOXk1uYMCuJPhw=;
 b=d63P671iX42jxb1oQeHtWNpdR33oj510Lnd9awUU8ECgFCYp1tb6vBIbno9cBAGFgVkyaO
 +K+U6Nb1Gm3rZXr5WEsOPI6UKG+MxtoSNrQFPIMV3HZgS4EXlFWL5z4iLVKk6Jax2jB18G
 k6frDC0HfdOzHaYTcihWQnj6UwOUnVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-jLnm1jehMQKxazeN2HeVfQ-1; Fri, 21 May 2021 11:24:20 -0400
X-MC-Unique: jLnm1jehMQKxazeN2HeVfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF69A106BB24
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 15:24:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB915D6DC;
 Fri, 21 May 2021 15:24:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1113113865F; Fri, 21 May 2021 17:24:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v4 0/9] qapi: untie 'if' conditions from C preprocessor
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
Date: Fri, 21 May 2021 17:24:10 +0200
In-Reply-To: <20210517163040.2308926-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Mon, 17 May 2021 20:30:31 +0400")
Message-ID: <87im3c155x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since I won't be able to complete my review before my vaction, let me at
least give you some high-level feedback.

I admit I'm rather fond of the the radically simple, stupid way 'if'
works.  It's tied to C, which is just fine as long as all we need is C.

Since we're going to need more than C, it's no longer fine.  You replace
the stupid C preprocessor expression string by a little language.  The
little language is less expressive than C preprocessor expressions.  I
agree with that choice.  Simplicity is more important than
expressiveness we may well never need.

I'm a bit concerned about excessive OO boilerplate on the one hand, and
keeping stuff factored cleanly on the other hand.  Balancing act.  We'll
figure it out.


