Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB2321B5D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:27:23 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lED7K-0000Ch-8A
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lED57-0006z3-Pv
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:25:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lED51-0006Nj-Lh
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614007497;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6kNlLNE7vgGkphteqZkcmXhcY8pPicMX6a2iV+GEnIU=;
 b=ehsQV7YIAPQnfxJq8XYmaa9b5zqC+T7wl0xFKDRT7Hmqcr+5eGtkX8NxNVskMJGOqoCfl4
 l1LJxpgiFMXpc1GCl3N2NZaOGemWda0zAVhB+fPidvHPesxH/ooKdRCzE+qH3t15GHi84f
 s2CztYzU6AKFhkYyT9fxlyDaTI0Jpik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-TtegTS1hMfSMaWowLdlfnw-1; Mon, 22 Feb 2021 10:24:45 -0500
X-MC-Unique: TtegTS1hMfSMaWowLdlfnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88010192CC49;
 Mon, 22 Feb 2021 15:24:44 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3AF2BFE7;
 Mon, 22 Feb 2021 15:24:38 +0000 (UTC)
Date: Mon, 22 Feb 2021 15:24:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <YDPMs1Hu8LDRJUhX@redhat.com>
References: <875z2knoa5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875z2knoa5.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 03:57:22PM +0100, Markus Armbruster wrote:
> We use JSON in several external interfaces:
> 
> * QMP
> 
> * The guest agent's QMP
> 
> * QAPIfied command line options when the option argument starts with
>   '{'
> 
> * The block layer's pseudo-protocol "json:" (which can get embedded in
>   image headers)
> 
> I *think* that's all.
> 
> The JSON parser we use for these interfaces supports extensions over RFC
> 8259.  Quoting json-lexer.c:
> 
>     - Extra escape sequence in strings:
>       0x27 (apostrophe) is recognized after escape, too
> 
>     - Single-quoted strings:
>       Like double-quoted strings, except they're delimited by %x27
>       (apostrophe) instead of %x22 (quotation mark), and can't contain
>       unescaped apostrophe, but can contain unescaped quotation mark.
> 
>     - Interpolation, if enabled:
>       The lexer accepts %[A-Za-z0-9]*, and leaves rejecting invalid
>       ones to the parser.
> 
> Ignore interpolation; it's never enabled at external interfaces.
> 
> This leaves single-quotes strings and the escape sequence to go with
> them.
> 
> I disabled them as an experiment.  Some 20 iotests, a qtest and two unit
> tests explode.
> 
> The unit test testing the JSON parser is of course excused.
> 
> The remaining qtest and the unit test could perhaps be dismissed as
> atypical use of QEMU from C.  The iotests less so, I think.
> 
> I looked at some iotest failures, and quickly found single-quoted
> strings used with all external interfaces except for qemu-ga's QMP.
> 
> We could certainly tidy up the tests to stick to standard JSON.
> However, the prevalence of single-quoted strings in iotests makes me
> suspect that they are being used in the field as well.  Deprecating the
> extension is likely more trouble than it's worth.

The shell based iotests use single quotes primarily because they're
being written in a language which lacks the concept of libraries and
and so all JSON is constructed by string substitution. Using single
quotes is convenient to avoid continually escaping double quotes.

For any other language constructing JSON documents through string
substitution is insanity, because they all have JSON libraries
available which let you construct JSON documents progamatically
without risk of introducing security flaws through malicious
substitutions.

This problem isn't unique to QEMU. Any app using JSON from the
shell will have the tedium of quote escaping. JSON is incredibly
widespread and no other apps felt it neccessary to introduce single
quoting support, because the benefit doesn't outweigh the interop
problem it introduces.

> Opinions?

IMHO we should deprecate and eventually remove single quotes. We
should expect mgmt apps to be using a JSON library to talk to QEMU
in general if they are using QMP. Sure some may be using shell, but
I'd expect that to be relatively few. Adapting is tedious but not
especially hard.

It would be nice at some point in future to have the option of using
a standard JSON library in part or all of QEMU. Especially if we
ever want to be able to have parts of QEMU written in non-C language,
we don't want to re-invent a custom JSON parser as the first step,
for back compatibility.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


