Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED131F31F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:33:57 +0100 (CET)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCso0-00040u-Fq
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsiz-0007Tp-F3
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:28:46 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsix-0002xl-PB
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:28:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a4so2558717wro.8
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wsUydO7s0DzsBp18259KZnYYFtRE66NaUDtn5vj738E=;
 b=OL12F8Onvd+X2SIRdJv1Yqgr/ovSzAI9Mmkstnsm3lRgm16yML5opT17eIW1Eohmhu
 PGWyFuElGDSyAFXbcCjek+9vtls8eEar4rcEEXH/jqRfHJigtwqDbal/EYz1gqpITpp6
 pDopn/dCxh2TMebhKBymce8eURxD5SWGGe6/pZ2BVocRrvumBYxM8SSv6lbIFpTV0+um
 3HJHco6I2XtcNmjnDp2eBEZfOUjfpCkA7qWPT5mhYi8h2j9KPmYkbm7zZuMRpaaBONSX
 l22XyzOBF514cjkV2SgcLQCL9t/wOewO9shGdIYFkh7dg4WvltXusW7pG3imR5nIEV5u
 +peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wsUydO7s0DzsBp18259KZnYYFtRE66NaUDtn5vj738E=;
 b=WDdBYmlovvZrBMaTufyv70FgZXq8c/rKqCp5+yq8m0bQ98KgKIQmYXo0qT9KY4KEGQ
 KEWzwwI1ZsXQXs2ygSbPqGykSjgjBQ2gPyfWRG9NV0E1Tvb8FJhyRm11Og63xJLsh93B
 9TenEs5lzBt8vFkPOklZuNqZrSQz+8bqcpqCme1ux5J3RODBrB+hR3+YxAZmvtk5h416
 CLFWbwg2mujYgqEgttqcYAUNOPYPDKFdvL12pAhTTM0mdCCZ65SeRXCYwYEphIDVDNm9
 E9PSiqOSIlpKjjn6NKvsuWyEA4rxclq8pUjpVf2E/4p2xkXlVeao2e0B47Yd8Klj9nZc
 rk7w==
X-Gm-Message-State: AOAM530REuneHA4ClgFmdly7krgzUtZSVRS6qaIAWHbgyeFvLjF3UqeT
 2GNF7mhSnN12CglbuhByjdzkojcaiXI=
X-Google-Smtp-Source: ABdhPJwKq/xHHm1UtqNgOpMM9NZzKQBa/g1CcEGgPm6E+itD2beAH+/prtHnmaLMU5z3nKts/ai+hA==
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr4545132wrb.57.1613690922133; 
 Thu, 18 Feb 2021 15:28:42 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm11305072wre.78.2021.02.18.15.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:28:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/5] tcg/tci: Merge identical cases in generation
Date: Fri, 19 Feb 2021 00:28:35 +0100
Message-Id: <20210218232840.1760806-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,=0D
=0D
This is your patch (#4/71 of v4 [*]) split in 5 parts for=0D
easier review. Please consider using this series instead of=0D
your original patch.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg783450.html=0D
=0D
Richard Henderson (5):=0D
  tcg/tci: Merge identical cases in generation (arithmetic opcodes)=0D
  tcg/tci: Merge identical cases in generation (exchange opcodes)=0D
  tcg/tci: Merge identical cases in generation (deposit opcode)=0D
  tcg/tci: Merge identical cases in generation (conditional opcodes)=0D
  tcg/tci: Merge identical cases in generation (load/store opcodes)=0D
=0D
 tcg/tci/tcg-target.c.inc | 204 ++++++++++++++-------------------------=0D
 1 file changed, 73 insertions(+), 131 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

