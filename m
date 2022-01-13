Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC7548DBAF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:26:18 +0100 (CET)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82vZ-0002zL-GX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82sH-0007cd-4M
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:22:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82sE-000867-W5
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642090970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LU0on/DLU2ewxhnVlqUTji/ttOzpLnmVGEC9k9O2U3U=;
 b=ZhM5ubmpgQzWpFU3JIRlpx7HaXm95I4yl+DFgdTpLDuwqRqQPQih6QQc5sDWq2NNQ1MALi
 WaSMsjPRj8tEXk+J8ymDQJiakgZAVEaVQXxdlSMUap3NZ4U4W+i5meTCiiVeb42+7ohe/5
 yPV/eV0u+sG3bD87gi8dfThOWCjPazE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-F8k_YpTnOh69mt5pCQAY7Q-1; Thu, 13 Jan 2022 11:22:47 -0500
X-MC-Unique: F8k_YpTnOh69mt5pCQAY7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D178654;
 Thu, 13 Jan 2022 16:22:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41CEE78A98;
 Thu, 13 Jan 2022 16:22:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B818111380A2; Thu, 13 Jan 2022 17:22:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <YcVWzuPDawXtXGIX@xz-m1.local>
 <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
 <YdOxDRvCaXutEmOx@xz-m1.local>
Date: Thu, 13 Jan 2022 17:22:40 +0100
In-Reply-To: <YdOxDRvCaXutEmOx@xz-m1.local> (Peter Xu's message of "Tue, 4 Jan
 2022 10:32:06 +0800")
Message-ID: <87pmov61wv.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Fri, Dec 31, 2021 at 12:36:40AM +0800, Hyman Huang wrote:
>> > > +struct {
>> > > +    DirtyLimitState *states;
>> > > +    int max_cpus;
>> > > +    unsigned long *bmap; /* running thread bitmap */
>> > > +    unsigned long nr;
>> > > +    QemuThread thread;
>> > > +} *dirtylimit_state;
>> > > +
>> > > +static bool dirtylimit_quit = true;
>> > 
>> > Again, I think "quit" is not a good wording to show "whether dirtylimit is in
>> > service".  How about "dirtylimit_global_enabled"?
>> > 
>> > You can actually use "dirtylimit_state" to show whether it's enabled already
>> > (then drop the global value) since it's a pointer.  It shouldn't need to be
>> > init-once-for-all, but we can alloc the strucuture wAhen dirty limit enabled
>> > globally, and destroy it (and reset it to NULL) when globally disabled.
>> > 
>> > Then "whether it's enabled" is simply to check "!!dirtylimit_state" under BQL.
>> Yes, checking pointer is fairly straightforword, but since dirtylimit thread
>> also access the dirtylimit_state when doing the limit, if we free
>> dirtylimit_state after last limited vcpu be canceled, dirtylimit thread
>> would crash when reference null pointer. And this method turn out to
>> introduce a mutex lock to protect dirtylimit_state, comparing with qatomic
>> operation, which is better ?
>
> I don't see much difference here on using either atomic or mutex, because it's
> not a hot path.

Quick interjection without having bothered to understand the details:
correct use of atomics and memory barriers is *much* harder than correct
use of locks.  Stick to locks unless you *know* they impair performance.

[...]


