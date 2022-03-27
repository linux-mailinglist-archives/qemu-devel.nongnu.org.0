Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0D4E8A4B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 23:47:24 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYajL-000083-BD
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 17:47:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYaiK-0007fR-1x; Sun, 27 Mar 2022 17:46:20 -0400
Received: from [2a00:1450:4864:20::433] (port=36491
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYaiI-00064b-AF; Sun, 27 Mar 2022 17:46:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id u3so17829338wrg.3;
 Sun, 27 Mar 2022 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q2hSMi7eaQhktpaiorkcRpDqQkHLTQImNrdpdMsLKaY=;
 b=haKRkXgJ3GWoMU4Yzr7KDek3WVEFnjXAJoP9YD3xIiAGrZJ2e2PaUen9N8xkKenM2K
 dNCYh9rPBbkZ+gX7v3+GXQVY6/b7wzyUyUxqMlU3lnwnFJ/QjbLbRE9Y+7JAXugLGI1v
 tqRXSzD7Uw5mKEKso3lwmsFEmfIOh1oFr+N5UIHBqV78l35aRHLg9wjnrw8nJWR5DR5U
 /v5hB4HA9vGH6qdtmaMPLw5o/tOaCrEvITcpb+XNfZEa3A6hYK3QMXooMA3T82bNPiQa
 SDCOrvMu5jXKJB/5nwe0gQ1/YPnGqHGsnIuSqxIMprDa2dzP+mnRUydJJO0AmeeaU/nQ
 Wo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q2hSMi7eaQhktpaiorkcRpDqQkHLTQImNrdpdMsLKaY=;
 b=GOJLJ5AtkBqYScClExyTTRKJusTDmniV9kXHnPIfuviNvgtdSnDfj2eFcfr772+I4q
 iecvgSKKya5PYL6GWSbg+W06HMOL2ySmvmBjMBvClKR6VgXpRZETOPRept5vs/xRTHjO
 H7K/BEbVzADVeUwuk3oxKRiF6EGX+IT2IFjySxbsBpyQeEwPvyTgFAYAcw9lTXem2KKA
 eljxfH+dB6zz/R9T4VyBgXnaU07RxUjGH7PjfIQOWKwKUfi4Tn5SwLMBWP82mAW0PLNa
 TKNhBKISckL7jb0TnQgYTmriUJX/K0TirM81RxJtRV/wqbCHi43gpUiBKk8aj1yf3Fsi
 66Hg==
X-Gm-Message-State: AOAM533JRrkmD+JLtFavaLc8yk0qmEjpdDCUs3ktsfRqbWz885a1ijab
 EqeZTUwLV5enck8XWLEDI/NE9byytC+FMg==
X-Google-Smtp-Source: ABdhPJw2aM9woXEhf0C5kErNZNVh4vmycTIgBn+DG1zcq97y6wGsXzI/O6Zjjx1tqgXKvN/Fc483Fg==
X-Received: by 2002:adf:e483:0:b0:203:f946:396 with SMTP id
 i3-20020adfe483000000b00203f9460396mr19069721wrm.548.1648417575892; 
 Sun, 27 Mar 2022 14:46:15 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm24485521wmq.27.2022.03.27.14.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 14:46:15 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Date: Mon, 28 Mar 2022 00:45:51 +0300
Message-Id: <20220327214551.2070008-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rémi Denis-Courmont <remi@remlab.net> wrote:
> The VTCR_EL2 specification says that the NSA bit "behaves as 1 for all purposes 
> other than reading back the value of the bit when one of the following is true 
> (...)
> * The value of VTCR_EL2.NSW is 1.
> * The value of VSTCR_EL2.SA is 1."
>
> Sorry but I don't see any reason to check the SW bit here.

That still does not cover the case of NSA=0, NSW=0, SA=0, SW=1.

> -- 
> Реми Дёни-Курмон
> http://www.remlab.net/

Idan Horowitz

