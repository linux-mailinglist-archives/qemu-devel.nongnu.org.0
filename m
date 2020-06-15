Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96F1F9C98
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 18:07:35 +0200 (CEST)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkre2-0006Wx-Fx
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 12:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrcb-0005TN-PG
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 12:06:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrcZ-000205-8z
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 12:06:05 -0400
Received: by mail-ot1-x344.google.com with SMTP id 69so13522686otv.2
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oAxIBrXLEI5B8bnQBR6NKC7z6dng4m0U8TiLwWGPIzY=;
 b=KxIj05u7eR38bLdDIIL/cEobM+KkJYgxbSgVQcWESuheV3Vs4j11sOpUVyzS15UwI9
 LG52KhMo5D81P0OiWNeoYkicKG+XRdodqVuijh+hEClD9vjp+DtH3Ce4VccRN/D19v7c
 Jci9jf2Ms9CCUqy8tqfS3Kmcrb8yxRi23c0WqOJe8EJO1GY/cQWdb1r+hk1bYIfh3m0n
 5RVA5huqaXPHTnhfNoQtV6zw3W6Hdyjtd7vq22fTav+xn8JNNZ5APOCifTlgkH8PgBNg
 Ap23SF+pZbb1+XNlQgiGh0nTaGHdAsAlUA34CHLEKuYaBZFAEXrtnvW7hd22ui9y1mDC
 /dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oAxIBrXLEI5B8bnQBR6NKC7z6dng4m0U8TiLwWGPIzY=;
 b=f1umHtEGSJuxlz0vvMVIdTqyg0nyVWYJkg0uwbFUtGf6Z6fdBwweXvQvySwsUFuAOc
 /iAsLNevh7JFPvuPyLtojefoHcOdZbDSvN79ccHzdRMk9kqIztYR+kkwuHLEruaGoaOL
 xfk0353EvrEbiyrYWTIn4mh1KmromKJ6pPWWjg8BpmJzlTwt0BS+Lu6KDzJlvui6WFkT
 tSDxkXi9y5b9emK5J+sPBYgqbQZ6p73Nz3FMKvjjwtShCwZSyGIzoD7XxjfLJH1F1dpz
 EdEUffj4efCVBfNznQMIA1u2lp/7a8BRaGbb47GLZv1pklNqXtc/aGI9ODUKF7YlX6tt
 YNIg==
X-Gm-Message-State: AOAM533eUPLDc8Du1YmGsw/ThFCiZq36lMLkm4KegjnJfbIL3H26xn5R
 e6IsRX654ULx+/8T1VYE9MwB9lRDOzM20iSRi79cWw==
X-Google-Smtp-Source: ABdhPJyrSTZbe8X1NIykasaUJJAF64lT5L+aO+OOiJ/1awud9WjDRI/kneJF6WrmF9ijKvT67RRYYALPlouGQc2MAFo=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr22660246ote.135.1592237161126; 
 Mon, 15 Jun 2020 09:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200612175440.9901-1-f4bug@amsat.org>
 <20200612175440.9901-3-f4bug@amsat.org>
In-Reply-To: <20200612175440.9901-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 17:05:49 +0100
Message-ID: <CAFEAcA8eYXvXtNP9xqnOs-rNA6d5S-jQBwsVVHA-aFMR7ApXPw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] hw/misc/led: Add LED_STATUS_CHANGED QAPI event
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Jun 2020 at 18:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Allow LED devices to emit STATUS_CHANGED events on a QMP chardev.
>
> QMP event examples:
>
> {
>     "timestamp": {
>         "seconds": 1591704274,
>         "microseconds": 520850
>     },
>     "event": "LED_STATUS_CHANGED",
>     "data": {
>         "name": "Green LED #0",
>         "status": "on"
>     }
> }
> {
>     "timestamp": {
>         "seconds": 1591704275,
>         "microseconds": 530912
>     },
>     "event": "LED_STATUS_CHANGED",
>     "data": {
>         "name": "Green LED #0",
>         "status": "off"
>     }
> }

Is there a proof-of-concept of what might be on the other end of this
QMP link consuming these events and doing something useful with them?

thanks
-- PMM

