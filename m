Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFBB492785
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:53:26 +0100 (CET)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ovN-0003P3-He
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9oBH-0002hl-7s
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9oB9-00083V-3z
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642511136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8Kj91L6nhy9WQwdJE9pRlHsAOAMpjnJRDxgzVNvZyI=;
 b=fak2h4LWCZPKIC5RrS2tCCUTnmSHPp11cjfPYOtswEp37st++bbCM/Zky6bpz2h+MAM3ij
 Ale0n4Eas1KH5/QNq6P9HJ9TJFT4Z+tsZ+b1+qQ7tXHOuPBF3vmYY0cmojbMU8KHNFD8L0
 irTfe7x6K63w1IdklL4pj2yvl6+EsHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-yAOg7wUjNIiGN-m-Mt2vBA-1; Tue, 18 Jan 2022 08:05:35 -0500
X-MC-Unique: yAOg7wUjNIiGN-m-Mt2vBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B418A100C61F;
 Tue, 18 Jan 2022 13:05:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECCDA78AB5;
 Tue, 18 Jan 2022 13:05:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D2E211380A2; Tue, 18 Jan 2022 14:05:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 3/3] meson: generate trace events for qmp commands
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-4-vsementsov@virtuozzo.com>
 <871r15pc8p.fsf@dusky.pond.sub.org>
 <30f67e03-0c51-aaa0-3bc5-bb7d26493f93@redhat.com>
Date: Tue, 18 Jan 2022 14:05:03 +0100
In-Reply-To: <30f67e03-0c51-aaa0-3bc5-bb7d26493f93@redhat.com> (Paolo
 Bonzini's message of "Tue, 18 Jan 2022 13:21:28 +0100")
Message-ID: <87y23dmby8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 michael.roth@amd.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 1/18/22 11:30, Markus Armbruster wrote:
>>> +# Please keep ordering between 'qapi' and 'trace' subdirs:
>>> +# We should first handle 'qapi' subdir, so that all
>>> +# generated trace events be generated prior handling 'trace'
>>> +# subdir.
>> I naively expect explicit dependencies to be used for ordering, but I'm
>> a Meson noob.  I'd like an ACK from a non-noob on this one.
>> 
>
> The Make-time dependencies are just fine, but still the Meson language
> is imperative (with generally immutable objects in order to avoid 
> aliasing horrors) and variables in Meson are all of the ":=" kind;
> there's no equivalent for Make's "=".  So you have to do
>
> 	subdir('qapi')
> 	subdir('trace')
>
> in this order so that the variables defined by qapi/ are found in trace/.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> but I would replace the comment with:
>
> # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
> # that is filled in by qapi/.
>
> Paolo

Thanks!

Please also have a look at Vladimir's "supporting auto-generated trace
points for qga qmp commands requires some deeper refactoring" in reply
to PATCH 2.


