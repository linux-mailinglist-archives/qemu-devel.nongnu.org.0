Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2A524C84
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:17:58 +0200 (CEST)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np7lV-000577-AI
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np7k4-0003BO-63
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np7k0-0002lP-LN
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652357783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EzRHaEUVKlriO4U9gTk2zi4sDOEBPFgz7ZPaX3Bwapk=;
 b=hxKlB4Vhr0+Y5kdaOXGPw/shrpydReT7E3RZH0Lt3coaO7dHUyy2Hsl4ZRFNJS8IzD3Ytf
 HvVqOvgbduRr/88KaPmqi9773s7KmuXfyMu00WRIawXQQIxrjF4wNuLRSNgK6E9lB5nEB0
 uC6DB8jhOCA2riDpOW+yQ6H3rFib62Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-0xGnOtldMQeiEgGqC8sYSw-1; Thu, 12 May 2022 08:16:22 -0400
X-MC-Unique: 0xGnOtldMQeiEgGqC8sYSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26215803B22
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 12:16:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F11D21541C4B;
 Thu, 12 May 2022 12:16:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5B3421E6880; Thu, 12 May 2022 14:16:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com>
Date: Thu, 12 May 2022 14:16:20 +0200
In-Reply-To: <20220511175147.917707-3-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 11 May 2022 19:51:46 +0200")
Message-ID: <878rr77xpn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> The "-display sdl" option still uses a hand-crafted parser for its
> parameters since some of them used underscores which is forbidden
> in QAPI.

Kind of.  QAPI indeed requires lower-case-with-hyphens for such names,
but there is an exception mechanism for names with upper case and
underscore: pragma member-name-exceptions.  Used for old names that
predate naming rule enforcement, and for newer names we've elected to
make consistent with their old siblings.

The series that QAPIfied -display partially explained why it left
-display sdl,... and -display vnc,... unQAPIfied in commit 7a61f43859
"ui: document non-qapi parser cases.":

    diff --git a/vl.c b/vl.c
    index 5f1734d851..3b39bbd7a8 100644
    --- a/vl.c
    +++ b/vl.c
    @@ -2114,6 +2114,16 @@ static void parse_display(const char *p)
         const char *opts;

         if (strstart(p, "sdl", &opts)) {
    +        /*
    +         * sdl DisplayType needs hand-crafted parser instead of
    +         * parse_display_qapi() due to some options not in
    +         * DisplayOptions, specifically:
    +         *   - frame
    +         *     Already deprecated.
    +         *   - ctrl_grab + alt_grab
    +         *     Not clear yet what happens to them long-term.  Should
    +         *     replaced by something better or deprecated and dropped.

This sounds like it was mostly reluctance to drag undesirables into the
QAPI schema.

Commit f6b560bbc1 "softmmu/vl: Remove obsolete comment about the "frame"
parameter" dropped item "frame".

Commit 8e8e844be4 "softmmu/vl: Add a "grab-mod" parameter to the
-display sdl option" decided the future of ctrl_grab + alt_grab.  It
replaced the second item's text:

    +         *     They can't be moved into the QAPI since they use underscores,
    +         *     thus they will get replaced by "grab-mod" in the long term

I figure they could've been moved to the QAPI schema back then.
Instead, we're getting rid of them without a detour through the schema.
Good!

    +         */
             dpy.type = DISPLAY_TYPE_SDL;
             while (*opts) {
                 const char *nextopt;
    @@ -2179,6 +2189,10 @@ static void parse_display(const char *p)
                 opts = nextopt;
             }
         } else if (strstart(p, "vnc", &opts)) {
    +        /*
    +         * vnc isn't a (local) DisplayType but a protocol for remote
    +         * display access.
    +         */
             if (*opts == '=') {
                 vnc_parse(opts + 1, &error_fatal);
             } else {

This remains, and that's fine.  One step at time.

>          Now that the problematic parameters have been removed, we can
> switch to use the QAPI parser instead.

Here's my attempt at a more accurate commit message.

  The "-display sdl" option still uses a hand-crafted parser for its
  parameters since we didn't want to drag an interface we considered
  somewhat flawed into the QAPI schema.  Since the flaws are gone now,
  it's time to QAPIfy.

> This introduces the new "DisplaySDL" QAPI struct that is used to hold
> the parameters that are unique to the SDL display. The only specific
> parameter is currently "grab-mod" which is modeled as a string, so that
> it could be extended for other arbitrary modifiers later more easily.

Are the values of @grab-mod parsed in any way, or do we recognize a set
of fixed strings?

The former would be problematic.  We try hard to represent complex data
as JSON instead of inventing little ad hoc languages.

If it's the latter, use an enum.  Makes introspection more useful, and
adding enumeration values is no harder than adding string literals.

> Signed-off-by: Thomas Huth <thuth@redhat.com>


