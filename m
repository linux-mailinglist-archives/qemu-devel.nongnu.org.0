Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2384D365CA5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:50:55 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYseL-0003EE-Lf
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbA-0001dd-0F
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:36 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsb3-0003Kv-Jt
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:35 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h4so29099331wrt.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyrRauPqvVYGTKn4Nlpl/1wotbpj1Srwu/bwsVpMorE=;
 b=D3UKcaJApNFtzNVp1bMLuybgE1SN/ver3/fJnFIEu4sBOvW3ialK4o8oa6C1U8bdJp
 /Fa3+Q0HxTQXeqkhOBAhTpaScojoKVLHMRRpsumJ9Ev+5NidK5NFRts/eMya5itpHsPU
 fM4QauHNNKMsq/5KrE/DnzsFhzq+G8oNa27avbErZ82b/SMyn3pPsUwR48sE08E4Q8tS
 MZnAUg9cswlXtGL3pK6oBKVkpOCviheVlJXH8ilN2eWraqYNCczUToue2D2H4bXuefWN
 kvDoR4wDjn63MZNX14uIQVmZAsS52rlz1CxK/2RnWdnvXA4HZjTrc8QOiF/qigrgRm8A
 5B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyrRauPqvVYGTKn4Nlpl/1wotbpj1Srwu/bwsVpMorE=;
 b=YVpRPyRcwc7g5yK1cYCZQ5qp5xS3hAAR1dKFbPEVlkd1mHKmNMgdjFNkP7p8dCXwm/
 4M4PahbpLJd645wg1yQ+zFjtJwGpwQfhGi3lMTP5JHckQMaQ+9o0fzTu5JZgIh2HA8+8
 aithy8alW/xpP8dLxad9GxHEBAtxgIt7vNyspVFzGYEzzXo93a9kMVwb9YTkbLNhYZYc
 SmR0KGoL9Pz5MOIGG/NxkI/iPznaSC7mIG1WXsmIlwVZjuF+URLRbw8/WjDgV51T25hp
 pwMu42iH0vRO3nKhFuxa1qtAx9yDKdhKiYaw2/gJviz0bjWSwrPbKEZ7Hsj8n/BawN7h
 A3Ng==
X-Gm-Message-State: AOAM532+NndVTsVgOPEeZH7ReNjMJRnNqT7s3KZwHcNT7mDmhVwQu+RD
 dkNYD66kQkVDDXpaGaKIkrdtqXiXrA0=
X-Google-Smtp-Source: ABdhPJwcSG8mPvtWLIGPpsLIVgysz90j9i45iiDGGk9vSSPSUntd6TcyYqvVF4UYftfDBnqXHRIvUA==
X-Received: by 2002:adf:a302:: with SMTP id c2mr21453954wrb.212.1618933647196; 
 Tue, 20 Apr 2021 08:47:27 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:26 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] virtiofsd: Changed various allocations to GLib
 functions
Date: Tue, 20 Apr 2021 17:46:35 +0200
Message-Id: <20210420154643.58439-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced allocations done using malloc(), calloc(), and realloc()
to their equivalent functions in GLib.

Memory that is allocated locally and freed when the function exits
are annotated g_autofree so that the deallocation is automatically
handled. Subsequently, I could remove a bunch of free() calls.

Also, tried to keep the semantics of the code as is, but when the
allocation is a small one, or a crucial one, I replaced the
NULL-checking mechanisms with glib's functions that crash on error.

This is related to a patch that I had submitted as a part of a
previous series. The previous patch had some errors. Also, I thought
that it's better to split the patch into smaller pieces.

Mahmoud Mandour (7):
  virtiofsd: Changed allocations of fuse_req to GLib functions
  virtiofds: Changed allocations of iovec to GLib's functions
  virtiofsd: Changed allocations of fuse_session to GLib's functions
  virtiofsd: Changed allocation of lo_map_elems to GLib's functions
  virtiofsd: Changed allocations of fv_VuDev & its internals to GLib
    functions
  virtiofsd/passthrough_ll.c: Changed local allocations to GLib
    functions
  virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib

 tools/virtiofsd/fuse_lowlevel.c  | 31 ++++++++++++-----------------
 tools/virtiofsd/fuse_virtio.c    | 34 +++++++++++---------------------
 tools/virtiofsd/passthrough_ll.c | 21 ++++++++------------
 3 files changed, 32 insertions(+), 54 deletions(-)

-- 
2.25.1


