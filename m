Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014D63C7D0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 20:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p05yX-00058U-Pc; Tue, 29 Nov 2022 14:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p05yW-00058A-3z
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 14:09:00 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p05yU-0008Bo-Q1
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 14:08:59 -0500
Received: by mail-yb1-xb30.google.com with SMTP id 7so18709671ybp.13
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 11:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pE5iRmA2NZZP1wdxGFKAl86fvGafacQRVbf1FsQAvDo=;
 b=n/Jle25RQ2mgdHvCUYCZWmv8oROqaRpeNQMv6SlV/WuZICX2Lc7fh0PdcuZ7bFg1zn
 Q2qyuCUg/saTFx/bv6YYF7FDc4SXmPxVtYAVExwbY5nIdM0402YsyHKYot5CPKAjhPZ5
 GH5I54LU3G6+nEH35hYDWWNXSoZxcEGPcuu4BsRmfWWDyWiFWAlVlLgEoUAP0DRJIqta
 DhrkAiIf8ZeAzy44OsJJvyYwyZFG3iF5NA5eRaV2x0QCSoRvJCZjsDVfhsSRMvXsQO5t
 9nqGLZW/0Mg8d1LSKZ0S+mJm8PkUxDABhI5yWIM/16/uRKMvsJMWYBXvBkErXezXRTSc
 ggHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pE5iRmA2NZZP1wdxGFKAl86fvGafacQRVbf1FsQAvDo=;
 b=yJUT4QT+7QGXkYF7gJ6YX9qq5H5ATSm/3aHt9SBN9uE+PHOUwStrw3J6ogWGcETMIg
 F5Vh1yujdlGgdp7hz337NyHBGMJmpn/4anxJlWqgdS2D1/MTFQgYLVUypF4xkaaYSwDg
 gzOsAAhjbk5GnGOq7kFtaSS2/p+E6OIZ/pb4cIlHD5RPhwDXcwhOl5PTOxLu5oWyF1XO
 4ibLZswoApvMY/+Liz4W9fpVWvDoRugT6jEfjApklYGsS5TkM6YcEzm8/ATOfOziGifc
 RxGKzIbT2RdNxiDzww6Bw81745g9n0siS1i9cXtgKIdGZxvDkRUajTJ7ypZCiie8Ht/N
 yPkg==
X-Gm-Message-State: ANoB5pmgEPD/mzwiW6NWb2mwOT0ut2gIaKn5gH33JZ3DnDpna1f2WS+u
 89bK2818Pu4nrSBAIRWzEzDvBHIfmPsyz8q1idA=
X-Google-Smtp-Source: AA0mqf4as2Bl41JtwhzM7L0ToeirGMGArVM97/7fwyC7E539stOLe0J3xMjnjrW2Kb9e3kJwqMcoKMnNSe6YA9jjSno=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr40752172ybj.58.1669748937266; Tue, 29
 Nov 2022 11:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20221129010547.284051-1-richard.henderson@linaro.org>
In-Reply-To: <20221129010547.284051-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 14:08:45 -0500
Message-ID: <CAJSP0QX4=EoTvwVY7gxL_TkM+AW=tS4y08+D61R71+AWpma3NA@mail.gmail.com>
Subject: Re: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
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

Merged, thanks!

Stefan

