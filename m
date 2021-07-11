Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE453C3EF5
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:14:55 +0200 (CEST)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2fqo-0007Y1-2i
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m2fpl-0006qq-Pq
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:13:49 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m2fpk-0000hV-HD
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:13:49 -0400
Received: by mail-lf1-x12a.google.com with SMTP id v6so743809lfp.6
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HkkE83YWXSph8GGIQ7a8kcVSWWojDzOTgjqgI2j1TWo=;
 b=UUylzr1hG+ZQjAhsc+9yWJYeijJ2x+miim2+7b/KM6QSUabvG6o9hQ2P0ZiO6pacO9
 uYSX+UUKZYEbYZm/LMy1M901MLhaAn5skTZpAkAi1isP0E/19XcfuoqcN2CbTXFeLdQc
 5h5ATDmOJW1CoXMk1FY1g/fNmDGYdDzoHq60d4OxXFdOlOjfCTv770WeCqo6dIrugDbY
 L3cMS1d/CxcSiTM1OfjWMVJqyTeIkUTkAm5rveGP4Y4Rezn//OCqaBcYLkOifLAMOIr+
 VMek4FnVrxYpgTcsWBzt5Ug0xcvtLyKfrbT2Gy19jNOGLL6rWiy5wLqpWhx6CHwE7ka0
 +thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HkkE83YWXSph8GGIQ7a8kcVSWWojDzOTgjqgI2j1TWo=;
 b=mMcuJ8mJzJXAWEzBuHgdTYfDyi4kTm7KuF9NRTTsdIDaJ9TTH+X6DcH7R0sN2AVtaQ
 AWJ7BPhEO5n1FP9EJV5eSz8MRnPge8Cc+ZYkpdLOPcwaR1pjyQMMcHvyhANEwfjH63Nr
 d027rhuFbfZirskxM//t5Oyr/oGA71tj2Ir45MfWamCyG/wNv/tM3qElHIGbx9iKnRAt
 RkZhFiHPjWCI54kZsM23Xq3+jd+6EduVGDMeKbByJPhtjSoSxxZOEX0Y27dPXDMms45q
 JdnJI6k55BCOxZDMEmxGenLgv+t++RXLIZwFREvgmaj1GM3q17zOERi1Ypwbuk1figvT
 5NtA==
X-Gm-Message-State: AOAM533K2zdFayv4zIRMG20TqbVyu9x7jQzqOvTnXZSIWWU8Sc2vnld4
 UWwh3C9kUtaa2F/u64gu4f0JuujtuKswaxztaGI=
X-Google-Smtp-Source: ABdhPJyKW8APxPy/WdNLH5AQFZlV2Reke51kIv1QMnURdqM9GxloNk/zRZujUtXhKGCwxZYFaSvSih2DNjQQSE4d8Kk=
X-Received: by 2002:a19:2d0a:: with SMTP id k10mr38478844lfj.301.1626034426019; 
 Sun, 11 Jul 2021 13:13:46 -0700 (PDT)
MIME-Version: 1.0
From: harry harry <hiharryharryharry@gmail.com>
Date: Sun, 11 Jul 2021 15:13:39 -0500
Message-ID: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
Subject: About two-dimensional page translation (e.g., Intel EPT) and shadow
 page table in Linux QEMU/KVM
To: kvm@vger.kernel.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com, Sean Christopherson <sean.j.christopherson@intel.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I hope you are very well! May I know whether it is possible to enable
two-dimensional page translation (e.g., Intel EPT) mechanisms and
shadow page table mechanisms in Linux QEMU/KVM at the same time on a
physical server? For example, if the physical server has 80 cores, is
it possible to let 40 cores use Intel EPT mechanisms for page
translation and the other 40 cores use shadow page table mechanisms?
Thanks!

Best,
Harry

