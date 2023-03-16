Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1226BD196
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 14:56:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pco4F-0003R0-GM; Thu, 16 Mar 2023 09:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pco4D-0003Qm-N7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pco4B-0008EC-Ua
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678974890;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYfwxis4mj5jW46oi5WQjkQucYku09OmxIHNO1SdDaw=;
 b=aoKWfXP8Bomv443z/0/mStXpjVNoWfHjzJSN14FQFDtCiiR/yzFXKZA+wKzd46z9/LfHvf
 1LtWKxgjIAqxwZNNugRXzcrBc6H5pzJlT0UrNSnCKEy8/l33gKAgh0JV3OQCn2ZrmBofKC
 M/dJ0apHNYW2VBDlVGJOJu+h/ZwePLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-RwEcyV3tM9G87h7XQ3-MNg-1; Thu, 16 Mar 2023 09:54:46 -0400
X-MC-Unique: RwEcyV3tM9G87h7XQ3-MNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81CB796DC80;
 Thu, 16 Mar 2023 13:54:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C776D35453;
 Thu, 16 Mar 2023 13:54:44 +0000 (UTC)
Date: Thu, 16 Mar 2023 13:54:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
Message-ID: <ZBMfosr0JDyfjhqs@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz58ubcn.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
> > Per the C++ standard, empty enum are ill-formed. Do not generate
> > them in order to avoid:
> >
> >   In file included from qga/qga-qapi-emit-events.c:14:
> >   qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
> >      20 | } qga_QAPIEvent;
> >         | ^
> >
> > Reported-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Two failures in "make check-qapi-schema" (which is run by "make check"):
> 
> 1. Positive test case qapi-schema-test
> 
>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/qapi-schema-test.out
>     +++ 
>     @@ -19,7 +19,6 @@
>          member enum2: EnumOne optional=True
>          member enum3: EnumOne optional=False
>          member enum4: EnumOne optional=True
>     -enum MyEnum
>      object Empty1
>      object Empty2
>          base Empty1
> 
>    You forgot to update expected test output.  No big deal.
> 
> 2. Negative test case union-empty
> 
>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/union-empty.err
>     +++ 
>     @@ -1,2 +1,2 @@
>     -union-empty.json: In union 'Union':
>     -union-empty.json:4: union has no branches
>     +union-empty.json: In struct 'Base':
>     +union-empty.json:3: member 'type' uses unknown type 'Empty'
>     stderr:
>     qapi-schema-test FAIL
>     union-empty FAIL
> 
>    The error message regresses.
> 
>    I can see two ways to fix this:
> 
>    (A) You can't just drop empty enumeration types on the floor.  To not
>        generate code for them, you need to skip them wherever we
>        generate code for enumeration types.
> 
>    (B) Outlaw empty enumeration types.
> 
> I recommend to give (B) a try, it's likely simpler.

Possible trap-door with (B), if we have any enums where *every*
member is conditionalized on a CONFIG_XXX rule, there might be
certain build scenarios where an enum suddenly becomes empty.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


