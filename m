Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A7625FD4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 17:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otXFX-0005Pw-7V; Fri, 11 Nov 2022 11:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otXFJ-0005Oz-P2
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:51:14 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otXFE-0007Vf-7r
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:51:10 -0500
Received: by mail-yb1-xb32.google.com with SMTP id o70so6456211yba.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 08:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=D0hDdUy5kU+suKLpwOfAqjD7cJHRArGxaVzsYvY5SMlUdAYB6M9fPfPNgx9dOjvlqm
 aSpJkYujAOCfcSPIO01Vgg3dSHRnhxdE1bm1mM2vpK4Lo24gfemBQ4/JFBUJiJl/grcB
 gxjmgzM6ixJuaFl9G3i+t0b1NbjHf3/ZTlDsM/ELGroYr9Z6EaO2Bbc/B4S//dUtvAnG
 DMFatsPvg65JfjQp6o+K4mzN7LENkJ7r2S6MuytwLpJu8TmMoWzrGpCSUlr1ujE0SA2C
 kBRTR603JkQdrCKmzTluIi33/ZEfhHsSdTcZNrMjPyvwlBv/fzETK19V2k2xsEZp7Gzu
 PHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=XXrMwrx8vNB+xsl5LZQPnsBHNxrgP516u7ofvtkqmfZJiiULSJ8RiP6gAQID/oFKSj
 I3IQ34aTR7CNHKEGMwHo9pNPeT/CwBHMndj6crY3Yn1m2Jx395NzVBx8ajJ0ekR8qjIg
 7V8a0sgbFrpprhhlK/HWtth/0bRGIxuplNGX5sg/GGvvhpmiG2v6nJwNoL4BoAVhDFB9
 H9To1ZzUCJEHCrf3Azpj/Xao1NXLifd05/dYezYsyrDy/dnHlqH+P3A2hLZ9woyjY3uM
 VjnQDMpQC3d2X0kUK1I/7VML9UvkKyeVtM2I0u4FtSfmSpfyAQaJp37MAIDcog+RR8AY
 WWTA==
X-Gm-Message-State: ANoB5pkI3WsOUDG1hWeACyeVSbZx0YkFvWGstqw/G612zOi9+EhjL6g1
 GjWMNHpxi46LThxNkqzibQylhn6gBdmlmVzPiHY=
X-Google-Smtp-Source: AA0mqf61vq/jW4EVrAa8buZyLk/bQTSBAp8ZxStZz1XxCh3YNU21jDxiknZ0ERfbHVdhEy8pBxy125gXuzQ/4lT7XTo=
X-Received: by 2002:a25:d2c3:0:b0:6dc:e3ee:3e60 with SMTP id
 j186-20020a25d2c3000000b006dce3ee3e60mr2595049ybg.58.1668185466794; Fri, 11
 Nov 2022 08:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20221111124550.35753-1-philmd@linaro.org>
In-Reply-To: <20221111124550.35753-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 11 Nov 2022 11:50:55 -0500
Message-ID: <CAJSP0QWio8A7FvL_QvX39u49bWdUPEfWC409rMq+ofFL0T-9ig@mail.gmail.com>
Subject: Re: [PATCH-for-7.2 v2] libvduse: Avoid warning about dangerous use of
 strncpy()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Xie Yongji <xieyongji@bytedance.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

