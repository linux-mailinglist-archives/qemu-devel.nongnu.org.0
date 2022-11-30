Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0437763E0FD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 20:47:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0T2N-000855-Fl; Wed, 30 Nov 2022 14:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0T2A-00083Z-1t
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 14:46:18 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0T28-0002IQ-Nl
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 14:46:17 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3bf4ade3364so132250117b3.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 11:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pE5iRmA2NZZP1wdxGFKAl86fvGafacQRVbf1FsQAvDo=;
 b=YmnPdR3yjSufku6qMMkhS6iOtYorfDB9jIoNuSoBLIeUWmfWJ8OGNuKQ9U4wKDHNE4
 WRHNU+WXfL8np9sx+LUkYM5XrNsQ5+Y2ldfCx+j/tKhT1i8ShxjvERoXKiyvdjjYRi4n
 9ammc/CvHGIvGfWGCakTix0dPAyWqxIO3dNTptEJHzb9Ma0DoDhrCqHDr8GPf8N5PMU4
 ZfODkMCsD3uqchALkqpw8wMFlXx55qDvBHgYLfIGyvRK0aB7PGAUE1BRvOYAQ43DD6rj
 SA7c0wk9+Ibno7tc8YA8IpiXOufux9COnxWSJxcCT4L/wDNwuHcLiDrskdsnpMQiv5he
 i5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pE5iRmA2NZZP1wdxGFKAl86fvGafacQRVbf1FsQAvDo=;
 b=0A18X9ryJgSJGRUz8ERyBvq0JZHxRUHvvSV/hD+n/g+wJjQiYhVMJJoaT0uQYdZfjA
 3W5SqIe6gXHkTAV2d02P7HYZdnLgs9XkaCuwv8nH7TZz+fNqNLN8XaZGbSuK88ua659W
 Vzt65llnKfMtXUkDY38aeQSfEOb/X/G34t3/1MLVbXNrvtwNOkbGW+IJU5q5X50sDI91
 UgQ40jC0It6MeU2jAQZDzofmd+YojbZVwP87ktMTRp1idoe0vI6FZNGz0ZU47TxFQt2i
 Beys81uEd+krfkBdEBoODFa6QEsN45xZPrMGtVMZ1fYXxdKTLzF5mKWy9Z1Fm8xKQ7AB
 wxnA==
X-Gm-Message-State: ANoB5pkASxy7XZUQTBHzvpwh/eGYdoaa7D0dvYvIJJUSbOxV/A2il9T9
 6K6lCCppkG0AcrtshE2eBD89BG/gEYDII3r27fU1V3Tv78Q=
X-Google-Smtp-Source: AA0mqf4VYK2tIIYeoymmuDvizFB6zxAoRbmuTQprl+ETEekp3fm1169hO4JrkwXv4UXrg2nEeONWjECgha8pE/JAzRg=
X-Received: by 2002:a0d:d202:0:b0:370:1a06:1b4a with SMTP id
 u2-20020a0dd202000000b003701a061b4amr40969943ywd.206.1669837575307; Wed, 30
 Nov 2022 11:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20221129204146.550394-1-richard.henderson@linaro.org>
In-Reply-To: <20221129204146.550394-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 30 Nov 2022 14:46:03 -0500
Message-ID: <CAJSP0QW3RAiOR8gQAcY39WSsFJ2jXYAYbd4EXpmzO+qXdJRjcQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2] target/arm: Set TCGCPUOps.restore_state_to_opc
 for v7m
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Merged, thanks!

Stefan

