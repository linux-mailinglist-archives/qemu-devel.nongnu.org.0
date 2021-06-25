Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E723B3BDE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 06:58:57 +0200 (CEST)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwdvc-0007fR-Jn
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 00:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lwduC-0006Ie-HF
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:57:28 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lwduB-0002BR-0f
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:57:28 -0400
Received: by mail-oi1-x22d.google.com with SMTP id h9so10067182oih.4
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKfJu+DnZgHrwe6clxbIevPbx17RUt6P9VMSMNnpV9Q=;
 b=v+NVQLnVGdJZ60spfWm7fwnBuBgHv9BVWfsBvpFQ8ZKiIIjTvbKm+HdGp/rFH4xnZn
 Hm0B7TrSnW59TAhiyAnN01R1JJlfyZ14iZO5OtMMyFng23nnE6dcmx8oH95/8UHkvYZ5
 asqpI12ayI1UCroeefLAZrEhe9ZhQzpEn0Bmsk8D4apo2fQ7wwqgg0Ao2OgEcZi6leNN
 tufk1GZ2kSEtyt1047g3ABSMQVYAXkmKN/46npa1l61qvyxHC0zL/9EyfWClHrHiNcqK
 T8xxAAxf0KDmPHYn6DyKwxi7NqJDwcrXKheGRuaysOvfWBMQy+CANCl39SeZpAbC5HDG
 Ai+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKfJu+DnZgHrwe6clxbIevPbx17RUt6P9VMSMNnpV9Q=;
 b=FIADq7aC8S1rScLP6UHPUZpsACtQwbQVvGfWO1GxEH8b1X+qVl/AzVfztLzWv5+Leo
 qFHIWE/FdQ7Sk8LqT+kIrLTeeNOSxYneIvKaSlgBYJq5mubVhsb1CWXy7ufrF9KgryIw
 KwPQ4gVjyYS2C4ItOlCVYhDvzO/2kcL+dDmB0W7kg/Q0RMXfWGX/MPJjOweHYh3Jh8AP
 XBfZlZiB6xIXs/Wqvctn0ArCDyiTy4Pt1yp3xDB5YzdaaIiO/r4apGbdkTJ8Q3eTBcyA
 iIVcsbKsrb54Dm/AW9h3jzLQKYQg62bwY3BcDTCNbF9/FDp1V/Q7sI6MPOZ3pHmBW3h6
 6B/A==
X-Gm-Message-State: AOAM532P1E9LnyJqEXlqn+NjasTDMwO9cqVR2SJbDTvt+vWOKeY30Otu
 toXmckmxXHoLlMQTPjVB1HBDmHQd/PLvNVV0
X-Google-Smtp-Source: ABdhPJyNL1hiu+UMSrJa/NIh4OjM9ok6lBNpXEDYb97Dk4Boc2d9dAHSTzwVysif7qP/wDsAThqeNA==
X-Received: by 2002:aca:f547:: with SMTP id t68mr10209250oih.75.1624597045305; 
 Thu, 24 Jun 2021 21:57:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p10sm1243157otf.45.2021.06.24.21.57.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Jun 2021 21:57:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Use correct trap number for *BSD
Date: Thu, 24 Jun 2021 22:57:06 -0600
Message-Id: <20210625045707.84534-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210625045707.84534-1-imp@bsdimp.com>
References: <20210625045707.84534-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22d;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, riku.voipio@iki.fi, richard.henderson@linaro.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a resend of a patch I sent back in March that was missing the proper
includes due to a rebasing mistake.

Warner Losh (1):
  tcg: Use correct trap number for page faults on *BSD systems

 accel/tcg/user-exec.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.22.1


