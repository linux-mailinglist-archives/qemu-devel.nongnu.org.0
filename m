Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014C672990
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 21:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIFCb-0006Nn-VM; Wed, 18 Jan 2023 15:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hao.xiang@bytedance.com>)
 id 1pIDf9-0006gj-DI
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:59:55 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hao.xiang@bytedance.com>)
 id 1pIDf7-00019r-8h
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:59:55 -0500
Received: by mail-lf1-x135.google.com with SMTP id j17so53077929lfr.3
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HK0q9FEFZMIJvnDWsa7KBgT9D1lhlyMZ6gp5uiCd1wg=;
 b=HEbqfxXw6e6MCYo25/sH/BgKZvHissfu91T2yA1QLRy+6yrIX0UnCRLsyHLasQRsTr
 aQ5Kkkzhi/ozg7oUxaTdHlxiWaEXzXbUaMzZW7QPLpS2upyx0ltoqB9atcMxVJIAxaTC
 HMzW1HErmvkzkFSUQsNSUxiSHblcFWKFojd3oSTAhrpwmDeMcXbd3r38EiLs4ac9jMWU
 OUl2faycDPu7hMl0c4IuzSaSsaT4fo75Fs0vr/EpkEuybM4PT/UjYSYa3y9/fZEi3spf
 LcZzS9vZqnP78C6HI31P4iV00QPe7HKuJYEvaEm2UQEqwyNXHH7G4lo8eg0UJ9fAKdv7
 fFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HK0q9FEFZMIJvnDWsa7KBgT9D1lhlyMZ6gp5uiCd1wg=;
 b=N7yTkkW6eJv+7i8rk67Fn0NPHqWh1YX4ooxhfPLe1PYzyxsOvMDkI8g326IT4l1svN
 4eiHnt5zWc0/q19I4Svuk2D4XZ2cfZU1So8MfR4TJbYQaK2ZhViQpqvYr6XKIPnkLWi6
 gf4ihQ9LL7iGlodUIQj/oErWFG9LIlOwFVC5s0q4DlBDK9rKFtt6VsdCgZFMNpo1VFBq
 Dd6MOst1MFEffuArsHQ3fsCNIZGd+cOG9zzb9GEJLcgMT0lwWRFQuMDI/5rj5geC1Qsh
 cnO5zoHi4XfyAklBeAWD4O5ijROLTHQ2ssn6YlBDw9tA/IOjZJkHoEyT53zrl5nMb0aM
 d5Lw==
X-Gm-Message-State: AFqh2kq2EURYiiV+YULXiyhsCH1FDMymz0Mhkb6C1BwBOPRvUCi0tVBl
 hJltB1hS6F6o841UqrgSLBlxl53R20yxxMFHZAQ2EV9VmtSYJA==
X-Google-Smtp-Source: AMrXdXvJlGDStQAQkiU1QIHYpfE1gCZHW6NY6wEnvsfdkPc94KbLFWL3e4z7govp+ZewTe0FNsAL5XTgm7oO4e3UcUA=
X-Received: by 2002:ac2:5e9c:0:b0:4cc:b784:c184 with SMTP id
 b28-20020ac25e9c000000b004ccb784c184mr848344lfq.641.1674068381085; Wed, 18
 Jan 2023 10:59:41 -0800 (PST)
MIME-Version: 1.0
From: "Hao Xiang ." <hao.xiang@bytedance.com>
Date: Wed, 18 Jan 2023 10:59:30 -0800
Message-ID: <CAAYibXhaSwTrv4M68csDSrG8+4cfuNTqyDZA8QoLO_gPSPQq4A@mail.gmail.com>
Subject: Integrating with new Intel DSA hardware offloading
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=hao.xiang@bytedance.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Jan 2023 15:38:31 -0500
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

Hi everyone,

I am looking into using the new Data Streaming Accelerator (DSA)
hardware acceleration feature built into the Intel Sapphire Rapids
system. One of the scenarios I am investigating is the QEMU live
migration feature. I noticed that during live migration, there is
pretty busy work checking zero memory page (memory comparison),
creating diff records between the previous and current state of a RAM
page (xbzrle) and just general memory page copying. These seem to be
very good fit for DSA offloading. I am wondering if there is any
ongoing work for that in the community?

Thanks, Hao

