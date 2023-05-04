Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F486F72C5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:04:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pueEs-0005TP-GW; Thu, 04 May 2023 15:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pueEq-0005RG-5v
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:03:36 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pueEn-0002tz-QC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:03:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a5f462so21923a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 12:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683227011; x=1685819011;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4cwyAg0OgqIIeta2z0Lqq4eqeWHoWe6XEehlv4UhnWs=;
 b=QnyAbOFaPuWVz6G/M8IMWej5VvZxX0PnsxlYm5SBWgsoEfiQ9tZyHVWw/s2ZcUcVzL
 EAPKGtgoP/k8/HahXxQeU3lGCwAcM6hna1zJljk+kRECpWd2m3L5FjkQkzJlm4BEdWky
 DZH2jpAmGz3MgVONqiIrRx8xr6HVbZVejZWOKpAgHeak6yo7ZdfJ8zcD2io6Ll5uTRYZ
 HkRxRLYvuWME05CvbWHq6tgf9+WLGkK3zf7H8vFvEAZzuMbMmfYciADE/jfgilq3kDt+
 MmPl7Y7cyYJTL9l3blyAMU8DsDlI0yc1YG5FzQpHPLJ7vwF2YLcXX0YAOBZcn8CZfL0t
 Mp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227011; x=1685819011;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4cwyAg0OgqIIeta2z0Lqq4eqeWHoWe6XEehlv4UhnWs=;
 b=VLLoHXnBe/er6RuQhRpRqXztnPbyxbJPOBrEFCnR9G3rU3CYdahHbISTdskvmkQZSK
 dhKStY50U/MvfpYnFAuot6Cy5FWlLYTK1MxcUhH+nRmm8NqC3Zv/7Q2SCMxi7DVqgcK1
 la8we7wF/nJeehA8N5wff0Z8dzIuJe/1sSCNnC3XUNFAmjsFpSvlK60jDWDivZCfDIPw
 43a61IZukzaQEgeWYJ/+/8ZTSPid6FDZBxBkCa+gLzkm6HyPj32imX+J0V8K8xcq0Cv2
 WK9Zdg0Zrl2EzrrZgyKm4BeftCeexFIjrnhQ029WGnY69IRN7TbINw849qEqmvDZZlu1
 76Nw==
X-Gm-Message-State: AC+VfDzKXg+oHi/kUj3XOKa7kNhVKfjdEm96H17LPvlCAwsDZDuBZv7Q
 OJFF2jrSGgbONMWkKtyqxzYEPjDK8tuTeHyi3RF8EFKzez4sk+It6pvpZQ==
X-Google-Smtp-Source: ACHHUZ6ySphvIeGpjiosRJx9rnbo0E8HQPZpRCmIlZaoN9SgVfZL+cvkcJRU4VenAeowwIsmHG/jaIQB4WNG5ib7wKI=
X-Received: by 2002:a05:6402:b51:b0:50b:f6ce:2f3d with SMTP id
 bx17-20020a0564020b5100b0050bf6ce2f3dmr452edb.0.1683227010958; Thu, 04 May
 2023 12:03:30 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 4 May 2023 12:03:19 -0700
Message-ID: <CAO=notxJzdsy6S_f64f1nXGMGU-ZSr01iRDwc1-EyT5Lj9p1Dg@mail.gmail.com>
Subject: ssl fips self check fails with 7.2.0 on x86 TCG
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000113e7a05fae2d478"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=venture@google.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000113e7a05fae2d478
Content-Type: text/plain; charset="UTF-8"

Hi,

I just finished rebasing my team onto 7.2.0 and now I'm seeing
https://boringssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/self_check/self_check.c#361
fail.

I applied
https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.html and
it's still failing.

Is anyone else seeing this issue or have suggestions on how to debug it?

I haven't yet tried with 8.0.0 but that's my next step, although it also
needs the float32_exp3 patch.

Patrick

--000000000000113e7a05fae2d478
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I just finished rebasing my team on=
to 7.2.0 and now I&#39;m seeing=C2=A0<a href=3D"https://boringssl.googlesou=
rce.com/boringssl/+/master/crypto/fipsmodule/self_check/self_check.c#361">h=
ttps://boringssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/self=
_check/self_check.c#361</a> fail.</div><div><br></div><div>I applied=C2=A0<=
a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.ht=
ml">https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.html</a>=
 and it&#39;s still failing.</div><div><br></div><div>Is anyone else seeing=
 this issue or have suggestions on how to debug it?</div><div><br></div><di=
v>I haven&#39;t yet tried with 8.0.0 but that&#39;s my next step, although =
it also needs the float32_exp3 patch.</div><div><br></div><div>Patrick</div=
></div>

--000000000000113e7a05fae2d478--

