Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776AC306FE7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:46:50 +0100 (CET)
Received: from localhost ([::1]:53710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l520u-0007Rl-MG
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51xo-0006HM-PC
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51xl-0000QY-4J
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611819810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TjC8yP7C3tSZMTa3GRFHp8olzNS8yHojWgHa1NDMkIc=;
 b=eBdfGvxEo2PWChT0nSp5E864o9zDNI1dieKRA5ZXl8D7rP55srou9RdMLpzNRoAdNTBT2V
 ozZtloBfDcEtJqMwMO4JDsnuRGL2HAwyrK3D0YZ/udXtHkb5fYZjSNiGQ0b8n43NMWhVXy
 gMjxezrMXfpFVPZMKqB84FzC/HCqRdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-35gMPNe6NCasU-4mzA9uog-1; Thu, 28 Jan 2021 02:43:28 -0500
X-MC-Unique: 35gMPNe6NCasU-4mzA9uog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 218A5107ACF5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:43:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C03896A8E4;
 Thu, 28 Jan 2021 07:43:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FA8C113865F; Thu, 28 Jan 2021 08:43:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/6] qapi: Simplify full_name_nth() in
 qobject-input-visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-4-kwolf@redhat.com>
 <87ft2mpjon.fsf@dusky.pond.sub.org>
 <20210127214242.GG6090@merkur.fritz.box>
Date: Thu, 28 Jan 2021 08:43:25 +0100
In-Reply-To: <20210127214242.GG6090@merkur.fritz.box> (Kevin Wolf's message of
 "Wed, 27 Jan 2021 22:42:42 +0100")
Message-ID: <87mtwtfqw2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 27.01.2021 um 14:56 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Instead of counting how many elements from the top of the stack we need
>> > to ignore until we find the thing we're interested in, we can just
>> > directly pass the StackObject pointer because all callers already know
>> > it.
>> >
>> > We only need a different way now to tell if we want to know the name of
>> > something contained in the given StackObject or of the StackObject
>> > itself. Passing name = NULL is the obvious way to request the latter.
>> >
>> > This simplifies the interface and makes it easier to use in cases where
>> > we have the StackObject, but don't know how many steps down the stack it
>> > is.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> > ---
>> >  qapi/qobject-input-visitor.c | 38 ++++++++++++++++++------------------
>> >  1 file changed, 19 insertions(+), 19 deletions(-)
>> >
>> > diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
>> > index a00ac32682..1415561828 100644
>> > --- a/qapi/qobject-input-visitor.c
>> > +++ b/qapi/qobject-input-visitor.c
>> > @@ -87,20 +87,16 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
>> >  }
>> >  
>> >  /*
>> > - * Find the full name of something @qiv is currently visiting.
>> > - * @qiv is visiting something named @name in the stack of containers
>> > - * @qiv->stack.
>> > - * If @n is zero, return its full name.
>> > - * If @n is positive, return the full name of the @n-th container
>> > - * counting from the top.  The stack of containers must have at least
>> > - * @n elements.
>> > - * The returned string is valid until the next full_name_nth(@v) or
>> > - * destruction of @v.
>> > + * Find the full name of something named @name in @so which @qiv is
>> > + * currently visiting.  If @name is NULL, find the full name of @so
>> > + * itself.
>> > + *
>> > + * The returned string is valid until the next full_name_so(@qiv) or
>> > + * destruction of @qiv.
>> 
>> How can this distinguish between a list and its member?
>> 
>> Before the patch:
>> 
>> * list member: n = 0, name = NULL
>> * list: n = 1, name = NULL
>
> Oh. These two lines were more helpful than the whole function comment
> before this patch (which doesn't talk about name = NULL at all).

See, I can write impenetrable comments with the best of them!

The spot that talks about @name is in visitor.h:

 * The @name parameter of visit_type_FOO() describes the relation
 * between this QAPI value and its parent container.  When visiting
 * the root of a tree, @name is ignored; when visiting a member of an
 * object, @name is the key associated with the value; when visiting a
 * member of a list, @name is NULL; and when visiting the member of an
 * alternate, @name should equal the name used for visiting the
 * alternate.

Many contracts in the same file refer back to it like this:

 * @name expresses the relationship of this object to its parent
 * container; see the general description of @name above.

The contract here doesn't.

>> Afterwards?
>> 
>> Checking... yes, regression.  Test case:
>> 
>>     {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk0", "filename": "tmp.img"}}
>>     {"return": {}}
>>     {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "node-name": "blk1", "image": "blk0", "take-child-perms": [0]}}
>>     {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms', expected: string"}}
>> 
>> The second command's reply changes from
>> 
>>     {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms[0]', expected: string"}}
>> 
>> to
>> 
>>     {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms', expected: string"}}
>> 
>> The idea of using @so instead of @n may be salvagable.
>
> I can always add a bool parameter that tells (independently from @name)
> whether we want the name of a member or of the container.
>
> Though do we really need the name of the container anywhere? The n = 1
> case exists in qobject_input_check_list(), but is this a case that can
> fail? The pattern how lists are intended to be visited seems to be
> calling visit_next_list() until it returns NULL.

Yes, the generated visitors always exhaust the list.  But virtual walks
needn't.  There's one in hw/ppc/spapr_drc.c:

        case FDT_PROP: {
            int i;
            prop = fdt_get_property_by_offset(fdt, fdt_offset, &prop_len);
            name = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
            if (!visit_start_list(v, name, NULL, 0, errp)) {
                return;
            }
            for (i = 0; i < prop_len; i++) {
                if (!visit_type_uint8(v, NULL, (uint8_t *)&prop->data[i],
                                      errp)) {
                    return;
                }
            }
            ok = visit_check_list(v, errp);
            visit_end_list(v, NULL);
            if (!ok) {
                return;
            }
            break;
        }

This visits @prop_len list elements.

If there are fewer, visit_type_uint8() should fail.  With the
QObjectInputVisitor, qobject_input_try_get_object() returns null to
qobject_input_get_object(), which then fails.

If there are more, visit_check_list() should fail.  With the
QObjectInputVisitor, it's the failure you challenged.

Now, this virtual walk is in a QOM getter, which should only ever be
with an output visitor.  Can't fail.  Only input visitors can.

> The only place where this pattern isn't followed and visit_next_list()
> is called outside such a loop, so that we can actually run into the
> error in qobject_input_check_list(), is a test case specifically for
> this error path.

See above.

> So should we just declare not visiting all list elements a programming
> error and assert instead of constructing an error message that users
> will never see?

We'd have to restrict virtual walks: if input visitor, then must exhaust
list input.  Ugh :)


