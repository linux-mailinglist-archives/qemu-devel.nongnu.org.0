Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73F51FF04
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:05:21 +0200 (CEST)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no40m-0006XB-8S
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1no3xC-0002jx-43
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:01:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1no3xA-0006xE-80
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:01:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 125-20020a1c0283000000b003946c466c17so259223wmc.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vedoqsn5x4hghVj9KF2eRAEHI47zhgp/D/PUyitWrq8=;
 b=t2DqVpTIGVVwXv3CrBYhkVvQtmVWn/xWg0tj+STujhCm+rnr2zli7vtqgRKUm5M19z
 PBFt9vLAg2ZOaqkQPmxl63eNr5FwzHTvZArGMbo7SknM0UHtdmAWjout2PQO0BBFdJIf
 SO/0fpjrr7ETvniKpNTU+GUvGlnLx6B6zt/lJT27RH9y8eUzCInp8I/lTfG86X37J9rd
 8M/IPgtVHD4GTC33IW/42SihL9R07LfdkGEDdz017NP5iuTdcNppA/wNNlGcI06jKEpM
 ybFQN92FTm7rkZwTACEJ+WVcNp5iVWMYJfHRACMB6lVCsdm2Z7AIizDU+O/Mu9wImcNF
 +1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vedoqsn5x4hghVj9KF2eRAEHI47zhgp/D/PUyitWrq8=;
 b=ZDKMzSU90HITRXxRm86+Dj0dEZluH9TGQvi6iiwWShMUjemjd0Z2AsZoYHM00yCqMn
 Q2Z+Qt+RWVqOXdenex0FHeXPc4trg5I2m70fTAwbH6+6/kvkmEwkIwd/7kmQUdNDK4QL
 R/B/y0fRrG8ZHrndE6emomXDfBJ7ryxGYzElMoGhRXE7VWb1MXPrfwm5cbRAqJKqwc/2
 eDOM9VkthjKnuGx+FLM4cc8Rt3c9LtG8NIuj8bm8aamgaDJDUQGYwZchZ5vfoU3i07NY
 efbwkxJlRs4fhzw/6CxLtGq7sHEq1Ddoh9Uu4QF3pPwG3yVWTcpSxQWmfS/egCmdAAat
 RpPw==
X-Gm-Message-State: AOAM533sn0ak1PRvhC9lBAO5C+IdHm53ZZVEyWrAPuk82MPN4JHM8wzJ
 lvinrj4vfNbEELgrPWO8q1gDfw==
X-Google-Smtp-Source: ABdhPJzAA/rmgILEsrAlvxIFALW4OJtEGEf+WIyOfXDKIAlnm4ibfjdBV8bDtI9cB4NAo3BcBtYXow==
X-Received: by 2002:a05:600c:3549:b0:394:89ba:e1be with SMTP id
 i9-20020a05600c354900b0039489bae1bemr7532827wmq.181.1652104893734; 
 Mon, 09 May 2022 07:01:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 j9-20020adff009000000b0020c5253d902sm11158232wro.78.2022.05.09.07.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:01:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A897F1FFB7;
 Mon,  9 May 2022 15:01:30 +0100 (BST)
References: <20220504152025.1785704-1-eric.auger@redhat.com>
 <20220504152025.1785704-4-eric.auger@redhat.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com,
 stefanha@redhat.com, jean-philippe@linaro.org
Subject: Re: [PATCH v6 3/3] tests/qtest/libqos: Add generic pci host bridge
 in arm-virt machine
Date: Mon, 09 May 2022 14:59:23 +0100
In-reply-to: <20220504152025.1785704-4-eric.auger@redhat.com>
Message-ID: <87bkw6u7np.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eric.auger@redhat.com> writes:

> Up to now the virt-machine node contains a virtio-mmio node.
> However no driver produces any PCI interface node. Hence, PCI
> tests cannot be run with aarch64 binary.
>
> Add a GPEX driver node that produces a pci interface node. This latter
> then can be consumed by all the pci tests. One of the first motivation
> was to be able to run the virtio-iommu-pci tests.
>
> We still face an issue with pci hotplug tests as hotplug cannot happen
> on the pcie root bus and require a generic root port. This will be
> addressed later on.
>
> We force cpu=3Dmax along with aarch64/virt machine as some PCI tests
> require high MMIO regions to be available.

Where would I be able to force disable-legacy=3Doff for the PCI device
from? Building on this for GPIO I run into the following:

  subprocess_run_one_test: /aarch64/virt/generic-pcihost/pci-bus-generic/pc=
i-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-=
mem/memfile/subprocess
  vhost_user_test_setup: -M virt, -cpu max -device vhost-user-gpio-pci,id=
=3Dgpio0,addr=3D04.0,chardev=3Dchr-vhost-user-test
  vu_gpio_get_protocol_features: 0x202
  qemu-system-aarch64: -device vhost-user-gpio-pci,id=3Dgpio0,addr=3D04.0,c=
hardev=3Dchr-vhost-user-test: Device doesn't support modern mode, and legac=
y mode is disabled
  Set disable-legacy to off
  Broken pipe

and I think this needs to be applied to the root bus device?

Anyway otherwise it looks OK to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

