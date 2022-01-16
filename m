Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A248FFA7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 00:55:56 +0100 (CET)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9FNK-0005fL-UY
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 18:55:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9FL7-0003t2-Us
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:53:37 -0500
Received: from [2a00:1450:4864:20::333] (port=52779
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9FL6-0007YV-09
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:53:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id v123so16918160wme.2
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 15:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GK//+DnMF6q4YF03vVM3FN3wfAOF7udeLc8FgrCjKyk=;
 b=YMwjx0oomi7HpbSzCMck7ArlKK4+G6K9XvNkCnmbMzm19pmP8z4R5LxArLkLqyrK50
 6JRiYfkGqKwdWMBd/EkiNNmJG2nmSRw+0ciMhJf0G2c719THMP8NQq+5dgywdbm2efLp
 uIeyd+HIbcp4EVPbdqnPpps0Xvf7CAn3XeFZE1C5hNFglf8ZKwUJjHbAbjKsvIBmFIpS
 utMiI7e7zeZ7fTUhW0kU6T/LABT4SgjHvOrSus8JjU0eKOun+AqqB59Y8q8p26Cif3ZH
 oml+zTO5vt3LCPcxwyIJs21zvCbSFEpsJYkZEazwnfPlKKajW5M2tRpdAAdJmtEnHtz7
 kyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GK//+DnMF6q4YF03vVM3FN3wfAOF7udeLc8FgrCjKyk=;
 b=nuZZzspdADLny7ABuRim35xy3CJEJasAu26LOHYAUPSmp6taUnCLzSxvJ/1/ZhvtvF
 /N0INo1Xnfp6QwysKzAIBqrPJwZs0FtwxUYAOF9YSyGfQAbw998HYHgrGsXneONgYuCR
 WyzcIi5hFMEENqQ37d5QjewQlqeVV+/Gb1f1l6s5ywe4rufReqiLThu6F0G/jrbGcF/f
 MCrWjYGFNNPrQGRFcxCDqVH2r9NveDeUO1q3BtRdeFQ+GYOzBHnbOPpWFT0ZP+JEFYyo
 pDhDmiRS+9tM7fUHlPIlg7ITrCJWFsDVlhpGeb6v8j6ADPJI73UqPLKdMDkt8RYRX8c3
 dJzQ==
X-Gm-Message-State: AOAM531Zy14JR2k2Hp7B5gWqQMZ/XWLEnaPms9EMFRRKHZWclMx1VI1M
 vkG1sV3IjoIVlPycipCtnheOw6/2e8lQGNkJ
X-Google-Smtp-Source: ABdhPJwf3xP33tFqD6DwjfrPEkwyRZTGXUhj0mXjEOlFCcwZMMKu9uadc03i5pptOHAMIu7caabngA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr9109067wry.660.1642377214161; 
 Sun, 16 Jan 2022 15:53:34 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o12sm4020453wrc.51.2022.01.16.15.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 15:53:33 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] hw/i386: QOM-attach CPUs/SGX-EPC objects to their parents
Date: Mon, 17 Jan 2022 00:53:29 +0100
Message-Id: <20220116235331.103977-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
First attach the CPUs to the machine,=0D
then the SGX-EPC to its memory backend.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/i386/x86: Attach CPUs to machine=0D
  hw/i386/sgx: Attach SGX-EPC to its memory backend=0D
=0D
 hw/i386/sgx.c | 3 +++=0D
 hw/i386/x86.c | 1 +=0D
 2 files changed, 4 insertions(+)=0D
=0D
-- =0D
2.34.1=0D
=0D

