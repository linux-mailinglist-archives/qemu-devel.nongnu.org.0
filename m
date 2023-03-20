Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627886C1329
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:22:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFSq-0005zx-Hj; Mon, 20 Mar 2023 09:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1peFSn-0005zm-PW
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:22:14 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1peFSl-0004Om-Ad
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:22:12 -0400
Received: by mail-il1-f179.google.com with SMTP id bp11so6452915ilb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679318529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1FB0iFKEV6YRhEIB37pqJB+1qhVrBk4KxPaUE+sJ7HE=;
 b=nZKH6Gvq27zChtu/zX8y2vbmexrQ4RAps2EONxR7jRG0oLEpNDnA/wFtgGAbo3TtuI
 Qy0LWmzrHx5CHTjxapMsumOqyO1d7yBVZ31iSmx+hB1zeldvunWw+nUeH4qhsu+xZ3WW
 nZS/1AQcQfItFHpXStrvOfVISMmtFhLQxTNiLaLq0pX4JVha1GVUg6sq7mdPR4wKWXhE
 5Uzc2aHVTZNoBmZqCJ8Oi3jP1BZw134CU3BoHWYEKOVFTWw7wKdHasUahtEifrvJp3MG
 c81HP8txXTmxoKJ+JIAShPG7P4Ughfb69nSo6KkLHA+1cW/lsNLtdVcPdiRZLW3fVPGt
 M8Pg==
X-Gm-Message-State: AO0yUKV8DzV2naKbu3stpg6DADb6YrXtyijYzfWn2PLOPXw/yzMKvJGB
 g0xa+qUQT0wKQU45IbAvJkumbdQIH+lha7jAip6XiJAdjco=
X-Google-Smtp-Source: AK7set+J7CD5NLyb+IftQbErCEo6l2HCwOyBgGVSKWbYwzwWK1NwdXlizHnHMpmrp2XAuidnAReo9NCxsfGvFC9jRdI=
X-Received: by 2002:a05:6e02:13c4:b0:316:f93f:6f83 with SMTP id
 v4-20020a056e0213c400b00316f93f6f83mr3031505ilj.6.1679318529166; Mon, 20 Mar
 2023 06:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230212082812.55101-1-ricky@rzhou.org>
In-Reply-To: <20230212082812.55101-1-ricky@rzhou.org>
From: Ricky Zhou <ricky@rzhou.org>
Date: Mon, 20 Mar 2023 06:21:58 -0700
Message-ID: <CAFoVXjhT-gsyxuRL9VGziBAj17P_1=_brmrNsoZ1Nz7360iaWA@mail.gmail.com>
Subject: Re: [PATCH] target/i386: Fix exception classes for SSE/AVX
 instructions.
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.179; envelope-from=ricky.zhou@gmail.com;
 helo=mail-il1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, Feb 12, 2023 at 12:28 AM Ricky Zhou <ricky@rzhou.org> wrote:
> Fix the exception classes for some SSE/AVX instructions to match what is
> documented in the Intel manual.
Friendly ping :-) Does this change seem reasonable to folks?

Patchew link: https://patchew.org/QEMU/20230212082812.55101-1-ricky@rzhou.org/

Thanks,
Ricky

