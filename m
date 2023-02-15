Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10617697D07
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:20:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHgj-0005Du-DC; Wed, 15 Feb 2023 08:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pSHgg-0005D9-GL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:19:06 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pSHgf-0003WA-1E
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:19:06 -0500
Received: by mail-lf1-x135.google.com with SMTP id w11so27520243lfu.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+twC4EWZxHblF//wmlyy8fvKPZO59vnJQALs0J7tzs=;
 b=izGEpYD0mUoPHjA0gzfkzq0VHJsyANLyQ156LhiWasMooxUE94Q30I6jh/IbHmAf/n
 diKbg0NmAI1KRovhBHOQQ6G7uqqO5rst+5LU4Ng2cpdW7e4zdyTJyI/sPsV/1ZmFrUuG
 su5XvHmKub3KRDvJ9fKmy2uiSzGScimWZneAwTxlXbq9ayMfnrW/YtRdengjOK3YJr0c
 rnVrUejqmMFs/hYKtI/gQ8VOtmqwIhp18zj+S+zqRe+SMh8FYNEdP0nlNQICsi3jr1fI
 sUrUt0GhlliDAdobAQu86OB/ZW2BvABkdlNIeq15rF5uTV3MgCHls2aIjYBRYOO+3RMC
 ALdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+twC4EWZxHblF//wmlyy8fvKPZO59vnJQALs0J7tzs=;
 b=E6y6XFMB7dpvJekLrcSKBSXFPRFFjuJokmaQ/uOSWW7wS4gd4V6OysC6FrV603MlrM
 K6PTN3m3kl71nJjUf/FSlQk06+CDXq/SNiHAKDOEDOeElIpnYdwBVP+uJ5TxBS5d3d5r
 EZwtg2uyQa4gE9UK5NwTdw279hgjr/ZTk7QwuA2JtQC3Pan0aBZeyhO+LBVmI91ctX36
 M19yIfObFqemy/H5HTYwLomIkA0UM7KmYA5SGZinI5VaRYJcbFytKJFneqyHSQEum3SV
 zmyZSosH4F6tcodTw9s79cFRrUgfTl3CuCbL6Jpjsn2qkL96OiRB4K4Pjgh48IIg5k0r
 kYew==
X-Gm-Message-State: AO0yUKXbap2Z2p+0bnQLFmXYvHJ8pih1iX0PDidvt9G0UP0Ym+P5ylpH
 mozGmUKNzGyKsFjiDnHFFbvEI7w97rSJGmjyVpE=
X-Google-Smtp-Source: AK7set9ipPvBAEGG9eoQEhB75y45LJY7Nao2waRHlbJ1bPqg2FK0xz7rtI4m3JVI5Q0S1QMzDSrvfaLxgzhaZ9qYUA8=
X-Received: by 2002:a19:f611:0:b0:4db:33ed:89eb with SMTP id
 x17-20020a19f611000000b004db33ed89ebmr524629lfe.5.1676467142185; Wed, 15 Feb
 2023 05:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20230215085102.415053-1-dbassey@redhat.com>
In-Reply-To: <20230215085102.415053-1-dbassey@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 15 Feb 2023 17:18:50 +0400
Message-ID: <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com, 
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

Hi

On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey <dbassey@redhat.com> wrote:
>
> This commit adds a new audiodev backend to allow QEMU to use Pipewire as =
both an audio sink and source. This backend is available on most systems.
>

Hmm, I would rather have less audio (and ui) backends in QEMU. (for
audio, if I could introduce and keep only one, that would be
GStreamer: to remove the others..)

What is the main advantage compared to using the ALSA backend? (I
assume pipewire depends on ALSA anyway on Linux)

--=20
Marc-Andr=C3=A9 Lureau

