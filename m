Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648993FB30A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:20:55 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdTA-0001mm-De
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKdQi-0008DC-Iu
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:18:13 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKdQd-0000qd-O7
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:18:12 -0400
Received: by mail-ej1-x632.google.com with SMTP id me10so29651581ejb.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nGnWNeqjPZGVSMiwdYMev+aH1orq5xIssQR95XnHGgo=;
 b=Y/bD0xN0F3KQMD/mO2ZoCjWZOAGu0gCzm/guJmKeY7WmJf4DwQVwjGW4tZXY1yqAW0
 r59QFxvQT8Uyvkx2M7DRfMgtW1g86Pl9RrJzlq0V5rKNqrNwcBPFoesv3AAoT1IzffPU
 9rOf0/BiN28pyQfAGKILvFBM53I7zcXyMRYhuQDlY5JzuNC2+EgLN5A9jGUa+qWyD6iC
 NYFcgNX83oMMcE0OVF3eHVEddGYJs7n8sJCW/kThxy6IykKMXFA8u1YIkIIaJ0UgRcFI
 OdvQopckA0QT2haEH/Usts7N3FUEKExrp4tSpvkBbyTNOAwt3bl0Kr7dY8o2jaoVk/uz
 pk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nGnWNeqjPZGVSMiwdYMev+aH1orq5xIssQR95XnHGgo=;
 b=E2QKwFl7oOG6J/F7zMEC5Et4Djktk7wX2r7EONe1ceWscKcEDIcWoKVJnkxR5ijKI7
 eruebBi9YmH6zCq6IjmFfbGetgQzvCd1tnIIrC1u8K8aYF3CEilSb1uuMd1to3THaz19
 E3llmOmkb0FAAcN1IMKp55VVVWcPgUYmZCcgcPqRV8bWvfKitICIl6O688X5uw6keiI8
 AfWW78+58jDzkC441K1S9Jv9lq0PNiiM5M3n0xV71VyVUpnrS18WNkYhKvjynCJ4aWvt
 +K+2lvHYrrmF5BLds5bmXhiXrU99frg8T71FXqbmlR22U0qfoVf8PsNetiY1GshU4Lv5
 hHmw==
X-Gm-Message-State: AOAM532HPSjj/ZweBW1YLF7HVuoTaW/NeJVk2CmDQJf3kC9zuBcgS3b+
 5MyGmsAGjQKxYsMxjBxQgkYFY5v38pWoM1cSXcr2OQ==
X-Google-Smtp-Source: ABdhPJwSy3QPkqntVzoWMnNPNTuvX0U7n4yTRR/A0Gpc7pZwzqL6RVQjMfb6MPWeuMm5CwQwuoD+9TUsXanmP1a81YU=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr24641414ejz.250.1630315086142; 
 Mon, 30 Aug 2021 02:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210826131725.22449-1-peter.maydell@linaro.org>
 <20210826131725.22449-11-peter.maydell@linaro.org>
In-Reply-To: <20210826131725.22449-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 10:17:18 +0100
Message-ID: <CAFEAcA-hCtXa7OpHqhP6CAzvHg5n73j3XB=TuwHOoBV3JeAntA@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] target/arm: Implement MVE FP max/min across
 vector
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 14:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Implement the MVE VMAXNMV, VMINNMV, VMAXNMAV, VMINNMAV insns.  These
> calculate the maximum or minimum of floating point elements across a
> vector, starting with a value in a general purpose register and
> returning the result there.
>

> @@ -440,6 +444,10 @@ VMLADAV_S        1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
>  VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
>
>  {
> +  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
> +  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
>    VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
>    VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
>    VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
> @@ -449,6 +457,10 @@ VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
>  }
>
>  {
> +  VMAXNMAV       1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
> +  VMINNMAV       1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
> +  VMAXNMV        1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
> +  VMINNMV        1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
>    VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
>    VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
>    VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz

I just realized that I forgot to do part of Richard's review
comments on the first version of this patch, about adding some
extra [] blocks here.

https://patchew.org/QEMU/20210729111512.16541-1-peter.maydell@linaro.org/20210729111512.16541-46-peter.maydell@linaro.org/

Diff to squash in:

index 1a18c3b8eeb..a46372f8c77 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -444,25 +444,33 @@ VMLADAV_S        1110 1110 1111  ... 0 ... .
1111 . 0 . 0 ... 1 @vmladav_nosz
 VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz

 {
-  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
-  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
-  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
-  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
-  VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
-  VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  [
+    VMAXNMAV     1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+    VMINNMAV     1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+    VMAXNMV      1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+    VMINNMV      1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+  ]
+  [
+    VMAXV_S      1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINV_S      1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+    VMAXAV       1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINAV       1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  ]
   VMLADAV_S      1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }

 {
-  VMAXNMAV       1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
-  VMINNMAV       1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
-  VMAXNMV        1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
-  VMINNMV        1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
-  VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  [
+    VMAXNMAV     1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+    VMINNMAV     1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+    VMAXNMV      1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+    VMINNMV      1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+  ]
+  [
+    VMAXV_U      1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINV_U      1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  ]
   VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }


-- PMM

