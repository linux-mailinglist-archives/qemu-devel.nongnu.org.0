Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5523C4384
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 07:41:44 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ohM-0005BZ-0T
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 01:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m2oeY-00032b-JT
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 01:38:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m2oeU-0005H7-4X
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 01:38:49 -0400
Received: by mail-pg1-x52b.google.com with SMTP id w15so17100784pgk.13
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 22:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5G080JMg8K1o7oQD4V2MLyWbh9BISOSXQN1+G6PPxM=;
 b=KUjuugGQ89knHf4lHcbcmLucr8vwrqJa9eJlybbQdxL48xaAvJ86eUqqP7CHSsovxr
 42sHXG2+0osyQWqMk4Rbtnq315A3jpxK3F5m+cuL7ThxYsgZOih+8fFMzXmetMOFFU75
 pukRGaiCeUXEuD2KCsiK03gJ0dGRhwcO7fgDDlqIIbfHH5zvUJrT6TTC3DqoPBhvSD5x
 AX5xglSkD4MtZmj5no7izYQ6hMnOQsFD0fVopm/izyx6/FE4oZLQN3s6l2jwIo/lO7aH
 7NN3gvKxuTfnQQ0jMD4ccWePACbZLBfyQg7lPyhC7SiAfYggBJkKAvOdJ2uDsUmBzm21
 Du+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5G080JMg8K1o7oQD4V2MLyWbh9BISOSXQN1+G6PPxM=;
 b=bQlyU783KVKK5GLjlLKqkF9TSjdLUfOBKGBqczKml46t56Mb24OFFLGGUzCHcTwL47
 uMpOo3uk41lBBKYhN4ZHX9TuRfTrN03h4oQG+OL+DRFlmMcdFjP3RWCSPMudNWvVu+tF
 c8gTL9Fgd47d7FCY7SuBX+ZPZl8FWPSw/cqTwKJXeGr9Ok16EkDCRpnHaT6aROHecvx9
 Y0gSwihZCwZZkociy7UD1LtD/H82k61ZJzGUqc+sAmVdnNlkmghOHJC9YYBIPKu3D2FU
 MgKJ8tMQmfwcTJJyO6N2KO6cltfSpJGs9bk66kAtAq2YL0QATUs33I8v1qqHLtWYPwD8
 0AAA==
X-Gm-Message-State: AOAM5315u4ofYRW5aqsfE/6qOFLz/Pi3gkqQLhMO1P8ijlIw+0RantPc
 RKmXzCOvJP0skyNv9kXVZ0m7KT+TRie3/g==
X-Google-Smtp-Source: ABdhPJz8K2jVkvJICR3B3S5ogIaYj46doO8aQBO4gh+gLytJNeJC/DTqRdZ/wpFWvOLjvldZgkoBZw==
X-Received: by 2002:a63:5cb:: with SMTP id 194mr51064818pgf.146.1626068324222; 
 Sun, 11 Jul 2021 22:38:44 -0700 (PDT)
Received: from C02D383UML85.bytedance.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id 92sm20240766pjv.29.2021.07.11.22.38.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Jul 2021 22:38:42 -0700 (PDT)
From: Zhiyong Ye <yezhiyong@bytedance.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/1] block: Do not poll in bdrv_set_aio_context_ignore() when
 acquiring new_context
Date: Mon, 12 Jul 2021 13:38:30 +0800
Message-Id: <20210712053831.51722-1-yezhiyong@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Zhiyong Ye <yezhiyong@bytedance.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bdrv_set_aio_context_ignore() is called in the main loop to change
the AioContext onto the IO thread, the bdrv_drain_invoke_entry() never
gets to run and the IO thread hangs at co_schedule_bh_cb().

This is because the AioContext is occupied by the main thread after
being attached to the IO thread, and the main thread poll in
bdrv_drained_end() waiting for the IO request to be drained, but the IO
thread cannot acquire the AioContext, which leads to deadlock.

Zhiyong Ye (1):
  block: Do not poll in bdrv_set_aio_context_ignore() when acquiring new_context

 block.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.11.0


