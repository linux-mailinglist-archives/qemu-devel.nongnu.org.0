Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2F582955
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:11:12 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGigo-00041D-IA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGice-0001Gp-KP; Wed, 27 Jul 2022 11:06:56 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGicc-00025A-R8; Wed, 27 Jul 2022 11:06:52 -0400
Received: by mail-yb1-xb31.google.com with SMTP id i14so30715375yba.1;
 Wed, 27 Jul 2022 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9fg7H1MtH0wbLzFHDc3g3kIU9HllXQeawZXX0g4nJ0=;
 b=PhRIOJy9iWFaHqq7n+5Z8Qn6Tj+iX1HypgEmCQzbv37CnMnfdm2tG7Jo7yj9QnXYwg
 oXo+nNlYe2+cLp5F/2K138nAXaCgyK1BWUj7yBVwmKKmB7iHFhRSiZNNuIoPhmPnvYCE
 73C5X/d5+GiHumy9TxrDYO2hS63egIXFEPsM+4EBP3ZRd+1OBPWyoeahdKSJfnrLGVLf
 eb4DUHJksjpU6RQ+0fELGwk3ZKnFAjotNUNZTb0TKCzGmCoywlLBsq+SxJzg85H5OfkJ
 OxTPzXzsJtgb0GXe8EtHzhg2ufJYPWzLYaznhu+m4APSSc5guU17RNbAgy30SwyXGze5
 khTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9fg7H1MtH0wbLzFHDc3g3kIU9HllXQeawZXX0g4nJ0=;
 b=Q8beF3RmWC2bh6Eq3e0Ib0W/f7YBUOyRBgUvADbZTx7rQCAB8RavJOPM7uOyyeO947
 DVF4an9vtsiLUKxWI4M07XJkgU328LzCNG82bOAVSZVtj+wCjripHCCj1ch5gI9fPZ7U
 raXf0mWtolBn2WBW9a1RYxsBJ1giixnuDEIN/70bAHfXil83mZh53k/3GPSm3zBlxK5w
 yx1BMtabvm8iS+amzml8bPTuoSSWhdMVpXXYtJ/iaxqrQwzJAuUz3dxZTISoAoID+jvL
 JEWCot2Dnqdamf4GcxRcZ0kFPRs1m6J3UwedqbYiznqtgx0efq1sm9vRmXHvYlaKtShn
 WA2w==
X-Gm-Message-State: AJIora8qb38F/8F3qM6HKGpVbof22DaCc/iDfhpgnIf0U+mhb96YcFMA
 GW/fepB3O7Xx+z1uUoEYPVUqb5J+nIdHfuSH+vc=
X-Google-Smtp-Source: AGRyM1uTv0h7HxS7wEMFY5lCQXZrdB7xzZawjAhjPUagWI5arYmw1qrvgKERTlspejMW6wBDFc1mWQmJvOswreHcS9U=
X-Received: by 2002:a25:238d:0:b0:673:4607:acf4 with SMTP id
 j135-20020a25238d000000b006734607acf4mr687229ybj.209.1658934409433; Wed, 27
 Jul 2022 08:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 11:06:37 -0400
Message-ID: <CAJSP0QUhg-5xioYmJzmjeXqPrZ_GB1dMxQj230neQp2mUNEMcw@mail.gmail.com>
Subject: Re: [RFC v4 0/9] Add support for zoned device
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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

This patch series introduces the concept of zoned storage to the QEMU
block layer. Documentation is needed so that users and developers know
how to use and maintain this feature.

As a minimum, let's document how to pass through zoned block devices on Linux:

diff --git a/docs/system/qemu-block-drivers.rst.inc
b/docs/system/qemu-block-drivers.rst.inc
index dfe5d2293d..f6ba05710a 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -430,6 +430,12 @@ Hard disks
   you may corrupt your host data (use the ``-snapshot`` command
   line option or modify the device permissions accordingly).

+Zoned block devices
+  Zoned block devices can be passed through to the guest if the emulated
+  storage controller supports zoned storage. Use ``--blockdev
+  zoned_host_device,node-name=drive0,filename=/dev/nullb0`` to pass through
+  ``/dev/nullb0`` as ``drive0``.
+
 Windows
 ^^^^^^^

For developers there should be an explanation of the zoned storage
APIs and how BlockDrivers declare support. It should also mention the
status of pass through (implemented in the zoned_host_device driver)
vs zone emulation (not implemented in the QEMU block layer) so
developers understand the block layer's zoned storage capabilities.
You can add a docs/devel/zoned-storage.rst file to document this or
let me know if you want me to write it.

Stefan

