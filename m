Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BA4395CF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:15:13 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meysi-0006LW-Ao
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1meyjX-00080Z-Mq
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1meyjP-0003Nt-Vv
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635163535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cvd4zOfuhKi6S01Z5kiuGq4BEoxK1dU5DsITiAiBL+o=;
 b=Ti9mlJACaIue0jVhk/OqdVWe7qzxIg+t2/E2hyyXCAt2qz1KQZia8WzCrYzyk0cOb57G7m
 Mcjjqu0m1zCa6FQWMWyKaKshQ1q0oGM3p4CFQ8b1eZQEUZGND+E6WaAegrwhRSgj2w4a91
 pxhMFNV/77u300ss56ltISz1/+Ifdao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-RZlQAuUQOSaFwFErWqykuA-1; Mon, 25 Oct 2021 08:05:32 -0400
X-MC-Unique: RZlQAuUQOSaFwFErWqykuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2823101F7A9;
 Mon, 25 Oct 2021 12:05:30 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4BF1835D;
 Mon, 25 Oct 2021 12:05:03 +0000 (UTC)
Date: Mon, 25 Oct 2021 14:05:00 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXadbMF3lj5I4+Cd@paraplu>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025052532.3859634-2-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 libguestfs@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 07:25:24AM +0200, Markus Armbruster wrote:
> By convention, names starting with "x-" are experimental.  The parts
> of external interfaces so named may be withdrawn or changed
> incompatibly in future releases.
> 
> Drawback: promoting something from experimental to stable involves a
> name change.  Client code needs to be updated.
> 
> Moreover, the convention is not universally observed:
> 
> * QOM type "input-barrier" has properties "x-origin", "y-origin".
>   Looks accidental, but it's ABI since 4.2.
> 
> * QOM types "memory-backend-file", "memory-backend-memfd",
>   "memory-backend-ram", and "memory-backend-epc" have a property
>   "x-use-canonical-path-for-ramblock-id" that is documented to be
>   stable despite its name.

Looks like there's another stable property with an "x-" prefix:
"x-remote-object", part of QOM type @RemoteObjectProperties.

Given the above "x-" properties are now stable, I take it that they
cannot be renamed now, as they might break any tools using them?  My
guess is the tedious way is not worth it: deprecate them, and add the
non-x variants as "synonyms".  
 
> We could document these exceptions, but documentation helps only
> humans.  We want to recognize "unstable" in code, like "deprecated".
>
> Replace the convention by a new special feature flag "unstable".  It
> will be recognized by the QAPI generator, like the existing feature
> flag "deprecated", and unlike regular feature flags.

FWIW, sounds good to me.

> This commit updates documentation and prepares tests.  The next commit
> updates the QAPI schema.  The remaining patches update the QAPI
> generator and wire up -compat policy checking.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst            | 9 ++++++---
>  tests/qapi-schema/qapi-schema-test.json | 7 +++++--
>  tests/qapi-schema/qapi-schema-test.out  | 5 +++++
>  3 files changed, 16 insertions(+), 5 deletions(-)

[...]

-- 
/kashyap


