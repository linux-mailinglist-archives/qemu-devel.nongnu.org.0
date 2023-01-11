Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA58665288
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 04:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFSDl-0006uV-RR; Tue, 10 Jan 2023 22:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFSDj-0006uI-Re
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:56:11 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFSDh-0003wE-3i
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:56:10 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id l18so9138537qvt.13
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 19:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i0ZxiGPLN4infqMKa/3EEkm9fKo7yaQtBzq8f1mULTk=;
 b=WN/Q4prvmGUZ95GUK9Ar7SMAQmcUVP5kr0Zh/+aq0GV7kzaoezX2ybpMfHWPWAVbEd
 p3EkHOCkfxaasovssmbowqgpsoQwUnjS3I30XkXlETUs3XMG00WJ73vKbgfBCeq80WtH
 xdVXW2nGvwnBYKeUlSXeCY10LytT8WQg7s9T1AuYox/GoPDgWQo1dogBv/qHve8TrqyA
 XZIo9d34zVSk8PUqjZPLQiapo7Wfrbk/ottCCXCSgC3NG8vvxlpY6YjyPYoRJbs07gMb
 17VN5+8gKysQVCvl240hIavQPEPP0WyPiAut52/RF6c/H7B9FpxiJi5JuevREK/7LiTO
 clAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0ZxiGPLN4infqMKa/3EEkm9fKo7yaQtBzq8f1mULTk=;
 b=jtHkVS3SBWbYmN7WdXcNI0l5oCPo4kkBDx9Cm2SvO6XAVMmWUFo5ZuWEvv4na8yCwg
 5SGIILCGPGpKiFStC3PB9qHqsfxWUb4+zUWY+LW4o7SKpXlhiMssQ3ZQSKCI7+/4yQUB
 PsPmdtkfkdR44HZnGFVju2PSXFJeemMbO/dMsAwVq5F4vxZ/HW2EHZAfL4u9xN/VipDf
 H6LZjsr2tUgnj2GMJ7UVamMM8irl+mqvARyrAXHprhCwwNHjJlceTHdyT0OMRXNtqmCU
 H3IFRPPgtvCQNOlIa7tq09ZMpB3FeonuRLSPu871yhMDDzjxyIb1wWb3XuqaWIgIQXsV
 +uEw==
X-Gm-Message-State: AFqh2koO/DFuuDDU26XZ8ZtrhUqNKlLt50KxYuQfWVKJRdP+UKu00Wi9
 Xr5oXwrDqZ1YrR5o84UskXJR/vUU9xBYm4AIo7A=
X-Google-Smtp-Source: AMrXdXsAczJAB7r1RUtdOarFaoivAZf7oMsPXZepf9OQ/ISrNuxbwHM/ye0lb0qq7FHUgvO27aCJig==
X-Received: by 2002:a05:6214:5244:b0:531:7d95:bb7 with SMTP id
 kf4-20020a056214524400b005317d950bb7mr82572034qvb.8.1673409367314; 
 Tue, 10 Jan 2023 19:56:07 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 l16-20020a37f910000000b00704df12317esm8344306qkj.24.2023.01.10.19.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 19:56:06 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 0/2] fix for #285
Date: Tue, 10 Jan 2023 22:55:34 -0500
Message-Id: <20230111035536.309885-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=cota@braap.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Context:
  https://gitlab.com/qemu-project/qemu/-/issues/285

So far the only fix that we have had posted on the list is
  https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg00391.html
by Daniel. The approach that I'm following here should have
the same outcome, except that it doesn't change the guest's
environment. The approach is to import GTree (sans GSlice)
into QEMU, and use that for TCG.

Daniel: what is the testing that you're using? Could you test
these patches to confirm they fix the issue?

Regarding performance, it looks like GSlice does buy us
something, which might explain why GLib's maintainers don't
want to change it. But I'd put correctness over performance
any day. Furthermore, we could use an alternative tree
implementation; I've tried CCAN's AVL and the performance impact
is lower (I believe due to faster traversals), although I'm
going with a straight import of GTree here to keep the API
identical (and also avoid any potential correctness concerns).

Thanks,
		Emilio



