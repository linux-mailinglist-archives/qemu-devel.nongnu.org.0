Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4145B13FC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 07:22:35 +0200 (CEST)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oW9zm-0004Hw-Fc
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 01:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oW9xj-0002Zb-ND
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oW9xf-0007Ac-Oc
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662614422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxnF5LvMwEEczvwoamLTQ3Od5bsMcPlfoOC/aIt6e9g=;
 b=PhVj8KSDLXysnLqTe8qM4WELxGYhh6wzww+aT0SeA7FvlKC+pcRiol+Qdi7n+H54+M64aV
 0VFbB9Z2Yqjs9s9Z1+sDnhjyFroftd97X/AatE+jUgT9TdyroX74HnTENKs6fVU4GCqC7O
 T2SQ7mfbYLtjmsRWXkJFhzkoGwx5NlM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-h8wkUsJXOjCQOKEDguEh5Q-1; Thu, 08 Sep 2022 01:20:19 -0400
X-MC-Unique: h8wkUsJXOjCQOKEDguEh5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E51C29AA3BA;
 Thu,  8 Sep 2022 05:20:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2451640C141D;
 Thu,  8 Sep 2022 05:20:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A362E21E6900; Thu,  8 Sep 2022 07:20:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,  Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Christian
 Schoenebeck
 <qemu_oss@crudebyte.com>,  Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-devel@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] audio: add help option (?) for -audiodev
References: <20220907142359.31827-1-cfontana@suse.de>
 <87fsh3usub.fsf@pond.sub.org> <Yxi3MOT/s8nn45zp@redhat.com>
Date: Thu, 08 Sep 2022 07:20:16 +0200
In-Reply-To: <Yxi3MOT/s8nn45zp@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 7 Sep 2022 16:22:24 +0100")
Message-ID: <87y1uusar3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Sep 07, 2022 at 05:06:36PM +0200, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>> > add a simple help option for -audiodev, so users can do
>> >
>> > qemu -audiodev ?
>>=20
>> The preferred form is actually '-audiodev help'.  The other one is
>> deprecated.  Recommend to stay away from it even in commit messages.
>
> We introduced 'help' many many years ago, but don't thing we
> ever formally deprecated '?'.

is_help_option()'s function comment says "'?' is deprecated".  Goes back
to

commit c8057f951d64de93bfd01569c0a725baa9f94372
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Aug 2 13:45:54 2012 +0100

    Support 'help' as a synonym for '?' in command line options
=20=20=20=20
    For command line options which permit '?' meaning 'please list the
    permitted values', add support for 'help' as a synonym, by abstracting
    the check out into a helper function.
=20=20=20=20
    This change means that in some cases where we were being lazy in
    our string parsing, "?junk" will now be rejected as an invalid option
    rather than being (undocumentedly) treated the same way as "?".
=20=20=20=20
    Update the documentation to use 'help' rather than '?', since '?'
    is a shell metacharacter and thus prone to fail confusingly if there
    is a single character filename in the current working directory and
    the '?' has not been escaped. It's therefore better to steer users
    towards 'help', though '?' is retained for backwards compatibility.
=20=20=20=20
    We do not, however, update the output of the system emulator's -help
    (or any documentation autogenerated from the qemu-options.hx which
    is the source of the -help text) because libvirt parses our -help
    output and will break. At a later date when QEMU provides a better
    interface so libvirt can avoid having to do this, we can update the
    -help text too.
=20=20=20=20
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>

The more formal deprecation process we use today didn't exist in 2012.
Looks like we simply de-documented '?'.

Note that output of -help has been updated since.

>                                Should we do so and aim to
> remove it, or are we happy to keep '?' forever, despite it
> tripping up shell filename expansion with single char filenames.

I'm not sure a belated formal notice of deprecation would be useful.

Emitting a warning might be.  Would have to be done at roughly 20 call
sites, I guess.

I'm cool with removing a feature that has been undocumented for a
decade.  However, experience tells us that every feature on the chopping
block will find a champion, and I believe this one is still around
simply because it's not worth a fight.

[...]


