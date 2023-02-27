Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2856A41A9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:26:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcZD-0000iV-9C; Mon, 27 Feb 2023 07:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWcZA-0000iE-J8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWcZ8-0006y0-SG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677500713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/D7tQ/gvj6J6RaU9Iv6dlgG5G7wnXshRvfDZGTvLJx4=;
 b=igLYvaZdEkONjl+lkz1uswIne6sErXqUYhsCc9Vm6U/qgJ0MiRHwbOIpnhEOXAjQxTur0w
 JdWYq5bny4PU1tGCv/bRLjCqpc0aUmS14eXl96qPXwcNeenU7+Sk5IvvieQ8zRsVzW/voG
 lbK5eaFiYd2ksA75zmZuxXpryZFwkrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-iPIuThf7OPm4zqBmIqJA2Q-1; Mon, 27 Feb 2023 07:25:09 -0500
X-MC-Unique: iPIuThf7OPm4zqBmIqJA2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45FC295D605;
 Mon, 27 Feb 2023 12:25:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 229BE40C6EC4;
 Mon, 27 Feb 2023 12:25:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3457421E6A1F; Mon, 27 Feb 2023 13:25:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>,  Pierre Morel <pmorel@linux.ibm.com>,
 qemu-s390x@nongnu.org,  qemu-devel@nongnu.org,  borntraeger@de.ibm.com,
 pasic@linux.ibm.com,  richard.henderson@linaro.org,  david@redhat.com,
 cohuck@redhat.com,  mst@redhat.com,  pbonzini@redhat.com,
 kvm@vger.kernel.org,  ehabkost@redhat.com,  marcel.apfelbaum@gmail.com,
 eblake@redhat.com,  seiden@linux.ibm.com,  nrb@linux.ibm.com,
 frankja@linux.ibm.com,  berrange@redhat.com,  clg@kaod.org
Subject: Re: [PATCH v16 08/11] qapi/s390x/cpu topology: set-cpu-topology
 monitor command
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-9-pmorel@linux.ibm.com>
 <aaf4aa7b7350e88f65fc03f148146e38fe4f7fdb.camel@linux.ibm.com>
 <0a93eb0e-2552-07b7-2067-f46d542126f4@redhat.com>
 <9e1cbbe11ac1429335c288e817a21f19f8f4af87.camel@linux.ibm.com>
Date: Mon, 27 Feb 2023 13:25:07 +0100
In-Reply-To: <9e1cbbe11ac1429335c288e817a21f19f8f4af87.camel@linux.ibm.com>
 (Nina Schoetterl-Glausch's message of "Mon, 27 Feb 2023 11:49:51
 +0100")
Message-ID: <87v8jnqorg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Nina Schoetterl-Glausch <nsg@linux.ibm.com> writes:

> On Mon, 2023-02-27 at 08:59 +0100, Thomas Huth wrote:

[...]

>> I'm not sure whether double inclusion works with the QAPI parser (since this 
>> might code to be generated twice) ... have you tried?
>
> I haven't, the documentation says:
>
>> Include directives
>> ------------------
>> 
>> Syntax::
>> 
>>     INCLUDE = { 'include': STRING }
>> 
>> The QAPI schema definitions can be modularized using the 'include' directive::
>> 
>>  { 'include': 'path/to/file.json' }
>> 
>> The directive is evaluated recursively, and include paths are relative
>> to the file using the directive.  Multiple includes of the same file
>> are idempotent.
>
> Which is why I thought it should work, but I guess this is a statement about
> including the same file twice in another file and not about including the same
> file from two files.

No, this is intended to say multiple inclusion is fine, regardless where
the include directives are.

An include directive has two effects:

1. If the included file has not been included already, pull in its
   contents.

2. Insert #include in generated C.  Example: qdev.json includes
   qom.json.  The generated qapi-*-qdev.h include qapi-types-qom.h.

   Including any required modules, as recommended by qapi-code-gen.rst,
   results in properly self-contained generated headers.

> But then, as far as I can tell, the build system only builds qapi-schema.json,
> which includes all other files, so it could apply.

Yes, qapi-schema.json is the main module, which includes all the others.

In fact, it includes all the others *directly*.  Why?

We generate documentation in source order.  Included material gets
inserted right at the first inclusion; subsequent inclusions have no
effect.

If we put all first inclusions right into qapi-schema.json, the order of
things in documentation is visible right there, and won't change just
because we change inclusions deeper down.

Questions?


