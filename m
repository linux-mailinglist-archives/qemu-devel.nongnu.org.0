Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E663A9C16
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:38:22 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVkL-000609-TY
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ltVi9-0002Tc-VA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:36:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ltVi8-0000JC-DY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:36:05 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w21so2748760edv.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9sepes8DxqN3TffjB6Y4aaUuUy982RpglfebDNkk6Ck=;
 b=G4dNPQthsd8lyW/Nw9cQowLMQxq+zkzKbR1yCwH+JtrsoKTnXNyECEX1okULSwQO4M
 HWcIyFDDStA9ItHlMB6ZmSgnmsBEWeB55E5WanQn+kgKE26zNFajMLe0ypSape/q+sE6
 hFU/1TiSKY+cLGQMaSEKfWLZUWlWKWi0wAICaK4TG6PtSqV46jmkB/1/j3vqNc5tkxkS
 AQJLoz3HDaINIGvv1WsKj7L09CogKjwz52eVYoDzwQSY8mHOQn/8+yE01kk+XVIcSHRM
 MJx7153IR8CuH2zMGgGiWKQDl1a9x5ucc8dQpznd/rjUh4mbXTLzJ+o0yo6wk0DtFEHR
 iYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9sepes8DxqN3TffjB6Y4aaUuUy982RpglfebDNkk6Ck=;
 b=h1h/JHHSv788UEusHHef/2qreyjatJUJHlyCtX5zxlNknmWpkdQ/yqwOM5Av7mb8ZY
 w9kUCPd0Wx/9yF6ic25I7KeMCWACqVB9FCZ7Zt8cQhB0XL9OAR1odC+5bzQGVrQRW2rW
 Vl/PGch7MO3Qa5mvUarI1niPKrB+RccGXx9fLV4S/0y3qdkMmU2HUb8Bgt2jGFqP49ja
 oQOh+0NWciPVuP7v1O09VXXjTIUWfvOypX0N37ORFuje0EP+scrbNGVf7uiHbQOhYsQk
 7Xn3J9JiRiW2SOYIeEzO9JnamTnCa9aMB7Ly/BXtCW6G+LD7SrqFaBzZGm4rYiPHR7ZG
 tq2Q==
X-Gm-Message-State: AOAM533QX+IVBiEH0HZ3AQNX7428tQQTCB3rrRbggefRk8yKspwhk1tS
 kg8Tpnm5rQdl/S8T/fI2L0KgkRemOojBGz9F5/I=
X-Google-Smtp-Source: ABdhPJz6Y2rXxwFMI4ozxf+dilQaIjsbB766s22hPmWx9nu6M9fbyJMIhK4s8ETnRfK0ONhfDNqZplJoLqUA6YyyXyg=
X-Received: by 2002:a05:6402:4242:: with SMTP id
 g2mr4236639edb.350.1623850560901; 
 Wed, 16 Jun 2021 06:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-21-richard.henderson@linaro.org>
In-Reply-To: <20210616011209.1446045-21-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Jun 2021 06:35:49 -0700
Message-ID: <CAMo8BfJHQx0mUxfMwXVjOhUmB+GNoZJn1Doqi0MEgYHdFPa7fg@mail.gmail.com>
Subject: Re: [PATCH 20/21] linux-user/xtensa: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 6:12 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the rt signal trampoline.
> Use it when the guest does not use SA_RESTORER.
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/xtensa/target_signal.h |  2 ++
>  linux-user/xtensa/signal.c        | 50 ++++++++++++++++++-------------
>  2 files changed, 32 insertions(+), 20 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

