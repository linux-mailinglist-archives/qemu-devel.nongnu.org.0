Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA12DA276
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:20:00 +0100 (CET)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovGA-0003kl-VU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kovDw-0003JH-O5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:17:40 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kovDv-00051E-6T
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:17:40 -0500
Received: by mail-io1-f67.google.com with SMTP id q137so18329923iod.9
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 13:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1493QeBrKMK3tVPvHlxEDixBiEMrXym0Ve/bnSSLCU=;
 b=beiMoNaqi2NKK0M5XAu7aS5kFWSlqt74X2fRHTRYVQIk2+UbGtx4X29rD0OqzExl9Z
 CtrJQVpQY6NVzcc29XbgGIBsR/28iwt4qoC3RqqcygfQ9tULFZN/6bZ5+AuWYljVbLvM
 2lNYIkvPauvDpIaO8FkngGcuxyvRtmk4yAnKm7zwx705jwYau+wUb9qQXk7QkkJTLu2z
 QXV3zu+cQjZCvL92f60tDNg0m9KdgZzG+rQQGzm+2LhGjvIflBgklLvKMTxwoanre5QU
 55hhZ0EI5jTgQ5XpDTppagUTeJ615WlEMRHLfe+WJkjcMZWxV4bTMWYwCax4t4Tkjw5Y
 FRPQ==
X-Gm-Message-State: AOAM5315JagUWzmS8JbirwrGbiuPG6d8i3ZAM3yvy6cEEcBzk+WXnjOX
 GMM2cw+xoe6d5ZuGsApJkT0NLLB0s/I=
X-Google-Smtp-Source: ABdhPJyFkkuEoAlik/JzIpmMr3lf458pOFpLfnwmyCZVufkcJV9pLPgJRJOKR5ICe+NSwdslAGIubw==
X-Received: by 2002:a6b:7a09:: with SMTP id h9mr34823505iom.167.1607980657676; 
 Mon, 14 Dec 2020 13:17:37 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id g13sm11659198iln.12.2020.12.14.13.17.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 13:17:37 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id z5so18336355iob.11
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 13:17:37 -0800 (PST)
X-Received: by 2002:a05:6602:142:: with SMTP id
 v2mr9685853iot.32.1607980657092; 
 Mon, 14 Dec 2020 13:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-2-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-2-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 14 Dec 2020 13:17:25 -0800
X-Gmail-Original-Message-ID: <CA+E+eSB1jN4N8_HL+eASQ2Vc9TzSM3SK2jRYf6mG7anxExRrtA@mail.gmail.com>
Message-ID: <CA+E+eSB1jN4N8_HL+eASQ2Vc9TzSM3SK2jRYf6mG7anxExRrtA@mail.gmail.com>
Subject: Re: [PATCH v4 01/43] tcg: Do not flush icache for interpreter
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.67; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f67.google.com
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
> This is currently a no-op within tci/tcg-target.h, but
> is about to be moved to a more generic location.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>

