Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA683007A4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:45:52 +0100 (CET)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ydD-00020W-AE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2ybh-0001YV-W2
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2ybg-0006t6-9C
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611330255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dfjdxj0yiuCPz4G7GXWvA99Hc9FO7sP2wotW5Nv4FCo=;
 b=Ot32cc8HI8wf3TwNLaBgTMMTZLN8NKYwnVFhus34iTlbHvyvCKPNp5APmX6oYDN2wfUBE0
 f0TijGULUKEdUHQGsfLrJey2jkLw9cIIO7W8o8RnV9R4bZC6dMysKTMtL5ZS3wLQL2pD9a
 v7Jh3sWZtCC/VlrT+J7J1g/2gAFGfQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-r_FtY_x1PdOwlx0v2mNRpg-1; Fri, 22 Jan 2021 10:44:11 -0500
X-MC-Unique: r_FtY_x1PdOwlx0v2mNRpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 598E2801817
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:44:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D885DA2D;
 Fri, 22 Jan 2021 15:44:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A884B113865F; Fri, 22 Jan 2021 16:44:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 05/25] keyval: simplify keyval_parse_one
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-6-pbonzini@redhat.com>
 <874kj95bhd.fsf@dusky.pond.sub.org>
 <84476bff-27ba-4308-cd9f-cbc1dc233831@redhat.com>
Date: Fri, 22 Jan 2021 16:44:08 +0100
In-Reply-To: <84476bff-27ba-4308-cd9f-cbc1dc233831@redhat.com> (Paolo
 Bonzini's message of "Fri, 22 Jan 2021 16:00:07 +0100")
Message-ID: <87r1mdyo1j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

> On 22/01/21 14:48, Markus Armbruster wrote:
>>    --nbd .key=
>>      master:       Invalid parameter '..key'
>>      your patch:   same
>>      Likweise.
>>    If I omit the '=', your patch's message changes to
>>                    No implicit parameter name for value 'key..'
>>    I consider that worse than before, because it's talking about
>>    something outside the user's control (lack of an implict parameter
>>    name) where it should instead tell the user what needs fixing in the
>>    input.
>
> I think whether it's better or worse depends on the specific erroneous
> command line (think "--nbd /path/to/file.qcow2"), but I can certainly 
> change it.

Quoting myself: Error messages based on guesses what the user has in
mind can be quite confusing when we guess wrong.  A strictly factual
syntax error style like "I expected FOO instead of BAR here" may not be
great, but has a relatively low risk of being confusing.

>> Your patch also adds an "Expected parameter at end of string" error.
>> Can you tell me how to trigger it?
>
> It is meant for "--nbd ''" but it is effectively dead code due to the
> "while (*s)" in the caller.  Possibilities:
>
> 1) leave it in as dead code

I'd prefer not to.

> 2) replace it with an assert

Works for me.

> 3) change the caller to use a do...while in such a way that it
> triggers it (and be careful not to change the grammar).

Only if it's not too hard, and results in better error messages.

>> I believe your grammar is ambiguous.  Your code seems to pick the sane
>> alternative.  If I'm wrong, you need to enlighten me.  If I'm right, you
>> need to fix your grammar.
>
> Will do.  Can I change the EBNF to use "+" and "*" for simplicity and
> clarity?

I tried to stick to ISO 14977 as described in
<https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form>, less
its foolish ',' for concatenation.  I'm not at all enamored with it.
All I want is something that is widely understood, and preferably not
invented here.  Switch to <https://www.w3.org/TR/xml/#sec-notation>
perhaps?

[...]


