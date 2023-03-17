Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E36BEE5D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCyu-0002ra-9m; Fri, 17 Mar 2023 12:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdCyp-0002pf-D8
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:31:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdCyn-0002lx-3F
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:30:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id x11so3854481pja.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679070655;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/84Ilr0Vy6ARGIAYbFhqDg+mJ/Ys1fz4gFnBt8ZPRxc=;
 b=Z1FP/11P3wSAZQpmJ5fBsA1h5YXBjozd2hBE7H92vovZGLWQ9aNAxHDfoTKMgMBLaw
 PxOQlXMVfn/JzQvUVlaU3TPUxkVWT0zbDy1CfcC8LGfA3/uWXIJu5yMAUvfF9fwBSU12
 JTcDI/u0LAm5F5d3/D0LIVQ5X8TOZ50/8Vbcn1x89D155czu5+mSB/c0+NzEu9ZBI1h+
 hSdBtdJwtGYJtc+jOntftlrG1LDbI5wJxR9ncaBSaWuQb8XU0ezSb7tGcyjCbTiyivR1
 TnbYJF34/W3v4jkBwi3EkC31sGgMrEOif5RK+X7NltZnokdMo6eS/1P9hJX5FPxMvPo8
 lqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679070655;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/84Ilr0Vy6ARGIAYbFhqDg+mJ/Ys1fz4gFnBt8ZPRxc=;
 b=khC8P8ocDn9wOyR45kQf72OrLuWAjD97GfuTGWQVQEmtKaH747dzkLyVPadCh0KK+r
 ZRRwJUqhu6PCi733pmff9Df44LaCqn99jJvGHMV7tt1RV+0vlA3WlR/P0O+BvWGx1e39
 dgufk3T4KfEvTv9yB9unVXM1+cm0mVrRNDFTlUrTubsXwO6Zkd3CwRsCTF5l9dbSwwVB
 /xp7Trw2MDxFmVI16Z0GOa0Se7JiMkO6P+NEPSicfIHms6UHmSxScdiwHnRa0N1DmP2U
 jOqSKalBK85q1/umSVgfuPM82UGDQjgFznipSWJ7Ys3WdlGIlsJ+phQR7uqvK7MjmIJr
 uxKA==
X-Gm-Message-State: AO0yUKWxaweI+Uv5clbKHMeCuKRMEZnOUXITYCOdYwXkPxa7vmiX7Crg
 S5j4t/ab83/6UVRSSoeiYJUwg0NHmj4z+jOhG0lPmQ==
X-Google-Smtp-Source: AK7set9dtBSPkc0IOzBGVd33QxvBgW8enkzjocYkRgvHVOS60qCHacV6vCeNI7jRjwE/qGGKMNmM4k5mZ4mrAEeER24=
X-Received: by 2002:a17:903:234e:b0:19a:5953:e85c with SMTP id
 c14-20020a170903234e00b0019a5953e85cmr1512496plh.1.1679070654781; Fri, 17 Mar
 2023 09:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230316162044.31607-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230316162044.31607-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 16:30:43 +0000
Message-ID: <CAFEAcA-creBruZ5FRkb__BtDiVW6BWL8hJr9QcN0SEK=gcpf-g@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v3] memory: Prevent recursive memory access
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Thu, 16 Mar 2023 at 16:21, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> A guest may request ask a memory-mapped device to perform DMA. If the
> address specified for DMA is the device performing DMA, it will create
> recursion. It is very unlikely that device implementations are prepared
> for such an abnormal access, which can result in unpredictable behavior.
>
> In particular, such a recursion breaks e1000e, a network device. If
> the device is configured to write the received packet to the register
> to trigger receiving, it triggers re-entry to the Rx logic of e1000e.
> This causes use-after-free since the Rx logic is not re-entrant.
>
> As there should be no valid reason to perform recursive memory access,
> check for recursion before accessing memory-mapped device.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1543
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> V1 -> V2: Marked the variable thread-local. Introduced linked list.

Don't we already have proposals on the mailing list for
addressing this? How does this patch differ from those?

Also, "device A DMAs to device A" is only a subset of the problems --
you can also have "device A DMAs to device B which triggers DMA to
device A" and more complicated situations.

thanks
-- PMM

