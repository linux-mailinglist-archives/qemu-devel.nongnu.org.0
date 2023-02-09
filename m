Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3296914EC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGgt-0000AV-7L; Thu, 09 Feb 2023 18:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGgi-0008WM-Qd
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:50:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGge-000237-6L
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675986642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LmzMiG9ZWfC0slZgIS8E7QOPYR2iwyK5gNfVNidwks=;
 b=FAp35QKjQaQ1XDaapLVSoF77a8nq1PI+cBZkVwbzIkQPoJ6ZKgsdi2daVoVV/wGYWR2puO
 GNCRRkmwxvbfhIBUSbY4oDhO9vXS1pnVJTmzvFMtHf46enXkmlTH0T+wujlc2ULVZlwuPI
 1pt8njIuKEk+tiKaOFFwmh7kja9yWVc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-ONVn5UD_N2epxySGbb6RdQ-1; Thu, 09 Feb 2023 18:50:41 -0500
X-MC-Unique: ONVn5UD_N2epxySGbb6RdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so3608131wmq.9
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 15:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/LmzMiG9ZWfC0slZgIS8E7QOPYR2iwyK5gNfVNidwks=;
 b=nQesCKXSlKUI12mvm1xJ6YN8DhvsELC7w1Q1jYR2PattxZO+aaLCNqfNE4t8HWKXXO
 XBg3hc/4Q7q6c3WC3W4ilSZi9KTgXWlE6YbC9ebb3blfNRI5omw+XmktgroGq5I3HfnY
 qNdFZRmP6AnWbLlZMF3MK2bIMnFOXasMB90AzoKmlzX8rQplA1XuxsQVLuofcYGoc1xY
 N0hcr4XzuO9I9saOJfzKOG0C+W8Jx+8fIsGV/DYhZOEr039ET6nuRyzawaFwn2kgGInd
 J03fz3u69rcwy9skiL0saaGFYgWQFjIsa3JFFVBqr/MAHk4GWo+UqxLraJMzBvHWzfmM
 gwiA==
X-Gm-Message-State: AO0yUKUhfkRbapLPVujbsnGYLkg49xE9fINSKFBUJmM8ca84/cWqFty8
 zCHQOymppMGH19hnD9tn0EyknltUXDzgrVKYx7r3RWmW0SRU4BpMOfk2Kl+QpEEP7SDuXy5ADmf
 +YUAHIdDCSSxKhbc=
X-Received: by 2002:adf:e351:0:b0:2bf:d680:e37a with SMTP id
 n17-20020adfe351000000b002bfd680e37amr12204275wrj.67.1675986640163; 
 Thu, 09 Feb 2023 15:50:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9CwQ6yH9O+Kran1lZfbzcn7DdfyFiuOznj0P04g2oAHBSz0ovsnxb0lhHG0JCKinbII0PKvg==
X-Received: by 2002:adf:e351:0:b0:2bf:d680:e37a with SMTP id
 n17-20020adfe351000000b002bfd680e37amr12204256wrj.67.1675986639837; 
 Thu, 09 Feb 2023 15:50:39 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm2230523wrf.98.2023.02.09.15.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 15:50:39 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: ling xu <ling1.xu@intel.com>,  qemu-devel@nongnu.org,
 dgilbert@redhat.com,  Zhou Zhao <zhou.zhao@intel.com>,  Jun Jin
 <jun.i.jin@intel.com>,  Thomas Huth <thuth@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [PATCH v7 2/2] Update bench-code for addressing CI problem
In-Reply-To: <9a51b2a6-2e56-d090-5083-b710048fdbbc@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 9 Feb 2023 23:46:24
 +0100")
References: <20221116152923.1087185-1-ling1.xu@intel.com>
 <20221116152923.1087185-3-ling1.xu@intel.com>
 <9a51b2a6-2e56-d090-5083-b710048fdbbc@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 00:50:38 +0100
Message-ID: <87sffez9dd.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 16/11/22 16:29, ling xu wrote:
>> Unit test code is in test-xbzrle.c, and benchmark code is in xbzrle-benc=
h.c
>> for performance benchmarking. we have modified xbzrle-bench.c to address
>> CI problem.
>> Signed-off-by: ling xu <ling1.xu@intel.com>
>> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
>> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
>> ---
>>   tests/bench/meson.build    |   4 +
>>   tests/bench/xbzrle-bench.c | 469 +++++++++++++++++++++++++++++++++++++
>>   tests/unit/test-xbzrle.c   |  39 ++-
>>   3 files changed, 507 insertions(+), 5 deletions(-)
>>   create mode 100644 tests/bench/xbzrle-bench.c
>
>
>> diff --git a/tests/bench/xbzrle-bench.c b/tests/bench/xbzrle-bench.c
>> new file mode 100644
>> index 0000000000..8848a3a32d
>> --- /dev/null
>> +++ b/tests/bench/xbzrle-bench.c
>> @@ -0,0 +1,469 @@
>> +/*
>> + * Xor Based Zero Run Length Encoding unit tests.
>> + *
>> + * Copyright 2013 Red Hat, Inc. and/or its affiliates
>> + *
>> + * Authors:
>> + *  Orit Wasserman  <owasserm@redhat.com>
>
> Is Orit the real author? Or is it based on migration/xbzrle.c?

Based on as far as I can se.

>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + */
>> +#include "qemu/osdep.h"
>> +#include "qemu/cutils.h"
>> +#include "../migration/xbzrle.h"
>
> Interesting migration include path. Similarly:

xbzrle.h is only exported for migration.  Nothing else can use them.
So we can't put that on include/migration/*

> $ git grep -F '#include "../' tests | egrep -v
> '(../libqtest.h|tests/tcg/mips|../multiarch)'
> tests/qtest/netdev-socket.c:12:#include "../unit/socket-helpers.h"
> tests/unit/test-qgraph.c:20:#include "../qtest/libqos/qgraph.h"
> tests/unit/test-qgraph.c:21:#include "../qtest/libqos/qgraph_internal.h"
>
> tests/migration/aarch64/a-b-kernel.S:14:#include "../migration-test.h"
> tests/unit/test-vmstate.c:27:#include "../migration/migration.h"
> tests/unit/test-vmstate.c:30:#include "../migration/qemu-file.h"
> tests/unit/test-vmstate.c:31:#include "../migration/savevm.h"
> tests/unit/test-xbzrle.c:15:#include "../migration/xbzrle.h"
>
> $ ls -1 migration/*.h
> migration/block.h
> migration/channel-block.h
> migration/channel.h
> migration/dirtyrate.h
> migration/exec.h
> migration/fd.h
> migration/migration.h      [*]
> migration/multifd.h
> migration/page_cache.h
> migration/postcopy-ram.h
> migration/qemu-file.h      [*]
> migration/ram.h
> migration/rdma.h
> migration/savevm.h         [*]
> migration/socket.h
> migration/threadinfo.h
> migration/tls.h
> migration/trace.h
> migration/xbzrle.h         [*]
> migration/yank_functions.h
>
> $ ls -1 include/migration/*.h
> include/migration/blocker.h
> include/migration/colo.h
> include/migration/cpu.h
> include/migration/failover.h
> include/migration/global_state.h
> include/migration/misc.h
> include/migration/qemu-file-types.h
> include/migration/register.h
> include/migration/snapshot.h
> include/migration/vmstate.h
>
> Do the 4 files marked [*] belong to include/migration/?

The split is:
include/migration/* <- exported for everybody to use
migration/*.h       <- Only for migration

Now, doing tests for migration makes this difference complicated,
because some tests really need things that are not exported.

This is the way that it is normally used in the tree, no?

Later, Juan.


