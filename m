Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124576BECCC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBtK-0002FK-0d; Fri, 17 Mar 2023 11:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1pdBtF-0002Cs-V5
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:21:11 -0400
Received: from forward500c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d500])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1pdBtD-0006My-LT
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:21:09 -0400
Received: from mail-nwsmtp-mxback-production-main-78.myt.yp-c.yandex.net
 (mail-nwsmtp-mxback-production-main-78.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:1a88:0:640:4486:0])
 by forward500c.mail.yandex.net (Yandex) with ESMTP id EF1C75EF09;
 Fri, 17 Mar 2023 18:21:01 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c12:4e2a:0:640:dc33:0
 [2a02:6b8:c12:4e2a:0:640:dc33:0])
 by mail-nwsmtp-mxback-production-main-78.myt.yp-c.yandex.net (mxback/Yandex)
 with HTTP id sKnrH60W8uQ0-DYjXBCY3; Fri, 17 Mar 2023 18:21:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phystech.edu; s=mail;
 t=1679066461; bh=7ZQ3yxIVjIJ03bDqTANr7acGblv9TMt0lUiMrkLath8=;
 h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
 b=AX5KaNZsWBlL9QVgVKT3DUvqWSRkGl9q0JYLNpjwt88qADWXJzQuTl3uvlUK5/ahv
 uUYTac6YVc7OnhZ2B+VyAtupGg+95xztkx39BEiVtCt0lFaYojxVFa2UV7HOBqOokK
 9z9ZXKoV+QgAA0jSN9o9yOv7UEcubsHrnZfEkNdI=
Authentication-Results: mail-nwsmtp-mxback-production-main-78.myt.yp-c.yandex.net;
 dkim=pass header.i=@phystech.edu
Received: by 7f4cvd2xm7d2gxse.myt.yp-c.yandex.net with HTTP;
 Fri, 17 Mar 2023 18:21:00 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: pbonzini@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com,
 viktor@daynix.com, annie.li@oracle.com, qemu-devel@nongnu.org
In-Reply-To: <CAFEAcA-W+ooYQSDiQ1xJepFdCmoe9OXKKfzxMjbX67XTpTPzPQ@mail.gmail.com>
References: <20230222211246.883679-1-viktor@daynix.com>
 <386021678985334@izsosstglkfltgsl.vla.yp-c.yandex.net>
 <CAFEAcA-W+ooYQSDiQ1xJepFdCmoe9OXKKfzxMjbX67XTpTPzPQ@mail.gmail.com>
Subject: Re:[PATCH v2 0/3] contrib/elf2dmp: Windows Server 2022 support
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 17 Mar 2023 18:21:00 +0300
Message-Id: <2504391679066460@7f4cvd2xm7d2gxse.myt.yp-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:d500;
 envelope-from=viktor.prutyanov@phystech.edu; helo=forward500c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Thank you! Personally, I agree with any way to get the elf2dmp patch series into the tree.
 
Best regards,
Viktor Prutyanov

