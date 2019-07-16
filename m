Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9303D6A65D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 12:21:21 +0200 (CEST)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnKaG-00052I-AN
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 06:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hnKa3-0004Zd-N0
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 06:21:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hnKa2-0004mz-IR
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 06:21:07 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hnKa2-0004j1-CF
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 06:21:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so18090718wma.1
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 03:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KDxrHfk+Cgj/Vj80FiyYkD8+55on8kzjbFMC2tWv0BA=;
 b=FyuJXy/p7H8DyEW2u10QGXAaap1ukEeJ3Py/glI7usQdP4cRM+zBlSXI39utm3Faoz
 Fhlo6PhG4pcYX37s2bqNXW7jOcSGlnVMXHg+etjCVwElb6NbGvBFj0Wrz8BTnkpiTEDB
 jmJEIBR7+yWGbX5+g9XNTZjT0+C4eneMz+WMNO6ZWz/oEKz98EsHeV289g2Osam8aDTA
 PrNJx6eghTE6qRc9dYbKOERqTxgiLkBcc76uKhBYXP0QuTNAoVkk02INAs7G1TOyd0i7
 6/BojyAZq8METq+IVb6qE2AwtN+QyIaW3R2keNdcHiZtaKmj+U+iZfSS6M1oLFnTyoj3
 rcQg==
X-Gm-Message-State: APjAAAUx8wix/m6fdK6UabK1YLRo4fYSoCK4zEQQgrIzBNKZCLLlFioh
 PxxVWO18gJNmePmevgoNeKoT7w==
X-Google-Smtp-Source: APXvYqxYNc2N23oXRBmJLdI5eA2xh0m2K+n/vVoVLppTJeXGtc8t0shorsBjGFvcDoJCwaJLXUvZZA==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr31750750wml.51.1563272463608; 
 Tue, 16 Jul 2019 03:21:03 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id x17sm15661465wrq.64.2019.07.16.03.21.02
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 03:21:03 -0700 (PDT)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20190716100731.29843-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c3e74283-5050-ec15-6f19-84b5e013e5bf@redhat.com>
Date: Tue, 16 Jul 2019 12:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190716100731.29843-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v2] nbd: fix uninitialized variable warning
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was writing on your v1 "it might be worth commenting this is when
building with -O3"

This might be as easy as having the subject modified (by maintainer
taking this patch?) as:

"fix uninitialized variable warning [when building with -O3]"

On 7/16/19 12:07 PM, Marc-André Lureau wrote:
> ../block/nbd.c: In function 'nbd_co_request':
> ../block/nbd.c:745:8: error: 'local_reply.type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      if (chunk->type == NBD_REPLY_TYPE_NONE) {
>         ^
> ../block/nbd.c:710:14: note: 'local_reply.type' was declared here
>      NBDReply local_reply;
>               ^~~~~~~~~~~
> ../block/nbd.c:710:14: error: 'local_reply.flags' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> ../block/nbd.c:738:8: error: 'local_reply.<U4be0>.magic' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      if (nbd_reply_is_simple(reply) || s->quit) {
>         ^
> ../block/nbd.c:710:14: note: 'local_reply.<U4be0>.magic' was declared here
>      NBDReply local_reply;
>               ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 81edabbf35..0f74c1e455 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -707,7 +707,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
>                                           void **payload)
>  {
>      int ret, request_ret;
> -    NBDReply local_reply;
> +    NBDReply local_reply = {};
>      NBDStructuredReplyChunk *chunk;
>      Error *local_err = NULL;
>      if (s->quit) {
> 

