Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C56F86DB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOc-0000Ub-IY; Fri, 05 May 2023 12:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOb-0000Te-1H; Fri, 05 May 2023 12:35:01 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOZ-0004tH-Jn; Fri, 05 May 2023 12:35:00 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so18482296fac.1; 
 Fri, 05 May 2023 09:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304498; x=1685896498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvZj1YOrInqqbWuFvor3phNSI1PiHIsDRB+lOfZ4/U8=;
 b=T/JySgqZyyWmA8aNZS+TBLMB4FLf8CoQ+TfI+X0MuXgTl2HB5D1Hg4Rp5QrEPtYQWM
 O0Sdel1QC9vREofToxw3vph4Q8o2eZ2RJK9pThsYbpICUdL3ATsfjxt0xu4UkvdbU0Zh
 0tnIKIS4WjDigHaNtvZSBwaseTYPpLX8mX/lLApMZBXQG3qozavg/rhxXXiudibCboSQ
 GdYCozNAU0vdVYuU1IhLzkeOmnjT2YhoHiwV1k41ARBzViMVjT4ZF8121ma8pTcgvEwI
 VRfLB00ZUOJK3J5diH1E4uJhyg76sqMay7zRq8Eu7WZx6KtRY4oupvHO1OPybzQ71SiO
 YL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304498; x=1685896498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvZj1YOrInqqbWuFvor3phNSI1PiHIsDRB+lOfZ4/U8=;
 b=fpwLe3p34HTSc7kK2menXjA0NucFpmbWygyKmJtI0jraiwBT0I0bw6DSY+YUiMDWnx
 BNwAnv42EtxkojKgtSPy69r4zISqb3YT4ZaGyCO62hRa3fo8NTVci9+3X+U9Grk8INJy
 vrtiVOxi125tKnqzqMnwkeUoLSok0VscSQydVie8Ph+fQyfWLfPnua+YKfbdRzqsBICL
 WiQ89F7f0XvaBDph1Q++MlcdlOkHiENbXjrbJeey6ypUQGWuknZaCc9O7Jn6ARVkjHMm
 7uwTOI009fKIkZrY9Z13dRI1G1ceRKckvaWJi+jWzxXjtcCJ7zGqJ+Lwk19nVvNxXfFH
 3oAw==
X-Gm-Message-State: AC+VfDzkDPJM7/I8NwF+dLjbGRVD/sEsUT9KcfAX0i8KhDNbYTWW5dwe
 sn5k/nO2wMLKdwoW7Rl1fPyx7t/kcq0=
X-Google-Smtp-Source: ACHHUZ68YxQZHSzA+Gtp2uiUpxtvohKtn/4IwXI0Ov7R2PV0GEQnJf33r5lc2FRNaC793VlTUmlkKA==
X-Received: by 2002:a05:6870:a10b:b0:184:2b9d:2b12 with SMTP id
 m11-20020a056870a10b00b001842b9d2b12mr3278036oae.13.1683304497960; 
 Fri, 05 May 2023 09:34:57 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:34:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PULL 3/6] MAINTAINERS: Adding myself in the list for ppc/spapr
Date: Fri,  5 May 2023 13:34:41 -0300
Message-Id: <20230505163444.347006-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
References: <20230505163444.347006-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Harsh Prateek Bora <harshpb@linux.ibm.com>

Would like to get notified of changes in this area and review them.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230503093619.2530487-3-harshpb@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 431556c217..55102f4761 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1422,6 +1422,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
+R: Harsh Prateek Bora <harshpb@linux.ibm.com>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/*/spapr*
-- 
2.40.1


