Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E777A5FC5D4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 15:03:00 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oibNy-0007uy-Kf
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 09:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oibKP-0005za-Fg; Wed, 12 Oct 2022 08:59:17 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oibKN-0005SF-TB; Wed, 12 Oct 2022 08:59:17 -0400
Received: by mail-qv1-xf32.google.com with SMTP id de14so10820001qvb.5;
 Wed, 12 Oct 2022 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2gURqsQcRQ0tkQZblaYX+FHPfWgnHN1WvbePIsxWA0M=;
 b=ZzkYdhTmqdER/KMR6+7sVA9KjPW9LRUrdUXQcDdXPLevOz08s7e7uz2Ekw6MNV++OR
 dXC1LXz0rLGLbcIJSE67RTOo4HE7gwgafxu0EuTBflV+b3To/B84SQUN8RF9gFlqZZP1
 x3ZTkiLzq6ZM8/fmNyZbkV77Q0nHArO8eQqG+zaPAPgBe+0RNdNt3YBpat6FwCMg6MOt
 +22zwQMwpQHtxsCFJ9Ro8T+8YmUAwXvhhpSDrCA5JIlPlqeRfwkBr1Pk+HAJeF2xie+C
 6ob9byPb4DM7/m5tA2PGdXGAqXrkZI75QC8Eh5Xvhu+KrSaQemA69wRJRDaIQFjwOamH
 4AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gURqsQcRQ0tkQZblaYX+FHPfWgnHN1WvbePIsxWA0M=;
 b=3607i+WKw2Hv53ZiyeQBlhJDvIrFiNKfT27zOh993esGtk82D4iGoYXk2C4Fy8iwpF
 cd/pmj+9b9Oe+oFoFj22Om0HydCe+O9X0eKFOAwsjdESzryJli5yT9x3K+uGl+x84giH
 KsqqzQAm9yGhRO29De3rTP228zudC6h4jtI4kPCMeOn1hTbG7HVxVcdy/DkL7pxLumYO
 hy5M4p7N3Kg0a51XZtJwXdiPmgPurjz94kG76xcHSATmV1SUZmlXzfviYH/mvSmFtW50
 i59M7P22YScbqMJJw/d7/dRvyw8Srj9LmbyDpY4JI6FRHQ6KVcmoFJ0L/zzC64NjpRBM
 yPDg==
X-Gm-Message-State: ACrzQf0I5m8JmIf5juUoJkoK3etrmU5BhOpz4CkEwq7conUtOXmlyQBg
 WUfzaZrn0qg57iB1a2ZpkTTy+4i6jDiZklumueo=
X-Google-Smtp-Source: AMsMyM4/Sx+Ly9rYiY8siTUnJe2dMqH+zqdclzCnJiJt8NHCYgIrs/4mCYAOe/fD9sMqEXT7SDcwBj1DGE4ybHlZ7GA=
X-Received: by 2002:a0c:e193:0:b0:4b4:7ac2:8c42 with SMTP id
 p19-20020a0ce193000000b004b47ac28c42mr2737747qvl.51.1665579554162; Wed, 12
 Oct 2022 05:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221012085932.799221-1-thuth@redhat.com>
In-Reply-To: <20221012085932.799221-1-thuth@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 12 Oct 2022 20:59:03 +0800
Message-ID: <CAEUhbmXBcQBPGjtdLn_zWmtJbVXWkzOPzr5r_k4DjmzUXP-dvw@mail.gmail.com>
Subject: Re: [PATCH] tests/unit/test-image-locking: Fix handling of temporary
 files
To: Thomas Huth <thuth@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 4:59 PM Thomas Huth <thuth@redhat.com> wrote:
>
> test-image-locking leaves some temporary files around - clean
> them up. While we're at it, test-image-locking is a unit test,
> so it should not use "qtest.*" for temporary file names. Give
> them better names instead, so that it clear where the temporary
> files come from.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/unit/test-image-locking.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Fixes: aef96d7d4f0b ("tests: Add unit tests for image locking")

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

