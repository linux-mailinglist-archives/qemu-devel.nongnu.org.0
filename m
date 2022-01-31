Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDF4A5358
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:38:13 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgFP-0006XF-Rk
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:38:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgCX-0004Ty-2J
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:35:13 -0500
Received: from [2a00:1450:4864:20::42f] (port=40513
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgCV-0000OB-HP
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:35:12 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s18so28445329wrv.7
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YKbO2FuzsyP5jtbZgugk2YdStsmNWZzVZBihPlRdvo8=;
 b=ijByaliwQ/FgGot7SUvrH+jt6Ze8ADRzqGpxNh/ltn1/h93D8NospvCE7a9SWmf8wu
 LTZFeTFGa+CBNjeKwvoOpDTX9SZOSnuEpjjTqbrKAeMOhGuSFJ2d9wEyEaZhTixLY23m
 tO0Pd5x/R9ehVCy6FuLR6fl9+2AgTVVyGaxVFNtPXIJ5SzmP9xdN0bso/WysJIhWJFwn
 0nDz7kuI1PeQPCs7jQCAq6FSnePNJDNl8v9pSAMwLEHfEH/6v1TyUw/SixrAELHDeVSC
 Wp7+qsYhaOx1aHJ3qQI5AWIjZIS3RZURFa9zhUwKM1WEmoFbxa3lDoyrfQvE02WGW8vP
 rpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YKbO2FuzsyP5jtbZgugk2YdStsmNWZzVZBihPlRdvo8=;
 b=tU7Gb4Cosx7m9GBBGOih2hht+hWt/huYVpnMtZwRJUAvaT/2wTZC2xWG7wBf4ueCog
 cWTz06ycIy0DCxhJs10nHhlw972qgaIZ572dUbXropRCZ1gjT7W816eVtphYFCGKK9i2
 Id1AM8e7DlAMmhe98+Ym/Ot+vUT00qXKVX0z2dOiLTfL8aX6HztUKiLkS4hE6AJuJU8y
 yNx3m9tMjoOmkYbih/qvBVlBXjQjTU/ljkSc88AuE0z0ww1n9XUPZqwM+mjkVfq1FX80
 pWO7qp4stA4K5fwDCsOnSwj5uNZl5mtU8ncxOJw9LsZ9jKPkUBgmYp5X3TR9adg5xUua
 jT/g==
X-Gm-Message-State: AOAM533Q25dbxP1kgd+t53Kt1dPeydPweVcHrKP+hHW8QJU96NEaFd7w
 P6nk14hqRwFjXk4HqiGCThMCimA46cs=
X-Google-Smtp-Source: ABdhPJwyGPcGNwpLflRHr7k7vOZBVXcU2uimF3DJQAG3xYydNqYBvyYUtY5ECmcdO2rFYObSt3dsyA==
X-Received: by 2002:a5d:45c7:: with SMTP id b7mr19338672wrs.213.1643672109691; 
 Mon, 31 Jan 2022 15:35:09 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 ay29sm563026wmb.38.2022.01.31.15.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:35:09 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 0/2] hw/i386: QOM-attach CPUs/SGX-EPC objects to their
 parents
Date: Tue,  1 Feb 2022 00:35:05 +0100
Message-Id: <20220131233507.334174-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Trying to fix the issue reported here:=0D
https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html=0D
=0D
First attach the CPUs and SGX-EPC objects to the machine.=0D
=0D
Since v2:=0D
- added missing QOM property auto-enum: [*] (Yang Zhong)=0D
=0D
Since v1:=0D
- addressed Paolo & Daniel review feedbacks=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/i386: Attach CPUs to machine=0D
  hw/i386/sgx: Attach SGX-EPC objects to machine=0D
=0D
 hw/i386/sgx.c | 2 ++=0D
 hw/i386/x86.c | 1 +=0D
 2 files changed, 3 insertions(+)=0D
=0D
-- =0D
2.34.1=0D
=0D

