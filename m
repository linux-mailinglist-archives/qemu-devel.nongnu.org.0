Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124E2B4089
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:14:09 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebWR-0002ET-ST
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kebV2-0001f6-VZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kebUz-0005bn-Nq
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605521555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gHkiI5x0LHkR+uU2ZpXgRtkhFEH/lrI4KFnExAMZGSg=;
 b=MPM+SniPqnkovM4yuMMJlbglb+zFPX3UXDXT/hwJrqjEZfHInyWUwTEGrsqjFw2o4Hy5Es
 DxTd7rEFL2IhAQckf0cW4HfKCwqFut+eN5a1Ya/fHnXnQV+RAuqtexk7FqOhm7eVP7p6SY
 PUj8FASfoB8IBIFAo06Mz6ernXgGQ/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-rja3qqEENqaD5VEGk_Ca7A-1; Mon, 16 Nov 2020 05:12:33 -0500
X-MC-Unique: rja3qqEENqaD5VEGk_Ca7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A19A801FCC
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:12:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3275B7667A;
 Mon, 16 Nov 2020 10:12:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A750A11358BA; Mon, 16 Nov 2020 11:12:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 09/11] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-10-jsnow@redhat.com>
Date: Mon, 16 Nov 2020 11:12:30 +0100
In-Reply-To: <20201026194251.11075-10-jsnow@redhat.com> (John Snow's message
 of "Mon, 26 Oct 2020 15:42:49 -0400")
Message-ID: <87y2j1zk35.fsf@dusky.pond.sub.org>
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

> This replaces _make_tree with Annotated(). By creating it as a generic
> container, we can more accurately describe the exact nature of this
> particular value. i.e., each Annotated object is actually an
> Annotated<T>, describing its contained value.
>
> This adds stricter typing to Annotated nodes and extra annotated
> information.

Inhowfar?

>              It also replaces a check of "isinstance tuple" with the
> much more explicit "isinstance Annotated" which is guaranteed not to
> break if a tuple is accidentally introduced into the type tree. (Perhaps
> as a result of a bad conversion from a list.)

Sure this is worth writing home about?  Such accidents seem quite
unlikely.

For me, the commit's benefit is making the structure of the annotated
tree node more explicit (your first paragraph, I guess).  It's a bit of
a pattern in developing Python code: we start with a Tuple because it's
terse and easy, then things get more complex, terse becomes too terse,
and we're replacing the Tuple with a class.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 97 +++++++++++++++++++-------------------
>  1 file changed, 48 insertions(+), 49 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index a0978cb3adb..a261e402d69 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -13,12 +13,13 @@
>  from typing import (
>      Any,
>      Dict,
> +    Generic,
> +    Iterable,
>      List,
>      Optional,
>      Sequence,
> -    Tuple,
> +    TypeVar,
>      Union,
> -    cast,
>  )
>  
>  from .common import (
> @@ -63,50 +64,48 @@
>  _scalar = Union[str, bool, None]
>  _nonscalar = Union[Dict[str, _stub], List[_stub]]
>  _value = Union[_scalar, _nonscalar]
> -TreeValue = Union[_value, 'Annotated']
> +TreeValue = Union[_value, 'Annotated[_value]']
>  
>  # This is just an alias for an object in the structure described above:
>  _DObject = Dict[str, object]
>  
> -# Represents the annotations themselves:
> -Annotations = Dict[str, object]
>  
> -# Represents an annotated node (of some kind).
> -Annotated = Tuple[_value, Annotations]
> +_AnnoType = TypeVar('_AnnoType', bound=TreeValue)
>  
>  
> -def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
> -               comment: Optional[str] = None) -> Annotated:
> -    extra: Annotations = {
> -        'if': ifcond,
> -        'comment': comment,
> -    }
> -    return (obj, extra)
> +class Annotated(Generic[_AnnoType]):
> +    """
> +    Annotated generally contains a SchemaInfo-like type (as a dict),
> +    But it also used to wrap comments/ifconds around scalar leaf values,
> +    for the benefit of features and enums.
> +    """
> +    # Remove after 3.7 adds @dataclass:
> +    # pylint: disable=too-few-public-methods
> +    def __init__(self, value: _AnnoType, ifcond: Iterable[str],
> +                 comment: Optional[str] = None):
> +        self.value = value
> +        self.comment: Optional[str] = comment
> +        self.ifcond: Sequence[str] = tuple(ifcond)
>  
>  
> -def _tree_to_qlit(obj: TreeValue,
> -                  level: int = 0,
> +def _tree_to_qlit(obj: TreeValue, level: int = 0,
>                    suppress_first_indent: bool = False) -> str:
>  
>      def indent(level: int) -> str:
>          return level * 4 * ' '
>  
> -    if isinstance(obj, tuple):
> -        ifobj, extra = obj
> -        ifcond = cast(Optional[Sequence[str]], extra.get('if'))
> -        comment = extra.get('comment')
> -
> +    if isinstance(obj, Annotated):
>          msg = "Comments and Conditionals not implemented for dict values"
> -        assert not (suppress_first_indent and (ifcond or comment)), msg
> +        assert not (suppress_first_indent and (obj.comment or obj.ifcond)), msg
>  
>          ret = ''
> -        if comment:
> -            ret += indent(level) + '/* %s */\n' % comment
> -        if ifcond:
> -            ret += gen_if(ifcond)
> -        ret += _tree_to_qlit(ifobj, level, suppress_first_indent)
> -        if ifcond:
> -            ret += '\n' + gen_endif(ifcond)
> +        if obj.comment:
> +            ret += indent(level) + '/* %s */\n' % obj.comment
> +        if obj.ifcond:
> +            ret += gen_if(obj.ifcond)
> +        ret += _tree_to_qlit(obj.value, level, suppress_first_indent)
> +        if obj.ifcond:
> +            ret += '\n' + gen_endif(obj.ifcond)
>          return ret
>  
>      ret = ''
> @@ -153,7 +152,7 @@ def __init__(self, prefix: str, unmask: bool):
>              ' * QAPI/QMP schema introspection', __doc__)
>          self._unmask = unmask
>          self._schema: Optional[QAPISchema] = None
> -        self._trees: List[Annotated] = []
> +        self._trees: List[Annotated[_DObject]] = []
>          self._used_types: List[QAPISchemaType] = []
>          self._name_map: Dict[str, str] = {}
>          self._genc.add(mcgen('''
> @@ -219,10 +218,9 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>          return self._name(typ.name)
>  
>      @classmethod
> -    def _gen_features(cls,
> -                      features: List[QAPISchemaFeature]
> -                      ) -> List[Annotated]:
> -        return [_make_tree(f.name, f.ifcond) for f in features]
> +    def _gen_features(
> +            cls, features: List[QAPISchemaFeature]) -> List[Annotated[str]]:

Indent this way from the start for lesser churn.

> +        return [Annotated(f.name, f.ifcond) for f in features]
>  
>      def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>                    ifcond: List[str],
> @@ -238,10 +236,10 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>          obj['meta-type'] = mtype
>          if features:
>              obj['features'] = self._gen_features(features)
> -        self._trees.append(_make_tree(obj, ifcond, comment))
> +        self._trees.append(Annotated(obj, ifcond, comment))
>  
>      def _gen_member(self,
> -                    member: QAPISchemaObjectTypeMember) -> Annotated:
> +                    member: QAPISchemaObjectTypeMember) -> Annotated[_DObject]:

Long line.  Ty hanging indent.

>          obj: _DObject = {
>              'name': member.name,
>              'type': self._use_type(member.type)
> @@ -250,19 +248,19 @@ def _gen_member(self,
>              obj['default'] = None
>          if member.features:
>              obj['features'] = self._gen_features(member.features)
> -        return _make_tree(obj, member.ifcond)
> +        return Annotated(obj, member.ifcond)
>  
>      def _gen_variants(self, tag_name: str,
>                        variants: List[QAPISchemaVariant]) -> _DObject:
>          return {'tag': tag_name,
>                  'variants': [self._gen_variant(v) for v in variants]}
>  
> -    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated:
> +    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated[_DObject]:
>          obj: _DObject = {
>              'case': variant.name,
>              'type': self._use_type(variant.type)
>          }
> -        return _make_tree(obj, variant.ifcond)
> +        return Annotated(obj, variant.ifcond)
>  
>      def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>                             json_type: str) -> None:
> @@ -272,10 +270,11 @@ def visit_enum_type(self, name: str, info: QAPISourceInfo,
>                          ifcond: List[str], features: List[QAPISchemaFeature],
>                          members: List[QAPISchemaEnumMember],
>                          prefix: Optional[str]) -> None:
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
>      def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>                           ifcond: List[str],
> @@ -300,12 +299,12 @@ def visit_alternate_type(self, name: str, info: QAPISourceInfo,
>                               ifcond: List[str],
>                               features: List[QAPISchemaFeature],
>                               variants: QAPISchemaVariants) -> None:
> -        self._gen_tree(name, 'alternate',
> -                       {'members': [
> -                           _make_tree({'type': self._use_type(m.type)},
> -                                      m.ifcond, None)
> -                           for m in variants.variants]},
> -                       ifcond, features)
> +        self._gen_tree(
> +            name, 'alternate',
> +            {'members': [Annotated({'type': self._use_type(m.type)}, m.ifcond)

Long line.  Try breaking the line before m.ifcond, or before Annotated.

> +                         for m in variants.variants]},
> +            ifcond, features
> +        )
>  
>      def visit_command(self, name: str, info: QAPISourceInfo, ifcond: List[str],
>                        features: List[QAPISchemaFeature],


