Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B61653D32
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:58:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8HO1-0001ZF-0J; Thu, 22 Dec 2022 03:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8HNz-0001Z1-5J
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8HNx-0004vJ-5C
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671699423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQfk582r4+u7TCeTqomhtfZtcwIzbWX3f0PR5lC+fgU=;
 b=FFsjMgrXLI78nVYwgVSfQIDd+MtAfZYmnKjvZ6cJCBt7gRArPzue+Ie+Jw2Z3AxgTyyKFY
 QVmmmac1TNJaP7dFWSt8Ywz352MBzd+O8/uILzXkbOeTu0Xr5BXTGcIUoe17ZU9/Z6G2vI
 30Ms/F79YZZCDC4xI77wA00lqEv8y6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-weHGX861NNGQTpGr-sO9bA-1; Thu, 22 Dec 2022 03:56:54 -0500
X-MC-Unique: weHGX861NNGQTpGr-sO9bA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0C2101A521
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 08:56:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BBCE51EF;
 Thu, 22 Dec 2022 08:56:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F3B5A21E691D; Thu, 22 Dec 2022 09:56:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  kwolf@redhat.com
Subject: Re: [PATCH v3 4/5] coroutine: Split qemu/coroutine-core.h off
 qemu/coroutine.h
References: <20221221131435.3851212-1-armbru@redhat.com>
 <20221221131435.3851212-5-armbru@redhat.com>
 <f6be3b34-acfd-8ac2-1b13-9cff62a8542e@redhat.com>
Date: Thu, 22 Dec 2022 09:56:52 +0100
In-Reply-To: <f6be3b34-acfd-8ac2-1b13-9cff62a8542e@redhat.com> (Paolo
 Bonzini's message of "Thu, 22 Dec 2022 09:01:24 +0100")
Message-ID: <87sfh7g6jv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/21/22 14:14, Markus Armbruster wrote:
>> +/**
>> + * Mark a function that executes in coroutine context
>> + *
>> + *
>> + * Functions that execute in coroutine context cannot be called
>> + * directly from normal functions.  Use @coroutine_fn to mark such
>> + * functions.  For example:
>> + *
>> + *   static void coroutine_fn foo(void) {
>> + *       ....
>> + *   }
>> + *
>> + * In the future it would be nice to have the compiler or a static
>> + * checker catch misuse of such functions.  This annotation might make
>> + * it possible and in the meantime it serves as documentation.
>> + */
>> +
>
> Is it intentional that "#define coroutine_fn" is not here?

Yes: I moved it to qemu/osdep.h in PATCH 2, along with its doc comment.
To avoid compromising coroutine.h as overview documentation, I added
rephrased documentation there.

This patch copies this rephrased documentation to coroutine-core.h.

I'm open to better ideas.


