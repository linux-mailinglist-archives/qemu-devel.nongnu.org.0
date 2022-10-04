Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8495F443A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:28:21 +0200 (CEST)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhy8-0003dl-8x
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYe-0008O0-BX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:02:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYa-0007QF-Ey
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p36-20020a05600c1da400b003bd24ccae2eso796663wms.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VAduaoosLO7MvAhcvJNn1SKuZyndPyiAt4ndSErOy/8=;
 b=wW0FM0/Hzae0FFXn8E2Q3CKgebcQtPmLdxba6FOLxLiOjlgGNL4tvkhzXIhzoBlgrz
 Wkkb7/czZn6FWnM5mA2iLofw8EdywkUqhyMe2Ba2vVlczd2GYV9AvaKZGl44WRCx5F99
 F/7gEaHKTlcv1gvCDLxywQ6hEghjSgmfTee7KcrAf+7c7K5lHjDc+llNlGnfxI9h86ll
 cnSw0r5CjYiVyipasFkZDpgV23HY32tvEJfZa3DzWH0I3NDh5e7nr71UNiBapC4OQGWM
 EW5zqVcYJ+P+XhgJ7YQ9ly7X6PQhelvZ+5gLy3SpgsGv+widWZ1ogz9VHLUg+nX1GiC0
 wWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VAduaoosLO7MvAhcvJNn1SKuZyndPyiAt4ndSErOy/8=;
 b=fccUnXYnKvYwfNBxO1s6jtSo1zYIWG//I/0TDlw5mSFOyi/w8jhccwPHhlJewSYDE9
 yvbLyibu3TlvdqPDOWWH67x+UYB4amSaPpLVMmGB8+QatjqBqEazPK9Avr5Jf7a3HlyC
 G0WlTpBRw3licY5VTbGVosOKKSI0BSYPueWCFdSLua71HpF1sEqrqwtTZDNZIQw5Ev9/
 9hwkfEz9h1atSmMoqZejwLo+aKhnmwbV08G/0wBW8frE93LK0+aXNCYk41ezsR6p2RKZ
 3Tg6LHt00DHrzmtB9l7qrg1Y1TtUijawxWU/QaRg6IZwRatnLAf2Q2ver5HXAh1kZWCa
 69kA==
X-Gm-Message-State: ACrzQf0hjSZgeyYit9u8djqH79vn4ojjOegIFBa2wtlLNmBGZ3mMjOvP
 +bgqBfpWb2bqeVLz3mOjk8W1yQ==
X-Google-Smtp-Source: AMsMyM4j9v5U2EF48n1uTrZv32H0bDX6MXxQ/1mJ097v8/F52viNT2RhY8fYYqC+upFwSYMZrBxZ+Q==
X-Received: by 2002:a05:600c:1da2:b0:3b4:856a:162c with SMTP id
 p34-20020a05600c1da200b003b4856a162cmr9872578wms.28.1664888514623; 
 Tue, 04 Oct 2022 06:01:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x16-20020adfec10000000b0022a2dbc80fdsm12500167wrn.10.2022.10.04.06.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F26E1FFE5;
 Tue,  4 Oct 2022 14:01:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PULL 51/54] contrib/gitdm: add China Telecom to the domain map
Date: Tue,  4 Oct 2022 14:01:35 +0100
Message-Id: <20221004130138.2299307-52-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <20220929114231.583801-52-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 434ef53afc..3727918641 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -10,6 +10,7 @@ bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
 crudebyte.com   Crudebyte
+chinatelecom.cn China Telecom
 eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
-- 
2.34.1


