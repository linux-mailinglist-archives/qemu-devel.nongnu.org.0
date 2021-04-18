Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C55363677
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 17:56:16 +0200 (CEST)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY9mR-0006Lo-3k
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 11:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lY9kL-0005Vf-4K
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 11:54:06 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lY9kI-0006id-AR
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 11:54:04 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y3so1490204eds.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0410E8YDLGjYDuWOVtKswfrd+h8nhQJtSWIfB77K3+8=;
 b=GR+01nZfFTx/HuncZyA/x6NXKUitP3X9Zon4GLwwNUF8hs0hhJ+2eVlYIN9dQGcJ6+
 pCxqZzJlJJtZoxxOi2AyySn7A68jI3ye9AdeJ8D7FlZxlzYX0L8GRLEQqu3iuiq/0UyZ
 PK2aBtwb+ncgWZfvTxzBbzuKHJHG4iEtY8rX5/B2+GUkuxfp4VyyqfGrc8BKkhBaI8Vl
 +okCUEArJ8n4EkzuJDuBxVDAt1DQGv8Hth1n+1RyNOv25IEyra+VYFL3zWMj6aVDswJX
 UNQBYM9vxsEOIZK/+Kult9CmXOJPEz6eXJ153JfQBny2bfyLndnkjiMry2wM3jlv7ToO
 KPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0410E8YDLGjYDuWOVtKswfrd+h8nhQJtSWIfB77K3+8=;
 b=kqJ8tA5qcQ0uOW592bg5wWM1R8ttUZFWjjhE3Yjfg3f6p13rsmun2sYcxlmyGlP30d
 aEblhr7jInSs3QWq7DAN8f3U4L1E456yRHbqT+6r2Qw5T9MpbbbKFuvrbOflznUPp9uX
 tZbYZW/ieoi/4CQma10+Ld7IXqzx8WlEbSy1egqh/2rO/oxljy2I/sucTvMsycxzXEGd
 Lr5ycykdYkEqhsY2FjhwbK82xOrhrRIvxGuZZqE4TaxYGNwc+UQ94w13WQrfjv8cXCQ2
 aswqWq9bLL17iRBSqpigJXviDkDi5h+noT4f+YmNpkdMdVsjCdg0xviQUuW2zs4etxue
 2o0g==
X-Gm-Message-State: AOAM533jpYMWMEHJ6Kca3eiBDRRihcRBpkXpON4A/bXKAu4roIXP/V8E
 +n4ZYucG96+1Ck9tdRGXOBFmLrAXsmFNEW1PBUTU3w==
X-Google-Smtp-Source: ABdhPJxnEGJ2EJO1SFSmUk6yIcyRXFzkvMWyaf5EeMBALRlc2Kv/OlfsrJc4s/G7rQlGhNBbEt9ChnvRsREOaq02vVQ=
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr7977870edq.146.1618761240019; 
 Sun, 18 Apr 2021 08:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210415154402.28424-1-vkuznets@redhat.com>
In-Reply-To: <20210415154402.28424-1-vkuznets@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Apr 2021 16:53:09 +0100
Message-ID: <CAFEAcA-u0XDFBuTaw2AcoP1NLSYNCSAEutXi+gfhb-qU=_UBGg@mail.gmail.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 16:46, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> When a migration blocker is added nothing is reported to the user,
> inability to migrate such guest may come as a late surprise. As a bare
> minimum, we can print a warning. To not pollute the output for those, who
> have no intention to migrate their guests, introduce '--no-migration'
> option which both block the migration and eliminates warning from

I'm not a fan. For a lot of people and configurations this
is going to be "add an extra complaint from QEMU to a previously
working configuration". We add too many of those already.

thanks
-- PMM

