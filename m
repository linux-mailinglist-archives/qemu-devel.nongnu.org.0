Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7C47347E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:58:21 +0100 (CET)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqWi-0006Go-3S
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwqUh-0004Db-U1
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:56:15 -0500
Received: from [2a00:1450:4864:20::430] (port=35429
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwqUg-0001xM-Hx
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:56:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id k9so10919442wrd.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 10:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ndCkpWyGaJKW30SGU0ux5F5T/kqVWVmDLc6sDNj6N98=;
 b=FT6vfy1b+Cl17pkWOuRVQpdS7QvgqKkmmFhDqR89CLuREAC9q/MYHXOuE8UgOhdNzl
 K2/5n+qoR6oWXGFnUz1uIrTWYQNmxaplcJmaTIy03vwjg89Mv4WHM4L06X322FdfUv3I
 Hw3epjopvR26auojShALYoXlE9xvDo77fKuiUeTe0YxxeGPgDnJIobKj+Beqlef94onR
 gBhnbz5/9GK9dJ5/c8if3UsriusTMunXSHx2yYBfBg+FOHpScE6dOboAHyeHmH3oCAYz
 scCufUgy5J0CHBbPbinWSo3nwi9PZw2aEQ6yHdSxpbL9+F9a/s+98d0GGquLDtv21GEo
 zLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ndCkpWyGaJKW30SGU0ux5F5T/kqVWVmDLc6sDNj6N98=;
 b=2AzPEgobr7FFFPFfJ2AtIlsA/uV/CX0dwSxIRLrFqbzwhyuFCWs7cHOB8BReAP1pXX
 rsMogVtd263Z1nFe257cKy19Cf2DYIkw71Jq74n9oXT+83Ntwblxue7ePMjI3S7gfjrD
 jyqDve7pXwRV2HYTgdYrDnuJSvfpIR3n6YvfZdirqkdcY8qOXB3Go23Ao28fcLegQpt9
 FAqgZiGhNY8iHX70TIrOhBcF7+sb8vmAOXRV6tFnpXBjLpBjjhTPNQ9S6bWbwhRlpEHI
 gWQ1TmDrKWR0j1nGxpVMmSqmN4si77+dXFvyDi4VhVBJmZEHXRBsn1iO48v2qN6unlHH
 ZowA==
X-Gm-Message-State: AOAM533XKxQ7Xh2TbG4u1GgHu75gkRDF8vRgnSbLj4usT5kTXKY9rL4M
 U/oKityyBuslPqejUfj8DANrtj8Tn9U=
X-Google-Smtp-Source: ABdhPJwROsH0rRGtngpndoTRShQd1vMjqg2ihKemWxQRkk8mK5E7hEk5mfnV6jAjJcOkqIFrlyt9oA==
X-Received: by 2002:adf:d091:: with SMTP id y17mr372353wrh.418.1639421772551; 
 Mon, 13 Dec 2021 10:56:12 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m125sm7810687wmm.39.2021.12.13.10.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:56:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] target/hppa: Fix deposit assert from trans_shrpw_imm
Date: Mon, 13 Dec 2021 19:56:08 +0100
Message-Id: <20211213185610.1987974-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
Add preliminary code movement patch to ease reviewing=0D
Richard patch.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  target/hppa: Minor code movement=0D
=0D
Richard Henderson (1):=0D
  target/hppa: Fix deposit assert from trans_shrpw_imm=0D
=0D
 target/hppa/translate.c | 19 ++++++++++++-------=0D
 1 file changed, 12 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

