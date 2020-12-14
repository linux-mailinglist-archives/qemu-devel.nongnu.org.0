Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322872DA359
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:25:22 +0100 (CET)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kowHR-0002Wu-8h
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kowEE-00005I-E7; Mon, 14 Dec 2020 17:22:02 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kowEC-0005fw-Mk; Mon, 14 Dec 2020 17:22:02 -0500
Received: by mail-lf1-x142.google.com with SMTP id x20so14718368lfe.12;
 Mon, 14 Dec 2020 14:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCp9I1Hn/NAAVrSCIItiYRTSyzE1+wt/m10580ZD2h8=;
 b=tu753PZmiZ8igdZF3H2D8j+XxpHhcB8QVaOzSKfT/oqCzMKhs7jA8VlTYaqeSQggSA
 dF3tTG0msFQxpGS0eEsGt1fJd97e8n2iCVVp9xyolNBSD8x2L5iMZO3lsvZ5T1eLnh+Y
 KOCJwcUdFMActJc7DK7Z5uN3jN1TGctDgoBp9FqaLLF+Ph0CxL2KP/9YnMkcE9yTdk2n
 FwWC/6Brks8ke+n26C9Sl+ejzMHl9VZlyyE7qHg3UDG37SvaFAtToZGODAnrJ496qw86
 Jx+J+3m3Djcdonaye1SBtZWvd2cmvN/ZyX03AmfhC+3QOBT7qogiBDflK3V7mv++BQvm
 4b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCp9I1Hn/NAAVrSCIItiYRTSyzE1+wt/m10580ZD2h8=;
 b=iaKn59P/vfabgEekTma/DaO58hslC/m9fRwYTMnUkbXoQVzj5xG+zFpKPJYmpszGKO
 5pSXRLJ3UUBvpwnPuAje36JqbQNjqJNtmbHuN3czJM61gV7WvkJNhTo43mqq6arYy1QA
 /x2cUtlo0oUbk+WxiOo0qPavX2+ZPb3WF24RlGuwzc2xLBIcraWb6xiSXFiufE5yOtIq
 KxcTa6tfKscOoG7uSckrGmP/1U4QrfQNCC4nfQWhBhZoOvQnfEiZV7k2bzAWNG4I4tYy
 LBVNX8Z/J+Wf9a3yRPQmveuyqSExtWRfZVpN9RFy7mTVNOkS6wKfNwbRWsQTeh9XbI6E
 6vDA==
X-Gm-Message-State: AOAM531csyZ57zc6GhbumVj5tFgo9mIdSTFqKjI2ZNkQwz2lRRsEodrZ
 p+cbEWuaTv2TX9Vka231zsbA2qR7hfBFww==
X-Google-Smtp-Source: ABdhPJwqZw4coBJQa7UsadbvpQK3OrRfPnb9AWucksDacjCbBVbLBB3WzTa55FMNWWFTMlpAMyuNuw==
X-Received: by 2002:a2e:b4f1:: with SMTP id s17mr8922046ljm.228.1607984517723; 
 Mon, 14 Dec 2020 14:21:57 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y12sm2238662lfy.300.2020.12.14.14.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:21:54 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs
Date: Mon, 14 Dec 2020 23:21:53 +0100
Message-Id: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 figlesia@xilinx.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

Found this while debugging an issue with lockups during boot of
Linux on Xen.

In the particular setup, I'm running without EL3 firmware so group0
interrupts are disabled on the physical interface and enabled on the
virtual interface.

Looks like we're checking the wrong CPU_CTLR reg for vCPUs. This fixes
the problem on my side.

Cheers,
Edgar

Edgar E. Iglesias (1):
  intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs

 hw/intc/arm_gic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1


