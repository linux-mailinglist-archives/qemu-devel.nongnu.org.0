Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F3764A541
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m0k-00028a-Tt; Mon, 12 Dec 2022 11:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0U-00023o-5L
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:22 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0J-0002ho-IJ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:13 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so440419pjj.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FORGBh/Pt4RiKOxYB/KoZdU5uzlKmJzHzUWMhfSn3HY=;
 b=Y2OuRGm92zhn1ZOWW2IJl4+1qjBhEIgiKj5memJSHC7ZRO4N4dPW1Tlgys7Kyul03J
 jqGw54VqkhlVmXNVH0dZf+xw0OoPquflykwZM/Q9ofUbt4qZPj/SYZE50MUfqP5hoiEX
 LkwZK715+5ZFtVuKGIFM5Yp1aFzQeBCTDhOPJGKXNFG5qjoF++eeBUGFr9nd6ABpUlhV
 0GE6fUr5i7A2nccwIx0nUVk6P4kySqghznEmY/V/kb00qQw8E4EMArkgAHN6UllSBMzM
 PWfxb2jdU8Y77uZbRmCbj56ts4XEBPyO/noD6o0mHPl30kBShuDTwSHFT7WuizUd0hC7
 vrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FORGBh/Pt4RiKOxYB/KoZdU5uzlKmJzHzUWMhfSn3HY=;
 b=MakEjio2Cc2bIDBpWzlXHsnZph5Bt5g7baV6i67f8bMUdBSGT50sALtqCZA/xb+1gO
 FDlOrkKWh+y75ZsDOL/JY4KFftSVDPmnOdPNJ5UST699Kg2mDX6P+5Zl//lsWW239A+4
 YY3KUF5uJkVTGNzQDCnd+Mrxct4JXnS41zvvVLrbIPlTtWmRlSqqRdBCJH8Rlw+V5uIL
 qPpCUl7YFGhV6MqNTv7C6F3U9s3QABxK6VQrLMh2hRmshFgyFHFq5CTSGx0W165XnNzL
 ZLGU+wugnOKxu8SzT6jz+wuVF8XPwfbicFVBRWACQgT/PQ4b/mwcmzNZq+Nnr8snvtns
 UJVA==
X-Gm-Message-State: ANoB5pnMWtPdoTfirUvAjhYsolj9Q0w6m/o1Z9WGtKWsxQTGTrOXFNfI
 fUM5lD9pUKFlDcwl0dzHAHOqFKTcKyDqPvgC
X-Google-Smtp-Source: AA0mqf45zzxY55J25hxD7S8SjgRGjkwG4FFQXuwQJw07P4NW94RYzke++35cOvaB3EpRN7Rkl5Vurg==
X-Received: by 2002:a17:902:ced0:b0:18f:9b13:5fc0 with SMTP id
 d16-20020a170902ced000b0018f9b135fc0mr5577384plg.52.1670863805679; 
 Mon, 12 Dec 2022 08:50:05 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902ea9500b0018f69009f3esm3012125plb.284.2022.12.12.08.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 08:50:05 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, peterx@redhat.com,
 zhouyibo@bytedance.com
Subject: [RFC v2 0/3] migration: reduce time of loading non-iterable vmstate
Date: Tue, 13 Dec 2022 00:49:39 +0800
Message-Id: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi!

In this version:

- rebase to latest upstream.
- add sanity check to address_space_to_flatview().
- postpone the init of the vring cache until migration's loading completes. 

Please review, Chuang.

[v1]

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test results:
test vm info:
- 32 CPUs 128GB RAM
- 8 16-queue vhost-net device
- 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate
before		about 210 ms
after		about 40 ms


