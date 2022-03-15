Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA144DA233
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:19:17 +0100 (CET)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBlK-0004Cp-Ru
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:19:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBc6-0007FL-Sn
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:09:42 -0400
Received: from [2607:f8b0:4864:20::b30] (port=39840
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBc5-0000Lz-7D
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:09:42 -0400
Received: by mail-yb1-xb30.google.com with SMTP id t11so100575ybi.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+q1fHTKoAJ5LoKENwJ+pzp10VXd/AEYNtUdotqTQrA=;
 b=IqUWOd8CpMJrTfN37kQbbRWWcpP/SOwuMDXPFnv4zA1Vu6jdixbtFBmugPX0toaN0H
 d2I6H9AY1BYumbw14j+5PP+/V5m1FJHci87REvHMzllRu5HuXr5F63sIkJX0W7VXgVLj
 PVe2IhkJwpBxjGGsxJFINpPQWW4lW51SWEmX5NEb4uOl8r183Uw2K/PEMEb3DMPkt0qU
 6+8yvVDmKFTfG+GGaRnkLP8fKeymcTHZMQavf+45giRGjx7Z73S93VgjIhLYx7bcVPgZ
 8amGRtlBe81dSHVvdsDyAktCq+9Sy4NGXkBFlUoMjhvrqnqQEzraqTgZ9qPRDcPIgltS
 Xb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+q1fHTKoAJ5LoKENwJ+pzp10VXd/AEYNtUdotqTQrA=;
 b=evioH6BW0wz57songtVdtTJvpGXwiEEdg9c9jc/UDMv9faL28sQd5r7Q5ARnxVDfhp
 9Cey4grqi5LSBIVnUAqjWgjDbEAhqEBLYt3Bjf9d8TLCqZJQQ1ldCDrtTcw2jUmFsPJ7
 6sC8zTamWmq/BMwMgQRIIxKwJPPUKwyur82YM2m5Y1ZdfBOO3VMh4RXrbVImiJnW6SLx
 3emXY0hRqq3pRqNfGgECaGuuhRzr11qMYkn7p3oJZM5BO2ECpJekEk3hhcA+M9B5fNWT
 uPmfVpCE9/GvrkmkG+6Wy84mqUf50kHpjP3uiKOD3icAEur/lP9QjkR08kyUlz11raWs
 04kQ==
X-Gm-Message-State: AOAM532g68X4sUb8zSRAE48Z+PVvLdZ6xH3gi0/V8/vlNVmpkPDsK7yJ
 YjWKaPJNK0Oo47quHQ8xaKD5vODClqWIwrBVD8FiUA==
X-Google-Smtp-Source: ABdhPJw59JHnDwsGvyT/D1QaRoKEDJl9O+duecx8CjgMAA41cGvgGkBhsBMwYbGiaBxEzboVtijaZbd4WU0dQbAv0LQ=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr23695691ybs.140.1647367780196; Tue, 15
 Mar 2022 11:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220308182452.223473-1-eric.auger@redhat.com>
In-Reply-To: <20220308182452.223473-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:09:28 +0000
Message-ID: <CAFEAcA8fAWcqf6K5pdh2_ufBEkaHESbJ+jC3xvG0b15JSGGUeQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/virt: Fix make check-qtest-aarch64 when
 CONFIG_ARM_GIC_TCG is unset
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, drjones@redhat.com, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 18:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> When CONFIG_ARM_GIC_TCG is unset, qtests fail with
> ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)
>
> This is due to the fact a bunch tests use gic-version=max which
> currectly unconditionally selects GICv3, ignoring the fact this
> latter may have been disabled.
>
> This series renames CONFIG_ARM_GIC_TCG into CONFIG_ARM_GICv3_TCG.
> Also it selects GICv2 if gic-version=max and CONFIG_ARM_GICV3_TCG is
> unset, in TCG mode. With those fixes qtests pass along with
> virt machine node.

The use of module_object_class_by_name() looks much neater than
the ifdefs.

Applied to target-arm.next, thanks.

-- PMM

