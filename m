Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EB30047F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:49:24 +0100 (CET)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2woV-0006Ep-JS
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2wnX-0005p7-RY
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2wnV-0004mf-Pj
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611323300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f0edANAuMFtztYY3OaDAItv6zlaPrw6Titm3PUKVXuo=;
 b=GlD/3CyGPjfJ0Go7y95O0uwjuzNrvn3AhQ0MI8+gO7Dirn48ROLYUzUrKnQMagB6YiTFxE
 K//8wi+2e3qCPA1fGlzDfPvu4OmGAc0XRcEu+va+1g1to1V7bGWIhdnrmZH0Kf6JZGdZHh
 EKGlQbqrFny38aYUkB/HW5dcI9UunIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-uyoDgJT9PAGkFqCiet96FA-1; Fri, 22 Jan 2021 08:48:17 -0500
X-MC-Unique: uyoDgJT9PAGkFqCiet96FA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C974F5F9EA
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:48:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 732425C230;
 Fri, 22 Jan 2021 13:48:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F211F113865F; Fri, 22 Jan 2021 14:48:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 05/25] keyval: simplify keyval_parse_one
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-6-pbonzini@redhat.com>
Date: Fri, 22 Jan 2021 14:48:14 +0100
In-Reply-To: <20210118163113.780171-6-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:53 -0500")
Message-ID: <874kj95bhd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Now that the key is NULL terminated, we can remove some of the contortions
> that were done to operate on possibly '='-terminated strings in
> keyval_parse_one.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Alright, I'm now ready to discuss the third argument: nicer code.

I think there is improvement, and I think it comes mostly from working
on a copy.  Could be done without the syntax change.

I feel further improvement is possible, but that's no reason to delay
this series.


Second argument: better error messages.  We discussed that in review of
a prior post, but you've since improved your error reporting further, so
let's have another look.  I'm testing with

    $ qemu-storage-daemon --nbd $ARG

because that one doesn't have an implied key, which permits slightly
simpler $ARG.

* Empty key

  --nbd ,

    master:       Invalid parameter ''
    your patch:   Expected parameter before ','

    Improvement.

  --nbd key=val,=,fob=

    master:       Invalid parameter ''
    your patch:   Expected parameter before '=,fob='

    Improvement.

* Empty key fragment

  --nbd key..=

    master:       Invalid parameter 'key..'
    your patch:   same

    Could use some love.  Not your patch's fault.

  --nbd .key=

    master:       Invalid parameter '..key'
    your patch:   same

    Likweise.

  If I omit the '=', your patch's message changes to

                  No implicit parameter name for value 'key..'

  I consider that worse than before, because it's talking about
  something outside the user's control (lack of an implict parameter
  name) where it should instead tell the user what needs fixing in the
  input.

* Missing value

  --nbd key

    master:       Expected '=' after parameter 'key'
    your patch:   No implicit parameter name for value 'key'

  Same criticism as above.

* Invalid key fragment

  --nbd _=

    master:       Invalid parameter '_'
    your patch:   same

  --nbd key.1a.b=

    master:       Invalid parameter 'key.1a.b'
    your patch:   same

    Could perhaps use some love.  Not your patch's fault.

  --ndb anti,,social,,key=

    master:       Expected '=' after parameter 'anti'
    your patch:   Invalid parameter 'anti,social,key'

    The new error message shows the *unescaped* string.  Okay.

Your patch also adds an "Expected parameter at end of string" error.
Can you tell me how to trigger it?

I think there is improvement, and I think it could also be done without
the syntax change.

There also is one regression: "No implicit parameter name..." is no
good.  Looks fixable to me.

I feel further improvement is possible, but that's no reason to delay
this series.


Now let me put the three arguments together.

Nicer code and better error reporting could be had with or without the
syntax change.  With is a bit easier, because we already have your
patch.

The syntax change is a choice we can make.  I'm reluctant to mess with
the syntax, but if you want the change, I'm not going to block it.

Hmm, bartering opportunity...  May I have your support for me
eliminating anti-social device names in exchange?  ;)

I believe your grammar is ambiguous.  Your code seems to pick the sane
alternative.  If I'm wrong, you need to enlighten me.  If I'm right, you
need to fix your grammar.

> ---
>  util/keyval.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/util/keyval.c b/util/keyval.c
> index eb9b9c55ec..e7f708cd1e 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -170,11 +170,10 @@ static QObject *keyval_parse_put(QDict *cur,
>   *
>   * On return:
>   * - either NUL or the separator (comma or equal sign) is returned.
> - * - the length of the string is stored in @len.
>   * - @start is advanced to either the NUL or the first character past the
>   *   separator.
>   */
> -static char keyval_fetch_string(char **start, size_t *len, bool key)
> +static char keyval_fetch_string(char **start, bool key)
>  {
>      char sep;
>      char *p, *unescaped;
> @@ -197,7 +196,6 @@ static char keyval_fetch_string(char **start, size_t *len, bool key)
>      }
>  
>      *unescaped = 0;
> -    *len = unescaped - *start;
>      *start = p;
>      return sep;
>  }
> @@ -219,7 +217,7 @@ static char *keyval_parse_one(QDict *qdict, char *params,
>                                const char *implied_key, bool *help,
>                                Error **errp)
>  {
> -    const char *key, *key_end, *s, *end;
> +    const char *key, *s, *end;
>      const char *val = NULL;
>      char sep;
>      size_t len;
> @@ -229,8 +227,8 @@ static char *keyval_parse_one(QDict *qdict, char *params,
>      QObject *next;
>  
>      key = params;
> -    sep = keyval_fetch_string(&params, &len, true);
> -    if (!len) {
> +    sep = keyval_fetch_string(&params, true);
> +    if (!*key) {
>          if (sep) {
>              error_setg(errp, "Expected parameter before '%c%s'", sep, params);
>          } else {
> @@ -247,13 +245,11 @@ static char *keyval_parse_one(QDict *qdict, char *params,
>              /* Desugar implied key */
>              val = key;
>              key = implied_key;
> -            len = strlen(implied_key);
>          } else {
>              error_setg(errp, "No implicit parameter name for value '%s'", key);
>              return NULL;
>          }
>      }
> -    key_end = key + len;
>  
>      /*
>       * Loop over key fragments: @s points to current fragment, it
> @@ -269,24 +265,21 @@ static char *keyval_parse_one(QDict *qdict, char *params,
>              ret = parse_qapi_name(s, false);
>              len = ret < 0 ? 0 : ret;
>          }
> -        assert(s + len <= key_end);
> -        if (!len || (s + len < key_end && s[len] != '.')) {
> +        if (!len || (s[len] != '\0' && s[len] != '.')) {
>              assert(key != implied_key);
> -            error_setg(errp, "Invalid parameter '%.*s'",
> -                       (int)(key_end - key), key);
> +            error_setg(errp, "Invalid parameter '%s'", key);
>              return NULL;
>          }
>          if (len >= sizeof(key_in_cur)) {
>              assert(key != implied_key);
>              error_setg(errp, "Parameter%s '%.*s' is too long",
> -                       s != key || s + len != key_end ? " fragment" : "",
> +                       s != key || s[len] == '.' ? " fragment" : "",
>                         (int)len, s);
>              return NULL;
>          }
>  
>          if (s != key) {
> -            next = keyval_parse_put(cur, key_in_cur, NULL,
> -                                    key, s - 1, errp);
> +            next = keyval_parse_put(cur, key_in_cur, NULL, key, s - 1, errp);

Unrelated line join.

>              if (!next) {
>                  return NULL;
>              }
> @@ -301,9 +294,9 @@ static char *keyval_parse_one(QDict *qdict, char *params,
>  
>      if (key != implied_key) {
>          val = params;
> -        keyval_fetch_string(&params, &len, false);
> +        keyval_fetch_string(&params, false);
>      }
> -    if (!keyval_parse_put(cur, key_in_cur, val, key, key_end, errp)) {
> +    if (!keyval_parse_put(cur, key_in_cur, val, key, s - 1, errp)) {
>          return NULL;
>      }
>      return params;


