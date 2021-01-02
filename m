Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C972E8871
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:17:06 +0100 (CET)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnKj-00088T-NJ
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnJh-0007Gn-P4
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:16:01 -0500
Received: from mail-il1-f176.google.com ([209.85.166.176]:46243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnJg-00034n-Aw
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:16:01 -0500
Received: by mail-il1-f176.google.com with SMTP id 75so21694565ilv.13
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K32pCZ0VhMwiXVdvRHclnKSBNPZLc3aPrk7Lip2cidk=;
 b=dTH5lZLki1gcicTuMEgwoWFCO5/OKtSuJyqP6BVqu8aWRfn1NRIJT0SgjcqcPN4CAo
 CLpGtQXI3z4tkST1jgeo3/o8BxmGOZZypX6CgJ2V+n3JNQ/1dyIE5US/z5HIWQE3KHdc
 Afdo4Vea/nnuoKYntjv4f/MxKg46qKx1GG5cq84ZVbUzxLyr5PdEYBvzyAvmPCsEfwxo
 Pv6SsZxE1YjXZ9Pe7Y6GFswGX1xlMR0WmlmdtQimZHrNryq4pg+09K2mPE7RC9d43twU
 d8N5BCTA8mXECoo6ksGlO7ULMTkEYJljEwoakCH/1irJAT3OwOfkjyPQkK9RPIOcn7dv
 pPTA==
X-Gm-Message-State: AOAM531qzK8d7e2Sd4fvNv3wSfY1hkqnTJnVmJhra6mRwee4HyQ3Ez+O
 Xfj1UmuMG9kc5LCMPqn3xV94nGExQwg=
X-Google-Smtp-Source: ABdhPJwpR2Jm7JDanBZfXbUHB9+xXL0DYiY0HBkUEnykV2u77fLoLIpnIDNMyqeKw6uTofAPgTpv7A==
X-Received: by 2002:a92:4101:: with SMTP id o1mr65349465ila.82.1609618559320; 
 Sat, 02 Jan 2021 12:15:59 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id o11sm37377730ilt.23.2021.01.02.12.15.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:15:59 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id w18so21515608iot.0
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:15:59 -0800 (PST)
X-Received: by 2002:a5d:939a:: with SMTP id c26mr54821397iol.63.1609618559067; 
 Sat, 02 Jan 2021 12:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-23-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-23-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:15:48 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAev5tabbWQzoWe-WdX2AFE+12j9M5XFrbjmMYCTTdYLw@mail.gmail.com>
Message-ID: <CA+E+eSAev5tabbWQzoWe-WdX2AFE+12j9M5XFrbjmMYCTTdYLw@mail.gmail.com>
Subject: Re: [PATCH v4 22/43] tcg/aarch64: Use B not BL for tcg_out_goto_long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.176; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f176.google.com
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
> A typo generated a branch-and-link insn instead of plain branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

