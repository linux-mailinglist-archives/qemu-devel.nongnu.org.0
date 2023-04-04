Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C86D6DB6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 22:14:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjn1B-0002QE-Tv; Tue, 04 Apr 2023 16:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjn16-0002Pi-41
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:12:35 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjn14-0002FK-Bk
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:12:31 -0400
Received: by mail-ed1-x530.google.com with SMTP id w9so135450910edc.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680639148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zcDlQVfo63in7WJVURErs0APTOW2otp6kxHVnFp9bh8=;
 b=LIrmY78mtmsxit364ZWtu3w8FLOwjzepknJ/It+ClF+WygynpsiSgGFWTLS6o/7Hg7
 xyvQmHl0H0689DMurRzFx4vMdsdgQnrKAIfvQiErOU9pNd6LmqcAj3bYycvWnvigm4nM
 JBcEYY3rUR4LMI23IcKl181WMhgqlONYoaCRPYdQzuSGmbnIfrheIRcVNztGXd55UK4L
 UGWgBlH2We6lA4W/hbdr5X00LOk9VfewLktUWtotbsmw1NuhgkDzrBxUbN73y0WU+heV
 dM6OhDkcGWNsmpRV6Z28hqRwr1Tz2XR4UhvXhWRrNrBWkHSh/Y6ciEMNRmRagdOf7sIg
 OVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680639148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcDlQVfo63in7WJVURErs0APTOW2otp6kxHVnFp9bh8=;
 b=gMktBtSz6Rze5QpEKOpmLfiC6A+og8nMuQC0KyoI02Ei+a+vLugT/GHlTJe9WqcXQZ
 9cCiI91GTGbl1q8XjjrOFWfp80FcW0jrrIeN3YO13UD6dJml7wRrjb+mYlZO3E5HnTic
 AyXHIM095EnJ2haT0Tjpm4rgixYVs9wWfeQA+0Fq9khzSReidqPOlr1yAWRdAp+dAKna
 EqFV50PCg8xT4tWkPOt4oubeT5EhfJKq4reBH6FxGjAcs4GAorvOyix6js3MHhjaD4un
 SGOEQae1li6u1Axmu2VkLNTIQXFfVkR/vVX7dkgyqAed3Oedoc/RCefDbMeovxdj+ntP
 qnEA==
X-Gm-Message-State: AAQBX9fKVZCrRK/gxklpXHPZyHsptIcG/WtNFplfMsLwc6ZOSRHRvjj8
 cLp3s/vpxnAcpJqz0FMI+8tDkjlgb18j2L25j5zn0Q==
X-Google-Smtp-Source: AKy350YKA8+RZdXQvpxzNf0COPNB/Kdy5kidRZ3A9nlYernv02GRQFBeMAUp1ztlsbZ7SoQB71dsG2mKVA6vN8tOiNQ=
X-Received: by 2002:a17:906:73d8:b0:939:a51a:dc30 with SMTP id
 n24-20020a17090673d800b00939a51adc30mr400393ejl.2.1680639148314; Tue, 04 Apr
 2023 13:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230227140213.35084-1-philmd@linaro.org>
 <20230227140213.35084-83-philmd@linaro.org>
 <CAFEAcA_mmZUoeCaA7AJLecxt8J_Y=GVDex-OQ0aOSv8vdXH_sQ@mail.gmail.com>
 <eeb107f5-eb95-6f82-99c5-6289e57f0595@eik.bme.hu>
In-Reply-To: <eeb107f5-eb95-6f82-99c5-6289e57f0595@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 21:12:17 +0100
Message-ID: <CAFEAcA9JfHm484mqgVfWaC9r=JPgOj-9Dtb7GWfbAb2uYb_i2w@mail.gmail.com>
Subject: Re: [PULL 092/126] hw/display/sm501: Add fallbacks to pixman routines
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Apr 2023 at 20:26, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Tue, 4 Apr 2023, Peter Maydell wrote:
> > Should the iteration expression just be deleted, or should the
> > statement in the loop be updating i rather than just setting it?
>
> In a previous version I've tried to update i from the loop but that did
> not work too well so I've reverted to setting i at every iteration which
> is also how this is done elsewhere already. So the increment in the for
> line can be dropped, I've just forgot that there apparently. Should I send
> a patch or you can do it?

If you could send a patch that would be helpful -- I don't have
a setup handy to test this beyond "did it compile".
This isn't an urgent thing to fix.

-- PMM

