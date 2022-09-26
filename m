Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D835EA82B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:17:32 +0200 (CEST)
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocovL-0004Yu-7B
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR4-0004s4-0l
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR1-00070C-U0
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id r7so10344969wrm.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=HZvusaZqQ4b+KyL2XGuP1ENPEdoDwsyrKXlYCA1hJi0=;
 b=OpIAnYgTfho9E3HWR8G12Jj3yhkn+h//KA6WDaGJchUh3b1y9cyzGHLneD5iw+pIpV
 LIMCiJRNOHt2MEw5btHxbHutp9b1tFFZkYmjTsXao4b9vVabZaTZskVHxEz+en5Fp2DG
 5f20JI280IqHZXMEhB3arSwbN0yS0RnMGVQR+PFQmkclwEhFJkkMSNXmZluiIufyGfhS
 vFYusMu8zaaM43h6UKA++WNQzeW+bz74WHCxe+SeyOsEdZP4pzgcyNjRwxZacmStwKoF
 lie/mICajclh5zYnaKv5B8Ss+Ut/57uf1lWLX0rIqBPRPXZ3LTCdEB6VxNhBYMWnAWyP
 GUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HZvusaZqQ4b+KyL2XGuP1ENPEdoDwsyrKXlYCA1hJi0=;
 b=JQHaWVEJORwRlhvuK70THUPNXhOrBIKD6Rf2FBdpDrT0/eoZBGRV566+9LC7nrgcXQ
 Czi6G+TrF6AhUzIboyd90cY7zoy/Q4ryBRClkMTJ0Fp9WhcpF1vXm7dCMGqjTZLmX/pK
 YAYyXn0WX26TMTwZwBOuPBPJJ0aPnjiZpl9Qqh94YJ4+R8Nt+F961d9tT7SHaLjS+/18
 ZnmjLTHDVUJMQ0XLoQFtczgRtk6rxQF32MzQWDejkl2Svf1Gn/1KsGigsYUG7cfWbs+l
 ga65Y6TwAhzfqHXBzyowjOiDFC0iu4HdaPqtfSGN/5S6aCXkoYol23+5Fi2UPrq5BbZ/
 i7bw==
X-Gm-Message-State: ACrzQf31aGi9iH/e4OZPP39AuL74I8Y1MxhHK7TfvOFtL9kd32bW51YF
 1IVadfE4oUmGjNttI1c+e+IqIg==
X-Google-Smtp-Source: AMsMyM5D0xc794x4XEERumgHtD28zbzQERp5RC3PtI2WOQr4LyTeE23X8w7taOUYfkDGttmjscYARw==
X-Received: by 2002:adf:f3d2:0:b0:22a:e5d2:5c with SMTP id
 g18-20020adff3d2000000b0022ae5d2005cmr13914692wrp.131.1664199970280; 
 Mon, 26 Sep 2022 06:46:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003b47575d304sm13091412wmj.32.2022.09.26.06.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19C4A1FFB7;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/7] contrib/gitdm updates
Date: Mon, 26 Sep 2022 14:46:02 +0100
Message-Id: <20220926134609.3301945-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

Hi,

As we approach the end of the financial year (for some) managers like
to see what has been achieved in cold hard stats. This years updates
to the gitdm mapping include new companies, academic institutions as
well as guessing who is an individual contributor.

As per usual I won't merge any given gitdm commit without an explicit
ack from the appropriate domain indicating this is the right mapping.

Could the appropriate individuals please review.

Alex Bennée (7):
  contrib/gitdm: add Simon to individual contributors
  contrib/gitdm: add mapping for Loongson Technology
  contrib/gitdm: add Paul to individual contributors
  contrib/gitdm: add WANG Xuerui to individual contributers
  contrib/gitdm: add ISCAS to the academics group
  contrib/gitdm: add Université Grenoble Alpes
  contrib/gitdm: add China Telecom to the domain map

 contrib/gitdm/domain-map            | 2 ++
 contrib/gitdm/group-map-academics   | 6 ++++++
 contrib/gitdm/group-map-individuals | 3 +++
 3 files changed, 11 insertions(+)

-- 
2.34.1


