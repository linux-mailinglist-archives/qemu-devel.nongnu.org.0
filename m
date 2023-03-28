Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB16CB60A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1rP-00057N-0E; Tue, 28 Mar 2023 01:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph1rL-000577-4y
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:27:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph1rJ-0005aO-NO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679981221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wT8jf0XVGXJSROT0uk+4GpCQcCM6xp7pY6aT96gCKV8=;
 b=gaNnsf9+USBd6iln9LGtnneqqq/xjNkpMh6cVexoj+QDrsXUAigW69utzsX6sa7bIXlfsN
 0AP65IJM+EhpaPWk4lXR2Z6ugVcPxVsZ7B3J/Cg3KO9AlK9rGd9TkfICmUrS7xP56/o92m
 EO7G6YOyhFkqiI4BTOlqTXO7tpmsuUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-AVlur8ARP9eu0yDBkygP4g-1; Tue, 28 Mar 2023 01:26:57 -0400
X-MC-Unique: AVlur8ARP9eu0yDBkygP4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8C42811E7C;
 Tue, 28 Mar 2023 05:26:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B48D1121330;
 Tue, 28 Mar 2023 05:26:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FE8321E6926; Tue, 28 Mar 2023 07:26:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,  qemu-devel
 <qemu-devel@nongnu.org>,  David Hildenbrand <david@redhat.com>,  Thomas
 Huth <thuth@redhat.com>,  "Borntraeger, Christian"
 <borntraeger@de.ibm.com>,  Janosch Frank <frankja@linux.ibm.com>,
 fiuczy@linux.ibm.com,  Halil Pasic <pasic@linux.ibm.com>,
 nsg@linux.ibm.com,  "P. Berrange, Daniel" <berrange@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 1/1] util/async-teardown: wire up
 query-command-line-options
References: <20230327133525.50318-1-imbrenda@linux.ibm.com>
 <20230327133525.50318-2-imbrenda@linux.ibm.com>
 <CABgObfYK_cVCS5x-JYY78KTdrhTnPU+fiK5QRnRTrd+EWMn3bw@mail.gmail.com>
Date: Tue, 28 Mar 2023 07:26:55 +0200
In-Reply-To: <CABgObfYK_cVCS5x-JYY78KTdrhTnPU+fiK5QRnRTrd+EWMn3bw@mail.gmail.com>
 (Paolo Bonzini's message of "Mon, 27 Mar 2023 23:16:19 +0200")
Message-ID: <87cz4t5tuo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> I am honestly not a fan of adding a more complex option,.just because
> query-command-line-options only returns the square holes whereas here we
> got a round one.
>
> Can we imagine another functionality that would be added to -teardown? If
> not, it's not a good design. If it works, I would add a completely dummy
> (no suboptions) group "async-teardown" and not modify the parsing at all.

Does v2 implement your suggestion?
Message-Id: <20230320131648.61728-1-imbrenda@linux.ibm.com>

I dislike it, because it makes query-command-line-options claim
-async-teardown has an option argument with unknown keys, which is
plainly wrong, and must be treated as a special case.  Worse, a new kind
of special case.

Can we have a QMP command, so libvirt can use query-qmp-schema?

In case QMP becomes functional too late for the command to actually
work: make it always fail for now.  It can still serve as a witness for
-async-teardown.  If we rework QEMU startup so that QMP can do
everything the CLI can do, we'll make the QMP command work.


