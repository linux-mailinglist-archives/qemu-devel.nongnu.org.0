Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B269081B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5bU-0008Ip-60; Thu, 09 Feb 2023 07:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ5bQ-0008Hb-LY
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:00:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ5bP-0007q8-1V
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675944034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oN0v+SK0m7GW0dSVsFxm1MfWGX0xaez5W8dycFYweNU=;
 b=aPPOU3AxmUmr+nK2dXb93zGuVS1ajErB53Kw3YXeBoRaFoLVAMIOMl0iEAjL0UJqtjh92H
 D0qdBohLhccv99Oxt6rOASVfvJrMr6QZDe0h9geSMaCFk7sCW4tueL2Lgq47Md7TK+98p0
 mPp31r7gXd4uKkuwjlVDzdudFCFsv68=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-BJpS8nIHMhepvlLNp7GHkw-1; Thu, 09 Feb 2023 07:00:28 -0500
X-MC-Unique: BJpS8nIHMhepvlLNp7GHkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D958718A6463;
 Thu,  9 Feb 2023 12:00:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A84A71121315;
 Thu,  9 Feb 2023 12:00:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF64621E6A1F; Thu,  9 Feb 2023 13:00:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  quintela@redhat.com,
 dgilbert@redhat.com,  pbonzini@redhat.com,  berrange@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper
 func to qapi-util.c file
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-2-het.gala@nutanix.com>
Date: Thu, 09 Feb 2023 13:00:25 +0100
In-Reply-To: <20230208093600.242665-2-het.gala@nutanix.com> (Het Gala's
 message of "Wed, 8 Feb 2023 09:35:55 +0000")
Message-ID: <87y1p73v6u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Het Gala <het.gala@nutanix.com> writes:

> renamed hmp_split_at_comma() --> str_split_at_comma()
> Shifted helper function to qapi-util.c file.

Not an appropriate home.

If we have to split up a string in QAPI/QMP, we screwed up.  Let me
explain.

In QAPI/QMP, data is not to be encoded in strings, it is to be
represented directly in JSON.  Thus, ["a", "b", "c"], *not* "a,b,c".

When you find yourself parsing QAPI/QMP string values, you're dealing
with a case where we violated this interface design principle.  Happens,
but the proper home for code helping to deal with this is *not* qapi/.
Simply because QAPI is not about parsing strings.

>                                              Give external linkage, as
> this function will be handy in coming commit for migration.

It already has external linkage.

> Minor correction:
> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)

This is not actually a correction :)

Omitting the second operand of a conditional expression like x ?: y is
equivalent to x ? x : y, except it evaluates x only once.

https://gcc.gnu.org/onlinedocs/gcc/Conditionals.html

Besides, please don't mix code motion with code changes.

[...]


