Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B0630D43
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 09:21:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owJ4f-00024M-7Q; Sat, 19 Nov 2022 03:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1owJ4d-00024D-Lg
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 03:19:39 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1owJ4c-0000yY-2c
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 03:19:39 -0500
Received: by mail-il1-x12e.google.com with SMTP id s17so1811790ilp.1
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hev-cc.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+8ME8frzuxQygTfFZ4n7rapMTExD0b9m1e2nUR1KQpo=;
 b=jx4Qd7Af6wlkJkiQj0DGqtK2dPBl2YCnpHszAEYrvgjZpNMg1Yu1g+YjD7q8g55Tld
 3cwxzBTRrEl5HsTSwYALnB777WODy/K+kGNRv5w5XW77MSut1U7Q8/EFSoe3o+97rdUM
 Na/St8/3+wmnCgKLjvfKgBSJJTLJb2J+x309t2Dp/8bTR+vYADFK0DZna7c0y5rpkY+e
 EcAKkfyj/D3Aj4jlQQjdYILRmLDK2iRuB3Z/+cDmY1YQH/ffm1Q98kkp4imJ3q3/thI+
 cqPoAy3NSsXR5NlB4Q8ejVVMu+Y1vR56ENg5JlFY4kg0XjQyDwviLnFLCjdnlCRSxLRk
 CS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8ME8frzuxQygTfFZ4n7rapMTExD0b9m1e2nUR1KQpo=;
 b=uwYRMV1FUpxJHZ7WMmiUlGcpm3EZQWzr1NdTLpdVcuVZM02K+5KiCTPmiihRl4NMPA
 hKl5UYiUEuV9POANkBP4tK1pWbkUjmSgaidt/Zpv1D0Pqju/QpucTmFn6h2V+yXCGCKK
 JjrukA8VXVUlhIZlPzmgTAr5OCBCbL24GknMfi4qi38rIbj7q3JjNl4dzCfIOv6Miae3
 BNovtIum27rsFWDrS99e6dCrIB/D++UfoTedot+J7+/CqJj/b05d0sH5E470+fiT3QNG
 HJJZWByp+DqN9mlBIQ6FuD8cbIeOWK7itHZh+yzzhiOv8Iv2NuD+onKWVieFz1Nbi2Bl
 LMoQ==
X-Gm-Message-State: ANoB5pkMktmAFUvQzA0ceBwnIfhdjnkw07nXv/xYXn7WIUGZ+Yki/Waf
 hQ9IAMxARsZdrrytdu6ucwOJ5ymtpEo5lvF7ZgdSQw==
X-Google-Smtp-Source: AA0mqf6IWRbQO/aD/12B9AQKGZGjJ433tJutTJSPAkQexV82OREBP24MOs5K5F5KOebcvPOh4vjvkZPoBpZpEvacVJM=
X-Received: by 2002:a92:d1d2:0:b0:302:535a:6eca with SMTP id
 u18-20020a92d1d2000000b00302535a6ecamr4629224ilg.256.1668845974378; Sat, 19
 Nov 2022 00:19:34 -0800 (PST)
MIME-Version: 1.0
From: hev <r@hev.cc>
Date: Sat, 19 Nov 2022 16:19:23 +0800
Message-ID: <CAHirt9id_Q8K33D4+2iF07e-BhUsjUBBhby9k+BZU2dYg=KToA@mail.gmail.com>
Subject: Instruction concurrent modification issue of direct jump in AArch64
To: Richard Henderson <rth@twiddle.net>, Pranith Kumar <bobby.prani@gmail.com>,
 Qi Hu <huqi@loongson.cn>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e; envelope-from=r@hev.cc;
 helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I talked with Hu Qi about the risk of instruction concurrent
modification in TCG direct jump for LoongArch, and the conclusion is
that the implementation is correct.

Similarly, the AArch64 implementation doesn't seem to be quite
correct. IIUC, multiple instructions paired with an atomic write does
not guarantee atomic effects on the execution side.

For example, the issue in AArch64 is:

Instruction concurrent modification:

* Before:
  adrp
  addi
  br

* After
  b
  nop
  br

* May actually execution:
  adrp
  nop
  br

That will cause the jump to an unexpected address to execute, What do you think?

Regards,
Ray

