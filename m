Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FC58CD0D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:51:15 +0200 (CEST)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6uH-0008TZ-JX
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oL6qq-0006DA-Ii
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:47:40 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oL6qo-0000EE-SH
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:47:40 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id j63so14730113ybb.13
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=yTMNqzFV7okcsN7resatl7CT/e6C4KrFJe6szbVSBRA=;
 b=p3sUrDWJwswxq7v6JZUfdH2Q0TZhuNnbhUoiKIbT7RQt3I3ubOuFbBTW1IjRxC5Lvc
 K5xWTLyIL2upX44QG8zCJvj78M88oBugnexPbRaZOXX4/0fekRzOj8/Sx6r+13557V+D
 uNuKAvHHk1RJ+wdaW4KWWZmfM0HqcdSqfHCK9b/Yy0H7pC5kxgZM7YT/8hiUM2IhHNfl
 hfIs1oRzvus9J2EFA/Ee2xBkDjZEpDZOZQRILWwIS+xZFcUBymN/8fAvDui/8DXEE6kX
 WyPr6nnAnbakJplIPTVtQtfUGVLsIlivOujdahOm8UZvifvB+DLobQvPd0rpdqaRz1ir
 yZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=yTMNqzFV7okcsN7resatl7CT/e6C4KrFJe6szbVSBRA=;
 b=3KtLSn+GICpq2VGJgBRV59WapKDwZL0W1OoFSbzap7MyD/88LrvTynG7jFTYn7MNS5
 4vcMHsPEObH+4muJ+piZBBAK7QbtOf4mmb6dI5WUu+d1Hda7pLAyPjfJiIXjx7w05Z+Y
 XG2cUqFMe9xCS+shKhmfasxg/mr3Ppr+wylzztqvPMGaWeE5NwOW8jB3FiJbB8E4IS/X
 GgIgPtNwblztpPrVyJXLE4q/A/irkOXRpB8ANGDDbCkQzPv3gXgiXlcVpf90ElWOWdDy
 TTUiKQ/snJ2Ke1r37PmwB/d1CNW2dotUuARVrNxHrmJh88Hm14hg0XhFsKn8xVUVwD0l
 Kt3A==
X-Gm-Message-State: ACgBeo3ivm+5c+p2FL719viCX46c/KCJzHZN7DXAm+fMLHJGNUn0Z2YU
 N+cRFhPk9zuNbY+Vqnwh1nSAFkD/KMhQR7gloNkzP87y59U=
X-Google-Smtp-Source: AA6agR7lgoNuvRmtCKM0FRmWoI6IrgzjC2ug/GcqzhHmLFKJ4FNxM3gPcg3v2rj8x+rKwOpuKugXAWtxpSnBsMxXfks=
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr16535851ybg.288.1659980857700; Mon, 08
 Aug 2022 10:47:37 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Aug 2022 18:47:26 +0100
Message-ID: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
Subject: how long do we need to retain gitlab CI job stdout logs?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi; I just reduced QEMU's storage usage on gitlab by 130GB (no typo!)
using https://gitlab.com/eskultety/gitlab_cleaner, which Dan helpfully
pointed me at. This script removes old pipelines, which take up a
lot of storage space for QEMU because they include the stdout logs
for all the CI jobs in the pipeline. (Gitlab doesn't expire these,
either by default or configurably -- you have to either manually delete
the pipeline in the UI or else use the API, as this script does.)

I somewhat conservatively only blew away pipelines from before the
1st January 2022. I feel like we don't really even need 6 months worth
of CI job logs, though -- any views on whether we should be pruning
them more aggressively ?

thanks
-- PMM

