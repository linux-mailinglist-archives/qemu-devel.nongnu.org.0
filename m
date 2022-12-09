Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0B647D27
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 06:14:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3VgK-0003Cf-49; Fri, 09 Dec 2022 00:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3VgH-0003C9-Pe
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3VgC-0005R6-Vk
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670562731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4mAX+3yAO6JDzLnI8LA/LlpCQtIBkbM1bQQCxHWdpOI=;
 b=A4WnatFrBkuR9VBsjN8UNJKZ8WnQZRZYZGZodB48IEp6DHyUHOUQ54HcBTn4az0xZHnbJT
 aT6PBSIX8q+3XhxmkWBhK+EAOkf10Pk8YsvZgYitG/arO3MNjfBm1x6ypSCZz/ECVT8xtC
 GU7RjPjZ46fnYHhLcNgNIvYMlHAlkzM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-2scPtLKHOSaXc60Vteyzyw-1; Fri, 09 Dec 2022 00:12:07 -0500
X-MC-Unique: 2scPtLKHOSaXc60Vteyzyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A00E029AB412;
 Fri,  9 Dec 2022 05:12:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E54940C2065;
 Fri,  9 Dec 2022 05:12:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5E63321E6921; Fri,  9 Dec 2022 06:12:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Daniel P. Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Target-dependent include path, why?
Date: Fri, 09 Dec 2022 06:12:04 +0100
Message-ID: <87edt9gnyz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I stumbled over this:

    ../include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No such file or directory
       12 | #include <pixman.h>
          |          ^~~~~~~~~~

Works when included into target-dependent code.

Running make -V=1 shows we're passing a number of -I only when compiling
target-dependent code, i.e. together with -DNEED_CPU_H:

    -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/spice-server -I/usr/include/spice-1

    -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC

    -isystem../linux-headers -isystemlinux-headers

Why?


