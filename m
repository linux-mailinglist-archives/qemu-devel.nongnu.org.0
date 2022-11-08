Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02766620CEE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 11:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osLYG-0001vK-HP; Tue, 08 Nov 2022 05:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1osLYE-0001v2-OV; Tue, 08 Nov 2022 05:09:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1osLYD-0003uG-4m; Tue, 08 Nov 2022 05:09:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o4so20170609wrq.6;
 Tue, 08 Nov 2022 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PBuuYhT1JpZhLn9k4HBlA5caR0RMHj1xng42owFfgzk=;
 b=PVevaqfG2bG3Q15g5/Q02LvDxIbahRsrzXEIQmtS/LTtuM8inWMhGItU5Y9cxncxUU
 6GDBazTaGt7g8xAHulWDkRM4qIdmGCc+qEjdlOtKy6X7RVEltafpGRvQweu8tFlpENeE
 E7gAiu15CY9uhjgYxxwwOGcHS87Fq0bImU7h+L6lVsei3BhxKYKWpYT7Y4zvtyQgjpyA
 HX3ascxys744kTk9Yl8VaDSdCy2pZZ4UYJ235ktvFZpZos9XMPYF4dBzvOwpPzspyoox
 OQjPUrhXlhI64ILgI+d8znc7I+L2bYYMcMUBH7amsLZBVw+68rv/ukWF2sL57W6xjwxn
 T5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBuuYhT1JpZhLn9k4HBlA5caR0RMHj1xng42owFfgzk=;
 b=HPTqsWdz8zFAH4CCK29XYpk5j5w1DhIGjOn2cj/We+RFj4WGGBy+aQnhGXVB3jqSPV
 GynMqyt40iQidfXbvsBdXyMccLWcbUAkp+jM8/F7dHePTg9NAlSXqdGIRlBJ5+0gZgEQ
 x+ihIUIIEHtnHerkoAHjL0wk6ptwqVP5p4UkqA7puqMQbgpn4goK3lctdyWAR0IZ9OvK
 tZ+0b655Ivy4MH1vmg5odAxtsVoFKDbcCN+wHQDoPjqUNupw8z+4wrVRSNI9Os8LkqoM
 LUhx6SyxwxK+B152yKT/bfJ8mEJeNltXn/MXWFCNjw6qIM1B2e6h+DPGYGYNJaf91WAJ
 iCmA==
X-Gm-Message-State: ACrzQf15mjHHpo4KLqFukq+fcVnJ6UBpQFlbcKCXs+wNPwKSpIereaq9
 8BfkSKk3KofTcEsaQKZ5Hx9bjhU0RRClRU0KO4I=
X-Google-Smtp-Source: AMsMyM72fG9tXGcFww3l+94QhKy33EpMprb+NlccQjFR128c0V+kTmFsBqDeJdK9fkGVZ1FEmHFUhCB+f2fO/d2IUBI=
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id
 q16-20020adfea10000000b00236ec3e869dmr23416470wrm.33.1667902186330; Tue, 08
 Nov 2022 02:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
In-Reply-To: <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Tue, 8 Nov 2022 11:09:35 +0100
Message-ID: <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>, 
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x42c.google.com
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

Mads, thanks for the review and feedbacks. I worked on this a few months
ago but only managed to have it published now, I'm sorry for work being
done twice.

I'll add support for SSTEP_NOIRQ as you suggested.

For multi-core systems there's no particular issue, just I'm not
familiar with all of these topics and I'm asking for good practices. KVM
saves breakpoints information in struct 'KVMState', and following the
same approach I've updated struct 'HVFState' to store equivalent data.
To keep separate information for each cpu, KVM uses field 'kvm_state' in
struct 'CPUState' (see 'include/hw/core/cpu.h'), but at the moment
there's no analogous field for the HVF state (which is instead defined
as a single global variable in 'accel/hvf/hvf-accel-ops.c'). Should we
add a new field to 'CPUState' for the HVF state, or take a different
approach?

For your last question regarding `hv_vcpu_set_trap_debug_exceptions()`,
I think it's possible to move it to `hvf_arch_update_guest_debug()` but
I'm not confident about `hvf_arch_init_vcpu()`, I will experiment again.

