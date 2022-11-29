Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762063CA84
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 22:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p08D9-0001Nk-Fc; Tue, 29 Nov 2022 16:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p08D6-0001Me-Iz
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:32:12 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p08D4-0001Su-3b
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:32:12 -0500
Received: by mail-lf1-x129.google.com with SMTP id f13so24030774lfa.6
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 13:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lTOBBqhQUhS4TRpJZM6iG+cevj0RyoXT843zL4YtRY=;
 b=A8Vz1NE29R1+riFt9SsOTeSk/VXnVYmztZYbFVussz+7J0LvnQuhmz14+rvSQiZN0a
 rzOT6odKX1NTef1e5GWBzlGURoNfa6y9FqQR21SBjl+cPi+5x0tSq8Cmde7nogZAtJP2
 SEFWSzcF/2UMCC/ZAIiK7S3IFdxP5DYb5fQKDDkXg23O2lutXt2uIweqQd2fWvqICEpr
 El65n8A6vdybcteA5Ssb6HtOJgJ03YLkh5sSluvWndN49SiN6lrSlIYn2Eu7oT/N4Q4d
 8fugjIVCnOHBREFzuVi6kO0Fz8JlGSI6M5KKLzM2hWeDWZbq82rvx3ogQkF/OVzDC12h
 C1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lTOBBqhQUhS4TRpJZM6iG+cevj0RyoXT843zL4YtRY=;
 b=sSo4juBFCgzgYlGv7VN2BPVUluEH2ZkO29acm/8QMVCjMwN2Kko9OZX3kr2Z2vodHk
 rQSYK1R1TSY/0onyyXJVXDRzKBaYbOBhGYhBHiTw+yE0H4dVIKFjA0MhBC+7ryhPT/BI
 bnWA+nmSslvbCBYH4J5f1tXDupoOm7O6y2sr9c4zUDWuxUAAoIQYyZEZH7TtQbTYGtgR
 hdLg/6AfLLhbAFfpblLNDaF55a9m+NtwN3KsmIXIWjtzpLvUzLyAh3xZW+5NkR5SFN7y
 PuQOwyYACsgEJJCiwHAl5t1hXFBa5G6hfScxd2QqPk1q4Ob8vFSeTNknc8gEWL2JkwbV
 uzxQ==
X-Gm-Message-State: ANoB5pmBNSyY1cDA6dEXcUHaqGvwt4nB2TFsjWTCukQF1CcowUEkNx6/
 JAW1K+wBZvtmJs7Zg4YaGM8=
X-Google-Smtp-Source: AA0mqf53wCDf6JYKIp+94bLCbC05zGXqnMh/K3k1UCDBVzeRKeICWMePbcpjfVcEo0X2n0WpGn7vog==
X-Received: by 2002:a19:6903:0:b0:499:8e29:2763 with SMTP id
 e3-20020a196903000000b004998e292763mr21864354lfc.137.1669757527920; 
 Tue, 29 Nov 2022 13:32:07 -0800 (PST)
Received: from front.loc ([80.83.239.107])
 by smtp.googlemail.com with ESMTPSA id
 p12-20020a2ea4cc000000b00279c10ae746sm162068ljm.140.2022.11.29.13.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 13:32:07 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Subject: Re: [PATCH for-7.2] target/arm: Set TCGCPUOps.restore_state_to_opc
 for v7m
Date: Wed, 30 Nov 2022 08:30:56 +1100
Message-Id: <20221129213056.21649-1-evgeny.v.ermakov@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129204146.550394-1-richard.henderson@linaro.org>
References: <20221129204146.550394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
---


