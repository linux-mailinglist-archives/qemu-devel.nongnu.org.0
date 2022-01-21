Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C7496681
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:43:23 +0100 (CET)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0kl-0002pn-1I
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB0Z3-0005Qu-Fs
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:17 -0500
Received: from [2607:f8b0:4864:20::32f] (port=41732
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB0Yz-00032A-Az
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:15 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso13194396otj.8
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 12:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3E5T1VQZ1y2cOpTFR+QSucALBSqalIPwzErmKXLL174=;
 b=DcltQbVU4ZRW+D+L9SuZmEC+9Rczq2yHDwfcrCSAWQcKJ+v+OTu0OyskHBdbaEPcoe
 89/N79zrKd60DgReExFH5f2PeUqbDfSYZpFuQS8SPHavU1JrnaT++AmBlPN1dqL3Tnpe
 JoNyAIK/vLkTq8jeK1SEz2ZRfJAthhtd7NsIc+TwP+2dBYSWXWcInd+0TVFACVNNqQrU
 lTGoGgWZPwEc9sKSAFQUytpi9AYUW+7t83xjhF/nCcqCqR1oADHKIbPl9H2OAnbtYYxJ
 MkBwdymU6vwAbe77Pzw7dm55d0JLkUJ4C2Tx3GoIA1XXlck6b/86X+5A4i7NzXVES3c9
 vq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3E5T1VQZ1y2cOpTFR+QSucALBSqalIPwzErmKXLL174=;
 b=yI4SdY+0INWvnja8HADWsiLIfpoWj2k/+xUTnOk7u5F18vfKjj+r3qA8j8/kBmB1ND
 aSd/ZXC93VOU4lU8mIXUa0sTHy6MqfCRPKMSWJGbiL6E1eerevHE/Ya9QzQBG1H7f+ry
 W2P14gzlsyTm3syqOJsnBc/JTLFZ5Zro8hIAD9NJrE+kAXDTsxEL3jEdi8V8Z61X9TWx
 frVWaVe6O/9iXfBPoLXpT+fiWZ281RQldaJnmZuZwEq3Prc8HrRirUaCTMvYNPUe+0rR
 FhKg/HbIrzMGaUTgxG3ETIOEqfnKBQsJcPNe9B3/W8O3kmkSD2QzHZDk0WCUP5Oc5m4M
 gaKw==
X-Gm-Message-State: AOAM530Yu72GfPYfgXEda+rEyx08PNQoiZphBEtqwhYIq4YMtmxLCNAl
 WMI13MYNMRKYgzqJD+YcBOZriQlh0lk=
X-Google-Smtp-Source: ABdhPJyh58dbvGmSoc+VEqtijZ3OcqcACxqEXRxJ+nCkYWz0vsuYHO6PYjrDAxP1uxVudJ8fQU3U9A==
X-Received: by 2002:a9d:60b:: with SMTP id 11mr3916899otn.384.1642797007030;
 Fri, 21 Jan 2022 12:30:07 -0800 (PST)
Received: from rekt.ibmuc.com ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id ay14sm1908822oib.5.2022.01.21.12.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 12:30:06 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] some simplifications in hw/core/fw-path-provider.c
Date: Fri, 21 Jan 2022 17:29:50 -0300
Message-Id: <20220121202952.24763-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: eduardo@habkost.net, pbonzini@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These are somes simplifications I found interesting to make while I was
investigating Gitlab #720.

It isn't clear in the MAINTAINERS file who is responsible for this file,
so I'm ccing the QOM maintainers since it's the closest match.


Daniel Henrique Barboza (2):
  hw/core/fw-path-provider: turn fw_path_provider_get_dev_path() static
  hw/core/fw-path-provider.c: open code fw_path_provider_get_dev_path()

 hw/core/fw-path-provider.c    | 14 +++-----------
 include/hw/fw-path-provider.h |  2 --
 2 files changed, 3 insertions(+), 13 deletions(-)

-- 
2.34.1


