Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3EE6616D5
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYqF-0006gc-OR; Sun, 08 Jan 2023 11:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYpz-0006Z4-6q
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:11 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYpx-0000LB-95
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:47:58 -0500
Received: by mail-qt1-x831.google.com with SMTP id h21so6033079qta.12
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jLtM+YHyGQwi72j55stD3tsP6qW44+5dginXpCAqFJA=;
 b=ZrJ8iB8k0CetipBzJfZ/UgHjkcuhyrxBftOvH4KIkZrE8ok6nbW+3IYeXW/aPyxilm
 Pj0YdTN3s5lxi0m7hSkKk+C2Seu4znNUBQKlgakJ3HZr0H4jkKd3k0sTfTW6GB/5menj
 ggugEy8PXmII2g2T99EYhQxgPLQCnCpWOF6fnpaSpu2iHXhP1tmkc6cC/wxhTvIy45Gc
 etBd7IL8ONZ7THD+FOcY8Dt71sk3kw92rAliJHECYRMJT16dq6Ch0AKIcKJkbxcGzoEw
 h/YzqHEuRk6VBqQRve9mls/i4aYrLdNa5zHMwwk+3/Wmn4NTHVuZrRZFfOxwTuBLPzdx
 y9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jLtM+YHyGQwi72j55stD3tsP6qW44+5dginXpCAqFJA=;
 b=DQ8ZNAeppZRX/k7bq0d41rc0rgJk23hhyY5uUaBE2fwMj1uvT1CxbtkrA/Ccof4a6q
 zA7SQlTOi9S56G4FT/SB4Uq7gd11GKLDBrs/1Cyj8rxbud05gEImibv0SHz2/vGd3gvk
 SBI56NV2Aqu17LPAwNhmY48mByjoskbVVksrNImZfqibxqLr1IwfyLAGFZ+NaB9v/QHP
 jgfFDbY6Lgg7kmsGspa2U/Phq0K9D5qaj8pobwFDDtCTzhq6I6TaQqKOqyQdm6lz/SQW
 vhjtm+RA50f5o0sFpakw7077Updfs4mPmAgmvGZYmpwkKGwh2AjxsVbbMcPfKHM5l/OD
 fwIQ==
X-Gm-Message-State: AFqh2kpZKEpF0yw8SQ/oLzTgf7pf+G1Inj3BzQhXBNsVdb9j9EJGwvzG
 NllZiqtF8+iNeZWBxLWVIojaqFyq5j3ja93C7h7cuw==
X-Google-Smtp-Source: AMrXdXu/DyE8KAEA+etmCHUiPJL6X1OxE5pc94nZDLvQv2ihvuaCKoVt4E+h5mVu40CcIJw6HYeDqA==
X-Received: by 2002:ac8:7389:0:b0:3a5:4a20:3096 with SMTP id
 t9-20020ac87389000000b003a54a203096mr85353549qtp.6.1673196475811; 
 Sun, 08 Jan 2023 08:47:55 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 v24-20020ac87498000000b003abf6eb5a51sm143346qtq.88.2023.01.08.08.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:47:55 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 0/4] plugin patches to fix #1381
Date: Sun,  8 Jan 2023 11:47:27 -0500
Message-Id: <20230108164731.61469-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::831;
 envelope-from=cota@braap.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Hi,

These are the plugin fixes that I mentioned here:
  https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02865.html

They should fix https://gitlab.com/qemu-project/qemu/-/issues/1381

Thanks,
		Emilio



