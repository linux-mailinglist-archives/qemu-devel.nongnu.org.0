Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391155EDA38
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:38:23 +0200 (CEST)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUSM-0008Tq-0n
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odSkB-0006ag-Gz
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:48:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odSk6-0004q2-4Z
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:48:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id r6so1362773wru.8
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date;
 bh=MZ3CPJ/3DWNz9L5l4Jxu/X6nCfQbHkzVpxkZAkRDM4M=;
 b=pBxtLMohqadGk6I08x6qkBgExWo0iAnvq5evDGuDqNZlJNlQE47eBTToEzmDCd22Hk
 FgCZtcegl3eNdHqgusduYIOMthJRtanqJrJOqcym1te5Rmvk/RSLqw1Liled+AIVp05n
 pQmwFjgNHLKpvFR2QRLQ4FGYjg4EV0/Vx0x6+ge7ZoTGorn9b1HoUgJ6BTrNXqBgkfGH
 l+fEQttj4G09rEkDNBRrM+MAYYYBVFAxcPhdrkiGL/y4Wc8ePmqFzdrge8XWLw9YfgMV
 7oLvBhV3un12n3HLxBIFc0b/W7e52bt162NqDM1/TyxKoXpN2BABf9rbBJDP73hBIpgN
 WGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
 bh=MZ3CPJ/3DWNz9L5l4Jxu/X6nCfQbHkzVpxkZAkRDM4M=;
 b=pVyXp7VNfeneUfvH7eN/GxrYlAPDxwtCWZxQWIf4zNyvtyDDQqpsLXNbTaRX+dCR3N
 gu9aaQs1eIrkQhcOB9kgSywi6dPi4DYsvWqlrXtpMZV65mZERliUtghomajSmyLDNE5G
 pUPRx8Cyh3rAkn9MjCDJAbYCkUJZRUoRyv6Olsm3+7ibGMam9oGLul398G8oA5jc+XaA
 6eNnuGoiGR4XDpEF744Tk5yfd0mD7/2c9urZGqQDJgb8/gWyzBUOfczKmZi/c0LgAA6Y
 hcvKdFpx6FdF2rQB89HnigI/2NY3Lanwr79/aikQbMkoVW1ySLe5Lj4CGsGSUygUdN6w
 StMQ==
X-Gm-Message-State: ACrzQf38kubArPRnPYa+cA/+dsSDUCBDHvP+aCT0+Q86EBOTCwURBBto
 CtO32scRnizxubfUPyz6Y/z99s+8UtBRkA==
X-Google-Smtp-Source: AMsMyM7NE6bUuDq9Y/0d89BSnmKTQ7wn+bRZBYFqn2OGcB6z8Cq1oPidav4BM5noAC1HW1n+RUnmnA==
X-Received: by 2002:adf:eb84:0:b0:22a:917e:1c20 with SMTP id
 t4-20020adfeb84000000b0022a917e1c20mr19555003wrn.223.1664354911802; 
 Wed, 28 Sep 2022 01:48:31 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003a83ca67f73sm1221466wmr.3.2022.09.28.01.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 01:48:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 195D01FFB7;
 Wed, 28 Sep 2022 09:48:30 +0100 (BST)
References: <20220927213501.4069117-1-alex.bennee@linaro.org>
 <CABgObfYjhe7_qTRYMz_eeTCaJekHOBe3WLrx_OnPBfaMRcuMKA@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
Date: Wed, 28 Sep 2022 09:44:54 +0100
In-reply-to: <CABgObfYjhe7_qTRYMz_eeTCaJekHOBe3WLrx_OnPBfaMRcuMKA@mail.gmail.com>
Message-ID: <877d1n3mw1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Paolo Bonzini <pbonzini@redhat.com> writes:

> What is an example of one such huge path? This would mean that LTO is cha=
nging the set of tests that are run, which is
> unexpected.

It does look like the LTO build runs more tests although its hard to
diff as the order if different:

=E2=9E=9C  grep "list" without-lto | wc -l
201
=F0=9F=95=9909:45:35 alex@zen:qemu.git/builds/arm.all  on =EE=82=A0 gitdm/n=
ext [$!?=E2=87=A1]=20
=E2=9E=9C  grep "list" ../debug/with-lto | wc -l
195

Logs attached:


--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=without-lto
Content-Description: log of qos-test setup without LTO

qos_push: 0
qos_traverse_graph: visited = 0
qos_traverse_graph:  list = 0x5628504c70a0
qos_push: 1
qos_push: 2
qos_traverse_graph: visited = 0
qos_traverse_graph: aarch64/xlnx-zcu102 list = 0x5628504c7170
qos_push: 3
qos_traverse_graph: visited = 0
qos_traverse_graph: generic-sdhci list = 0x5628504c3480
qos_push: 4
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci list = 0x56285049f720
qos_push: 5
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci-tests/registers list = (nil)
qos_pop: 5
qos_traverse_graph: visited = 1
qos_pop: 4
qos_traverse_graph: visited = 1
qos_pop: 3
qos_traverse_graph: visited = 1
qos_pop: 2
qos_traverse_graph: visited = 0
qos_traverse_graph: aarch64/virt list = 0x5628504c7f40
qos_push: 2
qos_traverse_graph: visited = 0
qos_traverse_graph: generic-pcihost list = 0x5628504c6f40
qos_push: 3
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-bus-generic list = 0x5628504c6dd0
qos_push: 4
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-bus list = 0x56285048f860
qos_push: 5
qos_push: 6
qos_push: 7
qos_push: 8
qos_push: 9
qos_push: 10
qos_push: 11
qos_push: 12
qos_push: 13
qos_push: 14
qos_push: 15
qos_push: 16
qos_push: 17
qos_push: 18
qos_push: 19
qos_push: 20
qos_push: 21
qos_push: 22
qos_push: 23
qos_push: 24
qos_push: 25
qos_push: 26
qos_push: 27
qos_push: 28
qos_push: 29
qos_push: 30
qos_push: 31
qos_push: 32
qos_push: 33
qos_push: 34
qos_push: 35
qos_push: 36
qos_push: 37
qos_push: 38
qos_push: 39
qos_push: 40
qos_push: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: AC97 list = 0x56285048eec0
qos_push: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 1
qos_pop: 42
qos_traverse_graph: visited = 1
qos_pop: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000 list = 0x562850491820
qos_push: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 42
qos_traverse_graph: visited = 1
qos_pop: 41
qos_traverse_graph: visited = 1
qos_pop: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000-82544gc list = 0x562850492080
qos_push: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 41
qos_traverse_graph: visited = 1
qos_pop: 40
qos_traverse_graph: visited = 1
qos_pop: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000-82545em list = 0x562850492980
qos_push: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 40
qos_traverse_graph: visited = 1
qos_pop: 39
qos_traverse_graph: visited = 1
qos_pop: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: i82550 list = 0x562850493690
qos_push: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 39
qos_traverse_graph: visited = 1
qos_pop: 38
qos_traverse_graph: visited = 1
qos_pop: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: i82551 list = 0x562850493e40
qos_push: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 38
qos_traverse_graph: visited = 1
qos_pop: 37
qos_traverse_graph: visited = 1
qos_pop: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: i82557a list = 0x562850494660
qos_push: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 37
qos_traverse_graph: visited = 1
qos_pop: 36
qos_traverse_graph: visited = 1
qos_pop: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: i82557b list = 0x562850494e20
qos_push: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 36
qos_traverse_graph: visited = 1
qos_pop: 35
qos_traverse_graph: visited = 1
qos_pop: 34
qos_traverse_graph: visited = 0
qos_traverse_graph: i82557c list = 0x5628504955e0
qos_push: 34
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 35
qos_traverse_graph: visited = 1
qos_pop: 34
qos_traverse_graph: visited = 1
qos_pop: 33
qos_traverse_graph: visited = 0
qos_traverse_graph: i82558a list = 0x562850495db0
qos_push: 33
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 34
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 34
qos_traverse_graph: visited = 1
qos_pop: 33
qos_traverse_graph: visited = 1
qos_pop: 32
qos_traverse_graph: visited = 0
qos_traverse_graph: i82558b list = 0x562850496550
qos_push: 32
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 33
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 33
qos_traverse_graph: visited = 1
qos_pop: 32
qos_traverse_graph: visited = 1
qos_pop: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559a list = 0x562850496870
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 32
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 32
qos_traverse_graph: visited = 1
qos_pop: 31
qos_traverse_graph: visited = 1
qos_pop: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559b list = 0x562850497490
qos_push: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 31
qos_traverse_graph: visited = 1
qos_pop: 30
qos_traverse_graph: visited = 1
qos_pop: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559c list = 0x562850497c70
qos_push: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 30
qos_traverse_graph: visited = 1
qos_pop: 29
qos_traverse_graph: visited = 1
qos_pop: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559er list = 0x562850498450
qos_push: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 29
qos_traverse_graph: visited = 1
qos_pop: 28
qos_traverse_graph: visited = 1
qos_pop: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: i82562 list = 0x562850498c10
qos_push: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 28
qos_traverse_graph: visited = 1
qos_pop: 27
qos_traverse_graph: visited = 1
qos_pop: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: i82801 list = 0x5628504993b0
qos_push: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 27
qos_traverse_graph: visited = 1
qos_pop: 26
qos_traverse_graph: visited = 1
qos_pop: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: ES1370 list = 0x562850499530
qos_push: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 26
qos_traverse_graph: visited = 1
qos_pop: 25
qos_traverse_graph: visited = 1
qos_pop: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: megasas list = 0x56285049c350
qos_push: 24
qos_push: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 26
qos_traverse_graph: visited = 1
qos_pop: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: megasas-tests/dcmd/pd-get-info/fuzz list = (nil)
qos_pop: 24
qos_traverse_graph: visited = 1
qos_pop: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: ne2k_pci list = 0x56285049cad0
qos_push: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 24
qos_traverse_graph: visited = 1
qos_pop: 23
qos_traverse_graph: visited = 1
qos_pop: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: tulip list = 0x56285049d6f0
qos_push: 22
qos_push: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 24
qos_traverse_graph: visited = 1
qos_pop: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: tulip-tests/tulip_large_tx list = (nil)
qos_pop: 22
qos_traverse_graph: visited = 1
qos_pop: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme list = 0x56285049ded0
qos_push: 21
qos_push: 22
qos_push: 23
qos_push: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 25
qos_traverse_graph: visited = 1
qos_pop: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme-tests/oob-cmb-access list = (nil)
qos_pop: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme-tests/pmr-test-access list = (nil)
qos_pop: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme-tests/reg-read list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 1
qos_pop: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: pcnet list = 0x56285049f660
qos_push: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 1
qos_pop: 20
qos_traverse_graph: visited = 1
qos_pop: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-ohci list = 0x5628504bbe00
qos_push: 19
qos_push: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 1
qos_pop: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-ohci-tests/ohci_pci-test-hotplug list = (nil)
qos_pop: 19
qos_traverse_graph: visited = 1
qos_pop: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: vmxnet3 list = 0x5628504be360
qos_push: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 19
qos_traverse_graph: visited = 1
qos_pop: 18
qos_traverse_graph: visited = 1
qos_pop: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e list = 0x5628504be4c0
qos_push: 17
qos_push: 18
qos_push: 19
qos_push: 20
qos_push: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/init list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/tx list = (nil)
qos_pop: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/rx list = (nil)
qos_pop: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/multiple_transfers list = (nil)
qos_pop: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/hotplug list = (nil)
qos_pop: 17
qos_traverse_graph: visited = 1
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci-pci list = 0x5628504c35e0
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci list = 0x56285049f720
qos_push: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci-tests/registers list = (nil)
qos_pop: 17
qos_traverse_graph: visited = 1
qos_pop: 16
qos_traverse_graph: visited = 1
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: tpci200 list = 0x5628504c38e0
qos_push: 15
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: ipack list = 0x562850499ef0
qos_push: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: ipoctal232 list = 0x56285049a250
qos_push: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: ipoctal232-tests/nop list = (nil)
qos_pop: 18
qos_traverse_graph: visited = 1
qos_pop: 17
qos_traverse_graph: visited = 1
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 1
qos_pop: 15
qos_traverse_graph: visited = 1
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-pci list = 0x5628504c4010
qos_push: 14
qos_push: 15
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 17
qos_traverse_graph: visited = 1
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x5628504bc080
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 1
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p list = 0x5628504bea40
qos_push: 15
qos_push: 16
qos_push: 17
qos_push: 18
qos_push: 19
qos_push: 20
qos_push: 21
qos_push: 22
qos_push: 23
qos_push: 24
qos_push: 25
qos_push: 26
qos_push: 27
qos_push: 28
qos_push: 29
qos_push: 30
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/config list = (nil)
qos_pop: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/version/basic list = (nil)
qos_pop: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/attach/basic list = (nil)
qos_pop: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/basic list = (nil)
qos_pop: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/no_slash list = (nil)
qos_pop: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/none list = (nil)
qos_pop: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/dotdot_from_root list = (nil)
qos_pop: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/non_existent list = (nil)
qos_pop: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/2nd_non_existent list = (nil)
qos_pop: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/lopen/basic list = (nil)
qos_pop: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/write/basic list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/flush/success list = (nil)
qos_pop: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/flush/ignored list = (nil)
qos_pop: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/basic list = (nil)
qos_pop: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/split_512 list = (nil)
qos_pop: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/split_256 list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/split_128 list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 1
qos_pop: 14
qos_traverse_graph: visited = 1
qos_pop: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-balloon-pci list = 0x5628504c4670
qos_push: 13
qos_push: 14
qos_push: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 1
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x5628504bc080
qos_push: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 1
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-balloon list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 1
qos_pop: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci list = 0x5628504bc640
qos_push: 12
qos_push: 13
qos_push: 14
qos_push: 15
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/msix list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/idx list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/nxvirtq list = (nil)
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/hotplug list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk list = 0x5628504bc1d0
qos_push: 13
qos_push: 14
qos_push: 15
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/indirect list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/config list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/basic list = (nil)
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/resize list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 1
qos_pop: 12
qos_traverse_graph: visited = 1
qos_pop: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-pci list = 0x5628504c1ef0
qos_push: 11
qos_push: 12
qos_push: 13
qos_push: 14
qos_push: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-pci-tests/idx list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-pci-tests/nxvirtq list = (nil)
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-pci-tests/hotplug list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-pci-tests/multiqueue list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk list = 0x5628504c1c50
qos_push: 12
qos_push: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-tests/basic list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-tests/indirect list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 1
qos_pop: 11
qos_traverse_graph: visited = 1
qos_pop: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-pci list = 0x5628504bcb20
qos_push: 10
qos_push: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-pci-tests/hotplug list = (nil)
qos_pop: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net list = 0x5628504bcca0
qos_push: 11
qos_push: 12
qos_push: 13
qos_push: 14
qos_push: 15
qos_push: 16
qos_push: 17
qos_push: 18
qos_push: 19
qos_push: 20
qos_push: 21
qos_push: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/basic list = (nil)
qos_pop: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/rx_stop_cont list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/announce-self list = (nil)
qos_pop: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/large_tx/uint_max list = (nil)
qos_pop: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/large_tx/net_bufsize list = (nil)
qos_pop: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/read-guest-mem/memfile list = (nil)
qos_pop: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/read-guest-mem/memfd list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/migrate list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/reconnect list = (nil)
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/connect-fail list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/flags-mismatch list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/multiqueue list = (nil)
qos_pop: 11
qos_traverse_graph: visited = 1
qos_pop: 10
qos_traverse_graph: visited = 1
qos_pop: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-rng-pci list = 0x5628504bd2b0
qos_push: 9
qos_push: 10
qos_push: 11
qos_push: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-rng-pci-tests/hotplug list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 1
qos_pop: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x5628504bc080
qos_push: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 11
qos_traverse_graph: visited = 1
qos_pop: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-rng list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 1
qos_pop: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-pci list = 0x5628504bd8d0
qos_push: 8
qos_push: 9
qos_push: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-pci-tests/iothread-attach-node list = (nil)
qos_pop: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 10
qos_traverse_graph: visited = 1
qos_pop: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi list = 0x5628504bd400
qos_push: 9
qos_push: 10
qos_push: 11
qos_push: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/hotplug list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/unaligned-write-same list = (nil)
qos_pop: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/large-lba-unmap list = (nil)
qos_pop: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/write-to-cdrom list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 1
qos_pop: 8
qos_traverse_graph: visited = 1
qos_pop: 7
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-pci list = 0x5628504c6770
qos_push: 7
qos_push: 8
qos_push: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 10
qos_traverse_graph: visited = 1
qos_pop: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x5628504bc080
qos_push: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 1
qos_pop: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial list = 0x5628504bda80
qos_push: 8
qos_push: 9
qos_push: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-tests/console-nop list = (nil)
qos_pop: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-tests/serialport-nop list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-tests/hotplug list = (nil)
qos_pop: 8
qos_traverse_graph: visited = 1
qos_pop: 7
qos_traverse_graph: visited = 1
qos_pop: 6
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-pci list = 0x5628504c6ad0
qos_push: 6
qos_push: 7
qos_push: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x56285049ec70
qos_push: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 1
qos_pop: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x5628504bc080
qos_push: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 8
qos_traverse_graph: visited = 1
qos_pop: 7
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu list = 0x5628504bdeb0
qos_push: 7
qos_push: 8
qos_push: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-tests/config list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-tests/attach_detach list = (nil)
qos_pop: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-tests/map_unmap list = (nil)
qos_pop: 7
qos_traverse_graph: visited = 1
qos_pop: 6
qos_traverse_graph: visited = 1
qos_pop: 5
qos_traverse_graph: visited = 1
qos_pop: 4
qos_traverse_graph: visited = 1
qos_pop: 3
qos_traverse_graph: visited = 1
qos_pop: 2
qos_traverse_graph: visited = 1
qos_pop: 1
qos_traverse_graph: visited = 1
qos_pop: 0

--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=with-lto
Content-Description: log of qos-test setup with LTO

qos_push: 0
qos_traverse_graph: visited = 0
qos_traverse_graph:  list = 0x55aedf37cfb0
qos_push: 1
qos_push: 2
qos_traverse_graph: visited = 0
qos_traverse_graph: aarch64/virt list = 0x55aedf37fb20
qos_push: 3
qos_traverse_graph: visited = 0
qos_traverse_graph: generic-pcihost list = 0x55aedf382b00
qos_push: 4
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-bus-generic list = 0x55aedf382ee0
qos_push: 5
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-bus list = 0x55aedf3836a0
qos_push: 6
qos_push: 7
qos_push: 8
qos_push: 9
qos_push: 10
qos_push: 11
qos_push: 12
qos_push: 13
qos_push: 14
qos_push: 15
qos_push: 16
qos_push: 17
qos_push: 18
qos_push: 19
qos_push: 20
qos_push: 21
qos_push: 22
qos_push: 23
qos_push: 24
qos_push: 25
qos_push: 26
qos_push: 27
qos_push: 28
qos_push: 29
qos_push: 30
qos_push: 31
qos_push: 32
qos_push: 33
qos_push: 34
qos_push: 35
qos_push: 36
qos_push: 37
qos_push: 38
qos_push: 39
qos_push: 40
qos_push: 41
qos_push: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-pci list = 0x55aedf383790
qos_push: 43
qos_push: 44
qos_push: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 46
qos_traverse_graph: visited = 1
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x55aedf3aca80
qos_push: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 1
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu list = 0x55aedf3aaaa0
qos_push: 44
qos_push: 45
qos_push: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-tests/config list = (nil)
qos_pop: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-tests/attach_detach list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-iommu-tests/map_unmap list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 1
qos_pop: 43
qos_traverse_graph: visited = 1
qos_pop: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-pci list = 0x55aedf385010
qos_push: 42
qos_push: 43
qos_push: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 1
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x55aedf3aca80
qos_push: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 1
qos_pop: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial list = 0x55aedf3aae70
qos_push: 43
qos_push: 44
qos_push: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-tests/console-nop list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-tests/serialport-nop list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-serial-tests/hotplug list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 1
qos_pop: 42
qos_traverse_graph: visited = 1
qos_pop: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-pci list = 0x55aedf386390
qos_push: 41
qos_push: 42
qos_push: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 1
qos_pop: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi list = 0x55aedf3ab2a0
qos_push: 43
qos_push: 44
qos_push: 45
qos_push: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/hotplug list = (nil)
qos_pop: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/unaligned-write-same list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/large-lba-unmap list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-tests/write-to-cdrom list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 1
qos_pop: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-scsi-pci-tests/iothread-attach-node list = (nil)
qos_pop: 41
qos_traverse_graph: visited = 1
qos_pop: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-rng-pci list = 0x55aedf386f30
qos_push: 40
qos_push: 41
qos_push: 42
qos_push: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 1
qos_pop: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x55aedf3aca80
qos_push: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 1
qos_pop: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-rng list = (nil)
qos_pop: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-rng-pci-tests/hotplug list = (nil)
qos_pop: 40
qos_traverse_graph: visited = 1
qos_pop: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-pci list = 0x55aedf388590
qos_push: 39
qos_push: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net list = 0x55aedf3a7a70
qos_push: 41
qos_push: 42
qos_push: 43
qos_push: 44
qos_push: 45
qos_push: 46
qos_push: 47
qos_push: 48
qos_push: 49
qos_push: 50
qos_push: 51
qos_push: 52
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/read-guest-mem/memfile list = (nil)
qos_pop: 52
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/read-guest-mem/memfd list = (nil)
qos_pop: 51
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/migrate list = (nil)
qos_pop: 50
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/reconnect list = (nil)
qos_pop: 49
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/connect-fail list = (nil)
qos_pop: 48
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/flags-mismatch list = (nil)
qos_pop: 47
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/vhost-user/multiqueue list = (nil)
qos_pop: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/basic list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/rx_stop_cont list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/announce-self list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/large_tx/uint_max list = (nil)
qos_pop: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-tests/large_tx/net_bufsize list = (nil)
qos_pop: 41
qos_traverse_graph: visited = 1
qos_pop: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-net-pci-tests/hotplug list = (nil)
qos_pop: 39
qos_traverse_graph: visited = 1
qos_pop: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk-pci list = 0x55aedf3891d0
qos_push: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: vhost-user-blk list = (nil)
qos_pop: 38
qos_traverse_graph: visited = 1
qos_pop: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci list = 0x55aedf389f90
qos_push: 37
qos_push: 38
qos_push: 39
qos_push: 40
qos_push: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk list = 0x55aedf3ac160
qos_push: 42
qos_push: 43
qos_push: 44
qos_push: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/indirect list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/config list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/basic list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-tests/resize list = (nil)
qos_pop: 42
qos_traverse_graph: visited = 1
qos_pop: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/msix list = (nil)
qos_pop: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/idx list = (nil)
qos_pop: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/nxvirtq list = (nil)
qos_pop: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-blk-pci-tests/hotplug list = (nil)
qos_pop: 37
qos_traverse_graph: visited = 1
qos_pop: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-balloon-pci list = 0x55aedf38b0f0
qos_push: 36
qos_push: 37
qos_push: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 39
qos_traverse_graph: visited = 1
qos_pop: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x55aedf3aca80
qos_push: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 38
qos_traverse_graph: visited = 1
qos_pop: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-balloon list = (nil)
qos_pop: 36
qos_traverse_graph: visited = 1
qos_pop: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-pci list = 0x55aedf38c350
qos_push: 35
qos_push: 36
qos_push: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 38
qos_traverse_graph: visited = 1
qos_pop: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio list = 0x55aedf3aca80
qos_push: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-tests/nop list = (nil)
qos_pop: 37
qos_traverse_graph: visited = 1
qos_pop: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p list = 0x55aedf3a8e30
qos_push: 36
qos_push: 37
qos_push: 38
qos_push: 39
qos_push: 40
qos_push: 41
qos_push: 42
qos_push: 43
qos_push: 44
qos_push: 45
qos_push: 46
qos_push: 47
qos_push: 48
qos_push: 49
qos_push: 50
qos_push: 51
qos_push: 52
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/config list = (nil)
qos_pop: 52
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/version/basic list = (nil)
qos_pop: 51
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/attach/basic list = (nil)
qos_pop: 50
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/basic list = (nil)
qos_pop: 49
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/no_slash list = (nil)
qos_pop: 48
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/none list = (nil)
qos_pop: 47
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/dotdot_from_root list = (nil)
qos_pop: 46
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/non_existent list = (nil)
qos_pop: 45
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/walk/2nd_non_existent list = (nil)
qos_pop: 44
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/lopen/basic list = (nil)
qos_pop: 43
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/write/basic list = (nil)
qos_pop: 42
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/flush/success list = (nil)
qos_pop: 41
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/flush/ignored list = (nil)
qos_pop: 40
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/basic list = (nil)
qos_pop: 39
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/split_512 list = (nil)
qos_pop: 38
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/split_256 list = (nil)
qos_pop: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: virtio-9p-tests/synth/readdir/split_128 list = (nil)
qos_pop: 36
qos_traverse_graph: visited = 1
qos_pop: 35
qos_traverse_graph: visited = 1
qos_pop: 34
qos_traverse_graph: visited = 0
qos_traverse_graph: tpci200 list = 0x55aedf38cd30
qos_push: 34
qos_push: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: ipack list = 0x55aedf3b2ff0
qos_push: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: ipoctal232 list = 0x55aedf3b2eb0
qos_push: 37
qos_traverse_graph: visited = 0
qos_traverse_graph: ipoctal232-tests/nop list = (nil)
qos_pop: 37
qos_traverse_graph: visited = 1
qos_pop: 36
qos_traverse_graph: visited = 1
qos_pop: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 35
qos_traverse_graph: visited = 1
qos_pop: 34
qos_traverse_graph: visited = 1
qos_pop: 33
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci-pci list = 0x55aedf38d960
qos_push: 33
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci list = 0x55aedf3aea50
qos_push: 34
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci-tests/registers list = (nil)
qos_pop: 34
qos_traverse_graph: visited = 1
qos_pop: 33
qos_traverse_graph: visited = 1
qos_pop: 32
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e list = 0x55aedf3aa310
qos_push: 32
qos_push: 33
qos_push: 34
qos_push: 35
qos_push: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/init list = (nil)
qos_pop: 36
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/tx list = (nil)
qos_pop: 35
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/rx list = (nil)
qos_pop: 34
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/multiple_transfers list = (nil)
qos_pop: 33
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000e-tests/hotplug list = (nil)
qos_pop: 32
qos_traverse_graph: visited = 1
qos_pop: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: vmxnet3 list = 0x55aedf3aa950
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 32
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 32
qos_traverse_graph: visited = 1
qos_pop: 31
qos_traverse_graph: visited = 1
qos_pop: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-ohci list = 0x55aedf3acbd0
qos_push: 30
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-ohci-tests/ohci_pci-test-hotplug list = (nil)
qos_pop: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 31
qos_traverse_graph: visited = 1
qos_pop: 30
qos_traverse_graph: visited = 1
qos_pop: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: pcnet list = 0x55aedf3aec60
qos_push: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 30
qos_traverse_graph: visited = 1
qos_pop: 29
qos_traverse_graph: visited = 1
qos_pop: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme list = 0x55aedf3afca0
qos_push: 28
qos_push: 29
qos_push: 30
qos_push: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 32
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 32
qos_traverse_graph: visited = 1
qos_pop: 31
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme-tests/oob-cmb-access list = (nil)
qos_pop: 30
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme-tests/pmr-test-access list = (nil)
qos_pop: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: nvme-tests/reg-read list = (nil)
qos_pop: 28
qos_traverse_graph: visited = 1
qos_pop: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: tulip list = 0x55aedf3b02a0
qos_push: 27
qos_push: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 29
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 29
qos_traverse_graph: visited = 1
qos_pop: 28
qos_traverse_graph: visited = 0
qos_traverse_graph: tulip-tests/tulip_large_tx list = (nil)
qos_pop: 27
qos_traverse_graph: visited = 1
qos_pop: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: ne2k_pci list = 0x55aedf3b0600
qos_push: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 27
qos_traverse_graph: visited = 1
qos_pop: 26
qos_traverse_graph: visited = 1
qos_pop: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: megasas list = 0x55aedf3b0830
qos_push: 25
qos_push: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 27
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 27
qos_traverse_graph: visited = 1
qos_pop: 26
qos_traverse_graph: visited = 0
qos_traverse_graph: megasas-tests/dcmd/pd-get-info/fuzz list = (nil)
qos_pop: 25
qos_traverse_graph: visited = 1
qos_pop: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: ES1370 list = 0x55aedf3b3240
qos_push: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 25
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 25
qos_traverse_graph: visited = 1
qos_pop: 24
qos_traverse_graph: visited = 1
qos_pop: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: i82550 list = 0x55aedf3b3470
qos_push: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 24
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 24
qos_traverse_graph: visited = 1
qos_pop: 23
qos_traverse_graph: visited = 1
qos_pop: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: i82551 list = 0x55aedf3b36a0
qos_push: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 23
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 23
qos_traverse_graph: visited = 1
qos_pop: 22
qos_traverse_graph: visited = 1
qos_pop: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: i82557a list = 0x55aedf3b38d0
qos_push: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 22
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 22
qos_traverse_graph: visited = 1
qos_pop: 21
qos_traverse_graph: visited = 1
qos_pop: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: i82557b list = 0x55aedf3b3b00
qos_push: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 21
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 21
qos_traverse_graph: visited = 1
qos_pop: 20
qos_traverse_graph: visited = 1
qos_pop: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: i82557c list = 0x55aedf3b3d30
qos_push: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 20
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 20
qos_traverse_graph: visited = 1
qos_pop: 19
qos_traverse_graph: visited = 1
qos_pop: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: i82558a list = 0x55aedf3b3f60
qos_push: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 19
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 19
qos_traverse_graph: visited = 1
qos_pop: 18
qos_traverse_graph: visited = 1
qos_pop: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: i82558b list = 0x55aedf3b4190
qos_push: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 18
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 18
qos_traverse_graph: visited = 1
qos_pop: 17
qos_traverse_graph: visited = 1
qos_pop: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559a list = 0x55aedf3b43c0
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 17
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 17
qos_traverse_graph: visited = 1
qos_pop: 16
qos_traverse_graph: visited = 1
qos_pop: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559b list = 0x55aedf3b45f0
qos_push: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 16
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 16
qos_traverse_graph: visited = 1
qos_pop: 15
qos_traverse_graph: visited = 1
qos_pop: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559c list = 0x55aedf3b4820
qos_push: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 15
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 15
qos_traverse_graph: visited = 1
qos_pop: 14
qos_traverse_graph: visited = 1
qos_pop: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: i82559er list = 0x55aedf3b4a50
qos_push: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 14
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 14
qos_traverse_graph: visited = 1
qos_pop: 13
qos_traverse_graph: visited = 1
qos_pop: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: i82562 list = 0x55aedf3b4c80
qos_push: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 13
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 13
qos_traverse_graph: visited = 1
qos_pop: 12
qos_traverse_graph: visited = 1
qos_pop: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: i82801 list = 0x55aedf3b4eb0
qos_push: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 12
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 12
qos_traverse_graph: visited = 1
qos_pop: 11
qos_traverse_graph: visited = 1
qos_pop: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000 list = 0x55aedf3b50e0
qos_push: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 11
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 11
qos_traverse_graph: visited = 1
qos_pop: 10
qos_traverse_graph: visited = 1
qos_pop: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000-82544gc list = 0x55aedf3b5540
qos_push: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 10
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 10
qos_traverse_graph: visited = 1
qos_pop: 9
qos_traverse_graph: visited = 1
qos_pop: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: e1000-82545em list = 0x55aedf3b5770
qos_push: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 9
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 9
qos_traverse_graph: visited = 1
qos_pop: 8
qos_traverse_graph: visited = 1
qos_pop: 7
qos_traverse_graph: visited = 0
qos_traverse_graph: AC97 list = 0x55aedf3b6310
qos_push: 7
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device list = 0x55aedf3aedc0
qos_push: 8
qos_traverse_graph: visited = 0
qos_traverse_graph: pci-device-tests/nop list = (nil)
qos_pop: 8
qos_traverse_graph: visited = 1
qos_pop: 7
qos_traverse_graph: visited = 1
qos_pop: 6
qos_traverse_graph: visited = 1
qos_pop: 5
qos_traverse_graph: visited = 1
qos_pop: 4
qos_traverse_graph: visited = 1
qos_pop: 3
qos_traverse_graph: visited = 1
qos_pop: 2
qos_traverse_graph: visited = 0
qos_traverse_graph: aarch64/xlnx-zcu102 list = 0x55aedf382a40
qos_push: 2
qos_traverse_graph: visited = 0
qos_traverse_graph: generic-sdhci list = 0x55aedf38d8a0
qos_push: 3
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci list = 0x55aedf3aea50
qos_push: 4
qos_traverse_graph: visited = 0
qos_traverse_graph: sdhci-tests/registers list = (nil)
qos_pop: 4
qos_traverse_graph: visited = 1
qos_pop: 3
qos_traverse_graph: visited = 1
qos_pop: 2
qos_traverse_graph: visited = 1
qos_pop: 1
qos_traverse_graph: visited = 1
qos_pop: 0

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


>
> Paolo
>
> Il mar 27 set 2022, 23:35 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha sc=
ritto:
>
>  It seems the depth of path we need to support can vary depending on
>  the order of the init constructors getting called. It seems
>  --enable-lto shuffles things around just enough to push you over the
>  limit.
>
>  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
>  ---
>   tests/qtest/libqos/qgraph.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
>  index 6e94824d09..5c0046e989 100644
>  --- a/tests/qtest/libqos/qgraph.h
>  +++ b/tests/qtest/libqos/qgraph.h
>  @@ -24,7 +24,7 @@
>   #include "libqos-malloc.h"
>
>   /* maximum path length */
>  -#define QOS_PATH_MAX_ELEMENT_SIZE 50
>  +#define QOS_PATH_MAX_ELEMENT_SIZE 64
>
>   typedef struct QOSGraphObject QOSGraphObject;
>   typedef struct QOSGraphNode QOSGraphNode;
>  --=20
>  2.34.1


--=20
Alex Benn=C3=A9e

--=-=-=--

