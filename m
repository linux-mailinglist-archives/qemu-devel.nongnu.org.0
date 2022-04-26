Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6FA50F9ED
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:13:50 +0200 (CEST)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njICX-00032z-11
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njHYH-0006TM-1K
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njHYE-0006qu-ML
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6spAlwLhmUs0JYp+ViWVmbT568rwl1JZhmAo79h9dQ=;
 b=c0tBbP02/PdVreXOjhqP6P/e3U1zd9IUsHpxYKmPTLtlbsvmGcoM2S7IqaLny6qoyiXEs1
 Crg6WIHCxXBBM4nZWtZ54IV4bXE0+2gauLXJODxy7g/OkxWjfzHXfBsdjCYunvm1Ru6OM0
 hRkxD2vjIo6ekQtKXdZVvKJ3L4kRqK0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-oGUrfz6uNdG-CQEhMWJ1Sw-1; Tue, 26 Apr 2022 05:32:04 -0400
X-MC-Unique: oGUrfz6uNdG-CQEhMWJ1Sw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j21-20020adfa555000000b0020adb9ac14fso1679604wrb.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o6spAlwLhmUs0JYp+ViWVmbT568rwl1JZhmAo79h9dQ=;
 b=2m+cZFMmBZau7BVD2s6M8C8bYjBUUOPtp9qm9deMXFqRqKcaaljKx3J2u8oM7DFxJx
 fuca7qK5Fgy3un0aKrVXOwrtrtt6M0EcE/pNts5pt+SBo+1bd/dyL500z3nlo5oCYHW8
 uAbVTx5BF0YahFe8khuV8zTEyrFb4L97orB1ifj+RHMtHzQH34gmxNiHIoDYgATjGtwC
 yIYlZkwQ19RVxG4QqPHCo0HyzOD3PJyDYZ6R2uXJlsDpfi6D7S8tC3friT6XXT3opnqA
 A/jQ2HbADs8VpbfYDtoy3NpgxZZ6viBPUAK59IkgO9PxJO1OTVnVl+NCIazOc2/WRelC
 wwHQ==
X-Gm-Message-State: AOAM530j7VLGg/cnou3J6B/IlfJ4ZATjjCYyTwqQ9uokG4o6IT1BiUJh
 9yZ0XuNcg9uaR2p/IYSUvPsyaaFlAdfOuqeT1WhLIN+ALeT/3NTqNCxGAQBTn8RX2AZoYbMYetO
 WCNFesJVCyf0SmnI=
X-Received: by 2002:a05:6000:3cc:b0:20a:df53:9a0e with SMTP id
 b12-20020a05600003cc00b0020adf539a0emr5413194wrg.264.1650965523000; 
 Tue, 26 Apr 2022 02:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwELPS+4Ak2F15tG9lIUiz54OvdKhFUCipEVvxcVv7h0C+En1E/Y8w57gpgdSeXp9dolPzEAg==
X-Received: by 2002:a05:6000:3cc:b0:20a:df53:9a0e with SMTP id
 b12-20020a05600003cc00b0020adf539a0emr5413177wrg.264.1650965522788; 
 Tue, 26 Apr 2022 02:32:02 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adfd1c5000000b0020a7954a974sm12776324wrd.34.2022.04.26.02.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 02:32:02 -0700 (PDT)
Message-ID: <50da3bb2-6199-ea6d-99de-b70b708c3d84@redhat.com>
Date: Tue, 26 Apr 2022 11:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/26] tests: make libqmp buildable for win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-8-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220426092715.3931705-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2022 11.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/libqmp.h |  2 ++
>   tests/qtest/libqmp.c | 37 +++++++++++++++++++++++++++++++------
>   2 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
> index 94aa97328a17..772f18b73ba3 100644
> --- a/tests/qtest/libqmp.h
> +++ b/tests/qtest/libqmp.h
> @@ -20,8 +20,10 @@
>   #include "qapi/qmp/qdict.h"
>   
>   QDict *qmp_fd_receive(int fd);
> +#ifndef G_OS_WIN32
>   void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
>                         const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
> +#endif
>   void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
>   void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
>   void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> index 0358b8313dc4..5f451ebee796 100644
> --- a/tests/qtest/libqmp.c
> +++ b/tests/qtest/libqmp.c
> @@ -15,9 +15,15 @@
>    */
>   
>   #include "qemu/osdep.h"
> -
>   #include "libqmp.h"
>   
> +#include <unistd.h>
> +#include <stdlib.h>

unistd.h and stdlib.h should have been added by osdep.h already, so please 
remove these two lines.

  Thomas


