Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAD74E9A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:09:42 +0200 (CEST)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYr00-0007em-Qi
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:09:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fyodor@yandex-team.ru>)
 id 1nYoyp-0005aZ-Td
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 09:00:22 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:57818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fyodor@yandex-team.ru>)
 id 1nYoyl-00025L-SR
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 09:00:18 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5A03E2E0B0E
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 16:00:07 +0300 (MSK)
Received: from 2a02:6b8:c08:78a:0:640:7f17:9212
 (2a02:6b8:c08:78a:0:640:7f17:9212 [2a02:6b8:c08:78a:0:640:7f17:9212])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 00rbF00IY0U1-07ImgAkt; Mon, 28 Mar 2022 16:00:07 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1648472407; bh=3MCJCwKcatIh+tV3yboGRUWgOouQkAINfe4uRNHv/LA=;
 h=Date:Message-Id:Cc:Subject:To:From;
 b=picdsvBhxefZbNdeO2+nidWEnAc4PIiOc9pSmV+eleydiAQvV4t2DKQpa/OmCHqd8
 ZEmh0bbc3Ujc3aaqAFSmykBPStpAVOcAFNkJO/Dx/+ujJcA34HyGQqYI1AiLfFnWIQ
 5xuRl6vhyGZIvGFypEV3OWGJvFV46YDozYM8aytI=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from iva8-dc7983bf477b.qloud-c.yandex.net
 (iva8-dc7983bf477b.qloud-c.yandex.net [2a02:6b8:c0c:1086:0:640:dc79:83bf])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 txqRH00IXOs1-qJ5SdlyN
 for <fyodor@yandex-team.ru>; Mon, 28 Mar 2022 15:59:57 +0300
Received: by iva8-dc7983bf477b.qloud-c.yandex.net with HTTP;
 Mon, 28 Mar 2022 15:59:57 +0300
From: Fyodor Bocharov <fyodor@yandex-team.ru>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: virtiofsd inconsistent forget behavior
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 28 Mar 2022 16:00:07 +0300
Message-Id: <46931648471047@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=fyodor@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Mar 2022 11:08:22 -0400
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
Cc: "asorotsky@yandex-team.ru" <asorotsky@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<div>Hi.</div><div> </div><div>We found out that forget datapath in virtiofsd's fuse impl calls `fuse_reply_err` in case of invalid request <a href="https://gitlab.com/qemu-project/qemu/-/blob/master/tools/virtiofsd/fuse_lowlevel.c#L724" rel="noopener noreferrer" target="_blank">https://gitlab.com/qemu-project/qemu/-/blob/master/tools/virtiofsd/fuse_lowlevel.c#L724</a> but if there is no user defined `forget` it calls `fuse_reply_none` (unlike other functions which call `fuse_reply_err(ENOSYS)`).</div><div>Could you please explain why is it so? Shouldn't it call `fuse_reply_none` no matter what error is?</div><div> </div><div>Thanks,</div><div>Fyodor</div>

