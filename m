Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9416E3136
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 14:08:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnegI-0003Wl-Ay; Sat, 15 Apr 2023 08:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolas.prochazka@gmail.com>)
 id 1pnegF-0003Vp-Br
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 08:06:59 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nicolas.prochazka@gmail.com>)
 id 1pnegB-0004pU-4Y
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 08:06:58 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 m17-20020a056820051100b00544255b8790so222213ooj.11
 for <qemu-devel@nongnu.org>; Sat, 15 Apr 2023 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681560412; x=1684152412;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MmHDxs5oZrBuE1acvXqncYGc/b/8rLCBvsI5+Ry6epw=;
 b=JqjybXBK6yQKPPvsmHn3T2W3RiQFYBFgQt3YtDbQZWD0igcW7yYcu90Pperxv4mxFr
 AimCPffIZH5a4oU5jKvg6pk76yeFsn+wV27IeubqX4MXIR+PtGcjBP4y5SUmUwSO5kGT
 2m0FJQr4PYDjkKmh1Pyv4w4GOXVd7sh+VjNMQDgi6tJP1jRrtbah24SZZyBmlKNxOBJ+
 vloFA3FnVmQwmcWKZeTGvn3pD010e4jEpKbtOtbKJTMIwMaqcTuTfDhDmzsWjqU1oa0x
 TqnRAiv8TBWdBRf1GF3ydgISQPrZHrfAvBUOQ3PkFl5BaC96My8+qcXlN5FGsgcE7spk
 OevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681560412; x=1684152412;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MmHDxs5oZrBuE1acvXqncYGc/b/8rLCBvsI5+Ry6epw=;
 b=OtvLhGq6OkTsNkqw7DtmhYMF134inMHEgwWxcu0kQvA/6/kY8llvYYxSE4P7FNA/Sa
 t1dpBo3Bxa4SmijyA7PU5oUgAeoArydYbFqOsqDJ5bd0BjIb+hMx3723sTpIVTD/6ZN/
 9m0F+XdCI3Lk8BN3qjqwbrJB1cwpq5lMniQICstEeALnvL1Z17TWPYthwOGfgHm4sIpH
 IclZbupjf9qPBiW9FwYA79cMtLf+jOmQju2Dvp4bFz6rGAV3jhF9AmSymo125MyjbRMb
 q88jJujeySTshtXjbmXKBgul1TWb4UvjyIkKHUO034qmDzjCJ96DlziAy0UfaaXGws2y
 NumA==
X-Gm-Message-State: AAQBX9fTPB1moow59S5Uka1Ql+QDOr4kml0GiMM896K6voE7y7fF05Mq
 c1ur/RVF2oZbFMEBrEgtG/uGGkYQG+zLJvIO2jzFNtegggpYVg==
X-Google-Smtp-Source: AKy350b5mXdnHOR2xx4GpEMzL8rr6MIM4YcWzOkzwaT1wH++sPM8roulmNVzCuXLVscVHTQfhqf7nHfxcCSuzR9cUfY=
X-Received: by 2002:a4a:e1c6:0:b0:541:c20b:e3bd with SMTP id
 n6-20020a4ae1c6000000b00541c20be3bdmr4003945oot.0.1681560412320; Sat, 15 Apr
 2023 05:06:52 -0700 (PDT)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Sat, 15 Apr 2023 14:06:36 +0200
Message-ID: <CADdae-j3LbHKL6n05m4SVh5FYoE88fii-Gu8x616RmHt7WCj5g@mail.gmail.com>
Subject: Slow video output from webcam with qemu-xhci but smooth with usb-ehc
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=nicolas.prochazka@gmail.com; helo=mail-oo1-xc31.google.com
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

Hello,
In https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg03329.html
  an user submit an issue about using webcam with xhci vs ehci .
I'm in the same situation
qemu 7.2.1
windows 10
attach a usb webcam to an qemu xhci root cause webcam cannot be used (
choopy, freeze ... )
attach the same usb webcam with qemu ehci works perfectly .

Regards,
Nicolas Prochazka


<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Sans virus.www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

