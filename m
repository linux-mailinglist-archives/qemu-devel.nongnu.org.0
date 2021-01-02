Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A82E8874
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:20:11 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnNi-00025E-7Q
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnLt-00012B-J8
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:18:21 -0500
Received: from mail-il1-f169.google.com ([209.85.166.169]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnLr-0003mI-Bq
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:18:16 -0500
Received: by mail-il1-f169.google.com with SMTP id 2so21751708ilg.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htkHJJI+2VfXCfdP6qfVLbeWGdSPVmmo5mKhNyLaWv0=;
 b=CbneNRuSscnU8r1IJRu9dqJraWos4LVvLGOmgL/1Mv8molkwnyvu+mdsn50kORkIUC
 7tcVqLe9pPQ5ax0JI3wWTLcSamJdgIRUsnDUp4ixpgKA5nsglC8UrKuxmHQIenW8/9kK
 QZN5aDnR8jvrQ2VUL1YtzRz8zE82ktTGPT+pS86AXOKTN0TBwZI9ou4MkUc9RYfSi0Cd
 QXGsX4jN3zvDIncSNaPO0rp94O/frt6tAPfvgKCoOVbSZEEKiY7Nig8lPI/B8ys6ynN0
 ddjgnYvl9qecg2wnhj+nUQ1rOjRB5nG6w/VXaTuuJjlZmgbQvQyn52EFks1Gk5p0DUoT
 ZyJQ==
X-Gm-Message-State: AOAM533gNBHwP43nReO9XHj2S7JiokSzTRlModLpJY4Ulzi8IscEKYiy
 GEtrGHl8xRMbLi3rX4chvY8Z559IuPk=
X-Google-Smtp-Source: ABdhPJzcs2t4aVORrvHiz2w7Z8gi9ZvRzwkdwP7ssbjSfLE+aZK+bMjy4tvZF7xy7HyITVbA8Pplaw==
X-Received: by 2002:a92:8e0f:: with SMTP id c15mr54003377ild.224.1609618693129; 
 Sat, 02 Jan 2021 12:18:13 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id o10sm40574871ili.82.2021.01.02.12.18.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:18:13 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id 75so21698519ilv.13
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:18:13 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr64783098ilq.273.1609618692879; 
 Sat, 02 Jan 2021 12:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-25-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-25-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:18:01 -0800
X-Gmail-Original-Message-ID: <CA+E+eSD2QvYHS1i43964p2z-ufu0wup0PhK=V8iL3bRaOu8DuA@mail.gmail.com>
Message-ID: <CA+E+eSD2QvYHS1i43964p2z-ufu0wup0PhK=V8iL3bRaOu8DuA@mail.gmail.com>
Subject: Re: [PATCH v4 24/43] disas: Push const down through host disasassembly
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.169; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f169.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/disas/dis-asm.h | 4 ++--
>  disas.c                 | 4 +---
>  disas/capstone.c        | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

