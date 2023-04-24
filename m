Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD26EC8D5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:26:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsSd-0000F5-Kp; Mon, 24 Apr 2023 05:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1pqsSO-0008Vc-2C; Mon, 24 Apr 2023 05:26:00 -0400
Received: from m126.mail.126.com ([220.181.12.28])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangliangzz@126.com>)
 id 1pqsSH-0005lR-Kd; Mon, 24 Apr 2023 05:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Message-ID:Subject:From:Date:Content-Type:
 Mime-Version; bh=5wDT3oePEPxFYxDjPIb6svVT1guIKF02/ImbhP3iGbk=;
 b=Luei5eFi5SElX3O8Cbm4ciI9lXUJjD3VD+nPziZiGin4OaptF83fVc55rltspR
 +9Pr59iX0qHdTTJ3dB3sPKO8MC7blL/RWodz62xOf5nGgcMTIr9qD6qKmpii/RN/
 4581ey8npKzwAOlkW9SmMlvH2GevM2tulc//BBioSTtsg=
Received: from localhost.localdomain (unknown [171.15.162.83])
 by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id _____wA3d08WS0Zku7xYBg--.4173S3; 
 Mon, 24 Apr 2023 17:25:44 +0800 (CST)
Message-ID: <da3556cf9715328206504fe040581c8ada8a4b0b.camel@126.com>
Subject: Re: [PATCH] block/monitor/block-hmp-cmds.c: Fix crash when execute
 hmp_commit
From: Wang Liang <wangliangzz@126.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, Wang Liang <wangliangzz@inspur.com>
Date: Mon, 24 Apr 2023 17:25:42 +0800
In-Reply-To: <3f6c1572-61e4-610a-1d1e-47b100cefb6c@redhat.com>
References: <20230423110254.35672-1-wangliangzz@126.com>
 <e56994f3-d906-89e3-3387-df65fb2c4b36@redhat.com>
 <3f6c1572-61e4-610a-1d1e-47b100cefb6c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wA3d08WS0Zku7xYBg--.4173S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF15ur18Gw1rCrWDAFW5KFg_yoWDCFc_uF
 4kZFZrW34UJFs7KanFyF45ZrWDGw4fKF45WrWUCr43Aas3XayxGFyDKr1ruw45Ga18tryS
 qrsYya1qkr9rCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbFoGJUUUUU==
X-Originating-IP: [171.15.162.83]
X-CM-SenderInfo: pzdqwzpldqw6b26rjloofrz/1tbiuRhb1lpEAaC+vQAAsQ
Received-SPF: pass client-ip=220.181.12.28; envelope-from=wangliangzz@126.com;
 helo=m126.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2023-04-24 at 10:36 +0200, Emanuele Giuseppe Esposito wrote:
> 
> Am 24/04/2023 um 10:15 schrieb Emanuele Giuseppe Esposito:
> > 
> > Am 23/04/2023 um 13:02 schrieb wangliangzz@126.com:
> > > From: Wang Liang <wangliangzz@inspur.com>
> > > 
> > > We need to get the aio_context before calling the
> > > blk_is_available.
> > > 
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
> > > Signed-off-by: Wang Liang <wangliangzz@inspur.com>
> > > 
> > 
> > Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > 
> 
> Sorry I forgot, if you need to resend can you add the cause of this
> issue in the commit message?
> Something along the lines of:
> "hmp_commit() calls blk_is_available() from a non-coroutine context
> (and
> in the main loop). Since this is a co_wrapper_mixed_bdrv_rdlock
> function, in this case it calls AIO_WAIT_WHILE(), which crashes if
> the
> aio_context lock is not taken before"
> 
> Thank you,
> Emanuele

Thanks for the detailed explanation. I'll resend the patch.

Wang Liang


