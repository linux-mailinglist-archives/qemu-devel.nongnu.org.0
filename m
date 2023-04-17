Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B06E50C1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:22:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUQS-0000Ly-GF; Mon, 17 Apr 2023 15:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poUQE-0000Fq-Bi
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:21:57 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poUQB-0007uy-Df
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:21:53 -0400
Received: by mail-ej1-x62a.google.com with SMTP id fw30so14285144ejc.5
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681759308; x=1684351308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsZ0eocG7j/LGeX4n/+ZlUQKTHBgWZnUgcseicYclso=;
 b=r6znnmUqZbmSQCl0wUha4muKHzW545nkmah0MweaTeTJySHdGFnvN7oqQ+OVf/Ij1g
 3wiHEiQGeN3GSMT/1Jxm2N57ji9QLpNUdUXfp4YUKwOYCcSSES3szyU8SLaXvvAKVWbU
 pcMNc9d22SxVdfnDiDoc+eOmm41OFYMmGo7NMXxVJ/SxjhQa1sNIDVu7n6Dt4N29Iff5
 UOiyf0a2VwDihe7sC+3I3mo8TahPp1Ah//L+uV0l9rxHfp8ZfwZCjKmM1FpRYgv4Go6l
 LB/qqhryeMjczD5aLzqpkbRJVU8VY/lzDfDKGLnDzt/LdAofmPfHKiJyLICAUY+cfRGt
 sbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681759308; x=1684351308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsZ0eocG7j/LGeX4n/+ZlUQKTHBgWZnUgcseicYclso=;
 b=VcEBnsjRr9uEUHl1CpMDnXZKJNtOrNPSD6gJwXx8yUhAovwCd8cCjNbS3y1zBPRSim
 yJGmJEX4F2itK33vCi2Yd5D5sDslh1+xund5qiMHGUMRXdFL8SK8pF2VW8bNSFgyf8Mu
 gxsUuRJZXBc429zvFyXWKHdly2N/MkxUOzBBG7hZb0lXsvzFMfX67V/+Y3DFmDHN4fO1
 ZL+TQDugQvzS6LneYMQdhcUbybKgCWc+UyG+XvW1NKWi8JOPyF+oYrhM10fe3XHrTXpf
 4g7PgbzHYRpBB1xSjTcu4UILGJCOL51jIxuQZ2NsMmbuuiPqOgByryqnWOK8zzfWmoGp
 0Rpw==
X-Gm-Message-State: AAQBX9dopFks0E9uJHOOtxDWN50QLhOXpeaAOwnz1mHa0qWEAk/c6jFG
 Qo74kFrGBpU8XtqnCSQJFnLHFnGE9ndsrw==
X-Google-Smtp-Source: AKy350bXhmM/2A9FSiSEPzOKXkxkD/B0kwL/YsCWO+mm6A8bQ+3Tl1zBWTbKQI0K1124yBMZUi0zFA==
X-Received: by 2002:a17:906:6888:b0:94e:7bde:3108 with SMTP id
 n8-20020a170906688800b0094e7bde3108mr8792782ejr.27.1681759308067; 
 Mon, 17 Apr 2023 12:21:48 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-025-091.89.12.pool.telefonica.de. [89.12.25.91])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1709066b9300b0094a65f209d7sm6940134ejr.119.2023.04.17.12.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 12:21:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/2] SDL2 usability fixes
Date: Mon, 17 Apr 2023 21:21:37 +0200
Message-Id: <20230417192139.43263-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I'm trying to use QEMU on Windows hosts for fun and for profit. While the G=
TK=0D
GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does. Hence I=
=0D
used the SDL2 GUI where I ran into several issues of which two are fixed in=
=0D
this series, which are:=0D
=0D
* Alt+Tab switches tasks on the host rather than in the guest in fullscreen=
 mode=0D
* Alt+F4 closes QEMU rather than a graphical task in the guest=0D
=0D
More information about each issue is provided in the patches.=0D
=0D
v2:=0D
* Omit AltGr patch since Voker is taking care of it=0D
* Protect Alt+Tab hint with #ifdef (Volker)=0D
=0D
Bernhard Beschow (2):=0D
  ui/sdl2: Grab Alt+Tab also in fullscreen mode=0D
  ui/sdl2: Grab Alt+F4 also under Windows=0D
=0D
 ui/sdl2.c | 4 ++++=0D
 1 file changed, 4 insertions(+)=0D
=0D
-- =0D
2.40.0=0D
=0D

