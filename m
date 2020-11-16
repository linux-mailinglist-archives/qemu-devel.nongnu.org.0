Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39A2B409E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:18:54 +0100 (CET)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebb3-0003XM-NT
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kebZS-000346-I6
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kebZQ-0007H6-3s
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605521831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e48lMfzrL3vaXjBF85EhlQQyBoyZ2h9n3rF5f5EjXDE=;
 b=X88jWtNvQcfezBx5F2ye3f6QCVGEGYaDq54772/g71mdobTRlrDMREJHHx37QrhBhYeJOa
 nkw4KPLGOLS1A2ott1AyOVDey7MEfSjH7VPznQGMb9viwY2obXLQX+Pf2t0gGaep2kAKK+
 wjggq9tNOmjko252XU/9aP/aFP831FY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-58RSTaPkPqW5y1j69UzAcg-1; Mon, 16 Nov 2020 05:17:09 -0500
X-MC-Unique: 58RSTaPkPqW5y1j69UzAcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61D84802B61
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:17:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4B955765;
 Mon, 16 Nov 2020 10:17:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9554A11358BA; Mon, 16 Nov 2020 11:17:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 10/11] qapi/introspect.py: improve readability of
 _tree_to_qlit
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-11-jsnow@redhat.com>
Date: Mon, 16 Nov 2020 11:17:06 +0100
In-Reply-To: <20201026194251.11075-11-jsnow@redhat.com> (John Snow's message
 of "Mon, 26 Oct 2020 15:42:50 -0400")
Message-ID: <87tutpzjvh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

> Subjective, but I find getting rid of the comprehensions helps. Also,
> divide the sections into scalar and non-scalar sections, and remove
> old-style string formatting.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index a261e402d69..d4f28485ba5 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -100,7 +100,7 @@ def indent(level: int) -> str:
>  
>          ret = ''
>          if obj.comment:
> -            ret += indent(level) + '/* %s */\n' % obj.comment
> +            ret += indent(level) + f"/* {obj.comment} */\n"
>          if obj.ifcond:
>              ret += gen_if(obj.ifcond)
>          ret += _tree_to_qlit(obj.value, level, suppress_first_indent)
> @@ -111,31 +111,36 @@ def indent(level: int) -> str:
>      ret = ''
>      if not suppress_first_indent:
>          ret += indent(level)
> +
> +    # Scalars:
>      if obj is None:
>          ret += 'QLIT_QNULL'
>      elif isinstance(obj, str):
> -        ret += 'QLIT_QSTR(' + to_c_string(obj) + ')'
> +        ret += f"QLIT_QSTR({to_c_string(obj)})"
> +    elif isinstance(obj, bool):
> +        ret += "QLIT_QBOOL({:s})".format(str(obj).lower())

Changed from

           ret += 'QLIT_QBOOL(%s)' % ('true' if obj else 'false')

Doesn't look like an improvement to me.

> +
> +    # Non-scalars:
>      elif isinstance(obj, list):
> -        elts = [_tree_to_qlit(elt, level + 1).strip('\n')
> -                for elt in obj]
> -        elts.append(indent(level + 1) + "{}")
>          ret += 'QLIT_QLIST(((QLitObject[]) {\n'
> -        ret += '\n'.join(elts) + '\n'
> +        for value in obj:
> +            ret += _tree_to_qlit(value, level + 1).strip('\n') + '\n'
> +        ret += indent(level + 1) + '{}\n'
>          ret += indent(level) + '}))'
>      elif isinstance(obj, dict):
> -        elts = []
> -        for key, value in sorted(obj.items()):
> -            elts.append(indent(level + 1) + '{ %s, %s }' %
> -                        (to_c_string(key),
> -                         _tree_to_qlit(value, level + 1, True)))
> -        elts.append(indent(level + 1) + '{}')
>          ret += 'QLIT_QDICT(((QLitDictEntry[]) {\n'
> -        ret += ',\n'.join(elts) + '\n'
> +        for key, value in sorted(obj.items()):
> +            ret += indent(level + 1) + "{{ {:s}, {:s} }},\n".format(
> +                to_c_string(key),
> +                _tree_to_qlit(value, level + 1, suppress_first_indent=True)
> +            )
> +        ret += indent(level + 1) + '{}\n'
>          ret += indent(level) + '}))'
> -    elif isinstance(obj, bool):
> -        ret += 'QLIT_QBOOL(%s)' % ('true' if obj else 'false')
>      else:
> -        assert False                # not implemented
> +        raise NotImplementedError(
> +            f"type '{type(obj).__name__}' not implemented"
> +        )

Not covered by the commit message's mandate.

Why bother?

> +
>      if level > 0:
>          ret += ','
>      return ret


