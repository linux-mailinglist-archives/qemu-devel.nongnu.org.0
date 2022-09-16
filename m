Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE355BA8BB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:57:21 +0200 (CEST)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ7A0-00053S-4V
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZ73i-0007bg-FR
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZ73e-0005TD-2L
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663318244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGitLjlR1zU87E/5Yx/kk39s3cPloCPj6c/iW0HIMWY=;
 b=iqvXE+rxKTwQZtMXy/DDRi9EsBw1WCt6nXpjw3+BmOlZTVmyirt2s+4mYmuMsKX8u8WH9/
 1LzT0VK4jdDR/gmBPNbjyh3PvzezXNFg/93aTHCPrsAs2nbL8TcGP/ptLwPz4PM1nWt2DI
 vBrjYyBSfD7TTzdvL2YArurSCmMMTvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-kOWrCe_0OuuduiYCRaw5GQ-1; Fri, 16 Sep 2022 04:50:41 -0400
X-MC-Unique: kOWrCe_0OuuduiYCRaw5GQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCD1F101A528;
 Fri, 16 Sep 2022 08:50:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAEED492CA2;
 Fri, 16 Sep 2022 08:50:39 +0000 (UTC)
Date: Fri, 16 Sep 2022 09:50:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 04/27] qapi: Start to elide redundant has_FOO in
 generated C
Message-ID: <YyQ43fibYYKzkWzR@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220915204317.3766007-5-armbru@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Sep 15, 2022 at 10:42:54PM +0200, Markus Armbruster wrote:
> In QAPI, absent optional members are distinct from any present value.
> We thus represent an optional schema member FOO as two C members: a
> FOO with the member's type, and a bool has_FOO.  Likewise for function
> arguments.
> 
> However, has_FOO is actually redundant for a pointer-valued FOO, which
> can be null only when has_FOO is false, i.e. has_FOO == !!FOO.  Except
> for arrays, where we a null FOO can also be a present empty array.
> 
> The redundant has_FOO are a nuisance to work with.  Improve the
> generator to elide them.  Uses of has_FOO need to be replaced as
> follows.
> 
> Tests of has_FOO become the equivalent comparison of FOO with null.
> For brevity, this is commonly done by implicit conversion to bool.
> 
> Assignments to has_FOO get dropped.
> 
> Likewise for arguments to has_FOO parameters.
> 
> Beware: code may violate the invariant has_FOO == !!FOO before the
> transformation, and get away with it.  The above transformation can
> then break things.  Two cases:
> 
> * Absent: if code ignores FOO entirely when !has_FOO (except for
>   freeing it if necessary), even non-null / uninitialized FOO works.
>   Such code is known to exist.
> 
> * Present: if code ignores FOO entirely when has_FOO, even null FOO
>   works.  Such code should not exist.
> 
> In both cases, replacing tests of has_FOO by FOO reverts their sense.
> We have to fix the value of FOO then.
> 
> To facilitate review of the necessary updates to handwritten code, add
> means to opt out of this change, and opt out for all QAPI schema
> modules where the change requires updates to handwritten code.  The
> next few commits will remove these opt-outs in reviewable chunks, then
> drop the means to opt out.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst            |  5 +--
>  docs/devel/writing-monitor-commands.rst | 14 ++++----
>  scripts/qapi/commands.py                |  2 +-
>  scripts/qapi/events.py                  |  2 +-
>  scripts/qapi/gen.py                     |  2 +-
>  scripts/qapi/schema.py                  | 47 +++++++++++++++++++++++++
>  scripts/qapi/types.py                   |  2 +-
>  scripts/qapi/visit.py                   | 17 +++++++--
>  8 files changed, 76 insertions(+), 15 deletions(-)
> 

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


