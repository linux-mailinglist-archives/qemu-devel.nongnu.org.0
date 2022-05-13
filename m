Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89795268B9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 19:50:11 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZQY-00049p-3d
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 13:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npZOZ-0003Qw-JJ
 for qemu-devel@nongnu.org; Fri, 13 May 2022 13:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npZOU-0003o3-Eb
 for qemu-devel@nongnu.org; Fri, 13 May 2022 13:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652464080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJMdpZ9ZR3Xxg53+lLQXyNsKwgZpTq0ygR4hNXrJE5U=;
 b=ZFTevO52FEBY+f9gfQj3TzxyHFy/t7BUXF5Bgf1ZHB2xlz9R1L3Htg8sfYESRw7irD52SY
 ICa4wgTcfGOwkYJ+9/ECEEtCSKsvdWg/7BN/nwt/QXWyapdeAYJqEbLKKEUeEd4G73WHsE
 hE3VBScBa4yu3Z7BU6cmhoIOZCk3j0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-11TF-wGaNiGy4mJwiyHIzg-1; Fri, 13 May 2022 13:47:56 -0400
X-MC-Unique: 11TF-wGaNiGy4mJwiyHIzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32DB780A0B9;
 Fri, 13 May 2022 17:47:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 071E440F9D68;
 Fri, 13 May 2022 17:47:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B14A921E690D; Fri, 13 May 2022 19:47:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  mark.kanda@oracle.com,  berrange@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
 <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org>
 <e7056663-6f22-e0ec-679a-3f474df05788@redhat.com>
 <87ee0xy3w0.fsf@pond.sub.org>
 <51586997-467c-0209-7319-fc82e1796809@redhat.com>
 <87y1z5v6te.fsf@pond.sub.org>
 <8bebcd75-61bd-d3aa-974b-eab9f62ae5e5@redhat.com>
Date: Fri, 13 May 2022 19:47:54 +0200
In-Reply-To: <8bebcd75-61bd-d3aa-974b-eab9f62ae5e5@redhat.com> (Paolo
 Bonzini's message of "Fri, 13 May 2022 17:50:50 +0200")
Message-ID: <87wneptjcl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/13/22 16:35, Markus Armbruster wrote:
>> Friday afternoon, worst time for word-smithing...  Feel free to ask
>> again on Monday:)
>> 
>>> a suggested place?  For example, do you think it would fit better in the
>>> query-stats or query-stats-schemas documentation?
>
> I think query-stats-schemas is good enough.
>
> # *Note*: While QEMU and other providers of runtime-collected statistics
> # will try to keep the set of available data stable, together with their
> # names, it is impossible to provide a full guarantee.  For example, if
> # the same value is being tracked with different names on different
> # architectures or by different providers, one of them might be renamed.
> # A statistic might go away if an algorithm is changed or some code is
> # removed; changing a default might cause previously useful statistics
> # to always report 0.  Such changes fall outside QEMU's usual deprecation
> # policies (also because statistics might be sourced externally, e.g.
> # from Linux).  However, they are expected to be rare.

Works for me!

Markup hint: "Note:" is a note section tag, while "*Note*:" is just
text.  I figure we want the section tag here.


