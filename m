Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD565E03B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:50:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBre-0007GB-SU; Wed, 04 Jan 2023 17:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDBpf-00066T-4E
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:02:09 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDBpd-0003D4-7w
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:01:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c2so9797797plc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gcxpew+8Lsb2EWcuDIKVUI32Y3kSgK3wx/i+IbVIH48=;
 b=yeRoC2wrWyCHxwQXyFNAW7YXlb+6IfDNCMsJ0EqINVxUNi0gzyr9P1E9H+WZ1UO0iR
 dP+/rQSWENaA0U6oPhxaQkKa06fprRr5O/skgxjuEU/sprsy/ws9xxlXa2sqj9ZY+/7W
 7jrTiGufmXZyd9W+PRJCSpRhQaNWT+uusCICBNJ0GgYk4XhQAnc7bYBpzykndL6HFiep
 ofhd6LtASujOgts3cD3l9Ys2f/DF7dcRINkg5jRGzmQqGWHk0xyfTP1B6ddn/q4hmFW4
 ksDh/MgYs1sjTmuEawrNnK0n3ahpQAD5XzCIPVKU8RmgUGkk9v66Mnz9c+lt3p3Ppxon
 GXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gcxpew+8Lsb2EWcuDIKVUI32Y3kSgK3wx/i+IbVIH48=;
 b=kMgq2SyimbVrEbi7I3NUT4aGB1KRV0yQ2otfhrMmIZNNRCMDplj5l0NArEi357cHaW
 6VdvlEhcsJ+4I3fUwAKMchqbEBPeSAfbbPaQtZSUbCSuPI3oh77wCU6xDEM7cr5m2Xv0
 H6ISuuALFYLfW+sgZksH6xBU7NZUsauk1fNkB+BQcf4EdjFraLiXFRaqOaBB8NMvlKcB
 DnaXyw27kzZKJYvKr7JSbXlJ1bFh2wYj/0RBOxCoJyQsTR0eknP44BtM37Hjwd/FZPyw
 /J3tYGx7VXXMDRgiZa8l5yK4jZpsmj5/gnIGnqSKwhLOMWyICUPs9nX8VzDtCBcUyWpH
 gvqw==
X-Gm-Message-State: AFqh2kpSZoAUcrlt/3WZXyMOTBlbHH/RzO3JasDfAQMCaQO8xNP87fBd
 zSvCnl1S/zoDIkkfoouV7JJb/yZZ0sOC4TJgtlSkUQ==
X-Google-Smtp-Source: AMrXdXsslyMrJIq2fU73ctDHp6N9xWG7So0TTZVmRdESTKxCq62MDEFYwMbInidZRv426vrTSoCk0T0rWsw7TXxz7pQ=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr293673plb.19.1672869715558; Wed, 04
 Jan 2023 14:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20230104123559.277586-1-thuth@redhat.com>
In-Reply-To: <20230104123559.277586-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jan 2023 22:01:44 +0000
Message-ID: <CAFEAcA-1-CBVd9FRYHS5_KTjC9UfTUz6E7qDz0g7xYjsA7PC=w@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Wed, 4 Jan 2023 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
>
> The windows jobs (especially the 32-bit job) recently started to
> hit the timeout limit. Bump it a little bit to ease the situation
> (80 minutes is quite long already - OTOH, these jobs do not have to
> wait for a job from the container stage to finish, so this should
> still be OK).
>
> Additionally, some update on the container side recently enabled
> OpenGL in these jobs - but the corresponding code fails to compile.
> Thus disable OpenGL here for the time being until someone figured
> out the proper fix in the shader code for this.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Now that the timeout and OpenGL problems are gone, the 64-bit is
>  working fine for me again. However, I'm still seeing random issues
>  with the 32-bit job ... not sure whether it's a problem on the
>  QEMU side or whether the builders are currently instable, since
>  the issues do not reproduce reliably...
>
>  .gitlab-ci.d/windows.yml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Thanks; applied to master on the assumption it will improve the
CI situation. I found that the msys2-32bit job still timed out
at 1h20, though:

https://gitlab.com/qemu-project/qemu/-/jobs/3555245586

-- PMM

