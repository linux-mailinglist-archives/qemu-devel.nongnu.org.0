Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A94904FD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:37:47 +0100 (CET)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9OSQ-0005uM-95
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n9OOQ-0004py-5F
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:33:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n9ONy-0005ev-LW
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642411938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KgdM2+k4+OBE6LSXrxBIeL3jDHrOZi5mA8H9q8L7erY=;
 b=c28RndQv6LGOAtcf4W37jIfdsnBJWLb9kHWhgbCs6h0NklEqfcDX05loAW0G7pgGUnShX/
 8xaLVAG2wnARw0t0icc/fc4BmuFHkcKXR4gqL0Or8kll00ujobC2pnLiMZX1KUpW98G4XR
 160iIPq1RFymjYggOZ5wv5TfLant9Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-zrwqhm6WNCW6NKLhy-R7dA-1; Mon, 17 Jan 2022 04:32:16 -0500
X-MC-Unique: zrwqhm6WNCW6NKLhy-R7dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 651F394DD0;
 Mon, 17 Jan 2022 09:31:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3854749BB;
 Mon, 17 Jan 2022 09:31:38 +0000 (UTC)
Date: Mon, 17 Jan 2022 10:31:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/4] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Message-ID: <YeU3edlINBJQF5hY@redhat.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-3-vsementsov@virtuozzo.com>
 <CAFn=p-ZxtMggvUoGOviWQAt9XpBUSUQX9nOo=MRWyH4k-fpv=Q@mail.gmail.com>
 <CAFn=p-bnoCP2HcXvaokrspOOFG-AqiVD18t54F1=yjzNQn1OmA@mail.gmail.com>
 <Yd6yhi96nErPW/rV@stefanha-x1.localdomain>
 <cef3a0e8-da08-f02b-8e9a-f12d963d18a8@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <cef3a0e8-da08-f02b-8e9a-f12d963d18a8@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.01.2022 um 09:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 12.01.2022 13:50, Stefan Hajnoczi wrote:
> > On Tue, Jan 11, 2022 at 07:32:52PM -0500, John Snow wrote:
> > > On Tue, Jan 11, 2022 at 6:53 PM John Snow <jsnow@redhat.com> wrote:
> > > > 
> > > > On Thu, Dec 23, 2021 at 6:08 AM Vladimir Sementsov-Ogievskiy
> > > > <vsementsov@virtuozzo.com> wrote:
> > > > > 
> > > > > Add possibility to generate trace points for each qmp command.
> > > > > 
> > > > > We should generate both trace points and trace-events file, for further
> > > > > trace point code generation.
> > > > > 
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > > ---
> > > > >   scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
> > > > >   1 file changed, 73 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > > > > index 21001bbd6b..9691c11f96 100644
> > > > > --- a/scripts/qapi/commands.py
> > > > > +++ b/scripts/qapi/commands.py
> > > > > @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
> > > > >   def gen_call(name: str,
> > > > >                arg_type: Optional[QAPISchemaObjectType],
> > > > >                boxed: bool,
> > > > > -             ret_type: Optional[QAPISchemaType]) -> str:
> > > > > +             ret_type: Optional[QAPISchemaType],
> > > > > +             add_trace_points: bool) -> str:
> > > > >       ret = ''
> > > > > 
> > > > >       argstr = ''
> > > > > @@ -71,21 +72,65 @@ def gen_call(name: str,
> > > > >       if ret_type:
> > > > >           lhs = 'retval = '
> > > > > 
> > > > > -    ret = mcgen('''
> > > > > +    qmp_name = f'qmp_{c_name(name)}'
> > > > > +    upper = qmp_name.upper()
> > > > > +
> > > > > +    if add_trace_points:
> > > > > +        ret += mcgen('''
> > > > > +
> > > > > +    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
> > > > > +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
> > > > > +        trace_%(qmp_name)s("", req_json->str);
> > > > > +    }
> > > > > +    ''',
> > > > > +                     upper=upper, qmp_name=qmp_name)
> > > > > +
> > > > > +    ret += mcgen('''
> > > > > 
> > > > >       %(lhs)sqmp_%(c_name)s(%(args)s&err);
> > > > > -    error_propagate(errp, err);
> > > > >   ''',
> > > > >                   c_name=c_name(name), args=argstr, lhs=lhs)
> > > > > -    if ret_type:
> > > > > -        ret += mcgen('''
> > > > > +
> > > > > +    ret += mcgen('''
> > > > >       if (err) {
> > > > > +''')
> > > > > +
> > > > > +    if add_trace_points:
> > > > > +        ret += mcgen('''
> > > > > +        trace_%(qmp_name)s("FAIL: ", error_get_pretty(err));
> > > > > +''',
> > > > > +                     qmp_name=qmp_name)
> > > > > +
> > > > > +    ret += mcgen('''
> > > > > +        error_propagate(errp, err);
> > > > >           goto out;
> > > > >       }
> > > > > +''')
> > > > > +
> > > > > +    if ret_type:
> > > > > +        ret += mcgen('''
> > > > > 
> > > > >       qmp_marshal_output_%(c_name)s(retval, ret, errp);
> > > > >   ''',
> > > > >                        c_name=ret_type.c_name())
> > > > > +
> > > > > +    if add_trace_points:
> > > > > +        if ret_type:
> > > > > +            ret += mcgen('''
> > > > > +
> > > > > +    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
> > > > > +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
> > > > > +        trace_%(qmp_name)s("RET:", ret_json->str);
> > > > > +    }
> > > > > +    ''',
> > > > > +                     upper=upper, qmp_name=qmp_name)
> > > > > +        else:
> > > > > +            ret += mcgen('''
> > > > > +
> > > > > +    trace_%(qmp_name)s("SUCCESS", "");
> > > > > +    ''',
> > > > > +                         qmp_name=qmp_name)
> > > > > +
> > > > >       return ret
> > > > > 
> > > > > 
> > > > > @@ -122,10 +167,14 @@ def gen_marshal_decl(name: str) -> str:
> > > > >                    proto=build_marshal_proto(name))
> > > > > 
> > > > > 
> > > > > +def gen_trace(name: str) -> str:
> > > > > +    return f'qmp_{c_name(name)}(const char *tag, const char *json) "%s%s"\n'
> > > > > +
> > > > >   def gen_marshal(name: str,
> > > > >                   arg_type: Optional[QAPISchemaObjectType],
> > > > >                   boxed: bool,
> > > > > -                ret_type: Optional[QAPISchemaType]) -> str:
> > > > > +                ret_type: Optional[QAPISchemaType],
> > > > > +                add_trace_points: bool) -> str:
> > > > >       have_args = boxed or (arg_type and not arg_type.is_empty())
> > > > >       if have_args:
> > > > >           assert arg_type is not None
> > > > > @@ -180,7 +229,7 @@ def gen_marshal(name: str,
> > > > >       }
> > > > >   ''')
> > > > > 
> > > > > -    ret += gen_call(name, arg_type, boxed, ret_type)
> > > > > +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_points)
> > > > > 
> > > > >       ret += mcgen('''
> > > > > 
> > > > > @@ -238,11 +287,12 @@ def gen_register_command(name: str,
> > > > > 
> > > > > 
> > > > >   class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> > > > > -    def __init__(self, prefix: str):
> > > > > +    def __init__(self, prefix: str, add_trace_points: bool):
> > > > >           super().__init__(
> > > > >               prefix, 'qapi-commands',
> > > > >               ' * Schema-defined QAPI/QMP commands', None, __doc__)
> > > > >           self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
> > > > > +        self.add_trace_points = add_trace_points
> > > > > 
> > > > >       def _begin_user_module(self, name: str) -> None:
> > > > >           self._visited_ret_types[self._genc] = set()
> > > > > @@ -261,6 +311,15 @@ def _begin_user_module(self, name: str) -> None:
> > > > > 
> > > > >   ''',
> > > > >                                commands=commands, visit=visit))
> > > > > +
> > > > > +        if self.add_trace_points and c_name(commands) != 'qapi_commands':
> > > > > +            self._genc.add(mcgen('''
> > > > > +#include "trace/trace-qapi.h"
> > > > > +#include "qapi/qmp/qjson.h"
> > > > > +#include "trace/trace-%(nm)s_trace_events.h"
> > > > > +''',
> > > > > +                                 nm=c_name(commands)))
> > > > > +
> > > > >           self._genh.add(mcgen('''
> > > > >   #include "%(types)s.h"
> > > > > 
> > > > > @@ -322,7 +381,9 @@ def visit_command(self,
> > > > >           with ifcontext(ifcond, self._genh, self._genc):
> > > > >               self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
> > > > >               self._genh.add(gen_marshal_decl(name))
> > > > > -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
> > > > > +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
> > > > > +                                       self.add_trace_points))
> > > > > +            self._gent.add(gen_trace(name))
> > > > >           with self._temp_module('./init'):
> > > > >               with ifcontext(ifcond, self._genh, self._genc):
> > > > >                   self._genc.add(gen_register_command(
> > > > > @@ -332,7 +393,8 @@ def visit_command(self,
> > > > > 
> > > > >   def gen_commands(schema: QAPISchema,
> > > > >                    output_dir: str,
> > > > > -                 prefix: str) -> None:
> > > > > -    vis = QAPISchemaGenCommandVisitor(prefix)
> > > > > +                 prefix: str,
> > > > > +                 add_trace_points: bool) -> None:
> > > > > +    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_points)
> > > > >       schema.visit(vis)
> > > > >       vis.write(output_dir)
> > > > > --
> > > > > 2.31.1
> > > > > 
> > > > 
> > > > I looked at Stefan's feedback and I want to second his recommendation
> > > > to use _enter and _exit tracepoints, this closely resembles a lot of
> > > > temporary debugging code I've written for jobs/bitmaps over the years
> > > > and find the technique helpful.
> > > > 
> > > > --js
> > > > 
> > > > (as a tangent ...
> > > > 
> > > > I wish I had a much nicer way of doing C generation from Python, this
> > > > is so ugly. It's not your fault, of course. I'm just wondering if the
> > > > mailing list has any smarter ideas for future improvements to the
> > > > mcgen interface, because I find this type of code really hard to
> > > > review.)
> > > 
> > > Come to think of it, we could use a framework that was originally
> > > designed for HTML templating, but for C instead. Wait! Don't close the
> > > email yet, I have some funny things to write still!!
> > > 
> > > Downsides:
> > > - New template language
> > > - Complex
> > > 
> > > Pros:
> > > - Easier to read
> > > - Easier to review
> > > - Avoids reinventing the wheel
> > > - Doesn't even technically add a dependency, since Sphinx already
> > > relies on Jinja ...
> > > - *Extremely* funny
> > > 
> > > As an example, let's say we had a file
> > > "scripts/qapi/templates/qmp_marshal_output.c" that looked like this:
> > > ```
> > > static void qmp_marshal_output_{{c_name}}(
> > >      {{c_type}} ret_in,
> > >      QObject **ret_out,
> > >      Error **errp
> > > ) {
> > >      Visitor *v;
> > > 
> > >      v = qobject_output_visitor_new_qmp(ret_out);
> > >      if (visit_type_{{c_name}}(v, "unused", &ret_in, errp)) {
> > >          visit_complete(v, ret_out);
> > >      }
> > >      visit_free(v);
> > >      v = qapi_dealloc_visitor_new();
> > >      visit_type_{{c_name}}(v, "unused", &ret_in, NULL);
> > >      visit_free(v);
> > > }
> > > ```
> > > 
> > > We could use Jinja to process it from Python like this:
> > > 
> > > ```
> > > import os
> > > from jinja2 import PackageLoader, Environment, FileSystemLoader
> > > 
> > > env = Environment(loader = FileSystemLoader('./templates/'))
> > > template = env.get_template("qmp_marshal_output.c")
> > > rendered = cgen(template.render(
> > >      c_name = "foo",
> > >      c_type = "int",
> > > ))
> > > 
> > > print(rendered)
> > > ```
> > > 
> > > You'd get output like this:
> > > 
> > > ```
> > > static void qmp_marshal_output_foo(
> > >      int ret_in,
> > >      QObject **ret_out,
> > >      Error **errp
> > > ) {
> > >      Visitor *v;
> > > 
> > >      v = qobject_output_visitor_new_qmp(ret_out);
> > >      if (visit_type_foo(v, "unused", &ret_in, errp)) {
> > >          visit_complete(v, ret_out);
> > >      }
> > >      visit_free(v);
> > >      v = qapi_dealloc_visitor_new();
> > >      visit_type_foo(v, "unused", &ret_in, NULL);
> > >      visit_free(v);
> > > ```
> > > 
> > > Jinja also supports conditionals and some other logic constructs, so
> > > it'd *probably* apply to most templates we'd want to write, though
> > > admittedly I haven't thought through if it'd actually work everywhere
> > > we'd need it, and I am mostly having a laugh.
> > > 
> > > ...OK, back to work!
> > 
> > I agree that mcgen string formatting is very hard to review.
> > 
> > I'm not sure if it's possible to separate the C templates into large
> > chunks that are easy to read though. If there are many small C templates
> > then it's hard to review and I think that's the core problem, not the
> > string formatting/expansion mechanism (%(var)s vs Python {var} vs jinja2
> > {{var}}).
> > 
> > If we could stick to Python standard library features instead of jinja2
> > that would be nice because while jinja2 is powerful and widely-used,
> > it's probably a bit too powerful and adds complexity/boilerplate that
> > could be overkill in this situation.
> > 
> > Stefan
> 
> I think that conversion to Python f-strings would be a good start: not
> very invasive, no extra dependencies, but may probably solve 60-80 %
> of the problem.

It doesn't really. As I understand it, the main problem mcgen() solves is
outputting correctly indented C code when you don't have a single
string, but the code has to be split across multiple strings because of
conditions and loops.

In general, f-strings are a little bit nicer than the formatting to be
used with the % operator, but you'd still keep all those mcgen() calls
with code between them. They just wouldn't need **kwds any more.

Of course, in the specific case of outputting C code, f-strings would
actually be terrible because you'd have to double all braces, which tend
to occur a lot in C code. So in this case, they probably aren't a little
bit nicer, but a little bit uglier.

Kevin


