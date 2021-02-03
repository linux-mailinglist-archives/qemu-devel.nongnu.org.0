Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02530DD3D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:51:14 +0100 (CET)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JUv-0007f5-K4
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7JRc-0005PL-Bg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7JRW-0002qK-Eu
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612363661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9dqlZlpYVU0pBS0cNRkW9I2lCDuHj5Yqb1VD5inmJBE=;
 b=SVGKGUcyZpdxFDHBEvMnUthtqPFX3YNn4QRNCHvH7ECRYGkl9J6FvF8+KWVC8zmh5Dcejw
 ThDf3qvAofS5r+vQmdcM/Jeffw28vSlxJCGh4IkiiWsPT+H9ASnex4/si3F3TQ8a4/Hb6K
 3PpPm6qaHGK0jjvULxS20EWiYI2EIa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-wG50h3CBO1mOD6PgKxKqdg-1; Wed, 03 Feb 2021 09:47:39 -0500
X-MC-Unique: wG50h3CBO1mOD6PgKxKqdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72ED9193410B;
 Wed,  3 Feb 2021 14:47:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DDE07046A;
 Wed,  3 Feb 2021 14:47:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A89A2113865F; Wed,  3 Feb 2021 15:47:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 08/14] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-9-jsnow@redhat.com>
Date: Wed, 03 Feb 2021 15:47:36 +0100
In-Reply-To: <20210202174651.2274166-9-jsnow@redhat.com> (John Snow's message
 of "Tue, 2 Feb 2021 12:46:45 -0500")
Message-ID: <878s85tdh3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Presently, we use a tuple to attach a dict containing annotations
> (comments and compile-time conditionals) to a tree node. This is
> undesirable because dicts are difficult to strongly type; promoting it
> to a real class allows us to name the values and types of the
> annotations we are expecting.
>
> In terms of typing, the Annotated<T> type serves as a generic container
> where the annotated node's type is preserved, allowing for greater
> specificity than we'd be able to provide without a generic.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 77 ++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 33 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index b82efe16f6e..2b90a52f016 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -13,8 +13,12 @@
>  from typing import (
>      Any,
>      Dict,
> +    Generic,
> +    Iterable,
>      List,
>      Optional,
> +    Tuple,
> +    TypeVar,
>      Union,
>  )
>  
> @@ -51,15 +55,25 @@
>  _scalar = Union[str, bool, None]
>  _nonscalar = Union[Dict[str, _stub], List[_stub]]
>  _value = Union[_scalar, _nonscalar]
> -# TreeValue = Union[_value, 'Annotated[_value]']
> +TreeValue = Union[_value, 'Annotated[_value]']

You need to quote 'Annotated[_value]', because it's a forward
reference.

Dependency cycle:

        +-----------------------------------------------+
        |                                               |
    TreeValue = Union[_value, 'Annotated[_value]']      |
                                   |                    |
        +--------------------------+                    |
        |                                               |
    Annotated(Generic[_NodeT])                          |
                         |                              |
       +-----------------+                              |
       |                                                |
    _NodeT = TypeVar('_NodeT', bound=TreeValue          |
                                         |              |
                                         +--------------+

Meh.  We'll live.

>  
> -def _make_tree(obj, ifcond, comment=None):
> -    extra = {
> -        'if': ifcond,
> -        'comment': comment,
> -    }
> -    return (obj, extra)
> +_NodeT = TypeVar('_NodeT', bound=TreeValue)

Can you teach me what NodeT is about?

> +
> +
> +class Annotated(Generic[_NodeT]):
> +    """
> +    Annotated generally contains a SchemaInfo-like type (as a dict),
> +    But it also used to wrap comments/ifconds around scalar leaf values,
> +    for the benefit of features and enums.
> +    """
> +    # Remove after 3.7 adds @dataclass:

Make this

       # TODO Remove after Python 3.7 ...

to give us a fighting chance to remember.

> +    # pylint: disable=too-few-public-methods
> +    def __init__(self, value: _NodeT, ifcond: Iterable[str],
> +                 comment: Optional[str] = None):

Why not simply value: _value?

> +        self.value = value
> +        self.comment: Optional[str] = comment
> +        self.ifcond: Tuple[str, ...] = tuple(ifcond)
>  
>  
>  def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
> @@ -67,24 +81,20 @@ def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
>      def indent(level):
>          return level * 4 * ' '
>  
> -    if isinstance(obj, tuple):
> -        ifobj, extra = obj
> -        ifcond = extra.get('if')
> -        comment = extra.get('comment')
> -
> +    if isinstance(obj, Annotated):
>          # NB: _tree_to_qlit is called recursively on the values of a key:value
>          # pair; those values can't be decorated with comments or conditionals.
>          msg = "dict values cannot have attached comments or if-conditionals."
>          assert not suppress_first_indent, msg
>  
>          ret = ''
> -        if comment:
> -            ret += indent(level) + '/* %s */\n' % comment
> -        if ifcond:
> -            ret += gen_if(ifcond)
> -        ret += _tree_to_qlit(ifobj, level)
> -        if ifcond:
> -            ret += '\n' + gen_endif(ifcond)
> +        if obj.comment:
> +            ret += indent(level) + '/* %s */\n' % obj.comment
> +        if obj.ifcond:
> +            ret += gen_if(obj.ifcond)
> +        ret += _tree_to_qlit(obj.value, level, suppress_first_indent)

Why do you need to pass suppress_first_indent now?

> +        if obj.ifcond:
> +            ret += '\n' + gen_endif(obj.ifcond)
>          return ret
>  
>      ret = ''
> @@ -201,7 +211,7 @@ def _use_type(self, typ):
>  
>      @staticmethod
>      def _gen_features(features):
> -        return [_make_tree(f.name, f.ifcond) for f in features]
> +        return [Annotated(f.name, f.ifcond) for f in features]
>  
>      def _gen_tree(self, name, mtype, obj, ifcond, features):
>          comment: Optional[str] = None
> @@ -215,7 +225,7 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
>          obj['meta-type'] = mtype
>          if features:
>              obj['features'] = self._gen_features(features)
> -        self._trees.append(_make_tree(obj, ifcond, comment))
> +        self._trees.append(Annotated(obj, ifcond, comment))
>  
>      def _gen_member(self, member):
>          obj = {'name': member.name, 'type': self._use_type(member.type)}
> @@ -223,7 +233,7 @@ def _gen_member(self, member):
>              obj['default'] = None
>          if member.features:
>              obj['features'] = self._gen_features(member.features)
> -        return _make_tree(obj, member.ifcond)
> +        return Annotated(obj, member.ifcond)
>  
>      def _gen_variants(self, tag_name, variants):
>          return {'tag': tag_name,
> @@ -231,16 +241,17 @@ def _gen_variants(self, tag_name, variants):
>  
>      def _gen_variant(self, variant):
>          obj = {'case': variant.name, 'type': self._use_type(variant.type)}
> -        return _make_tree(obj, variant.ifcond)
> +        return Annotated(obj, variant.ifcond)
>  
>      def visit_builtin_type(self, name, info, json_type):
>          self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>  
>      def visit_enum_type(self, name, info, ifcond, features, members, prefix):
> -        self._gen_tree(name, 'enum',
> -                       {'values': [_make_tree(m.name, m.ifcond, None)
> -                                   for m in members]},
> -                       ifcond, features)
> +        self._gen_tree(
> +            name, 'enum',
> +            {'values': [Annotated(m.name, m.ifcond) for m in members]},
> +            ifcond, features
> +        )
>  
>      def visit_array_type(self, name, info, ifcond, element_type):
>          element = self._use_type(element_type)
> @@ -257,12 +268,12 @@ def visit_object_type_flat(self, name, info, ifcond, features,
>          self._gen_tree(name, 'object', obj, ifcond, features)
>  
>      def visit_alternate_type(self, name, info, ifcond, features, variants):
> -        self._gen_tree(name, 'alternate',
> -                       {'members': [
> -                           _make_tree({'type': self._use_type(m.type)},
> -                                      m.ifcond, None)
> -                           for m in variants.variants]},
> -                       ifcond, features)
> +        self._gen_tree(name, 'alternate', {'members': [

I think I'd prefer another line break after 'alternate', to get
{'members': align...

> +                Annotated({'type': self._use_type(m.type)}, m.ifcond)
> +                for m in variants.variants
> +            ]},

... with ]}.

> +            ifcond, features
> +        )
>  
>      def visit_command(self, name, info, ifcond, features,
>                        arg_type, ret_type, gen, success_response, boxed,


