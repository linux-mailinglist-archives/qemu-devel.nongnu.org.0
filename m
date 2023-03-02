Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAF6A798A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 03:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXYkG-0000kS-Hn; Wed, 01 Mar 2023 21:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYkB-0000jB-5r
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 21:32:31 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYk7-00048a-SF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 21:32:30 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so1413050pjh.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 18:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677724343;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4UXPLfpRXeWjtHYgrdOgFIZrsGiUoZWchmtMXfPGG8c=;
 b=IL/bGjuFZC9b0Xk9YPFfc+nN1m90jXc3pi6ZdwL0vLxhatUoPVxskcRU9wJQ2YvN8S
 K0hJE261SKHZjdUWG6pcv1ppl29XqdpjujsxdLUKaOcbo43DWb4H8e5hIyk/FBu+YQOQ
 66+oNIM3VWnHofiNBYUIFZJxt3hwPHpVucXwX9enwTbu2KinbKydo8mNpPig9iW67Mzf
 LiXYjMkyg71EsFXgrCj4t2YVFfrFas8yRQSz02JAqr4lJZhlJDuly0nl5S6pC0pA+/bj
 glR9wIuj2OB3MtvS3PMy0yc6QIdu4kNS6UnKfIy/uaNVe4dWh+GujFXN64/X6lZSbYdB
 mThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677724343;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UXPLfpRXeWjtHYgrdOgFIZrsGiUoZWchmtMXfPGG8c=;
 b=plJYRvqQAEbEo/Eq013HTtT5kijiIwQYZh+tH5KC2aQzcbh7CqLhcaT3icdg81MOLv
 4mZdTHeCmMqn6iWnyEJX0qH2dYZleVXxVlnIdzQR6gP6SOId5PPDy9WmNz2/1Rbi3hWZ
 GakoMwDY0tcAKbAA6CJNPY4huIHGr3yNh+feIhTas+KLI3OnVdNjuS2eiPGy8D0peGn8
 E2ZfUay685P6nvE3WYBMnCKFNq1h2apXbyf4qsFDISYy8eCRWUjkLhZMJvWmzm8T6eT/
 QPeav9J8JSQ0Nuz1t/iCGFg1k0QJh+W5GKZIRzQgNerPA8lOS6MmvyCvJ/OXNK51FrS+
 X5vg==
X-Gm-Message-State: AO0yUKVkT44q0E18nODEuC5Aztzw8lxDIoXH9Xv05DY21nhIrsodB2pa
 ZLyYYaoIGJgLWKYxk7wGL164OA==
X-Google-Smtp-Source: AK7set9p37ChMJm/kUFLyfdRNshfthkNrkZtk9KDMZBunaTX5iNoPg9NB9DBX4OpUSHFuvdrxK4dYA==
X-Received: by 2002:a17:903:2448:b0:19c:d78b:cdc with SMTP id
 l8-20020a170903244800b0019cd78b0cdcmr10193347pls.5.1677724343370; 
 Wed, 01 Mar 2023 18:32:23 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 c5-20020a6566c5000000b00503000f0492sm1755765pgw.14.2023.03.01.18.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 18:32:22 -0800 (PST)
Date: Wed, 01 Mar 2023 18:32:22 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:31:21 PST (-0800)
Subject: Re: [PATCH 0/2] Fix the OpenSBI CI job and bump to v1.2
In-Reply-To: <20230224212543.20462-1-palmer@rivosinc.com>
CC: Bin Meng <bmeng.cn@gmail.com>, thuth@redhat.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Message-ID: <mhng-33fa8014-8db8-44e5-85d9-f2071db025ac@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 24 Feb 2023 13:25:41 PST (-0800), Palmer Dabbelt wrote:
> The OpenSBI version bump found a CI failure, which appears to actually
> have been related to the Docker version as opposed to the Ubuntu
> version -- at least assuming my local CI run
> <https://gitlab.com/palmer-dabbelt/qemu/-/jobs/3832389705> is accurate
> (thanks to Thomas for pointing out how to get those set up).
>
> I've left off the Ubuntu version upgrade because it's triggering some
> key-related issues when in apt.  That's probably worth doing, but I
> figured it'd be better to send these along now to try and get things
> unblocked.  The EDK2 Docker setup looks like it would have the same
> issue but I'll also keep that independent.

This is queued.

