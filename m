Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936062F70F0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:28:45 +0100 (CET)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Fn2-0007KL-Ku
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Flf-0005vN-3j
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:19 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0FlY-0000dt-Py
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:15 -0500
Received: by mail-pf1-x42b.google.com with SMTP id h10so4620647pfo.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5p801JKIJC/wp03gj/uy7UR5GXKX9PM9orgLXl9Gn4=;
 b=BWYowHHMi1K4dR3TfIyTEaeFgLGI0ReJ2a/dnQANhkvl+XTv10eRqLbuYGQI5KF5rH
 ZuN6vsQvUN924MtXfpEHX771Uzu2qYi897Al+rZK42Fjuoamsjmn8mmtoUSsF0zcngYo
 6fYh1He2fnv3Ic9ApsET9d9aWmjE7MUpNRxR7mkQbDj0aCtOdHqqJLMZpKxgBcnoYC9N
 fbymSiAuafkuR5kaiZ3ZMyUpmRSZkZ5GlTqSVl1IHNv2qRCOn8jnGOIirRiXH69YdsaK
 dw2UEqgt9ayjGYVAeESzqsG+I+J/ilMEwaULKJMlhKp7kmHiHNY9AbyZvxvlrf+U9NUc
 lkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5p801JKIJC/wp03gj/uy7UR5GXKX9PM9orgLXl9Gn4=;
 b=Ns6zHsm7duU8u5jG8G477MB7nhhCSiM2n5VB1zpQLrFozbPi5kFeZ915OthBZN8lxN
 Y9+Qr3IccznJfSpeFmfpEcrcqbu7kz8tlkt4n1VM+mcteZaPI+KoAyYEnd+tq3WwhJNe
 cl7I/010L5pzQnau+dT9ayZGfncY/Rz3fPB9vfXiVK30wHj2vx1HnKjS1PtN91HkWYrL
 4Fn5HodCNl5Xl0Xi3HoXQMZWU+1SKpf4Rtt6n2h2XjkNuh2hOfqQ6asae1DIyytFvzC/
 xVmd34Y18PW7Z3zr6hQHsf15pLpb0tyJbYaFZXVtIw4oL8TnFpvpwVXkYspr7YkDf3J7
 df+Q==
X-Gm-Message-State: AOAM5312hjLfCBfN32vR0bF/HDe4mPZLq1nlAUf35mdudkTjB/awJHfV
 1AdpUddf9DLTxmJFZwEkjfFZCg==
X-Google-Smtp-Source: ABdhPJystvTqKFsbp7GuYLWbYriAf9+svRzOsn0EAiHJlfl+O5MsKlCfoqCN1Q68q6CcbcfHubAlnw==
X-Received: by 2002:a63:cb0e:: with SMTP id p14mr10480271pgg.408.1610681230911; 
 Thu, 14 Jan 2021 19:27:10 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id j16sm6583662pjj.18.2021.01.14.19.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:27:10 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v4 0/3] support NVMe smart critial warning injection
Date: Fri, 15 Jan 2021 11:26:59 +0800
Message-Id: <20210115032702.466631-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3 -> v4:
- Drop "Fix overwritten bar.cap". (Already fixed)

- Avoid to enqueue the duplicate event.

- Several minor changes for coding style & function/variable name.

v2 -> v3:
- Introduce "Persistent Memory Region has become read-only or
  unreliable"

- Fix overwritten bar.cap

- Check smart critical warning value from QOM.

- Trigger asynchronous event during smart warning injection.

v1 -> v2:
- Suggested by Philippe & Klaus, set/get smart_critical_warning by QMP.

v1:
- Add smart_critical_warning for nvme device which can be set by QEMU
  command line to emulate hardware error.

Zhenwei Pi (3):
  block/nvme: introduce bit 5 for critical warning
  hw/block/nvme: add smart_critical_warning property
  hw/blocl/nvme: trigger async event during injecting smart warning

 hw/block/nvme.c      | 91 +++++++++++++++++++++++++++++++++++++++-----
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  3 ++
 3 files changed, 86 insertions(+), 9 deletions(-)

-- 
2.25.1


