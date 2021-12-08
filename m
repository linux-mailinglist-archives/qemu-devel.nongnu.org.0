Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E546CF42
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 09:42:29 +0100 (CET)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1musWy-0006dq-Cg
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 03:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1musUt-0004lg-Lb
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:40:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1musUn-0006CW-0p
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638952811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJcOtcS/1pR/HbNTJUp8DlKhLlhn+3+i4qIOcl2cvrk=;
 b=fGzeFi0ghaLO45heTslOzrV5P9ZqVyfutGnOLo/6FkeOL/0Z++NLUlN+IaeMG0nvalcqdu
 fd5XIcpTDV09qhbJdQqnZfWzWKDFcWXJm6/j+FF5RPS2ii23fXL3Yskj4Z/ZPEeS5jP8BL
 y6tyj8pPaLORFr+hojA8tqF3duqW8A4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182--lyZ6caVNX-LCjqhrpboeg-1; Wed, 08 Dec 2021 03:40:10 -0500
X-MC-Unique: -lyZ6caVNX-LCjqhrpboeg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so926145wmj.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 00:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HJcOtcS/1pR/HbNTJUp8DlKhLlhn+3+i4qIOcl2cvrk=;
 b=voTw1kAupqEfLmfc/SCe/N1jtPy0o1WII3qoICviuGlVCZKcxIl9+WkcuMnIFNQWDg
 TFxu7H6Fd0JYDASicr14yaLf4DmgAHWOn9GCQ3YYze5394pDwl1N/oDFcmVDHcqHGlom
 Y9FnhzIGIitRkM2i/arlq+KdMFOlZUrmNZh/nznBuDRdbbaN+gCEXKYnVnRO3xiXQgaW
 ePA/GYyAXD9BTQ3HLTsH30o9P+r9JUs8KH3JBwpWpHHBhVaA9sga57vnu1bKITqPibes
 kdfkMMnYRndBD33OnJFLpw2Q9QuO2sCBejCvB+Aio6NadSQ1AkSfSVzSVTKBTGlcsamd
 ofzw==
X-Gm-Message-State: AOAM531DvwJKA2XNFz9oAGtn2qVXWUQ2PzNTsiufYW4A6aAFt7MUm8Rn
 pit75Y0OCIJlRKYAw3UXKPpUJvGFqFwYil3g96hWnOxqqMMTtmimtYvpzyzjkrg97Fn4KLQBa0i
 5g07tpDY/EGdRd14=
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr56556753wry.441.1638952808996; 
 Wed, 08 Dec 2021 00:40:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwariSoJZzuaVrPdfRxpDuEc4iH27pkRwbPj2/0GTFreU4Tk4d5JpsjiWi7aDLCvfWlABViA==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr56556733wry.441.1638952808817; 
 Wed, 08 Dec 2021 00:40:08 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e24sm2114091wra.78.2021.12.08.00.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 00:40:08 -0800 (PST)
Message-ID: <393f9756-6b7d-8da4-67c4-d45c4ac3f2bd@redhat.com>
Date: Wed, 8 Dec 2021 09:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] ui/clipboard: Don't use g_autoptr just to free a
 variable
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211207204038.664133-1-jsnow@redhat.com>
 <20211207204038.664133-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211207204038.664133-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 21:40, John Snow wrote:
> Clang doesn't recognize that the variable is being "used" and will emit
> a warning:
> 
>   ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>       g_autoptr(QemuClipboardInfo) old = NULL;
>                                  ^
>   1 error generated.
> 
> OK, fine. Just do things the old way.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  ui/clipboard.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


