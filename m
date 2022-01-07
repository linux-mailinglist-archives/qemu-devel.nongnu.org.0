Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCE487D68
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:01:23 +0100 (CET)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5uTe-0002ef-91
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 14:00:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5uI2-0007q5-QM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:48:38 -0500
Received: from [2a00:1450:4864:20::433] (port=43995
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5uHs-0005TP-Vk
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:48:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id o3so12721086wrh.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 10:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=raftlsgfS0DQzuOTvWNeZTfeD+RimU34KWwkH9tPzXs=;
 b=NbTWi5M8MEUi0BMTcfYbnzqyj+f5aYFWoCxMXQurA9exrgDjgLVAbGS+vN0aZiDYI+
 1IRQc1VOo4NukUiZql4qunI9YKvTBUesEeqQkYh01nkestt8s8wPyNhE4B9UuBq652zj
 6mBQaM4bY+JlzD0ZwhnawuXxUVaJllVSTx2bNHQXbszLB2O1wiy0Qzi6tHOTxL/kUdbt
 1ZQNNfqV8ePvLwNVxEBZ0kzLTz1varW700B07QaJCeUTv64LmtUvragToRP5fvHeSan9
 0opvPRk+00khMAQRIRzwT7qQjZfPRz+Wc4QM5UUsXWMtSEvV+uf9Ws7IWSrkQhZjtFJB
 0W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raftlsgfS0DQzuOTvWNeZTfeD+RimU34KWwkH9tPzXs=;
 b=ppUOG/m+C8EMkmlaJP+TUUPcvXF70bsMrkQkJZLV1nIGa2UevEf4mr11aafknboG8l
 KBkqbpV7h7ace6XeYWgqiTMBWKAg2l4jUUqzHkos3qoJcdWQiEnt3QUxIszDF2/patSz
 3Ds+5wg4Gi4whhppBI0cVI2tD1fif38G9BTy9n8wCk96kW/UYkL5fwe4J6GB5wShZCEd
 xfWFWfjTJBhsHk+8CrEnWCe5yV1vtlPE28r5CwuYhCcIS41Lu2XKNESnVJ4vw3O3ReJQ
 pyHjmpb/QXHecoxp/yt8EgEzztbsFGQyF2o/nLWu7Qvp8CzoA0LVJAWk6fYSRmCNxtHQ
 b9ww==
X-Gm-Message-State: AOAM530CVpnm4r62s82htiqpSw7tnBDncbl4jxn9u2Wa+kbCPIWh8OzY
 e2M0WhBrx49CFXT7J+kGr9tdHRt/A2AMOPq8SHjtwUVA/QY=
X-Google-Smtp-Source: ABdhPJxSrCyrEJr1EOWUT8XHqQX7+3cJ1ZfTXpm2LDTyfxkzeXIDtwiHj6P1/dInVJ97Wnu5CZ4/oDt3wl8O0HKcwDM=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr34251380wrv.521.1641581307149; 
 Fri, 07 Jan 2022 10:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20211227211642.994461-1-maz@kernel.org>
 <20211227211642.994461-4-maz@kernel.org>
 <ef8b3500-04ab-5434-6a04-0e8b1dcc65d1@redhat.com>
 <871r1kzhbp.wl-maz@kernel.org>
 <d330de15-b452-1f9c-14fa-906b88a8b4c4@redhat.com>
 <87y23rtnny.wl-maz@kernel.org>
In-Reply-To: <87y23rtnny.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 18:48:16 +0000
Message-ID: <CAFEAcA8KCZFfiYA_AAxA-ChfN5vZd7EF1jGcFxmcpq=fi4ToeQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 18:18, Marc Zyngier <maz@kernel.org> wrote:
> This is a chicken and egg problem: you need the IPA size to compute
> the memory map, and you need the memory map to compute the IPA
> size. Fun, isn't it?
>
> At the moment, virt_set_memmap() doesn't know about the IPA space,
> generates a highest_gpa that may not work, and we end-up failing
> because the resulting VM type is out of bound.
>
> My solution to that is to feed the *maximum* IPA size to
> virt_set_memmap(), compute the memory map there, and then use
> highest_gpa to compute the actual IPA size that is used to create the
> VM. By knowing the IPA limit in virt_set_memmap(), I'm able to keep it
> in check and avoid generating an unusable memory map.

Is there any reason not to just always create the VM with the
maximum supported IPA size, rather than trying to create it
with the smallest IPA size that will work? (ie skip the last
step of computing the IPA size to create the VM with)

-- PMM

