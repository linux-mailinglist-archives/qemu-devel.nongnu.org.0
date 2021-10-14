Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9F42DFAF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:51:43 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3xG-0007jx-SP
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cM-0003uK-Vv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:07 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cJ-0000nY-QE
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:04 -0400
Received: by mail-ed1-x536.google.com with SMTP id y30so9624311edi.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/1uOyLYgtnVUV173Bs2NRWW3tMeXyLbby9vcQkuvwxs=;
 b=JQg6pEaWkAIPLBaDCS7INMo1jiZwq4Y2RjTSOVCuUhQX8tTtkahN+imLITwkSoM7q2
 ch+74VRR6KUfQxqijAfu40Qd19wQhWKlGz62QZgCSQ6yxXWe8zPnP0dlzL1058Bo9juc
 0t27FGnxYEBDBZO6+cevn2vOr7xesT3ztJsOsDsrroyO4nba1rYufj49FReRnV5E6tQI
 i0Pla/fAWNiNergyZZ79uehIt+R3UHouUKlEYHnpd86Fb/dlzTPPQB2Xtt4rIeb7sa6R
 7bTYToAEkdhUxMpycTJTkRyPokmVutElhuPnnAdJUVqdNScrG3h24ZgI6n4NnCe8pbsp
 kq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/1uOyLYgtnVUV173Bs2NRWW3tMeXyLbby9vcQkuvwxs=;
 b=LvUwRPhupziha0VgSGGfZ5G4oVlF8G8EUe0l2iLx25r5K0DuCWNTuJmWnPHJnPxbGD
 +W0yDpfVnvG/mYRh71mTt3CpAALZ8IPUUH+u8pol6ijtGVWByXZc32nW0vBLajS3D0E1
 Wos8wygUHqaM3V8ZlxSqASLbp/UAYHaYjZjtjNyH4qdNmGPwTCor8pS3CEmK3K7R/3fz
 kkVkexvRsR8tH+6bbJKj0nRcRXrMMBLweAM/NjuOPOxlunWdewgUTjLzi5s2wL68bGQs
 6btCheB53jxESvWOD2kguaRolWW9yLTsaIhTXWNPjRFrQBOHR0WZoVa5VCO+Ocfq+o5Y
 O0jQ==
X-Gm-Message-State: AOAM533oG8dpOtWIMazl4smfr0Mu8TuvrKnH3SGEDkBmUmrK781f6tBD
 JBQhMEiyBvXYtZLwZpRw6RAEVeG/Img=
X-Google-Smtp-Source: ABdhPJyJPpW6AbF+610hMQWIHpvmIE5j9gK9LbSxkBFmvnNEDyMRl/YpZIy/FyIUm3SfcuWi2x3Ljg==
X-Received: by 2002:a17:906:ae54:: with SMTP id
 lf20mr4905086ejb.195.1634229000352; 
 Thu, 14 Oct 2021 09:30:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:30:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] configure: remove deprecated --{enable,
 disable}-git-update
Date: Thu, 14 Oct 2021 18:29:34 +0200
Message-Id: <20211014162938.430211-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The options were deprecated in 6.0.  That said, we do not really have a
formal deprecation cycle for build-time changes, since they do not affect
users.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/configure b/configure
index 7c58c7c28d..b12b5f26b0 100755
--- a/configure
+++ b/configure
@@ -1483,14 +1483,6 @@ for opt do
   ;;
   --with-git=*) git="$optarg"
   ;;
-  --enable-git-update)
-      git_submodules_action="update"
-      echo "--enable-git-update deprecated, use --with-git-submodules=update"
-  ;;
-  --disable-git-update)
-      git_submodules_action="validate"
-      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
-  ;;
   --with-git-submodules=*)
       git_submodules_action="$optarg"
   ;;
-- 
2.31.1



