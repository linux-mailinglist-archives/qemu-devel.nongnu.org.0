Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29672B808E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:32:10 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPRK-0004UI-27
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfPPQ-0003OE-Fq
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:30:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfPPL-0003Kf-Sp
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605713406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lYbnYyJ9u324U6mWqKTiTbnmcFd4ibHnrYmx23FZ+9w=;
 b=YgkGI03XSMpZV27wb5fKku/x7aDmR220mHBOHXjVgn9pxWhC9Uyd3wV3qGpsMHFzaz9evL
 BSwigiVRWAGEL6KnrVB8hb1Syo7ET4B4rH058cek+gvX930HtcbzO9ISpv7bM9KCYCYLX8
 2MJjhUjVJ90tYcDiMa2ka3eZGcXtYZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-JR8zBXADOsKAqy3u97e0Ow-1; Wed, 18 Nov 2020 10:30:04 -0500
X-MC-Unique: JR8zBXADOsKAqy3u97e0Ow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D913618C43C1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 15:30:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A658A60853;
 Wed, 18 Nov 2020 15:30:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F116411358BA; Wed, 18 Nov 2020 16:30:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 04/16] qapi/expr.py: Add assertion for union type
 'check_dict'
References: <20201026213637.47087-1-jsnow@redhat.com>
 <20201026213637.47087-5-jsnow@redhat.com>
Date: Wed, 18 Nov 2020 16:30:00 +0100
In-Reply-To: <20201026213637.47087-5-jsnow@redhat.com> (John Snow's message of
 "Mon, 26 Oct 2020 17:36:25 -0400")
Message-ID: <87blfuisxz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> mypy isn't fond of allowing you to check for bool membership in a
> collection of str elements. Guard this lookup for precisely when we were
> given a name.

Spoilsport.

Peeking at the patch... aha, it's about check_type()'s parameter
@allow_dict.

@allow_dict tells us whether an anonymous type is allowed, and also
whether its member names may violate the naming rules.

* a str: allow anonymous type, waive member naming rules if @allow_dict
  is in .name_case_whitelist.

  Used for checking struct's 'data' and union's 'base'.

* True: allow anonymous type, enforce member naming rules

  Used for checking 'data' of commands and events.  Waiving the naming
  rules is simply not implemented there.

* False (default): do not allow anonymous type

Perhaps the "is in .name_case_whitelist" check should be lifted into the
two callers that pass a str.  We could then turn the parameter into an
enum.  Meh.  Perhaps a separate @permit_upper parameter, only valid with
allow_dict=True.  Meh again.

Splitting check_type() into multiple functions feels more promising.
Not now.

> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index f7c7f91326ef..2c4c341d5243 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -173,7 +173,9 @@ def check_type(value, info, source,
>          raise QAPISemError(info,
>                             "%s should be an object or type name" % source)
>  
> -    permit_upper = allow_dict in info.pragma.name_case_whitelist
> +    permit_upper = False
> +    if isinstance(allow_dict, str):
> +        permit_upper = allow_dict in info.pragma.name_case_whitelist

Slightly more compact:

       permit_upper = (isinstance(allow_dict, str)
                       and allow_dict in info.pragma.name_case_whitelist)

Matter of taste.

>  
>      # value is a dictionary, check that each member is okay
>      for (key, arg) in value.items():


