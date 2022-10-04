Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E475F4567
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:25:23 +0200 (CEST)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofirJ-00053c-FW
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq9-0001JV-68
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:06 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq5-0001rN-Sp
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p36-20020a05600c1da400b003bd24ccae2eso827980wms.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xfYgIheO7osrtJ2jz1JkzH21idzxGZlWkdFddTP0iFI=;
 b=gcOhvlMWtqFcKZlRPN0/EZnKveuiqBVUkFOhRPOBr3w2yrIaSzj/ZW7oA/GGW2SGDB
 zFSid+aAfcC/6vPX2FIPDAyZTKMOe4TKxpug97lRPeWOvoCpqFCGOiqAA77quf3XZC8E
 clGUf97UUkezQQSPjC/cUSKP0dCp5mOfE4noEzhZahOpTMImOzm+2c6wEekKrnZh5EsH
 ZvB6mK0N/8zr+SpNQnd4gTHIOTrjWKej8Yr4+aYCEEu8dVNnOOaNmvNUy5UBzQmGWp5g
 CnrqF8YJWdjhYnI+3MJPMOkDT6GJMerO+SnPEN/Wlrta1hUR6NLjvuMn5QmWp0YvqmCt
 OwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xfYgIheO7osrtJ2jz1JkzH21idzxGZlWkdFddTP0iFI=;
 b=BQwu5o1Ys8HpDkZ4igXFDNE6TTmSQkn762xXEc/Vb3psbsB1fBDUcXxo4lCzr7hQf0
 /4GP/nu21uRi/FFhTHgqgDOaz1yOmUHYMktVsfvyr6M04o4rUJJIqCV2hFw5vvAXMBQu
 paoEW7e36xW1TCr1N0tQXex/p+6TMaT0dNCBVUL64luGx5tvSxgoqelHP4RkBBl33L3c
 NWmviDtmNHJOxVfPwCrQA9l2TUX+3p5NWAoEhIDe7F6yjoGC+00JslMK+XJBtH2y6e/t
 1PbaMc56oFzDEjhtMpE7b6JRo7XKsNeU/4uxahcPz0iA8nPmDPqsl1TI4ItM77TAwgxI
 q8Vw==
X-Gm-Message-State: ACrzQf2PzelOSfSoW7z50SWYopMF5V7dQOdMYHzsaTO6W+eqvC+VY4jf
 TrMXq5cTsd5x8g3QYymhC6IrRJytMkj04Q==
X-Google-Smtp-Source: AMsMyM5/krHFg7bmz/QvlXPugqI3h9Q9e/qb1SIbpNGk3180N8YEI6fsZ+4EhJYL9ti3kRmcd3YW0g==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr10502372wmq.107.1664889597684; 
 Tue, 04 Oct 2022 06:19:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az26-20020adfe19a000000b0022cd59331b2sm12561402wrb.95.2022.10.04.06.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C64471FFBE;
 Tue,  4 Oct 2022 14:01:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 47/54] contrib/gitdm: add mapping for Loongson Technology
Date: Tue,  4 Oct 2022 14:01:31 +0100
Message-Id: <20221004130138.2299307-48-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Please confirm you are happy with this mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220929114231.583801-48-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 2800d9f986..434ef53afc 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -19,6 +19,7 @@ ibm.com         IBM
 igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
+loongson.cn     Loongson Technology
 lwn.net         LWN
 microsoft.com   Microsoft
 mvista.com      MontaVista
-- 
2.34.1


