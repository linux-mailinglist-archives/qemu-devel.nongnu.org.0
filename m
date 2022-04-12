Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365C4FE90A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:46:06 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMSj-0000hE-1y
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMOx-0006LX-1O
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMOu-0008Bh-UM
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so2261298wms.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQMr5I9v2fSqcbuJWyn6BXe3TJyIXCvMFsRdiKECaFs=;
 b=Ufrlr1Qk95jetuH3tJtN24+w9WfMgWwykeU/gbvCPBdh+bmTS94kukLf+Y+gVs+zpX
 N+OECPk7Nm3do3359wZu9P0xZZawsTy71Nyl+VgnAaH98f8cJ75Fi9qw7JrbRREPV+dS
 +MXDhuarQv3S9YZmVLqBZrF5VofwqywEEZFiZnCZ74dUYZyVhQfEcMgIj8IESyV1c78i
 /NgGbKv2KQrnXUaKhc7hupZZZ2kKB5i74xfRAR5mx+sFYhV74mBJAFIv5KXfhK/bLTPL
 +dZCWmolMyEWTd1NKCc//pPmmL81rBjEvwpQ6jv9y/Ru31hyTyK096xJI+AFPc5DyuiG
 UWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iQMr5I9v2fSqcbuJWyn6BXe3TJyIXCvMFsRdiKECaFs=;
 b=JmBOwZFNlkRXJVxtkSJgV+S/SUUDYAbeO7blqPgBesyVkHeB1ymyXmvXCiA+OJIMfv
 o3HkDefCc/87/6dNTdgls8UVxEB9nTQRMKs4TUA/arO9/XrKgtNn9cyjc2XQlKONb5hY
 ZpTLF1dpmwWZMuJW3zZknZvmXb/znh7l16O5/bcKKJ3Mfh2KLB0UKn7c6bK4RH+jnb6J
 brUex8/2zXIkgpV8PpTuyp0q0qKL/ckhL+PzQFxxTR2fKt86IEu5MsEyvWmHb8/EmF9t
 vjjXLPk0LNGGI18/JNuOWI6NFCH8rp5l8Cvg/6kf6ZJgtIlwjmm235HTA1ZVRlLYFNNf
 xu/Q==
X-Gm-Message-State: AOAM5328eEPX9OcCHtR9ZDxb4k8vKyayBoK4ID30S6+uD2Ba1W/Ym5YF
 CsDjORNg5cFxj4WmFRZyAwJmcxcdwNIAsA==
X-Google-Smtp-Source: ABdhPJw2uLc4bcEDcmCTby0UAcslEBVyBEnbfnXUiGActwVgLLW/WCRIJ/IVd9EWmmUVehwvMrInvw==
X-Received: by 2002:a05:600c:1548:b0:38e:b434:bda5 with SMTP id
 f8-20020a05600c154800b0038eb434bda5mr5615245wmg.166.1649792527136; 
 Tue, 12 Apr 2022 12:42:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 0/8] nbd: actually make s->state thread-safe
Date: Tue, 12 Apr 2022 21:41:56 +0200
Message-Id: <20220412194204.350889-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
 block/nbd.c        | 295 +++++++++++++++++++++++----------------------
 2 files changed, 154 insertions(+), 145 deletions(-)

-- 
2.35.1


