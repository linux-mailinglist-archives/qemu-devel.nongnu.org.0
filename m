Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF063A9C2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeLg-0008S6-9B; Mon, 28 Nov 2022 08:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ozeLd-0008R8-ME
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:39:01 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ozeLQ-0006aA-EP
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:39:01 -0500
Received: by mail-pl1-x636.google.com with SMTP id jn7so10148406plb.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mj/14+8E7E8PIi8xBwZinz/ODLGQ6p1hzvcMrr0AgqI=;
 b=kKRP411SLQwuhUVpTo/fSuIuzN7CDE852stkqNJdEzvW0gFXHkKnyBPiN3YO5rRpNQ
 428ZFR0AvajiE0izgLqloChb5/ZzEJ26jvulWTWLWpoCctc1PmID9rW54GZWXk2pl4U/
 EzyylkMyYQjLPp2qRu5e2d7gnVujuvlrhzgRbQnmcBPiZsPt6RyrUx09IrI2YsYDOuyi
 JuSGJ+DOX31wTdVF/bAraIECApsFcfnK3moD7OwqHAj+7Bkpp5OMhH58+yzkM8UMxVzm
 FOi86Qp04A19b5YWqYnpNfcwwKHtd0h6Eiext/olhF84zGUbAfJ2OspC76tPAT0Et0KO
 RGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mj/14+8E7E8PIi8xBwZinz/ODLGQ6p1hzvcMrr0AgqI=;
 b=qpGIwrZIJqvDlekbU+fC5TJ8LH0i4FFFn3SfzlrnDMfX/DxC/sDAx10e4wb9krVxFj
 gv5jgcFjJmf5qF0xUQmBim2TwsgJWPwBGOfUzj+Gt1gtfLs3NPUOmNaqi5jH8z6+WaBV
 tmQNynbUdZxWsQvu2iOJ7CPB7LLrQ93UhBcWhbpON2EHFuPS328RQohqfKfKyxkQVCIn
 JPj38pvlmMtUjoAK/ymTYZ/85k1o6z622s/TMpEyo+NybMLQZr6kQZ69TuCOJKcJOiyD
 ozHzWZmiIvLH8LAZrWfgvfbVmSuAujsg64eCoe4Ruv5DTx1wpxL/WkIltctoGoRX52ZJ
 S9bA==
X-Gm-Message-State: ANoB5pkMIpDTfnT0EwF91KzZc3FI+WeW6NKbWfG82lu8uZG35Clbjmyo
 oZ/cKirwt518349Eo0Qhfdk9R6qo225+4cK9eOu6ng==
X-Google-Smtp-Source: AA0mqf6BsBBxSfj6eqRcr0m/ubgcNE0TNb5F9elw1RnACvNCohHO5H+G82WGHfQJXxOYKKOFbYIUV11rTYbnAsob5BI=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr34637951plk.60.1669642726399; Mon, 28
 Nov 2022 05:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20221128130851.14362-1-quintela@redhat.com>
 <20221128130851.14362-3-quintela@redhat.com>
In-Reply-To: <20221128130851.14362-3-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2022 13:38:35 +0000
Message-ID: <CAFEAcA_yQsrf0Bx2_8h7HvwHYVSgxD1=B2RU8V5meTeMbxBqDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration: Perform vmsd structure check during tests
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, 28 Nov 2022 at 13:09, Juan Quintela <quintela@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Perform a check on vmsd structures during test runs in the hope
> of catching any missing terminators and other simple screwups.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

> +/*
> + * Perform some basic checks on vmsd's at registration
> + * time.
> + */
> +static void vmstate_check(const VMStateDescription *vmsd)
> +{
> +    const VMStateField *field = vmsd->fields;
> +    const VMStateDescription **subsection = vmsd->subsections;
> +
> +    if (field) {
> +        while (field->name) {
> +            if (field->flags & (VMS_STRUCT | VMS_VSTRUCT)) {
> +                /* Recurse to sub structures */
> +                vmstate_check(field->vmsd);
> +            }
> +            /* Carry on */
> +            field++;
> +        }
> +        /* Check for the end of field list canary */
> +        if (field->flags != VMS_END) {
> +            error_report("VMSTATE not ending with VMS_END: %s", vmsd->name);

This is always a bug, right, so what prevents us from assert()ing it?

thanks
-- PMM

