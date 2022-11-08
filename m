Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E9621BB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTAS-0002EQ-Ih; Tue, 08 Nov 2022 13:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osTAO-0002E2-AR; Tue, 08 Nov 2022 13:17:44 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osTAM-000461-Qc; Tue, 08 Nov 2022 13:17:44 -0500
Received: by mail-yb1-xb32.google.com with SMTP id 63so18325972ybq.4;
 Tue, 08 Nov 2022 10:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GS5xOBU219I0ts2Koj+cOPUNu6uxItLQP18JOFLZopA=;
 b=erw45iYR4EPeU/gEb2haKJioV4qzBPE7Jzt9dMBGAzAnCpJKSZcCeQlJZWiYwiihb6
 l/0wQngK3f+PoSVtFi5Cjua+3q36KTv8U13KXkFH1s91Tz6A9HOVC1ya9DSAT5Dp9Xpn
 i3qhnJvsaNHtJMmkZTX3drZ83hReEuuNms3l54wH4VkYVTNomSm83Sb4+jBKWLo0Fl0n
 /DcMrie3v8Jo6hgkQofLZcpQK+CKalfMrDgSCdKDYq5tW045gtb7j9FCh19QmpuKDvWW
 vmCwl4eD+aWDNwwVzFFvuTw0XQOzDGdepoDqzN5nEnHj6QKK5DNEIMeQUNSQSM2BoXyn
 PpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GS5xOBU219I0ts2Koj+cOPUNu6uxItLQP18JOFLZopA=;
 b=GzMsAsZRHVhn75JpjYPHyRTsFkh7dyGf7Y1mxj5hVF1l4Zx3IvzgO1j1FMG/divEWY
 3LOTawBAzw+02TNgLQT37Z7v9JwvkqUi/OGv7ij2GiEyNsHNOELZUrBTpJxEMJsp862g
 iDTxu4XEH2XiqEMKGbc79E7ESIh+73Y71y4iyrFOmkSSxhTvmK8MgdBJryG/kkKtyrHa
 tLFvObia0vaO0zXcUdNwgKs0aOgB5wfkq72A5pWt1gRCdxwIZMHu0LK1z9jUHQXd6tfX
 ns1P7X3IsonD6EiHYQrAT1KZ1NQ5mip/ZJ3hZVpfEaI5iKc+TBjnsczm04mAsfffbAji
 clxg==
X-Gm-Message-State: ACrzQf3yO9AFLcRDvHviZ7f8C/gMx+t2JPOE4l3EAn0y9xY9sKeGML6N
 To9F5rZtpGht30ANO4/ihDgBtv7MoDQhZgQLhlY=
X-Google-Smtp-Source: AMsMyM7pjtgYboO/aTP5VaNmqlpziAPJizAa7MiHZW72zqNw6aMu5tU14plxNh1bup+C3+wuiBfY/vWRx70nU2lDT58=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr43352552ybh.207.1667931460006; Tue, 08
 Nov 2022 10:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20221107221236.47841-1-philmd@linaro.org>
In-Reply-To: <20221107221236.47841-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 13:17:28 -0500
Message-ID: <CAJSP0QWQxRyQESv_LW+8ZgZc7Nzds8USydZ=4nD9dkNJSE6kGQ@mail.gmail.com>
Subject: Re: [PATCH-for-7.2 0/2] hw/sd/sdhci: Do not set Buf Wr Ena before
 writing block (CVE-2022-3872)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
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

Applied to the staging tree. Thanks!

Stefan

