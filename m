Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C8A6AC329
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:26:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBlq-0005yA-Tg; Mon, 06 Mar 2023 09:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBla-0005vs-B9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:24:43 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBlW-00039j-Br
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:24:41 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 132so5602291pgh.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w9up3E/zaBdle4smgSLjNuwhRW4+exZxbv50CbyMUP4=;
 b=mK0VUPxgp2VpUtL32wJ0r7iuaIJeAELmTRBeDHTDRDSYm9O1uF+Nbd6od5K8agQTZi
 9DyKfh2lqDhFBd7SpASTXOPZ4XYCWyGrRfvGXY4YazfxganrdGvwkg0lD9PovB6s92HP
 GDBDzqvR4zdD6HQbGJsyGl5PW3RIwJSA/AZn0URYyaWT2MchicN3nRc99qYCgstkHkZq
 Bnld/hxj4YzL6e1nd/87KTD0spvTrA3Xf6mtxmH9euLj1zU4qEDciyGqURaKPJxgh1sc
 L0k7Y2HnnzHkw9yZkI3J/UUYi5zWb/HumOyT3DbUMGyXWo0NYlK4JZDyoe4STV4iixsE
 fhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w9up3E/zaBdle4smgSLjNuwhRW4+exZxbv50CbyMUP4=;
 b=3QaBIm6VPUeMSWjGXjs5by0UdZ+a9J1w1FeGVm+LTk4rIo9oQOogEM2Q+HaACCxG7Q
 S8R1siumJioYf3eMk93nGwxwxUXNgf+fiPIStQEKyCfgNLOmT0NG0sHaZhoxdoy3suXy
 JA7E5rncNOnugyuPa9Jr0/Af4x/rwfMTLAPW12GEtzAvuwxcDJEyW30EN+AcEKpb2A1G
 glbFf0Mb64m4XP/VAyN0SuIYffOzXUaYBwkOBpuWUiTGFCe06hehF2zKVePvWJ8RVgI8
 LaG4J9VBjz7b1c+u+6af4hVykmF7cR8lqurUJYEdySvuK0+izwMgaeDrk97HmlklXLAn
 ttsQ==
X-Gm-Message-State: AO0yUKW1n6VyUWzoK3Uh5z1mEkZyjW6lnYiGT9aMFkc5EDj3JxiAFRcD
 VHD4fncyVpo4PAUvUSitShwT2++2Aa3ujZBw+sgomw==
X-Google-Smtp-Source: AK7set8bgMgBiQhv5n6jrtW/Svv4TiV/nkmUxZIpI9ct+AvyxZEZeFT58FhdfukNNQc4vsFg/pJZ/EQNbuhrig3Lod8=
X-Received: by 2002:a63:7d03:0:b0:503:4a2c:5f0 with SMTP id
 y3-20020a637d03000000b005034a2c05f0mr3528676pgc.9.1678112674831; Mon, 06 Mar
 2023 06:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-5-pbonzini@redhat.com>
 <CAFEAcA961ZHCLAp2ZiZZ2iURFt7_FdcN_1rFtzJNdHs-sesHFg@mail.gmail.com>
 <71ed58bd-fb24-4eab-6638-a6a88676201b@redhat.com>
In-Reply-To: <71ed58bd-fb24-4eab-6638-a6a88676201b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 14:24:23 +0000
Message-ID: <CAFEAcA9SfBnBaAL3P2VPGh0Mjx59Fgp+RP1vdLtezruT=Sh4aA@mail.gmail.com>
Subject: Re: [PATCH 4/8] edu: add smp_mb__after_rmw()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com, 
 david@redhat.com, stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 6 Mar 2023 at 14:10, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/6/23 14:38, Peter Maydell wrote:
> > On Fri, 3 Mar 2023 at 17:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> Ensure ordering between clearing the COMPUTING flag and checking
> >> IRQFACT, and between setting the IRQFACT flag and checking
> >> COMPUTING.  This ensures that no wakeups are lost.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Why is this device even messing around with multiple
> > threads and atomics anyway ??
>
> Because it is an example of deferring device work to another thread,
> just like on real hardware it may be deferred to an on-device
> microcontroller or CPU.

If we want to be able to do that, we should probably have
infrastructure and higher-level primitives for it that
don't require device authors to be super-familiar with
QEMU's memory model and barriers... The fact there are only
half a dozen other uses of qemu_thread_create() under hw/
suggests that in practice we don't really need to do this
very often, though.

thanks
-- PMM

