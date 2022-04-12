Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE24FE71C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 19:33:41 +0200 (CEST)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neKOa-00010f-EZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 13:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neKNO-0000Kk-4m
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 13:32:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neKNM-0000Sp-DH
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 13:32:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t1so11055457wra.4
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OS4ATiDhdwKi1M/h6Ux1s2mJPlEbtELUe05mTk1YAIk=;
 b=WcIxlll9RdomjKMcuIfQk8Oas2oVDFOqJ35ioTjPP1eJTA+fYAjxYR2RiwHPlDY6QL
 gTgzAlTrwfChoA8YopfMe3ue0IVRIl3LhFZVLIzn6vwMRk1OvwqItjoH/6GFTDMrEBJd
 KS3CDH9oF5id/JA89mLzsfBbQiicnitHV4ujCABkzu0DZ/2irWoWdFVjWS56AWziBuwq
 iLVjJiKKfoGUI2XQqQ3/ZaSji4jQlmj9LO2oq6qTH6BlOIbE+LcclqbFMzTayeTw5fv4
 koqw/G+Mozmkx02tRS1s14aT2ewsn0g24kejdRfz01ETM5kZ3j6pRSofBXWJCiSsrCul
 MzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OS4ATiDhdwKi1M/h6Ux1s2mJPlEbtELUe05mTk1YAIk=;
 b=hh7keT13QR4d7/bsJSaRTOtH5hxiEiAHuaK35vk8Jg3v/JzX6AAR2XwjEfP8EY1fXt
 NWbZPlLjZrWdXIZlgvCJ+GGX9/ZREy4nKxi2OqW6NfBgQT8fgR4dDxS1lVbTUO6TfwBI
 px1ARaONm6QuH6cQB8jTADxrVBAthXwg9hdkCWL7v0lMd7NN0XLbvZXlluPJIvGzrYXj
 QXCes49EEKmMFeuPPuv9SLisaQQ69SqnMF1SV6rzEJWI7b1oACyBsleuwBDVbrMrVA1J
 8/GQCM1J/5qMVRfd/b/QcBOAm3YQRlB43EgzgSepbYhnHHkGMnzAUeJfI4tdQOU7AaSF
 P2uw==
X-Gm-Message-State: AOAM5311KxjAGOylr0XB6GTyghvRIa0ZybJvreqkXh+14lLNSd5pc74t
 5arHzfKVkMWHRbEbRf88TGfSik+Qww4YgA==
X-Google-Smtp-Source: ABdhPJyi3qtDO3ouMz7ckEojJE/AB4T4pk+pGoPcoEGkIFaTo1zGS6/m11l6iJrI5Ev1Ks9yPGWreg==
X-Received: by 2002:a5d:59af:0:b0:206:1cb0:599a with SMTP id
 p15-20020a5d59af000000b002061cb0599amr30112216wrr.350.1649784742541; 
 Tue, 12 Apr 2022 10:32:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a056000168f00b002057a9f9f5csm35157120wrd.31.2022.04.12.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 10:32:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 0/8] nbd: actually make s->state thread-safe
Date: Tue, 12 Apr 2022 19:32:08 +0200
Message-Id: <20220412173216.308065-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main point of this series is patch 6, which removes the dubious and
probably wrong use of atomics in block/nbd.c.  This in turn is enabled
mostly by the cleanups in patches 3-5.  Together, they introduce a
QemuMutex that synchronizes the NBD client coroutines, the reconnect_delay
timer and nbd_cancel_in_flight() as well.

The fixes happen to remove an incorrect use of qemu_co_queue_restart_all
and qemu_co_enter_next on the s->free_sema CoQueue, which was not guarded
by s->send_mutex.

The rest is bugfixes, simplifying the code a bit, and extra documentation.

Paolo Bonzini (8):
  nbd: actually implement reply_possible safeguard
  nbd: mark more coroutine_fns
  nbd: remove peppering of nbd_client_connected
  nbd: keep send_mutex/free_sema handling outside
    nbd_co_do_establish_connection
  nbd: use a QemuMutex to synchronize reconnection with coroutines
  nbd: move s->state under requests_lock
  nbd: take receive_mutex when reading requests[].receiving
  nbd: document what is protected by the CoMutexes

 block/coroutines.h |   4 +-
 block/nbd.c        | 303 +++++++++++++++++++++++----------------------
 2 files changed, 157 insertions(+), 150 deletions(-)

-- 
2.35.1


