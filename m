Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36620262EA0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 14:38:35 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFzMw-0007Qf-AE
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 08:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kFzLg-0006tm-Mp
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:37:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58804
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kFzLd-0007Eu-TH
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599655030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9Wugqb+Pkhckxv/g9pk2JnXVTZZJmsx64zWhb4s5UEw=;
 b=S3H4x5f9taB9m65JsxXByhJBCoar3KZHsJomkwc/xnlFQs5E+XkDlN4xClsv4PCqrX15VI
 ZqLsgBRr6VfJIcT3b+4XHPjQ79GlvA1vvQo/4MxFU3gocf3EtzEGw9ZaJ7zUbn32riU4AB
 So/CjtT748zz5YCsf6XPQnSm/kJZCAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-GmcKuA6DOaq1eGewjKgjnQ-1; Wed, 09 Sep 2020 08:37:07 -0400
X-MC-Unique: GmcKuA6DOaq1eGewjKgjnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECF4C1007466
 for <qemu-devel@nongnu.org>; Wed,  9 Sep 2020 12:37:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF9AC7D4FA;
 Wed,  9 Sep 2020 12:37:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2D7F113865F; Wed,  9 Sep 2020 14:37:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Subject: Meson can't recover from deletion of generated QAPI file(s)
Date: Wed, 09 Sep 2020 14:37:01 +0200
Message-ID: <87pn6vw2he.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:05:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Watch this:

    $ rm qapi/qapi-types-error.h 
    $ make
    Generating qemu-version.h with a meson_exe.py custom command
    Compiling C object qom/libqom.fa.p/object_interfaces.c.o
    In file included from ../qom/object_interfaces.c:4:
    /work/armbru/qemu/include/qapi/error.h:275:10: fatal error: qapi/qapi-types-error.h: No such file or directory
      275 | #include "qapi/qapi-types-error.h"
          |          ^~~~~~~~~~~~~~~~~~~~~~~~~
    compilation terminated.
    make: *** [Makefile.ninja:348: qom/libqom.fa.p/object_interfaces.c.o] Error 1

To recover, I have to run qapi-gen.py manually and exactly right, or
blow away the build tree and start over.

The old build system did what a build system should: it remade the files
that are missing or out of date.

I'm still too clueless about Meson to debug this, but I hope I can learn
from watching you fix it.


