Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BE0519008
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:23:38 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzzd-00029a-Fp
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nlymS-00018G-GF; Tue, 03 May 2022 16:05:56 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nlymQ-0008PR-8f; Tue, 03 May 2022 16:05:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2919150pjm.1; 
 Tue, 03 May 2022 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5yqTQ1Qvlp+E8L9mG3dxwcWSP7iC95R3l/V9CI6bPI=;
 b=qmiHHwYPeqUlNPcpoxpQNyXma17+GtWIn8nrZf8TwZbN2mWopiUokOSA9GKwo6ZPEW
 Ftrv53J55E7zXA1ldiCnv/XI0XX7vRzk445VO3oGHXh3IQ971GxnhJ97PIzddOU6nMeD
 2+Unr+8cIkgphwelVSL98UtI1KZjNsuQdYQVUT2ePKzJwx3ao7egCNfjNBAmRCoaWcVo
 RKr/Org0lh/q4OPWvru5bfgLP6sEoc1Mxr/YRPvTSEs6VvL416+nz+yfmkFgUJNDr87l
 ZVnBw3/3x/txifrRRYiOWXDjJMDjUEspRHEyWR/H+4TNAglMluyKkeDd5n/2yMk9Cxiw
 wFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5yqTQ1Qvlp+E8L9mG3dxwcWSP7iC95R3l/V9CI6bPI=;
 b=LLwVe3bzUe4BYdnic78mjtNWMP9CVMI8kB2cFD1FHnIQ3dmFNxboEAsHQxzdMkKa98
 Y3pbZn3DQ4y2os1JxLUql06PnkrfHEIFGFVoMteLMnq/2cc2pLPFV0NPuA4YesJ2IrSm
 r9Rs9v3jpFi7ELw6W2ZP+jjKPq+mtgyZQCc3wfibUESh3Gfi1OHhlXtH8090xQreWxd3
 NuJNYCJ3KlEHv4DLDPrSPigfbFyrEP7kqR1nd+1pPUBjYVnZgQHHq8NtZgSF0SES1nHx
 ZCQ8sBcMZPkCMN5Q9tuwKi/Qql+QTSjoESaRU4FKfPptLdhkz4X78fVvBIIjbtoi6cIi
 UTVg==
X-Gm-Message-State: AOAM5315cbhTd5l/wnNIWf4otdKzKzcZqkSTnBY5YDjmPW5yKfVRdjNM
 YatkpBaIkXWjlaH6fZaufVUbt+IYGJs=
X-Google-Smtp-Source: ABdhPJxqpJhsFN4apsiGHpEIA3By7nxFIX7D/RAPgeDBgFuagcDK3WNxWYoZzja+N9fBhR39Fyh3Yg==
X-Received: by 2002:a17:90b:4c88:b0:1dc:564c:87a2 with SMTP id
 my8-20020a17090b4c8800b001dc564c87a2mr6541644pjb.171.1651608350844; 
 Tue, 03 May 2022 13:05:50 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 q26-20020a63505a000000b003aa8b87feb5sm13670148pgl.0.2022.05.03.13.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:05:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] Upgrade mingw base packages
Date: Wed,  4 May 2022 04:05:22 +0800
Message-Id: <20220503200524.1868-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.36.0.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v1. upgrade both cirrus and gitlab-ci to the newest mingw base release

Yonggang Luo (2):
  cirrus/win32: upgrade mingw base packages
  gitlab-ci: Upgrade mingw base package.

 .cirrus.yml              | 2 +-
 .gitlab-ci.d/windows.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.36.0.windows.1


