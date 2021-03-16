Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E833D0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:30:07 +0100 (CET)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM61e-0003al-R3
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM60P-0002uk-Vf
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM60O-0002gS-6z
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615886927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15j5emuJ3X3+qpN1itcf6S9fso563IiZyiKXYDP9M8o=;
 b=UaMhzgQsVIVk8A4uv1eNYkzVevEO0Gx6bhlZA6A6Mshs5C1xYFqHVOdyLb09zCv5JVXBez
 jp0mxPSFN6jRKs2LDMdJXvDoF3/0nyquGUnl9fWfFo5zI1nQPyP0u+Ss69IlVodG79axkf
 dAefHpK48e6s91xm7/8bo87YyLew+Vc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-sMmGCPaqPmGNyqrLqWzj0w-1; Tue, 16 Mar 2021 05:28:45 -0400
X-MC-Unique: sMmGCPaqPmGNyqrLqWzj0w-1
Received: by mail-wr1-f70.google.com with SMTP id n17so16399431wrq.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 02:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15j5emuJ3X3+qpN1itcf6S9fso563IiZyiKXYDP9M8o=;
 b=kyWPNFwwN7SRip0v2Qw7bml2VHdJKkbmUOQsfo9q7+9QJVXLkOM45k8gvNfGX1uNlE
 QqWfUCuXfkgnsjlpWUoWyvL5c2orQ8yV5TJQAzU32Oh3HAYqB1zPBNaFwh49yvo68K1T
 bD+pwepMBcLXT3vdAP/FXRtkucXXNcOG0NZ3Qeo+QdFFdVFazNILlAM7FPyQOIIZgWMP
 2JhCCbQ4n5BvQRKLlI2pCl+fZJiGHNDFM5h+FDrGRDUnR1W1vse7E553tA4lIUHe5ei0
 NaR2l+q0Mh0RBZWYm/dDuMW9MJSw1cNf5eKgaz5dTAiFy0xnCt5FUC2zrzNoOCHrsJAY
 y9rA==
X-Gm-Message-State: AOAM533FONs7/b6weDRwF4M0azHvgXszSGwt85bICuqmDS1sMn7EODZH
 Rfu2mVVra1xEQYiK0KhKJeHS1C9mRmL7SmRebWOYVCVdW1iFKGjFJUWYDqe+RhI8k+ZGEnAfmnl
 BpNEW4cSIcP6Itno=
X-Received: by 2002:adf:ded1:: with SMTP id i17mr3866527wrn.349.1615886924562; 
 Tue, 16 Mar 2021 02:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGBuaphiRMQb+wb0LBhS19t/jsghZgJ02jwIYM3hbxBchV+LZxyklGtTjiFbEHErse6jJbvQ==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr3866513wrn.349.1615886924396; 
 Tue, 16 Mar 2021 02:28:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j30sm24005604wrj.62.2021.03.16.02.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 02:28:43 -0700 (PDT)
Subject: Re: libqemuutil
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <87zgz38o0v.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0c5aa88-029e-4328-7a53-482a3010c5f8@redhat.com>
Date: Tue, 16 Mar 2021 10:28:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zgz38o0v.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 10:07, Markus Armbruster wrote:
> I suspect the linker happens to pick the one that makes things work,
> until something in my patch makes it pick the other one.

Ouch.  Fortunately the stub is unnecessary and can be removed.

----------- 8< ------------
 From fe45350cc11434efe3461c540bb0f258bbe010f7 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Mar 2021 05:25:48 -0400
Subject: [PATCH] qemuutil: remove qemu_set_fd_handler duplicate symbol

libqemuutil has two definitions of qemu_set_fd_handler.  This
is not needed since the only users of the function are
qemu-io.c and the emulators, both of which already include
util/main-loop.c.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/stubs/meson.build b/stubs/meson.build
index a054d5877f..8a3e804cf0 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -34,7 +34,6 @@ stub_ss.add(files('ram-block.c'))
  stub_ss.add(files('ramfb.c'))
  stub_ss.add(files('replay.c'))
  stub_ss.add(files('runstate-check.c'))
-stub_ss.add(files('set-fd-handler.c'))
  stub_ss.add(files('sysbus.c'))
  stub_ss.add(files('target-get-monitor-def.c'))
  stub_ss.add(files('target-monitor-defs.c'))
diff --git a/stubs/set-fd-handler.c b/stubs/set-fd-handler.c
deleted file mode 100644
index bff7e0a45a..0000000000
--- a/stubs/set-fd-handler.c
+++ /dev/null
@@ -1,10 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu/main-loop.h"
-
-void qemu_set_fd_handler(int fd,
-                         IOHandler *fd_read,
-                         IOHandler *fd_write,
-                         void *opaque)
-{
-    abort();
-}

> Is qemu_set_fd_handler() the only one?  Nope:
> 
>      $ nm --defined-only bld-x86/libqemuutil.a | awk '/ T / { print $NF }' | sort | uniq -c | grep -v '^ *1 '
>            2 qemu_set_fd_handler
>            2 yank_generic_iochannel
>            2 yank_register_function
>            2 yank_register_instance
>            2 yank_unregister_function
>            2 yank_unregister_instance
> 
> I didn't run into this issue when I posted my series last Friday.  The
> issue now blocks its merge, and today is the soft freeze.  Help!

For yank_*, I suggest moving the non-stub version to monitor/ and adding 
it to the qmp_ss sourceset.

Paolo


