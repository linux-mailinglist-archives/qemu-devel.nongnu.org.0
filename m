Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9864EADA1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:48:36 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBGy-0004BQ-99
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:48:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZBEU-0001Q4-F7; Tue, 29 Mar 2022 08:46:00 -0400
Received: from [2607:f8b0:4864:20::32b] (port=33401
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZBES-0005Qe-TM; Tue, 29 Mar 2022 08:45:58 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso12720599otj.0; 
 Tue, 29 Mar 2022 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9VrC1NjKUV5/dnoTf3RuNmZalzrOB9vFvlL9G1iOqw=;
 b=FAheOW/VmL5LsOtLfh+dRAxifgagYG1ADU53qA6q0AIKxsvbE6qCMGitUDxCujYx0C
 hv/R6Egg9ysRwQJayjaK3xtJIP6s9y2dJskWHwjweSVH6jKQezl9ZS4z6C10Hz+LeKrn
 k5ygjuzgR3iesWkY4rwYEH7vLhldrMVwFTGK+A0FE40HuHWO1c7uqslWJgnzImt6bFx9
 bHN+jFHTxFOULFbyDk3Pt/+7iajBgifEMNJB0k0Yns1XWCJL30aTtcBB42QYApl35+le
 V7cIArEOmuhMOSxbwYXpg7NVYBE1BOXKXdleacGm7fGpljZQxx2hujaBTTyKDQvTWDg0
 nrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9VrC1NjKUV5/dnoTf3RuNmZalzrOB9vFvlL9G1iOqw=;
 b=24GIfmH/n0OtA9I7eov0geGQ1/zUCn84HmGHquvHkV1MU9ZGbASv7Vv2zxH/3KKtAP
 Ek2LpFoHaZRKrwaYueeapm+AgnO2CiQ+6gVILtSoOxzFz5qtGGuEOZmYqkZyh0IE9l4w
 IqJzggR5lLmSCVy7LdCRMbkN1dDRbzmPf5Bze9liQG2lapXOIWblBiGp2m1SVg0SMdLp
 2EOPaafW+JPqovB0pGEAJusAtlUGqjbDFt79BU5KS/IQhW+46KzXpHR46dh/7Lv1P5gL
 Idu1V1zE8NdtSZP46a3pzr+5hSIsAzeK09XpaHtUgW/1o6ZbbZ6rOISI8Dw/AwrmyYLY
 RwwQ==
X-Gm-Message-State: AOAM5332Nn4vXgKhRSXry45OMIJNZ+YdpP86Dl4ieXx3YCHBbcvg+Jg/
 KuU3y5NhZE62WncvWIm2rpXJ9Cn6BoA=
X-Google-Smtp-Source: ABdhPJxAOktRL/IhbKOfn1ohk5pcsIz03+kl52pQNchBFgjpU43qkVpPtE/7lXMmr33drnEIYG58pw==
X-Received: by 2002:a05:6830:1b73:b0:5b2:2d0f:226a with SMTP id
 d19-20020a0568301b7300b005b22d0f226amr1020548ote.296.1648557954674; 
 Tue, 29 Mar 2022 05:45:54 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 bm51-20020a0568081ab300b002da5c44e0bdsm8586630oib.28.2022.03.29.05.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 05:45:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] fix vcpu hotunplug leak in spapr_realize_vcpu
Date: Tue, 29 Mar 2022 09:45:44 -0300
Message-Id: <20220329124545.529145-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This second version squashes the two patches of v1 together, as
requested by David. 

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06552.html

Daniel Henrique Barboza (1):
  hw/ppc: free env->tb_env in spapr_unrealize_vcpu()

 hw/ppc/ppc.c            | 7 +++++++
 hw/ppc/spapr_cpu_core.c | 3 +++
 include/hw/ppc/ppc.h    | 1 +
 3 files changed, 11 insertions(+)

-- 
2.35.1


