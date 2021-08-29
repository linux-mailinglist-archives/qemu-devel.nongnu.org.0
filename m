Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56963FAE63
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 22:22:08 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKRJV-0002iy-IJ
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 16:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mKRHV-0001CN-4t; Sun, 29 Aug 2021 16:19:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mKRHT-0008Bu-Hy; Sun, 29 Aug 2021 16:19:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id u16so19410406wrn.5;
 Sun, 29 Aug 2021 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRzehENWVenwx+2eKZxeEkedInooacXD9R1T/qNf11Y=;
 b=Z2M2pOksye6DjLu4vMdJMBtb4FWz8FzyM170jG7p0No2Qj3MU/KCNRs0B1kAIqGX2i
 ryRXtiigS0fopL21BWMxcz/rfA8a5yK+oKGKzhbNIxLZh/X2HsLoRAf0pPYDzM/fpXJc
 7SLo+2DlahJ1FRaFGiU7Kcnsqt0q9Wl/LLf8D9I3z2rybSGUe6eYkpmuKW3RYHPT56GU
 SUURMNyX8SUM4IoJvWuhpE7ba+szWc1b2Mq3AlS965L2YUMXZMPhmxtwFo21322U6zLe
 ue+ABs0wzBUcMqS5AgXHEb322BHBUM/DbrgYi81fJXG4pJKzps4iEaM7A1IA/0smfgmr
 fIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRzehENWVenwx+2eKZxeEkedInooacXD9R1T/qNf11Y=;
 b=NaH7+/hADhSPfdo2CMkLZtNAeUITcvBEKxRAkxtDueUjSLKpPxpQcfksv04mSmfopR
 PammV4/rvPr0RU8OaNI1XbdZ//6oSitA0nxNqWQWoNvPF0h8VFdWLhMtFrrWrQk5Xp3W
 /TVJCIoD3QTsnqBjBVzIXUfEoQ1sVy/N+WdsxyIprFllLzeoN35Otqh1T3qL+S1ET5MH
 VwKSIrkpUvdKrQCXkS3QBzqv4EIr7FodfNha6gtQbMaE2AtwIiOzR5ek2EdW8cdlBJP8
 870bKEw9zMyCbgfADgRljLBcqNGDFhUh40ma3Ns8EEacGtQoVcWeV5D3X5Uy0Qq48neV
 rLrA==
X-Gm-Message-State: AOAM5311jLzqtD/mWMzupQl3vBqD8LBezr2CimSCqvvTqhQZsWdQQmK9
 qEh6tKOCFpyruDL2w+KenIit9lrMKJw=
X-Google-Smtp-Source: ABdhPJwmyRIx0oHvXvZwZoCNkGlVDoHbHBRfwKJstqWCXakOlZHYB0hnrgPEr2yafHvzCvk761TV0A==
X-Received: by 2002:adf:914e:: with SMTP id j72mr22712523wrj.218.1630268387517; 
 Sun, 29 Aug 2021 13:19:47 -0700 (PDT)
Received: from endor.speedport.ip
 (p200300c21707a48b7f3f1b0e18124d09.dip0.t-ipconnect.de.
 [2003:c2:1707:a48b:7f3f:1b0e:1812:4d09])
 by smtp.gmail.com with ESMTPSA id x18sm13326817wrw.19.2021.08.29.13.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 13:19:47 -0700 (PDT)
From: Johannes Stoelp <johannes.stoelp@googlemail.com>
X-Google-Original-From: Johannes Stoelp <johannes.stoelp@gmail.com>
To: qemu-devel@nongnu.org
Cc: johannes.stoelp@gmail.com,
	qemu-trivial@nongnu.org
Subject: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
Date: Sun, 29 Aug 2021 22:19:29 +0200
Message-Id: <20210829201929.79931-1-johannes.stoelp@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813173923.49278-1-johannes.stoelp@gmail.com>
References: <20210813173923.49278-1-johannes.stoelp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=johannes.stoelp@googlemail.com; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: johannst <johannes.stoelp@gmail.com>

Ping.

https://patchew.org/QEMU/20210805193950.514357-1-johannes.stoelp@gmail.com/
https://lore.kernel.org/qemu-devel/20210805193950.514357-1-johannes.stoelp@gmail.com/

Thanks and best,
Johannes

