Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4542DA5BF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 02:45:36 +0100 (CET)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kozPD-0007j8-E6
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 20:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozLx-00074I-00
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:42:13 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozLv-0004MA-FZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:42:12 -0500
Received: by mail-il1-f195.google.com with SMTP id p5so17714066ilm.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRYkmkTgslWfEbRLgUobTAEWsOSn4zDkJdaqwTjbpIA=;
 b=WiLSOStivH3oLFZdxDl3M19JziN0PfzJN+OjYotDnzMUKc/fCondB1zyp9A4vYLlrD
 7tQwaZ/jnf40Q8vOCpZBuImNnBQelgEEy5eNFCWK9d3QQXDePUMConASPjtCqw9Bp9CO
 fQHF6uxZAJi7et1trF+UptC/aWNa6VVJKYgTNbybRkVdgzWyEG+eV7/p0zg0clgbhMjl
 ynifnP6Sw68lNlMZjWrkxmE57woQOBG5pgfeq1v0Qf0LjEio77HMhQQzocOQpCEe1ryp
 mrkbXre9Qi7D5lTHELOrHEU5ttVOorymoRi/IcmQiDPWy9xS/3QOzfAitGpHgaRYY9Ln
 zp9Q==
X-Gm-Message-State: AOAM533F3di6kL8KBbiKpNPTZvYlRZjIAynLyplVnfxicyQqA+Uzu+07
 zcnC9yU7GAMlasSYFAUJZZ4UlLhwtbg=
X-Google-Smtp-Source: ABdhPJzMsmlTohz6p1bu99A0hJ4nJVVAxs/igVIIspqPS5jq6kOOSCOX+uR3PBcSGzsPOxJR2CqsvQ==
X-Received: by 2002:a92:a804:: with SMTP id o4mr39012428ilh.125.1607996530138; 
 Mon, 14 Dec 2020 17:42:10 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id r3sm12170532ilt.76.2020.12.14.17.42.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 17:42:09 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id 75so5690690ilv.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:42:09 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr39079743ilq.273.1607996529555; 
 Mon, 14 Dec 2020 17:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-3-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-3-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 14 Dec 2020 17:41:58 -0800
X-Gmail-Original-Message-ID: <CA+E+eSB8VAOYg-z5r_khG-mb_eRuZeu2VTMn3OEBRGF3qUUUEA@mail.gmail.com>
Message-ID: <CA+E+eSB8VAOYg-z5r_khG-mb_eRuZeu2VTMn3OEBRGF3qUUUEA@mail.gmail.com>
Subject: Re: [PATCH v4 02/43] util: Extract flush_icache_range to cacheflush.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.195; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f195.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
> This has been a tcg-specific function, but is also in use
> by hardware accelerators via physmem.c.  This can cause
> link errors when tcg is disabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>

