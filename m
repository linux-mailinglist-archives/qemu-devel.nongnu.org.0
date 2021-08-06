Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE33E237C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:49:42 +0200 (CEST)
Received: from localhost ([::1]:39206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtfp-0004uC-Ai
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBtef-00049Y-Hz
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBtec-0003X6-Qv
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yD1m8h+CGrCDACpHqg0tUe3iEtwqnrnQ/ahWcjAOmI4=;
 b=TkoQ+TV0/nRdz2Df4C014uMlWtdg+Kvv99MCSFHsR6zrnJAu4K8pil7VUx+zUyKWpD/WPd
 UI0zhJIBRZ59lCrjfbdogcwqgcVtpR3A26JfGgTVTO6wOSOTOnvvZV42rJGzvt8x7tZQwz
 REGhsJovxH7XaXt/xKMR43hLHoRzeM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-FsbIXoaxNI6Ibq_VRppJjg-1; Fri, 06 Aug 2021 02:48:23 -0400
X-MC-Unique: FsbIXoaxNI6Ibq_VRppJjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABB188042EF;
 Fri,  6 Aug 2021 06:48:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C1219C79;
 Fri,  6 Aug 2021 06:48:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9C0311380A0; Fri,  6 Aug 2021 08:48:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v7 08/10] qapi: Use 'if': { 'any': ... } where appropriate
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-9-marcandre.lureau@redhat.com>
 <87lf5g6lly.fsf@dusky.pond.sub.org>
 <CAJ+F1CL_a8nH-sNBxEY2zVUd1rG7QnevwQPraG69KWjFGUb5CQ@mail.gmail.com>
Date: Fri, 06 Aug 2021 08:48:20 +0200
In-Reply-To: <CAJ+F1CL_a8nH-sNBxEY2zVUd1rG7QnevwQPraG69KWjFGUb5CQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 5 Aug 2021
 18:41:06 +0400")
Message-ID: <87h7g3132j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Thu, Aug 5, 2021 at 5:57 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> > Tested-by: John Snow <jsnow@redhat.com>
>> > Reviewed-by: Markus Armbruster <armbru@redhat.com>

[...]

>> Missing:
>>
>>   diff --git a/qapi/ui.json b/qapi/ui.json
>>   index fd9677d48e..aed2bec4ab 100644
>>   --- a/qapi/ui.json
>>   +++ b/qapi/ui.json
>>   @@ -1136,7 +1136,8 @@
>>        { 'name': 'gtk', 'if': 'defined(CONFIG_GTK)' },
>>        { 'name': 'sdl', 'if': 'defined(CONFIG_SDL)' },
>>        { 'name': 'egl-headless',
>>   -              'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' }=
,
>>   +              'if': { 'all': [ 'defined(CONFIG_OPENGL)',
>>   +                               'defined(CONFIG_GBM)' ] } },
>>        { 'name': 'curses', 'if': 'defined(CONFIG_CURSES)' },
>>        { 'name': 'cocoa', 'if': 'defined(CONFIG_COCOA)' },
>>        { 'name': 'spice-app', 'if': 'defined(CONFIG_SPICE)'} ] }
>>   @@ -1167,7 +1168,8 @@
>>          'gtk': { 'type': 'DisplayGTK', 'if': 'defined(CONFIG_GTK)' },
>>          'curses': { 'type': 'DisplayCurses', 'if': 'defined(CONFIG_CURS=
ES)' },
>>          'egl-headless': { 'type': 'DisplayEGLHeadless',
>>   -                        'if': 'defined(CONFIG_OPENGL) && defined(CONF=
IG_GBM)' }
>>   +                        'if': { 'all': [ 'defined(CONFIG_OPENGL)',
>>   +                                         'defined(CONFIG_GBM)' ] } }
>>      }
>>    }
>>
>>
>> You make up for it in PATCH 10.  Can tidy up in my tree.
>>
>>
> Ah yes, those are new in the rebase. I think they could either be squashe=
d
> in this patch (with update title), or a new patch. Leaving to the last
> patch isn't really a big issue either I suppose.
>
> Thanks in advance for cleaning it up if you take it :)

I'm squashing it into PATCH 06, which already has similar changes to
tests/qapi-schema/qapi-schema-test.json.


