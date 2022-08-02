Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C4587E2D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:33:33 +0200 (CEST)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsxg-0003XQ-HY
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIsvC-0001TT-SS
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:30:58 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:34483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIsv7-0003KR-P5
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:30:58 -0400
Received: by mail-vs1-f52.google.com with SMTP id j2so8243853vsp.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=wX3DpG7juVH46IwEEWXOOXb7d7REkqAnigCj7WtUsLM=;
 b=tPuLyTCN/6MBYMXKJOMmwMBccXpvRvmdFuJdNCtjlk5w5307C/pfw/U7DLo8R+C4aZ
 rb7UllErVg73Ftn6bKZhxFp9Hv75RR8hqYXlfEW4kr/88wlOPKH2luvw13P4VfgbOQFu
 zpQb6ZPSrr6V5G61LlSaKacUtD/r8Ds4EZyHoGDBGPhyd4caq/3d1pjmpGM4MGLItGyu
 y5sfshOqX1Xfe0yVO2+DElqRXnJGqtDpkaJn5JHizLFhVNX5Q0WehrVRkOEZoRSTPGKQ
 8YMNgi8T662tk4RwraRN7UUoydcgtp4MWTeorFwfF5BhUaChPEdMOgDlY56sVzdxGXK9
 aRaw==
X-Gm-Message-State: ACgBeo1/VeqdOOpbYakcXWyHoy70e9vEeCjR0j2WhK+kSbH3n/mahwKK
 Q+CN6aJMzaTR6NGm0MvrsIJ+EjVukZeu7F7TeaKrrL5PJHM=
X-Google-Smtp-Source: AA6agR58b3bxI6eS/pJWkKyv3mJJL3ysbjoKEkiluxGChF5gpQFmwvo5kWQ/2Ayt3EiJ8kd7X4cRm2Cd5Dy+DhVzyQE=
X-Received: by 2002:a05:6102:902:b0:387:275c:4e95 with SMTP id
 x2-20020a056102090200b00387275c4e95mr2756228vsh.83.1659450652814; Tue, 02 Aug
 2022 07:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <165943656662.362178.2086588841425038338.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165943656662.362178.2086588841425038338.stgit@pasha-ThinkPad-X280>
Date: Tue, 2 Aug 2022 16:30:41 +0200
Message-ID: <CAAdtpL57dypi5EE8q4fkhdDyekw=CDcFn5sD-oG1rkO2e8smew@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: fix replay-linux test
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.52;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Aug 2, 2022 at 12:46 PM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> Last line of the test is missing by accident.
> This patch fixes the script.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/avocado/replay_linux.py |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

