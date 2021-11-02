Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964844431B7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:29:44 +0100 (CET)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvjL-0007Nx-PC
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvRr-0008Pi-0R
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:11:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvRo-000477-DH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635865894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Jcawyih0IhXHAtPN2U7m79nSZpmBFnmGHQ2HrKiZmY=;
 b=hYgJUobJmYWSUitvzGdsVVMjH4kNN861JiZdJnvq0ghhriw6VlBTr3TMG9dS8WQTKc3S75
 dlkQ+hrnN0hYDaDRl9XKn5jSkj0FtcEJXQiAEyvxJquuS4GBNSk89bdfiGsHWVYSz6x0Sj
 5jfod01l0q+PiMt+RByhMpf90KNpPJU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-IDS1mPYyNt6lBIx4-4g-cg-1; Tue, 02 Nov 2021 11:11:33 -0400
X-MC-Unique: IDS1mPYyNt6lBIx4-4g-cg-1
Received: by mail-wm1-f72.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso7132405wme.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Jcawyih0IhXHAtPN2U7m79nSZpmBFnmGHQ2HrKiZmY=;
 b=wCr4OreI7P7S+bCxomFEK7/fum0+v4PxGyhX5G7NoyCZ4HJ8IH/OBqF7XJbFczty/3
 BqKpcHuTJbDEp9UiGPzzKk8bT8eXtRiKQgISnt2umJkFUZCb96VMXq0LuTzYkpZjGaHL
 spTSW8i8cUYcGPJrmnf6nr1Ql224Zxw9o2XZ5BIOTmaL6HeRazWLMDp5Lz2bh6qy8S1j
 F9enCcYbVaMNcuv8QYg3kNHKgKHMVgqHkq6wS8uYQKcnMinepduIuUDvlWSsmrRNpqkL
 IYqFJ15wIi/IyBU8vOLY8xqdWERTEWvFktFf+8rcEanEEo2Ftg2ykmTNxEW7MGoU0SNJ
 jMNw==
X-Gm-Message-State: AOAM530eDNbOLT8XlJ9YBlxqoTmVQP9QLZgKaksd/L7P4sxTmJ/PGHfv
 circO09wBUiyucd6xHVzNHwERLY7tbVkHKANG4kTEsF6DuHBFs24NcuT1P2YkL/y+EzyJOK9si7
 heomAwC3pOlVQn6o=
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr994390wri.322.1635865892244; 
 Tue, 02 Nov 2021 08:11:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSEyA7hHQQjSr/MddmWS9fdVYnTlwS+mjOBv5erJghsyGc+Gd9Zk/vikDdw5t4AlBD7sGp2A==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr994351wri.322.1635865892049; 
 Tue, 02 Nov 2021 08:11:32 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y6sm18608309wrh.18.2021.11.02.08.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:11:31 -0700 (PDT)
Message-ID: <8057a01d-4fe3-cfe5-bed6-545d1990589a@redhat.com>
Date: Tue, 2 Nov 2021 16:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 06/22] monitor: introduce HumanReadableText and HMP
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This provides a foundation on which to convert simple HMP commands to
> use QMP. The QMP implementation will generate formatted text targeted
> for human consumption, returning it in the HumanReadableText data type.
> 
> The HMP command handler will simply print out the formatted string
> within the HumanReadableText data type. Since this will be an entirely
> formulaic action in the case of HMP commands taking no arguemnts, a
> custom command handler is provided.
> 
> Thus instead of registering a 'cmd' callback for the HMP command, a
> 'cmd_info_hrt' callback is provided, which will simply be a pointer
> to the QMP implementation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  include/monitor/hmp.h       |  3 +++
>  include/monitor/monitor.h   |  2 ++
>  include/qapi/type-helpers.h | 14 ++++++++++++++
>  monitor/hmp.c               | 31 ++++++++++++++++++++++++++++---
>  monitor/misc.c              | 18 +++++++++++++++++-
>  monitor/monitor-internal.h  |  7 +++++++
>  qapi/common.json            | 11 +++++++++++
>  qapi/meson.build            |  3 +++
>  qapi/qapi-type-helpers.c    | 23 +++++++++++++++++++++++
>  9 files changed, 108 insertions(+), 4 deletions(-)
>  create mode 100644 include/qapi/type-helpers.h
>  create mode 100644 qapi/qapi-type-helpers.c

> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index d50c3124e1..352a4d9c80 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1061,6 +1061,31 @@ fail:
>      return NULL;
>  }
>  
> +static void hmp_info_human_readable_text(Monitor *mon,
> +                                         HumanReadableText *(*handler)(Error **))
> +{
> +    Error *err = NULL;
> +    g_autoptr(HumanReadableText) info = handler(&err);
> +
> +    if (hmp_handle_error(mon, err)) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, "%s", info->human_readable_text);
> +}

Missing:

-- >8 --
diff --git a/monitor/hmp.c b/monitor/hmp.c
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -35,6 +35,7 @@
 #include "qemu/log.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "monitor/hmp.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
---

to avoid:

monitor/hmp.c: In function ‘hmp_info_human_readable_text’:
monitor/hmp.c:1070:9: error: implicit declaration of function
‘hmp_handle_error’ [-Werror=implicit-function-declaration]
 1070 |     if (hmp_handle_error(mon, err)) {
      |         ^~~~~~~~~~~~~~~~
monitor/hmp.c:1070:9: error: nested extern declaration of
‘hmp_handle_error’ [-Werror=nested-externs]
cc1: all warnings being treated as errors


