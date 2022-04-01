Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85644EEB23
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:19:58 +0200 (CEST)
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naENp-0003kl-Oq
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:19:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naEEM-0005Fs-JF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:10:13 -0400
Received: from [2a00:1450:4864:20::533] (port=33368
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naEEK-0006On-NS
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:10:10 -0400
Received: by mail-ed1-x533.google.com with SMTP id r23so2423475edb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=cXcg2rYVCZNcEpJlQKvzF3F2ermw5rW2mq6503h6KV/DmXxO31uUTlZu58DBdmrhZ0
 iXdN5n2itYIFa26gKlqpU2Om6ze1/nIcnbHt8semAMKOrwmGqe3EMSpqH/P+JQKOpxLO
 a49HC7w9ED030KcLSAMvmQ3vIB6QY+rBf6DRz/zxMy12GXTzOJRpfhVR37B9/MYubarY
 jYOq4g9CiKG7zpOohFM5wHiwxXzsEgwRp3Y+zFQrSHpzLAVo7ffKuXXZf1wkXBcqGPv8
 z6RRcepR+ns3K2gvhjfL6ztIW9J4TGeFbNAxZhQIRpnt782HmCstqj+TeOjfEvp1Gycf
 0PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=DccOD0gpKCwq6HsUqGVy1+Yc4lIbkPKgKXQUB2H+0B1tYsVDNn1o2YueZRIiS223ZG
 o+koLAhLmWCuhLxgnX2ofjgQn8gSgAsVsHTilUE64DGKxpXU1x7hylYTo380zZBaEhSO
 dbl1ZOHr10MJ4Wc0k7AmRoi35Vpzt8Y57Hz1YDRE/eNCluUFQnhQcColzVQfVD8Zi6pC
 NZWeSX4fdn9vbcUSwvfpywd731xeNJVEXeWgwQV43lNPfi8RWxkegtkMK6u/e8Ht6N7M
 04mb1cC7WEsCCB/jekOk62VVpIE0qA2wqO6fS7GXZjH82a+Khx5uEXanlDFkohCBg4KP
 9LKw==
X-Gm-Message-State: AOAM530zRVYmmWBjuYMb0h7n+ZVAZP2FYa2rcmJYy161UJKHxdltQtJb
 vaSVzAjo35F4QIm4wueMXi8=
X-Google-Smtp-Source: ABdhPJy+lukuLILa0twVbI3BKQpgnBGQzHQoFI3WL3a0tb2vIWfURScrYtRMnj0H07s1wxLu/yK3Sw==
X-Received: by 2002:a05:6402:40c4:b0:419:135b:83ac with SMTP id
 z4-20020a05640240c400b00419135b83acmr20542949edb.321.1648807806573; 
 Fri, 01 Apr 2022 03:10:06 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 nd31-20020a170907629f00b006dff863d41asm858185ejc.156.2022.04.01.03.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:10:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] build-sys: drop ntddscsi.h check
Date: Fri,  1 Apr 2022 12:10:01 +0200
Message-Id: <20220401101001.1205992-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401085106.2167374-1-marcandre.lureau@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



