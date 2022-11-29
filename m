Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F963C9F8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 22:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07hV-00077Z-FT; Tue, 29 Nov 2022 15:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p07hT-00077H-Bg
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:59:31 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p07hR-0002yX-Lv
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:59:30 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3bfd998fa53so98654277b3.5
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UYyUfulGoq5FHxq85Agbxdr02/H0+T6oZ3yMNNL5wSE=;
 b=OyQFwT2apLzc+I2YftRsW8FUSf5qSeHgoSZ1/PXZEpeowMusamguAG7pl6wT7ekGSj
 h8bUhC+gU1C/8nukObchFr2ZmsBznuokqGD1ukwzKml2Aqh6Nj2ZmM3fva12CyR3jTBh
 Qf57KrRmlTEXya43EYYGkop/nCMHpYndppfKDy318G6Uop4p7XMVc4mFlY1lYcmwolnx
 jAyaF13F6PblJ/m2wMIfJNtQIxQs29pdzpcvi1TvY4XgjnUIbPm6PFNXH47nMlezzXim
 QM6NULU/ECAJLJEuW36Qg0BuQEUljlcuB0Gq6gIFv7pVHXa03pS6plW2jLkDdIemcnCg
 4nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UYyUfulGoq5FHxq85Agbxdr02/H0+T6oZ3yMNNL5wSE=;
 b=uU03GQeTayrOdP2LryepR3yxbRWbLV1sZUiot8S7gTvT28dE3kVGjGD1LGpPq5afgK
 TDG4r7EBED0k9VDSDZ6NLL0VxN8//b69wKmLmKxEkeQD0BCbWb1Vfn20Deg8KERvB9ej
 WzQC1NyxC+7YFWpq5SPkLcBJtFv1tMXspGaLFoNnHVoS6LbHtvcrPcsNwEIbakLj9TpQ
 neJiTVMrvpjrKh7nrPv1LjwmcVPLHio5lKN6xoG2JQR+ylmE+WuZwpj489KRqaAe6zXV
 jxFNrYCqAQKUjyt4CVtOf4gnQlSpijtQGlgXXZrJzHENJEftd9ZAf/f7aKg0dKMBhl7h
 3Mew==
X-Gm-Message-State: ANoB5pkxi7idvVsPVBxRjkIjOXiShXeS/I84vK5aPgBtv3qq/ZZpaBsy
 ATw1mU7aeIc6Ucr56pGFPAFD7mI0oP8dOluzvmw=
X-Google-Smtp-Source: AA0mqf4CgbRPy6MV4IXnA9D5jawvq9spRHAio0wB5IjrrjcNaGyOSoAAgwTsiWLPRcqJ8Me7xF+LX/DbmtwOH/KFoXA=
X-Received: by 2002:a81:5309:0:b0:38f:80d5:f22d with SMTP id
 h9-20020a815309000000b0038f80d5f22dmr38046669ywb.296.1669755568529; Tue, 29
 Nov 2022 12:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20221129204146.550394-1-richard.henderson@linaro.org>
In-Reply-To: <20221129204146.550394-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 15:59:17 -0500
Message-ID: <CAJSP0QUB7TBbgxg=oJ6Js-AZb+yLzGb=tcso5K3dsyOGbSVkmw@mail.gmail.com>
Subject: Re: [PATCH for-7.2] target/arm: Set TCGCPUOps.restore_state_to_opc
 for v7m
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
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

Waiting for Evgeny's Signed-off-by. It seems a -rc4 tag will be
required anyway for vhost fixes so I'll wait.

Stefan

