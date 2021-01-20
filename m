Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313E2FCE86
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:57:10 +0100 (CET)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BAi-0005vL-TX
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2B7z-0004Y4-Mv; Wed, 20 Jan 2021 05:54:19 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:40503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2B7y-0001RI-6A; Wed, 20 Jan 2021 05:54:19 -0500
Received: by mail-qk1-x729.google.com with SMTP id z11so24850880qkj.7;
 Wed, 20 Jan 2021 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95zT68R9kHzjFQ18LRWA6dT/6xiWY8MHzMz6YnQrnyU=;
 b=BhNbgMOOOehgVLa5NngQ3ggBU0Z8wTlrXOXTckkW7Ury03hTVMo6uAjFoE3bb1R5Y+
 SPSbKijR5oVYNbOKJTZTVo/CyY9Lx00uAx3/rIW/AlsJJ7rzuStkv3HPBvQ82ou9lR1h
 5oK59T53Etn8BQkqJN9/E6BKZpZH4b5OR2qizvkCZRqdpAi0B/uswzcpU5zDA2WajWmF
 rulYmZSOu0YNqK5Uv9oVwsivTLv/wpSaTfKwoSP+KtQmFEIpWdO0mqwT/Tp9IrZvqgqf
 +eh2kMtJEcZ3oIxF76pJhB24scvOGjefRmboqje2oh0Pl6kE+mQk+71pWNyLgSajbCVu
 MQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95zT68R9kHzjFQ18LRWA6dT/6xiWY8MHzMz6YnQrnyU=;
 b=iFMyclzRH1ea7Gsyuot7sFmDCHWRxLGLuLdPlOI1sV2MICRWl42IC+4npNoW6/0XO3
 f43F+JJWfWg9925oxgFbbZW/gSoCUmdEvrH3g9Pvsrj5mF9XLOXwb6BCE8ng9fUbvqyk
 E/tTe6kqL3Wrr3BdICKdNnldrzSZMsw1dGk8cKU6ERhTts2zdKwo4iWZd4Tk8Ecq0Xsg
 nwPxAobzwrZkEfeJTHdlPcBA6qLW7DwHbV/Xz4WnKFE9hhIvWleDodw8P5ib7o8/bUvI
 4CMqHaT/RBjX3X2bBbbbyHiIAGKCMWW6Pqfr65Ny5NfTVSLSWjIWIXzq/Z+MBw8gA4iv
 qykw==
X-Gm-Message-State: AOAM530RSs8P6jsR3TLDbNXwsBHkzIE34pOd1TqaDNHLGfB1YoSyVo9S
 XPbLRH79yOFdbdH1f+DuSa7blesai0A=
X-Google-Smtp-Source: ABdhPJzf8A8ZyIUTGb92SUwgl76ddCWPPj/CsLfMgkuOomlsLegEPlZks0BetOAYD6mWcLWQcXpnwg==
X-Received: by 2002:a05:620a:204f:: with SMTP id
 d15mr5837564qka.14.1611140056688; 
 Wed, 20 Jan 2021 02:54:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id e12sm1045079qka.82.2021.01.20.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 02:54:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] spapr_caps.c: check user input before warning about
 TCG only caps
Date: Wed, 20 Jan 2021 07:54:05 -0300
Message-Id: <20210120105406.163074-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes from v1:
- check command line input to decide if the warning will be shown
  instead of setting capabilities based on running with TCG or not.
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04890.html


Daniel Henrique Barboza (1):
  spapr_caps.c: check user input before warning about TCG only caps

 hw/ppc/spapr_caps.c | 47 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

-- 
2.26.2


