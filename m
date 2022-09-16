Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2F5BA8FE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 11:09:11 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ7LS-0007DB-9i
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 05:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZ77d-0002H0-Oy
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZ77a-0005yo-FO
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663318489;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBUdOEoA94aevtunx+Ifxf/DhmqtLls69vA9MlKEs7M=;
 b=M7lV1kNFl2L7i07lvBwdtNMEh3/fcyd0kfvKNkv4zieyNAreKL4auk/ExXDkJL1aJr7lAx
 T8sSUbgPLinBNwAY9+i+vl8L80VA72/bafoQWoI5mWcfw2CMYi5O4+LFo+/jYzW/rvzm17
 2NJz5Nu/xAZBSpJap05C/wi+u9ayULA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-wYeFF1KrOmWgmzFoy3G5Tg-1; Fri, 16 Sep 2022 04:54:48 -0400
X-MC-Unique: wYeFF1KrOmWgmzFoy3G5Tg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 196981C0BDE7;
 Fri, 16 Sep 2022 08:54:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 353B040C83ED;
 Fri, 16 Sep 2022 08:54:47 +0000 (UTC)
Date: Fri, 16 Sep 2022 09:54:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 05/27] qapi tests: Elide redundant has_FOO in generated C
Message-ID: <YyQ51Gvy2JS56+TL@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220915204317.3766007-6-armbru@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 10:42:55PM +0200, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for
> tests/qapi-schema/qapi-schema-test.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qtest/qmp-cmd-test.c               |  2 +-
>  tests/unit/test-qmp-cmds.c               | 26 +++++++++++-------------
>  tests/unit/test-qmp-event.c              |  4 ++--
>  tests/unit/test-qobject-input-visitor.c  |  2 +-
>  tests/unit/test-qobject-output-visitor.c |  2 --
>  tests/unit/test-visitor-serialization.c  |  3 +--
>  scripts/qapi/schema.py                   |  4 +---
>  7 files changed, 18 insertions(+), 25 deletions(-)

> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 6085c09995..2373cd64cb 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -43,15 +43,15 @@ void qmp_user_def_cmd1(UserDefOne * ud1, Error **errp)
>  {
>  }
>  
> -FeatureStruct1 *qmp_test_features0(bool has_fs0, FeatureStruct0 *fs0,
> -                                   bool has_fs1, FeatureStruct1 *fs1,
> -                                   bool has_fs2, FeatureStruct2 *fs2,
> -                                   bool has_fs3, FeatureStruct3 *fs3,
> -                                   bool has_fs4, FeatureStruct4 *fs4,
> -                                   bool has_cfs1, CondFeatureStruct1 *cfs1,
> -                                   bool has_cfs2, CondFeatureStruct2 *cfs2,
> -                                   bool has_cfs3, CondFeatureStruct3 *cfs3,
> -                                   bool has_cfs4, CondFeatureStruct4 *cfs4,
> +FeatureStruct1 *qmp_test_features0(FeatureStruct0 *fs0,
> +                                   FeatureStruct1 *fs1,
> +                                   FeatureStruct2 *fs2,
> +                                   FeatureStruct3 *fs3,
> +                                   FeatureStruct4 *fs4,
> +                                   CondFeatureStruct1 *cfs1,
> +                                   CondFeatureStruct2 *cfs2,
> +                                   CondFeatureStruct3 *cfs3,
> +                                   CondFeatureStruct4 *cfs4,
>                                     Error **errp)

It makes me so happy to see this change finally arrive, the new
method signature just "feels right".



> @@ -87,8 +86,8 @@ UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
>  
>      ud1c->string = strdup(ud1a->string);
>      ud1c->integer = ud1a->integer;
> -    ud1d->string = strdup(has_udb1 ? ud1b->string : "blah0");
> -    ud1d->integer = has_udb1 ? ud1b->integer : 0;
> +    ud1d->string = strdup(ud1b ? ud1b->string : "blah0");
> +    ud1d->integer = ud1b ? ud1b->integer : 0;

Pre-existing problem. use of 'strdup' will leave these fields
NULL on OOM and nothing is checking this. Fortunately it is only
the test suite so not a big deal, but worth changing to g_strdup
at some point (separate from this patch / series). Repeated in
other chunks of the test beyond this quoted one, but I won't
point them out.


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


