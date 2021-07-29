Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C552B3DA611
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:12:09 +0200 (CEST)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96lc-0001Z2-SP
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m96kZ-0000AU-6W
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:11:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m96kX-0006Mc-PH
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:11:02 -0400
Received: by mail-ej1-x62a.google.com with SMTP id nb11so10979532ejc.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QbrMwzr3wkaL/w9ejgVD7JYBc03Vi8GuvADW7Wdh44=;
 b=HyOuQtDfrLRhPV7ojnbQu6nwnm0Y2lZvYUrJ5Oj35fUJdbN04z7mfv7AZRfq2pxdbQ
 arA/uhsG6EgJc0nngRyJH3bXDRAZHB7VbC6kGatwq4qZGSy+/mC67PuH3JrlaaL3HEaP
 +qXVN8jXwUgs3hIVnJKTRBNsFpFkYFatg0FDOQVbZmkG7prkJGK/FFdJc/E3RBu+6dhC
 t5Qkoe5YehPzB8lsRlwapPGJTESHFFFJBZadmY/m145x27itOXtnWUWWHuHE8mpqX2vN
 anX/X/vmPuvoGpA1rL3S8IYrzN4J07ixp4xIr6Y2TbhoefeB1Su+xx6+I7Kyn21M8j42
 f0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4QbrMwzr3wkaL/w9ejgVD7JYBc03Vi8GuvADW7Wdh44=;
 b=dmJpr+QkDp/mUMBuqB3SdRrf2Mc7Tiw1X+ERIZBjbFHk0LfjzRQ75tWriGIdWekLvi
 ZdM0+ne/d2Z0FPNaOgxW/ud7ZAt+x5b+2gSEermEFhD2ADx+XLod/rGQ4mhW4IADZhtb
 ihEI9yJvQmmQHky2vkL7B9vGqyVJ9s8czAnbt7wacGuoFf8LaylgxGqnkoqve4EzIR3F
 VtcKJxDDaw1uUAn3e+XDQbETSictDSkD3dFGtZcYBTz3GR/piHW4649aqgxwh+svnVoM
 q5HFv0ECBJTyg0nFm6e2RTHdeVi+ETMY8rv1JBQiZe1LmmBmHhFs1d1zVav74+ykZ/he
 RwEg==
X-Gm-Message-State: AOAM530spRHApju2pRFvAm8BpcgF93mvxJ4DvA8Ai4DNItHFDYyPTj1J
 y2IUBnIhip+m/D0O533A5Rnud5PXrgEHLQ==
X-Google-Smtp-Source: ABdhPJynPacjCWQDAaFH7RijxLffjwQ/rF81y8NtGwjG1i6+qvudB51ERCZtbGUp7jkw8zeZVjcLuQ==
X-Received: by 2002:a17:906:3016:: with SMTP id
 22mr4744818ejz.28.1627567859887; 
 Thu, 29 Jul 2021 07:10:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id mf1sm1024132ejb.51.2021.07.29.07.10.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 07:10:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] vl: fix passing smp options via -readconfig
Date: Thu, 29 Jul 2021 16:10:56 +0200
Message-Id: <20210729141058.228405-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Even though [smp] does not work in config files, [smp-opts] does
and lxd is using it.  So, fix it.

Paolo Bonzini (2):
  vl: introduce machine_merge_property
  vl: stop recording -smp in QemuOpts

 softmmu/vl.c | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

-- 
2.31.1


