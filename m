Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B581B42E97A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:57:11 +0200 (CEST)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbH9S-00008Q-OL
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7X-0006IX-C8
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:55:11 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7S-0008Tn-Da
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:55:09 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso6628611pjb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKCJJwccUEvcdgbG1LfcoOeO+wP2JV9/kud3YWJqE8U=;
 b=U/3QeeRSGvDOVcKo18yR+/ReD+wAg9/kiBbZMRWgkppyTvZOQ+u5mqjproNvViS1tD
 pTwrVVX1sIDSfw1tcpp+3HpcuvMocIwSvixVI3llmbDbu/aNr9BOp0XnHrWCc/FmNZBX
 Sln78UyrA3JhDkZTKObMol67NO0dyhz2omW4uw9Wrd7663s4QDffBL5EkmYFoxMTBf4p
 CVHl2aw7F8BPZgpTCB8xMFepWtI5LYvpLtqPFYLKwPgfJmZc3E+Fuy3hxW65trDXHtN3
 z1u/VJCjRxUU3kaYuW4ZPLaUgq5u1fbQItkc2uv9L/3ZxDbNEufcG+l9hEqOQrExAqbZ
 8XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKCJJwccUEvcdgbG1LfcoOeO+wP2JV9/kud3YWJqE8U=;
 b=7LZN42aO2BEho3KysrECmwwfLm28oTLbWpwB8H831rKEnNf+aQthwVddul2JVzMW8e
 0FbJbczwikRZNA44h/uc5LNq51G939AyvJFzot5yYvBWxDckLCWm4pOFZdjWGQC9Fsoj
 h8aisWv0F84FxzPZuZXnCVxq+0PeFOwBOuO30UKvYDZ9S5Gif8igcluPGhsHSCanYmfz
 DSPaN/gsAR86MbXjWwNfpSKpxhMN9CAEalJ8+kYRxTEIeRPMjKZ5VnBmHWhB62np/1oR
 l7bEu18qE+6q+nlzz5abeThPklYM6M+/Q7/4FyaPquoxMKdXrpql1Tq1kuZDzVT+hBlT
 mp5Q==
X-Gm-Message-State: AOAM532i4+V9TlCWtVGUw10Kctb6HWr+IYRo7u3nqhQqXQExPyfiTKgG
 b1LkoeS3I+jaZBi/vU5nF66cpt3M6nlQOWW+
X-Google-Smtp-Source: ABdhPJyfRYd3J9LtWmBSDVCl5+0kPkjqaYGPKc09GSRmTvi2s9D6RaEfxNZaQLO1m3YCvwzfo4YgZw==
X-Received: by 2002:a17:90a:5502:: with SMTP id
 b2mr26300431pji.154.1634280904824; 
 Thu, 14 Oct 2021 23:55:04 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id d6sm4105059pfa.39.2021.10.14.23.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:55:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH RESEND v3 0/2] add APIs to handle alternative sNaN propagation
 for fmax/fmin
Date: Fri, 15 Oct 2021 14:54:55 +0800
Message-Id: <20211015065500.3850513-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag are removed
and replaced with minimum, minimumNumber, maximum and maximumNumber.

minimumNumber/maximumNumber behavior for SNaN is changed to:
  * If both operands are NaNs, a QNaN is returned.
  * If either operand is a SNaN, an invalid operation exception is signaled,
    but unless both operands are NaNs, the SNaN is otherwise ignored and
    not converted to a QNaN.

This patchset add support of the above alternative sNaN propagation for
fmax/fmin, which is required by RISC-V floating-point v2.2.

Chih-Min Chao (2):
  softfloat: add APIs to handle alternative sNaN propagation for
    fmax/fmin
  target/riscv: change the api for single/double fmin/fmax

 fpu/softfloat-parts.c.inc | 19 +++++++++++++++++++
 fpu/softfloat.c           | 18 +++++++++++++-----
 include/fpu/softfloat.h   | 10 ++++++++++
 target/riscv/fpu_helper.c |  8 ++++----
 4 files changed, 46 insertions(+), 9 deletions(-)

--
2.25.1


