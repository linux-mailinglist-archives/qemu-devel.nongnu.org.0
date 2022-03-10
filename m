Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38D4D5313
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:29:46 +0100 (CET)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPPt-0001oJ-6j
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:29:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO7-00086F-Vf
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:55 -0500
Received: from [2607:f8b0:4864:20::1032] (port=56278
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO6-0008E7-Ed
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:55 -0500
Received: by mail-pj1-x1032.google.com with SMTP id e3so6141684pjm.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbVuoKkqrd+UBwfTjPLfg/TnC7WrIGUwZEyQfS06s8Y=;
 b=sN3fUK0rkOMymwBo/dcKTZBn/Q/eX6Dfha5HRCLxmHcuMCzY64HPtPCJQJCokpMslj
 nutsKV5vXqzvO/vz7+cyA1rs6vzl9/r98PB93vHZbeK5CXHeUd9qvz3sbtf7hdLqeJ+r
 vt7vL4DAxskTTGasb0od+vpq3yehW59DfE0F1VxUttVFhBgEZklIf6G0z0kB3t/ZBvs7
 xcYstn1+8bTsd9j1MjnBl6rx0IsOYuuhGDh7Tv1iMLi2FNULjiWm36d/0kdVKRIhJm1e
 sDIQkK93oLJ5XppzA4x74qLpS+2N4nZMcf4RAkgkvk1RN5BcdcKq6gU6+AsSTMYOdoQf
 5ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbVuoKkqrd+UBwfTjPLfg/TnC7WrIGUwZEyQfS06s8Y=;
 b=muJcrg52/GJcyGIc6FyG3B1Jy/bVfhvqt7ZJkNuViNIj5G7cQBGD6ju/NsJKDbdklc
 AgfJcgnjQrALTV3DEuR9vO1qQnXImpZr1nHRaBgNQQCQXtfq/EaZEYJVhYip6Y/BFSjb
 v80cLOB7VDKaDnOcS6rfZeKmT/gaRi2XSuYTUcfzbdcdkOkBOQ9yt1uuL5YAo5345IGc
 79p9Knjvd6+CXpqMrq1Ow1WhIEiBQgJY2rkXoJTGAi9LYlBeEmkxu20FH9wWH6yMQ8/4
 bt4sY/Ib/SIR5/KjdKh39FBRe5aWmPnc5zXYJCFgsGmHW00wLKw3IqwldbShzaTaOyDs
 Og8w==
X-Gm-Message-State: AOAM532I8N+inyTBMmJaUp1cm1GeBoczAdNTGXe/xJRSEcRRtRgo7Fn5
 UnF/rjwWd/dk02I6SSZnKXIXCj5boFdRsw==
X-Google-Smtp-Source: ABdhPJx3t4uTM2IJx+Q5W8OIZs6KA0yvqwjZYHKNWGhi0uSj6YdoqGyy9ZEAvsp18HLpt4EFyCMwzQ==
X-Received: by 2002:a17:90a:77c6:b0:1bd:5ce1:1966 with SMTP id
 e6-20020a17090a77c600b001bd5ce11966mr6828494pjs.230.1646944072761; 
 Thu, 10 Mar 2022 12:27:52 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l9-20020a655609000000b0037589f4337dsm6399938pgs.78.2022.03.10.12.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:27:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tcg/s390x vector fixes
Date: Thu, 10 Mar 2022 12:27:48 -0800
Message-Id: <20220310202751.594961-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These 3 issues were found by running risu on arm neon test cases.
In the meantime, Thomas encountered one of the same with the new
tests of vectorized sha512.


r~


Richard Henderson (3):
  tcg/s390x: Fix tcg_out_dupi_vec vs VGM
  tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
  tcg/s390x: Fix tcg_out_dup_vec vs general registers

 tcg/s390x/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1


