Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A86BCF83
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmlO-0000zh-18; Thu, 16 Mar 2023 08:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pcmlJ-0000z6-Kp
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pcmlD-0005v3-Rd
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678969870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XR+nBbFQup+KNp6dAhIKQBlyynIiWQ6fypbZTTg9wsY=;
 b=X3DDEOGCBtXxdMEAGN/DzghwL7OS7+EAY+9vgbmijIrYIog32aZRiE2VWxX8RXq3EOf1+p
 LHgWWsBXjAVKHiZ8TzIpMEY/tOeKtaftV0LEIY3eqjGjysbKu7N+edhkhZjEoy+ub+ShPc
 VwASaQA44DdCStehioy+pUS844yXmys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-k11cuZiQNgChNj5OyclFDg-1; Thu, 16 Mar 2023 08:31:06 -0400
X-MC-Unique: k11cuZiQNgChNj5OyclFDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B86F85A588;
 Thu, 16 Mar 2023 12:31:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D320140EBF4;
 Thu, 16 Mar 2023 12:31:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 699D721E675B; Thu, 16 Mar 2023 13:31:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
Date: Thu, 16 Mar 2023 13:31:04 +0100
In-Reply-To: <20230315112811.22355-3-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Mar 2023 12:28:10
 +0100")
Message-ID: <87cz58ubcn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Per the C++ standard, empty enum are ill-formed. Do not generate
> them in order to avoid:
>
>   In file included from qga/qga-qapi-emit-events.c:14:
>   qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
>      20 | } qga_QAPIEvent;
>         | ^
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Two failures in "make check-qapi-schema" (which is run by "make check"):

1. Positive test case qapi-schema-test

    --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/qapi-schema-test.out
    +++=20
    @@ -19,7 +19,6 @@
         member enum2: EnumOne optional=3DTrue
         member enum3: EnumOne optional=3DFalse
         member enum4: EnumOne optional=3DTrue
    -enum MyEnum
     object Empty1
     object Empty2
         base Empty1

   You forgot to update expected test output.  No big deal.

2. Negative test case union-empty

    --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/union-empty.err
    +++=20
    @@ -1,2 +1,2 @@
    -union-empty.json: In union 'Union':
    -union-empty.json:4: union has no branches
    +union-empty.json: In struct 'Base':
    +union-empty.json:3: member 'type' uses unknown type 'Empty'
    stderr:
    qapi-schema-test FAIL
    union-empty FAIL

   The error message regresses.

   I can see two ways to fix this:

   (A) You can't just drop empty enumeration types on the floor.  To not
       generate code for them, you need to skip them wherever we
       generate code for enumeration types.

   (B) Outlaw empty enumeration types.

I recommend to give (B) a try, it's likely simpler.


