Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C96A0A77
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:25:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBZj-0002AS-NW; Thu, 23 Feb 2023 08:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVBZi-0002AA-Ft
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:23:54 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVBZg-0008Pk-Vu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:23:54 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u14so8900186ple.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BmbJQysyE94mp/ooIQeA6DiueXheewBECzDYx515B0E=;
 b=KX+1FFCDETKWPHCOxGbtSQ67RSS2LN9ukhAuSp3XSttyIdQodXgumM3wTFQWVd+VLZ
 wPDxzhc7S+FOa5nGexlN6gaGvrehSKoBi1pKp7QDwTU3A25hQVsk8jLz2b9BIoaQgJC1
 C4xowVdqG4FgxvKUTHDmSFqt43Ycs7tQTAPdBRGUtHAoyYxGwwajMRT9H93N3CS3ou2Y
 keQACabrnXro0Ic6VsbacUC/vLE6c6WYcQ3lMmopLyXeeUdVsg+9U8gUGpdDLCXhBeaq
 NstBEdQtNC5NJrM7z65bjVAakdyimWAtM4tbbC0ekDqv0nFXzTkzKTrars6UyDX0hx1Y
 vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BmbJQysyE94mp/ooIQeA6DiueXheewBECzDYx515B0E=;
 b=eDu+MLQht/NW5e4jtpAOQdtrsTFVhLG3WTMXM2RHHIK+eV19AKp8eEvCe/xHa7v6o1
 vigs8u45tovnlj03DsYOo0azyfFhpmy608IvYLZqxLH0vVwb6nsy7KAbMA6U20iXRBTK
 W6cBWFMBSqzb4MeJ2QBcrfmtUic6rFHJR2c1wf75DLXbxQOkoytkLO7CvUS7Yx8+bjCf
 hVmqH/dCP4Rr1Hvkk1XNhitMLiUvON6xI8XfKvtLAVtqm+/gOamNYMlAByA4uYGEJzif
 ne0BB9fMBLbAE1uXWyhPIhXJuluP5gBfCNPyjmmw0WEh4Hxk71QfY6RmbmPOUJo3AQrx
 L8Kw==
X-Gm-Message-State: AO0yUKXXsS5Buj8MFQfeAbkKT/U+oHH0oXZTqJVw6h+5PCkvo2U8ggP+
 GLFhq/AIITblw4bQD9HO1bqXfY9lJmm7O8GCXeNqIQ==
X-Google-Smtp-Source: AK7set+EhS9U6Vbx/3KudzUsv7KJc70BAvs9EyOrx+XTy+UIrmB3kjHTcKAHgRXR2Da9BBu1cBU+0iZwBrD2MJZDZSc=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1094041pjb.137.1677158631398; Thu, 23
 Feb 2023 05:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20230223130841.25916-1-farosas@suse.de>
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 13:23:40 +0000
Message-ID: <CAFEAcA_j7x1DimADiv432rFnf44wazeJXzfUSWxChoyQj6XngA@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 23 Feb 2023 at 13:10, Fabiano Rosas <farosas@suse.de> wrote:
>
> Changes since v6:
>
> Now using the same feature set for -cpu max for both qtests and
> TCG. This requires a slightly awkward code movement to expose
> aa32_max_features to non-tcg code, but we gain by not having a
> different environment for the tests.

I'm ignoring this version, because I've already taken
at least half of it into target-arm.next from the
previous version.

thanks
-- PMM

