Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406935235ED
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:43:35 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonYr-0007ZW-Qn
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nonX7-0006t7-UK
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nonX4-0000aM-F2
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652280098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIdIJ8FNMgRpxug4h1/4PCdUq6qkdChQqdXqv3qvDFU=;
 b=DLx90MV3wB9X94a84GSSp4fa0iGHYpMBOd36Cv/Cn9dmojDoPmjgvEEGlXLJvVUkzxQ+AI
 rqs1v+7lUgDA1tKcs7Nx3jM+5/xvpCuhF0qB5JBwjo0lNuHrVNRVKGd9srQwDmHcmKF92f
 JvxaKbGkORtohgWnbuX1oTR0H4w5vzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-xG7vrKdGM1-wGv_jN5Wp1A-1; Wed, 11 May 2022 10:41:37 -0400
X-MC-Unique: xG7vrKdGM1-wGv_jN5Wp1A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5412510665A0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:41:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC37455D6B;
 Wed, 11 May 2022 14:41:35 +0000 (UTC)
Date: Wed, 11 May 2022 15:41:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnvLHPKduFo42zkI@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com> <87pmkkdugo.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmkkdugo.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 04:17:43PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, May 10, 2022 at 01:34:03PM +0100, Daniel P. Berrangé wrote:
> > Having said that, a different way to approach the problem is to expose
> > the versioning directly in the generated code.
> >
> > Consider a QAPI with versioning info about the fields
> >
> >   { 'command': 'block_resize',
> >     'since': '5.0.0',
> >     'data': { 'device': ['type': 'str', 'until': '5.2.0' ],
> >               '*device': ['type': 'str', 'since': '5.2.0', 'until': '7.0.0' ],
> >               '*node-name': ['type': 'str', 'since': '5.2.0', 'until: '7.0.0' ],
> >               'node-name': ['type': 'str', 'since': '7.0.0' ],
> >               'size': 'int' } }
> >
> > Meaning
> >
> >   * Introduced in 5.0.0, with 'device' mandatory
> >   * In 5.2.0, 'device' becomes optional, with optional 'node-name' as alternative
> >   * In 7.0.0, 'device' is deleted, and 'node-name' becomes mandatory
> >
> > Now consider the Go structs
> >
> > In 5.0.0 we can generate:
> >
> >    type BlockResizeArguments struct {
> >        V500 *BlockResizeArguments500
> >    }
> >
> >    type BlockResizeArgumentsV1 struct {
> >         Device string
> >         Size int
> >     }
> >
> > app can use
> >
> >     dev := "dev0"
> >     cmd := BlockResizeArguments{
> >        V500: &BlockResizeArguments500{
> >           Device: dev,
> > 	  Size: 1 * GiB
> >        }
> >     }
> >
> >
> > In 5.2.0 we can now generate
> >
> >    type BlockResizeArguments struct {
> >        V500 *BlockResizeArgumentsV500
> >        V520 *BlockResizeArgumentsV520
> >    }
> >
> >    type BlockResizeArgumentsV500 struct {
> >         Device string
> >         Size int
> >     }
> >
> >    type BlockResizeArgumentsV520 struct {
> >         Device *string
> > 	NodeName *string
> >         Size int
> >     }
> >
> >
> > App can use the same as before, or switch to one of
> >
> >     dev := "dev0"
> >     cmd := BlockResizeArguments{
> >        V520: &BlockResizeArguments520{
> >           Device: &dev,
> > 	  Size: 1 * GiB
> >        }
> >     }
> >
> > or
> >
> >     node := "nodedev0"
> >     cmd := BlockResizeArguments{
> >        V520: &BlockResizeArguments520{
> >           NodeName: &node,
> > 	  Size: 1 * GiB
> >        }
> >     }
> >
> >
> >
> > In 7.0.0 we can now generate
> >
> >
> >    type BlockResizeArguments struct {
> >        V500 *BlockResizeArgumentsV500
> >        V520 *BlockResizeArgumentsV520
> >        V700 *BlockResizeArgumentsV700
> >    }
> >
> >    type BlockResizeArgumentsV500 struct {
> >         Device string
> >         Size int
> >    }
> >
> >    type BlockResizeArgumentsV520 struct {
> >         Device *string
> > 	NodeName *string
> >         Size int
> >    }
> >
> >    type BlockResizeArgumentsV700 struct {
> > 	NodeName string
> >         Size int
> >    }
> >
> >
> >
> > App can use the same as before, or switch to
> >
> >     node := "nodedev0"
> >     cmd := BlockResizeArguments{
> >        V700: &BlockResizeArguments700{
> >           NodeName: node,
> > 	  Size: 1 * GiB
> >        }
> >     }
> >
> >
> > This kind of per-command/type versioning is not uncommon when defining API
> > protocols/interfaces.
> 
> 1. At every release, put a copy of the QAPI schema in the freezer.
> 
> 2. For every copy, generate Go types with a suitable name suffix.
>    Collect all the name stems.
> 
> 3. For each name stem, define a Go struct that contains all the suffixed
>    Go types with that stem.
> 
> Look Ma, no cluttering the QAPI schema with a full history!  Also no
> complicating the schema language to provide the means for that.

That could indeed be a viable approach. Puts a little more work on the
code generator to match up the types, but probably isn't too hard.

Incidentally, we've intentionally not exposed type names in the QAPI
introspection in QMP.  With code generators, when the generated code
type names driven from QAPI schema, there's likely going to be an
expectation that type names in QAPI have some kind of stability rules.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


