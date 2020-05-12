Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EC1CF756
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 16:37:54 +0200 (CEST)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYW2b-0003gK-5L
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 10:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jYW1f-0002pS-Au
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:36:55 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jYW1d-0001Ho-Pp
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:36:54 -0400
Received: by mail-lj1-x244.google.com with SMTP id d21so6231699ljg.9
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKcm2/E/aUigIdXU7XUWChygV7RSbDYvirMtU2nELHk=;
 b=I14Ov6wHt7yYOlW8MTBx5WfiOVUf462b45bCpk/ZRoiYVGnLWsdj7+d7tu/gIy+zDk
 KFWtIErWeaz87wmNGNSKEx79JvTxz9BGk7hx/LGehuRD3xF7QwU5l1kys1wz5BU1cd5o
 YbQ+H/gPHutxlsGD0eSzvHR9q5+X2pgml1g0i37+xpwSdYLLWWZ7j/bGfwzduNHuNfnf
 UQfeQg4PWHc5E3A2AGqKZcEj1sltg2QtUaml7UlUpBj7DygIEPOKKfoFOljA3LTUYXWP
 MNb0cIY45TIO6eh3LQA9ZHCjMvYCZXlEIFXWvPEvsC6a24Vpe7xN2FZMT+eyEg6m5eJk
 mvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKcm2/E/aUigIdXU7XUWChygV7RSbDYvirMtU2nELHk=;
 b=jS3dClndH5745/gPUn/LkkOGsdFUqw6otPmifKXyGk2g98NxhrBXw432uC44EfacSu
 c6gmOVtDX4noRDy7YhE6670NkSjyNoQXjECTVjIX0lATZOseqh7dLcBWPSy1JMcaqRZY
 J7N8OMvYk7AW2AyOJc1WKy6GTLz1wfVO6ocWTiulrAOiXd2hCHPFpHiR1fuKV7MI8Ny5
 lme+pHem9wrxemEAJAcDzHgaH5wEF5oLt85QfQxH9mFVwMefQTNiyC4jR0MhHilAYOQ9
 HEeuNml6PC5zCjLHHPxsDJho6vfmhAPQJXDskpRSly9V9OETWWnWVG+dKuydXqCfZWLC
 TRBg==
X-Gm-Message-State: AOAM533cQYWw83jeNLbmrN1DjDfV+oacFRTn+mJLCSzY+dOEaYSSxSJG
 ViqpPg/r2hw++oJIub5B+vBAtd0fNhc=
X-Google-Smtp-Source: ABdhPJyjLPqWNilK/RvGWuR4uGWLSmv1j8xYrS3pJE5pTtw9lshWIKDnoTOVl+iw6Xrgs/ou2efEOQ==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr14006015ljg.291.1589294211188; 
 Tue, 12 May 2020 07:36:51 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id i124sm12678146lji.95.2020.05.12.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 07:36:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] target/microblaze: Fix mfs from EDR
Date: Tue, 12 May 2020 16:36:48 +0200
Message-Id: <20200512143649.21655-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 tong.ho@xilinx.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

We're missing mfs from EDR support, this adds it.
Showed up in Xilinx Versal PLM code.

Cheers,
Edgar

Tong Ho (1):
  target/microblaze: Add MFS Rd,EDR translation

 target/microblaze/translate.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.20.1


