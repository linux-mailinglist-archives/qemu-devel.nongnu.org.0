Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78698508B04
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:45:08 +0200 (CEST)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBZr-0004Gn-JL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBG4-00050W-7V
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBG0-0005lB-N5
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650464675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1fYOXTs7DjhvQhl5fjsznzVh5rkLXwSVX4eMjgpnhg=;
 b=FodbiZ8PN6i8mkx3hiy/M6tkOITSXGZF1lpv2eXU/JItQRj9rUyWdbO7XDfTPsFuWaOmpP
 m/B1fAOLwUZjCTiK1VNbhyQjKLjTm0sKajlHY1L0G1FA6jadZfSV9TgNg0r1YfxULSleyL
 L64lhkVowRy6PrUpSg79rhGiPIMuSyI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-IaGkkJJDP3a8CWbmRtubZw-1; Wed, 20 Apr 2022 10:24:34 -0400
X-MC-Unique: IaGkkJJDP3a8CWbmRtubZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j30-20020adfb31e000000b0020a9043abd7so447340wrd.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y1fYOXTs7DjhvQhl5fjsznzVh5rkLXwSVX4eMjgpnhg=;
 b=3+oGVBDuFGuITzsLVURhDVj6BjK97GsENlbDFfSffad+FaV82+tOv82XqNSvSuGVz9
 Skg3KypM9uULLXiniVINJSsN19uPJezkax/54yU+eQ6qFVYhMhl0Av098K48CrkSICOx
 L7eo2kCCucJpcuAVU6DS51X0OsQJQJt78/m8nYPW30YKuLX/FUDXvT7WeBA8LdKiknWO
 bG9pJ62Cxi+ssaq01PDVetI8QVJiwSj7Cn8d70ZWV0HnlblE0m5aaL+mHNtGcEsAjk3V
 eORJlQ0KeAmXJ3kX88SZgRG3uGBZfSxmJ/YSzdpZAqVMO+bqa6eLSaIs2ZDx7G3LPajB
 4U1Q==
X-Gm-Message-State: AOAM532ldxwINVr7sT7xZEwXsvDhuheQjfS1IU12wgniEOdjrkh/vLC0
 3A7gKIZWrtew5LxM31+TPQ8D1xRQ+p1vwzcnILvaTs0fpmz9k0nedSkeXBK34mT8NsGbvZwq7S8
 vXaRQSz/YWydz7Ho=
X-Received: by 2002:a05:600c:4fd0:b0:392:8cd5:8abe with SMTP id
 o16-20020a05600c4fd000b003928cd58abemr3976527wmq.73.1650464673309; 
 Wed, 20 Apr 2022 07:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9eF7n+WXvYpt5DhJ93R3ISBcVi05+03LM/rX6i095m2la+BIq8dlh431e4bP4nE9wh/TXIQ==
X-Received: by 2002:a05:600c:4fd0:b0:392:8cd5:8abe with SMTP id
 o16-20020a05600c4fd000b003928cd58abemr3976503wmq.73.1650464673037; 
 Wed, 20 Apr 2022 07:24:33 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adffb87000000b00207982c7f4dsm12495wrr.67.2022.04.20.07.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:24:32 -0700 (PDT)
Message-ID: <13a07569-45f3-0b91-6f6d-4a03e6e2a77c@redhat.com>
Date: Wed, 20 Apr 2022 16:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 32/41] qtest: simplify socket_send()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-33-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420132624.2439741-33-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 15.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Reuse qemu_write_full().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/libqtest.c | 16 ++--------------
>   1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7b5890dcc487..2b9bdb947d6f 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -414,21 +414,9 @@ void qtest_quit(QTestState *s)
>   
>   static void socket_send(int fd, const char *buf, size_t size)
>   {
> -    size_t offset;
> -
> -    offset = 0;
> -    while (offset < size) {
> -        ssize_t len;
> +    size_t res = qemu_write_full(fd, buf, size);
>   
> -        len = write(fd, buf + offset, size - offset);
> -        if (len == -1 && errno == EINTR) {
> -            continue;
> -        }
> -
> -        g_assert_cmpint(len, >, 0);
> -
> -        offset += len;
> -    }
> +    assert(res == size);
>   }
>   
>   static void qtest_client_socket_send(QTestState *s, const char *buf)

Reviewed-by: Thomas Huth <thuth@redhat.com>


