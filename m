Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F53511468
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:46:21 +0200 (CEST)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njeFY-0007Li-0t
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njeAX-00058p-K2
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njeAU-0000FW-P9
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651052465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxBhSKSLAAKZlGwwJld7B7GHGv9ZiVqaXR2Hm/AaN4k=;
 b=feQl6H/cNr+2qc8WEbBaRshrX1+MNCwiJR6TRAU01eT/BfLoYxq1eSJcm+niIImRFBshdz
 ph6vloMKVlgJf/VL7c9Iz1xDS75Zz7Xq81m33QF8+BNJdoiOiU28QPvk6OHIwE3uj/g482
 pewfhKYU5Tlv6c8VJ+QWzhKnfBpNUsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-xj6EAHoNODeDUm6k_eoIHA-1; Wed, 27 Apr 2022 05:41:04 -0400
X-MC-Unique: xj6EAHoNODeDUm6k_eoIHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso526218wma.9
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 02:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oxBhSKSLAAKZlGwwJld7B7GHGv9ZiVqaXR2Hm/AaN4k=;
 b=KZCHQWmMg2JRZVW67VAQSR2kYjHin5Ip+X2XG6jQTTQ7WYIS9vyB8kfZssdojRivml
 7MvOP0EgWBjnWQMhSp/DuYn6RSmwWzksH8SVIXU4Y4bf9DKvWCiLQ7DpeYDSXSoVFATA
 e7lwjuvnmruess/opEsrEDrRF8AN7cRtjF/ZYuLQtH1IR+O9FTtnLKryCvzxqhlPhVPU
 2qr3cBRZueFgst38sQvndUiCVgLzTknHhDGt1tmwcwsPwE+pJfJby7UtT3HE81pDCtRZ
 DzpsRpFh+8akWO86IOPxhUcaGbUp3vlVuW1Z2eflPzkaZjuGA5bB47i7zjL/26ky+lh9
 +k3w==
X-Gm-Message-State: AOAM531qxaBPr/+ca+pt6e76lFI6SrQUoFkBETcdZ59nOkTNwr2t/l1E
 W+9oLjQMzjW8bC6cGzzzK4vizZu02yO5RQPOK/Zyq8ByAr2yf1SWeEwlrH3WJg+Ck4rnJS9WhVG
 M+dcj67CW1OiKzUs=
X-Received: by 2002:adf:d1e4:0:b0:20a:f21e:2fb2 with SMTP id
 g4-20020adfd1e4000000b0020af21e2fb2mr720184wrd.281.1651052463596; 
 Wed, 27 Apr 2022 02:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIWSN2yduICrgcSSeo0WvsIr8Bqx5D2I9mK/m1Ll3szCM7U+0bfda+6R37V4K0CXPSrpwvNw==
X-Received: by 2002:adf:d1e4:0:b0:20a:f21e:2fb2 with SMTP id
 g4-20020adfd1e4000000b0020af21e2fb2mr720177wrd.281.1651052463426; 
 Wed, 27 Apr 2022 02:41:03 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g25-20020adfa599000000b0020aeb9e5bdfsm1828823wrc.43.2022.04.27.02.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:41:02 -0700 (PDT)
Message-ID: <1a33c268-6d00-4385-f0d2-84a86b022f63@redhat.com>
Date: Wed, 27 Apr 2022 11:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 25/26] tests: replace qemu_set_nonblock()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-26-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220426092715.3931705-26-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 26/04/2022 11.27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The call is POSIX-specific. Use the dedicated GLib API.

g_unix_set_fd_nonblocking() is also available on Unix-like systems according 
to its name, I suppose? So what's the advantage of this change?

  Thomas


> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/vhost-user-test.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index ee30f5479648..a2cec8768462 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -302,6 +302,7 @@ static int chr_can_read(void *opaque)
>   
>   static void chr_read(void *opaque, const uint8_t *buf, int size)
>   {
> +    g_autoptr(GError) err = NULL;
>       TestServer *s = opaque;
>       CharBackend *chr = &s->chr;
>       VhostUserMsg msg;
> @@ -394,7 +395,8 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
>            * The receive function forces it to be blocking,
>            * so revert it back to non-blocking.
>            */
> -        qemu_set_nonblock(fd);
> +        g_unix_set_fd_nonblocking(fd, true, &err);
> +        g_assert_no_error(err);
>           break;
>   
>       case VHOST_USER_SET_LOG_BASE:


