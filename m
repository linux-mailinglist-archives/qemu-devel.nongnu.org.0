Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A382DBC5A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 08:53:03 +0100 (CET)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpRcM-0001ia-IW
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 02:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpRaj-0001EL-Nh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:51:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpRaf-0006Vt-QX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608105076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZIBCbfM56NE7tLS8xuQR9ebc1+oPO08YGXRImVtk5Sw=;
 b=D+afeHRQ8+DXOyZ2cVDf870nyI74tx4kDDabN0h7q4HYERq8CQqTkXm+DzLcaX+wmz5j3s
 ibwqr/upaogaIKsOpWJ8gz+Cq2/JgdheDm7/kJm4yxeAldv9FrTKWTQYocTlWeQ3IrFISb
 LJm8vu7QF61j/PLKQY5+tvGdfRE82eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-VUOAy6G0NRq_9dZc5rMDlg-1; Wed, 16 Dec 2020 02:51:13 -0500
X-MC-Unique: VUOAy6G0NRq_9dZc5rMDlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C128910054FF
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:51:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 431375D9D7;
 Wed, 16 Dec 2020 07:51:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9FA511329A5; Wed, 16 Dec 2020 08:51:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 05/11] qapi/introspect.py: add preliminary type hint
 annotations
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-6-jsnow@redhat.com>
 <874kltnqx8.fsf@dusky.pond.sub.org>
 <995012d8-9b13-726a-fa05-844ec8ff61f6@redhat.com>
Date: Wed, 16 Dec 2020 08:51:10 +0100
In-Reply-To: <995012d8-9b13-726a-fa05-844ec8ff61f6@redhat.com> (John Snow's
 message of "Mon, 7 Dec 2020 18:48:23 -0500")
Message-ID: <87v9d2tci9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 11/13/20 11:48 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> The typing of _make_tree and friends is a bit involved, but it can be
>>> done with some stubbed out types and a bit of elbow grease. The
>>> forthcoming patches attempt to make some simplifications, but having the
>>> type hints in advance may aid in review of subsequent patches.
>>>
>>>
>>> Some notes on the abstract types used at this point, and what they
>>> represent:
>>>
>>> - TreeValue represents any object in the type tree. _make_tree is an
>>>    optional call -- not every node in the final type tree will have been
>>>    passed to _make_tree, so this type encompasses not only what is passed
>>>    to _make_tree (dicts, strings) or returned from it (dicts, strings, a
>>>    2-tuple), but any recursive value for any of the dicts passed to
>>>    _make_tree -- which includes lists, strings, integers, null constants,
>>>    and so on.
>>>
>>> - _DObject is a type alias I use to mean "A JSON-style object,
>>>    represented as a Python dict." There is no "JSON" type in Python, they
>>>    are converted natively to recursively nested dicts and lists, with
>>>    leaf values of str, int, float, None, True/False and so on. This type
>>>    structure is not possible to accurately portray in mypy yet, so a
>>>    placeholder is used.
>>>
>>>    In this case, _DObject is being used to refer to SchemaInfo-like
>>>    structures as defined in qapi/introspect.json, OR any sub-object
>>>    values they may reference. We don't have strong typing available for
>>>    those, so a generic alternative is used.
>>>
>>> - Extra refers explicitly to the dict containing "extra" information
>>>    about a node in the tree. mypy does not offer per-key typing for dicts
>>>    in Python 3.6, so this is the best we can do here.
>>>
>>> - Annotated refers to (one of) the return types of _make_tree:
>>>    It represents a 2-tuple of (TreeValue, Extra).
>>>
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/introspect.py | 157 ++++++++++++++++++++++++++++---------
>>>   scripts/qapi/mypy.ini      |   5 --
>>>   scripts/qapi/schema.py     |   2 +-
>>>   3 files changed, 121 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>> index 63f721ebfb6..803288a64e7 100644
>>> --- a/scripts/qapi/introspect.py
>>> +++ b/scripts/qapi/introspect.py
>>> @@ -10,7 +10,16 @@
>>>   See the COPYING file in the top-level directory.
>>>   """
>>>   
>>> -from typing import Optional, Sequence, cast
>>> +from typing import (
>>> +    Any,
>>> +    Dict,
>>> +    List,
>>> +    Optional,
>>> +    Sequence,
>>> +    Tuple,
>>> +    Union,
>>> +    cast,
>>> +)
>>>   
>>>   from .common import (
>>>       c_name,
>>> @@ -20,13 +29,56 @@
>>>   )
>>>   from .gen import QAPISchemaMonolithicCVisitor
>>>   from .schema import (
>>> +    QAPISchema,
>>>       QAPISchemaArrayType,
>>>       QAPISchemaBuiltinType,
>>> +    QAPISchemaEntity,
>>> +    QAPISchemaEnumMember,
>>> +    QAPISchemaFeature,
>>> +    QAPISchemaObjectType,
>>> +    QAPISchemaObjectTypeMember,
>>>       QAPISchemaType,
>>> +    QAPISchemaVariant,
>>> +    QAPISchemaVariants,
>>>   )
>>> +from .source import QAPISourceInfo
>>>   
>>>   
>>> -def _make_tree(obj, ifcond, features, extra=None):
>>> +# This module constructs a tree-like data structure that is used to
>> 
>> "Tree-like" suggests it's not a tree, it just looks like one if you
>> squint.  Drop "-like"?
>> 
>
> Sure. I think I am grammatically predisposed to assume "binary tree" or 
> at least some kind of monomorphic tree when I see "tree", hence the 
> hedging and weasel-words.
>
> No problem just to drop it.
>
>>> +# generate the introspection information for QEMU. It behaves similarly
>>> +# to a JSON value.
>>> +#
>>> +# A complexity over JSON is that our values may or may not be annotated.
>> 
>> It's the obvious abstract syntax tree for JSON, hacked up^W^Wextended to
>> support certain annotations.
>> 
>
> Yes.
>
>> Let me add a bit of context and history.
>> 
>> The module's job is generating qapi-introspect.[ch] for a QAPISchema.
>> 
>> The purpose of qapi-introspect.[ch] is providing the information
>> query-qmp-schema needs, i.e. (a suitable C representation of) a JSON
>> value conforming to [SchemaInfo].  Details of this C representation are
>> not interesting right now.
>> 
>> We first go from QAPISchema to a suitable Python representation of
>> [SchemaInfo], then from there to the C source code, neatly separating
>> concerns.
>> 
>> Stupidest solution Python representation that could possibly work: the
>> obvious abstract syntax tree for JSON (that's also how Python's json
>> module works).
>> 
>> Parts corresponding to QAPISchema parts guarded by 'if' conditionals
>> need to be guarded by #if conditionals.
>> 
>> We want to prefix parts corresponding to certain QAPISchema parts with a
>> comment.
>> 
>> These two requirements came later, and were hacked into the existing
>> stupidest solution: any tree node can be a tuple (json, extra), where
>> json is the "stupidest" node, and extra is a dict of annotations.  In
>> other words, to annotate an unannotated node N with dict D, replace N by
>> (N, D).
>> 
>> Possible annotations:
>> 
>>      'comment': str
>>      'if': Sequence[str]
>> 
>> They say there are just three answers a Marine may give to an officer's
>> questions: "Yes, sir!", "No, sir!", "No excuse, sir!".  Let me put that
>> to use here:
>> 
>>      Is this an elegant design?  No, sir!
>> 
>>      Is the code easy to read?  No excuse, sir!
>> 
>>      Was it cheap to make?  Yes, sir!
>> 
>
> Yes, I believe I am on the same page so far. It was difficult to read 
> and difficult to annotate, but once I got to the bottom, it's easy to 
> see why it happened this way in retrospect. It's the simplest thing that 
> could work.
>
> And it does work!
>
> So far, this comment isn't really a correction on what I wrote, but if 
> you believe my comment that explains the types could be clearer, feel 
> free to suggest.

Yes, it's not correction, it's elaboration.

You guys clearly struggled with the tree data structure.  Documentation
would have helped[*].  Since you're going to replace it (PATCH 09),
adding it now makes little sense.

*My* struggle is with the type annotations.

The initial state is messy to type, in part due to mypy's surprising
inability to deal with recursive types, in part because the tree data
structure is messier than it could be.

Much of the series is cleanup that benefits the typing.  Makes sense.

What makes review hard for me: you add (fairly complicated) typing
first, then evolve it along with the cleanups.  I have to first grok the
complicated typing (a struggle), then for each cleanup grok the type
changes in addition to the code changes.

I believe adding the typing before the cleanups is a mistake.

I share the desire to have type annotations that help with understanding
the code.  I understand the desire to have them sooner rather than
later.  I just think they're a costly distraction at this stage for this
code.  Once you understand the data structure, the cleanups are fairly
straightforward.

Is it too late to delay the introduction of type hints until after the
data structure cleanups?

If yes, I have to spend more time replying below.

>>> +#
>>> +# Un-annotated values may be:
>>> +#     Scalar: str, bool, None.
>>> +#     Non-scalar: List, Dict
>>> +# _Value = Union[str, bool, None, Dict[str, Value], List[Value]]
>>> +#
>>> +# With optional annotations, the type of all values is:
>>> +# TreeValue = Union[_Value, Annotated[_Value]]
>>> +#
>>> +# Sadly, mypy does not support recursive types, so we must approximate this.
>>> +_stub = Any
>>> +_scalar = Union[str, bool, None]
>>> +_nonscalar = Union[Dict[str, _stub], List[_stub]]
>>> +_value = Union[_scalar, _nonscalar]
>>> +TreeValue = Union[_value, 'Annotated']
>> 
>> Are there naming conventions for this kind of variables?  I'm asking
>> because you capitalize some, but not all, and I can't see a pattern.
>> 
>
> Types generally get CamelCase names; though for interior aliases I used 
> underscore + lowercase. In this case, I was trying to illustrate that 
> these intermediate types were only interesting or useful in service of 
> the Capitalized Thing, TreeValue.
>
>> Ignorant question: only 'Annotated' has quotes; why?
>> 
>
> It hasn't been defined yet, so it's a forward reference. Cleber 
> suggested I hoist its definition up to avoid this. I forget if I had 
> some strong reason for doing it this way, admittedly.
>
> A lot of this code gets changed shortly in the following patches, so 
> honestly I was likely just not really putting in a lot of effort to make 
> code that gets deleted soon pretty.
>
> (Why did the patches go in that order then? During early review, Eduardo 
> wanted to see the type hints go in first to help review for the cleanup 
> be easier ...!)

Understandable, but it didn't play out well, I'm afraid.

>> There is "_Value", "Value" and "_value".  Suggest to add "value"
>> somewhere, for completeness ;-P
>> 
>
> Yeah, my mistake. See my response to Cleber here...
>
>> I find the names _value and TreeValue a bit unfortunate: the difference
>> between the two isn't Tree.  I'll come back to this below.
>> 
>
> Feel free to suggest something better; I am at a point with this 
> particular module where I'd be happy to have someone more opinionated 
> than me telling me what they want.
>
>>> +
>>> +# This is just an alias for an object in the structure described above:
>>> +_DObject = Dict[str, object]
>> 
>> I'm confused.  Which structure, and why do we want to alias it?
>> 
>
> Yep, I don't have a good name for this either. I mean this to be a 
> generic type that describes the natural python representation for a JSON 
> object.
>
> i.e. Dict[str, THING].
>
> All of the various bits and pieces here that are generating SchemaInfo 
> subtype representations (like _gen_member, _gen_variant, etc.) are using 
> this as a generic "Well, it's some kind of dict/object."
>
> (Aside: this is an interesting part of code, because it is not type safe 
> with respect to the QAPI definitions that define SchemaInfo's descendant 
> types. There's no more explicit type for me to use here to describe 
> those objects.)
>
>>> +
>>> +# Represents the annotations themselves:
>>> +Annotations = Dict[str, object]
>> 
>> Losely typed.  I have no idea whether that's bad :)
>> 
>
> Kind of: unlike Any, using 'object' means that if we treat the 
> dictionary values in a manner that we could not treat *all* values, mypy 
> will raise an error.
>
> So it is a very broad type, but it's "safe".
>
>>> +
>>> +# Represents an annotated node (of some kind).
>>> +Annotated = Tuple[_value, Annotations]
>> 
>> So, _value seems to represent a JSON value, Annotated an annotated JSON
>> value, and TreeValue their union, i.e. a possibly annotated JSON value.
>> 
>> Naming is hard...  BareJsonValue, AnnotatedJsonValue, JsonValue?
>> 
>
> I was afraid of using "JsonValue" to avoid implicating it as a literal 
> JSON value -- since it isn't, exactly. It's the Python native 
> approximation of a subset of JSON values.
>
>>> +
>>> +
>>> +def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>> 
>> I'd expect obj: _value, i.e. "unannotated value".
>> 
>
> Sure, and I believe that would work -- this type is "tighter". 
> _make_tree only ever sees Dict[str, object] and str, actually.
>
> Later in the series, _make_tree goes away and this weird sub-type also 
> goes away in favor of the more generic type.
>
>>> +               features: List[QAPISchemaFeature],
>>> +               extra: Optional[Annotations] = None
>>> +               ) -> TreeValue:
>>>       if extra is None:
>>>           extra = {}
>>>       if ifcond:
>>> @@ -39,9 +91,11 @@ def _make_tree(obj, ifcond, features, extra=None):
>>>       return obj
>>>   
>>>   
>>> -def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
>>> +def _tree_to_qlit(obj: TreeValue,
>>> +                  level: int = 0,
>>> +                  suppress_first_indent: bool = False) -> str:
>>>   
>>> -    def indent(level):
>>> +    def indent(level: int) -> str:
>>>           return level * 4 * ' '
>>>   
>>>       if isinstance(obj, tuple):
>>> @@ -91,21 +145,20 @@ def indent(level):
>>>       return ret
>>>   
>>>   
>>> -def to_c_string(string):
>>> +def to_c_string(string: str) -> str:
>>>       return '"' + string.replace('\\', r'\\').replace('"', r'\"') + '"'
>>>   
>>>   
>>>   class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
>>> -
>> 
>> Intentional?
>> 
>
> I'm sure I thought it looked nice at the time. It's not important.
>
>>> -    def __init__(self, prefix, unmask):
>>> +    def __init__(self, prefix: str, unmask: bool):
>>>           super().__init__(
>>>               prefix, 'qapi-introspect',
>>>               ' * QAPI/QMP schema introspection', __doc__)
>>>           self._unmask = unmask
>>> -        self._schema = None
>>> -        self._trees = []
>>> -        self._used_types = []
>>> -        self._name_map = {}
>>> +        self._schema: Optional[QAPISchema] = None
>>> +        self._trees: List[TreeValue] = []
>>> +        self._used_types: List[QAPISchemaType] = []
>>> +        self._name_map: Dict[str, str] = {}
>>>           self._genc.add(mcgen('''
>>>   #include "qemu/osdep.h"
>>>   #include "%(prefix)sqapi-introspect.h"
>>> @@ -113,10 +166,10 @@ def __init__(self, prefix, unmask):
>>>   ''',
>>>                                prefix=prefix))
>>>   
>>> -    def visit_begin(self, schema):
>>> +    def visit_begin(self, schema: QAPISchema) -> None:
>>>           self._schema = schema
>>>   
>>> -    def visit_end(self):
>>> +    def visit_end(self) -> None:
>>>           # visit the types that are actually used
>>>           for typ in self._used_types:
>>>               typ.visit(self)
>>> @@ -138,18 +191,18 @@ def visit_end(self):
>>>           self._used_types = []
>>>           self._name_map = {}
>>>   
>>> -    def visit_needed(self, entity):
>>> +    def visit_needed(self, entity: QAPISchemaEntity) -> bool:
>>>           # Ignore types on first pass; visit_end() will pick up used types
>>>           return not isinstance(entity, QAPISchemaType)
>>>   
>>> -    def _name(self, name):
>>> +    def _name(self, name: str) -> str:
>>>           if self._unmask:
>>>               return name
>>>           if name not in self._name_map:
>>>               self._name_map[name] = '%d' % len(self._name_map)
>>>           return self._name_map[name]
>>>   
>>> -    def _use_type(self, typ):
>>> +    def _use_type(self, typ: QAPISchemaType) -> str:
>>>           # Map the various integer types to plain int
>>>           if typ.json_type() == 'int':
>>>               typ = self._schema.lookup_type('int')
>>> @@ -168,8 +221,10 @@ def _use_type(self, typ):
>>>               return '[' + self._use_type(typ.element_type) + ']'
>>>           return self._name(typ.name)
>>>   
>>> -    def _gen_tree(self, name, mtype, obj, ifcond, features):
>>> -        extra = None
>>> +    def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>> +                  ifcond: List[str],
>>> +                  features: Optional[List[QAPISchemaFeature]]) -> None:
>> 
>> _gen_tree() builds a complete tree (i.e. one SchemaInfo), and adds it to
>> ._trees.
>> 
>> The SchemaInfo's common parts are name, meta-type and features.
>> _gen_tree() takes them as arguments @name, @mtype, @features.
>> 
>> It takes SchemaInfo's variant parts as a dict @obj.
>> 
>> It completes @obj into an unannotated tree node by the common parts into
>> @obj.
>> 
>> It also takes a QAPI conditional argument @ifcond.
>> 
>> Now let me review the type annotations:
>> 
>> * name: str matches SchemaInfo, good.
>> 
>> * mtype: str approximates SchemaInfo's enum SchemaMetaType (it's not
>>    Python Enum because those were off limits when this code was written).
>> 
>
> It's also a little cumbersome, perhaps, to duplicate information from 
> the QAPI schema directly into the QAPI generator.

qapi/introspect.json is strongly coupled with
scripts/qapi/introspect.py.  Not proud of it, but I don't have better
ideas.

> Didn't feel like getting clever enough to "fix" this.
>
>> * obj: _DObject ...  I'd expect "unannotated JSON value".
>> 
>
> It's NOT any value though -- like you said: "_gen_tree() builds a 
> complete tree (i.e. one SchemaInfo)" -- we only accept objects here, 
> which is correct.
>
>> * ifcond: List[str] should work, but gen_if(), gen_endif() use
>>    Sequence[str].  Suggest to pick one (please explain why), and stick to
>>    it.
>> 
>>    More instances of ifcond: List[str] elsewhere; I'm not flagging them.
>> 
>
> Yes, I should probably be using Sequence, if I can. generally:
>
> - Input types should use the most generic type they can cope with 
> (Iterable, Sequence, Collection) based on what properties they actually 
> need in the incoming type.
>
> (By the end of this series, Iterable[str] should actually be sufficient, 
> but I'll have to see where it makes sense to slacken the input types in 
> this series. It's been through the washer quite a few times I'm afraid.)
>
> - Output types should be as explicit as possible.

Got it.

> I was not always perfectly good about generalizing the input types; List 
> is correct, but not necessarily maximally correct.
>
>> * features: Optional[List[QAPISchemaFeature]] is correct.  "No features"
>>    has two representations: None and [].  I guess we could eliminate
>>    None, trading a tiny bit of efficiency for simpler typing.  Not a
>>    demand.
>> 
>>> +        extra: Optional[Annotations] = None
>> 
>> "No annotations" is represented as None here, not {}.  I guess we could
>> use {} for simpler typing.  Not a demand.
>> 
>
> This goes away later, kinda. It becomes:
>
> comment: Optional[str] = None
>
> and that comment is eventually passed to an Annotated node constructor 
> that takes the comment specifically.
>
>>>           if mtype not in ('command', 'event', 'builtin', 'array'):
>>>               if not self._unmask:
>>>                   # Output a comment to make it easy to map masked names
>>> @@ -180,44 +235,64 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
>>>           obj['meta-type'] = mtype
>>>           self._trees.append(_make_tree(obj, ifcond, features, extra))
>>>   
>>> -    def _gen_member(self, member):
>>> -        obj = {'name': member.name, 'type': self._use_type(member.type)}
>>> +    def _gen_member(self,
>>> +                    member: QAPISchemaObjectTypeMember) -> TreeValue:
>>> +        obj: _DObject = {
>> 
>> I'd expect "unannotated value".  More of the same below.
>> 
>
> See my remark to your expectation for what _gen_tree should accept. It 
> deals with "objects" and "objects" have the property that more keys can 
> be assigned to them, and this is a fundamental feature of _gen_tree.
>
>>> +            'name': member.name,
>>> +            'type': self._use_type(member.type)
>>> +        }
>>>           if member.optional:
>>>               obj['default'] = None
>>>           return _make_tree(obj, member.ifcond, member.features)
>>>   
>>> -    def _gen_variants(self, tag_name, variants):
>>> +    def _gen_variants(self, tag_name: str,
>>> +                      variants: List[QAPISchemaVariant]) -> _DObject:
>>>           return {'tag': tag_name,
>>>                   'variants': [self._gen_variant(v) for v in variants]}
>>>   
>>> -    def _gen_variant(self, variant):
>>> -        obj = {'case': variant.name, 'type': self._use_type(variant.type)}
>>> +    def _gen_variant(self, variant: QAPISchemaVariant) -> TreeValue:
>>> +        obj: _DObject = {
>>> +            'case': variant.name,
>>> +            'type': self._use_type(variant.type)
>>> +        }
>>>           return _make_tree(obj, variant.ifcond, None)
>>>   
>>> -    def visit_builtin_type(self, name, info, json_type):
>>> +    def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>> 
>> A built-in's type info is always None.  Perhaps we should drop the
>> parameter.
>> 
>
> QAPISchemaBuiltinType -> QAPISchemaType -> QAPISchemaEntity
>
> This class ultimately takes an info parameter in the constructor which 
> is Optional, which means that the type for the info field is 
> Optional[QAPISourceInfo].

I understand you've since worked on tightening Optional all over, so
this might be moot.

> If you want to remove the parameter here, that works.
>
>>> +                           json_type: str) -> None:
>>>           self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>>>   
>>> -    def visit_enum_type(self, name, info, ifcond, features, members, prefix):
>>> +    def visit_enum_type(self, name: str, info: QAPISourceInfo,
>>> +                        ifcond: List[str], features: List[QAPISchemaFeature],
>>> +                        members: List[QAPISchemaEnumMember],
>>> +                        prefix: Optional[str]) -> None:
>>>           self._gen_tree(name, 'enum',
>>>                          {'values': [_make_tree(m.name, m.ifcond, None)
>>>                                      for m in members]},
>>>                          ifcond, features)
>>>   
>>> -    def visit_array_type(self, name, info, ifcond, element_type):
>>> +    def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>> 
>> Here, @info is indeed optional: it's None when @element_type is a
>> built-in type.
>> 
>>> +                         ifcond: List[str],
>>> +                         element_type: QAPISchemaType) -> None:
>>>           element = self._use_type(element_type)
>>>           self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>>>                          ifcond, None)
>>>   
>>> -    def visit_object_type_flat(self, name, info, ifcond, features,
>>> -                               members, variants):
>>> -        obj = {'members': [self._gen_member(m) for m in members]}
>>> +    def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>> 
>> And here it is optional due to the internal object type 'q_empty'.
>> 
>>> +                               ifcond: List[str],
>>> +                               features: List[QAPISchemaFeature],
>>> +                               members: Sequence[QAPISchemaObjectTypeMember],
>>> +                               variants: Optional[QAPISchemaVariants]) -> None:
>> 
>> We represent "no variants" as None, not as [].  I guess we could
>> eliminate use [], trading a tiny bit of efficiency for simpler typing.
>> Not a demand.
>> 
>
> For a later series:
>
> I recommend turning QAPISchemaVariants into an extension of 
> Sequence[QAPISchemaVariant],

I admittedly wasn't deep enough into Python at the time to even think of
this.

>                              and then always creating an empty 
> collection for the purpose of simplifying the type signature.
>
> I'd recommend the following magicks:
>
> __bool__ -- for writing "if variants: ..."
> __iter__ -- for writing "for variant in variants: ..."
>
> Then we can just always say "variants: QAPISchemaVariants" and go about 
> our lives.
>
> (Maybe that won't work, QAPISchemaVariants has a lot of other parameters 
> it takes that maybe don't apply to empty collections. Something to come 
> back to, I think.)

One way to find out whether it's an improvement.  Not now.

[...]


[*] Dearth of documentation making the code hard to understand is a
common theme in scripts/qapi/.  Sorry about that.


