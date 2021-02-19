Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189B31F9A9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:08:46 +0100 (CET)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5WX-0000nU-Jx
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD5V5-0000LM-O4
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD5V0-0003lu-QQ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:07:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yr4PK1+yxidWME7gC7K2kDVvI3lv+DflaSKVdJb8Wao=;
 b=UEGk0hdmmhwwfM7JWjD18J0KzF6gmBe4L0Tn7mOwoIuc15FUlWEGgOpPNRhR+kkJPxFCoq
 SCt3k0OYpj39cK8n7OGtKeV9MjiDcVYqcsUySPcx9Dj0MjQGafSBrbTmc3hhl2tvZiUpUM
 d4XGfaq9W6fEzUp+4cTSu5BNgypDddE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-e6a27uo7PSih07OgJji3vQ-1; Fri, 19 Feb 2021 08:07:07 -0500
X-MC-Unique: e6a27uo7PSih07OgJji3vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC2018449E0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:07:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F35A5C1BB;
 Fri, 19 Feb 2021 13:07:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D37A8113860F; Fri, 19 Feb 2021 14:07:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 4/6] qapi: Apply aliases in qobject-input-visitor
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-5-kwolf@redhat.com>
 <871rder9py.fsf@dusky.pond.sub.org>
 <20210217175026.GC5662@merkur.fritz.box>
 <87o8ghebrb.fsf@dusky.pond.sub.org>
 <20210218161007.GA10998@merkur.fritz.box>
 <878s7kpglc.fsf@dusky.pond.sub.org>
Date: Fri, 19 Feb 2021 14:07:04 +0100
In-Reply-To: <878s7kpglc.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 19 Feb 2021 10:11:27 +0100")
Message-ID: <87ft1skxzb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Kevin Wolf <kwolf@redhat.com> writes:
[...]
>> Yes, don't use optional objects in the middle of the path of a wildcard
>> alias unless there is no semantic difference between empty object and
>> absent object.
>
> Aha!  So my spidey-sense wasn't entirely wrong.

Like optional members, union branches get visited only when the input is
shaped a certain way.  Which makes me wonder: does "don't use optional
in the middle" apply to union branches, too?

Hmm, I figure it doesn't because

* If the union is flat, there is no object: the variant members are the
  members of the branch struct type.

* If the union is simple, there is, but it's always there: 'data'.

Hope I'm not speaking in riddles.

>>                This is documented in the code, but it might actually
>> still be missing from qapi-code-gen.txt.
>
> I can't find it there.  Needs fixing, obviously.

"there" = qapi-code-gen.txt

> I guess checking "path of a wildcard alias crosses optional objects" is
> hard (impractical?) for the same reasons checking "alias can't resolve"
> is.
>
> I'd expect "alias can't resolve" to be caused by typos, incomplete
> renames, and such.  Basic testing should catch at least the typos.  Not
> ideal, but I guess it'll do, at least for now.
>
> Relying on testing to catch "crosses optional objects" mistakes feels
> iffier to me, because it takes more careful tests.
>
> Ham-fisted way to make basic tests catch it: *ignore* optional objects
> when resolving aliases.  Is this a bad idea?

[...]


