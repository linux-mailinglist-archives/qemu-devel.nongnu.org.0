Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39576321B86
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:35:25 +0100 (CET)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDF5-0002Eq-E8
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECvi-0004Gg-GT
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:15:23 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECvf-0001r9-Q2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:15:22 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E9CAE40727;
 Mon, 22 Feb 2021 18:15:17 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 088788D;
 Mon, 22 Feb 2021 18:15:19 +0300 (MSK)
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
 <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
 <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
 <ba3a2bae-d2a4-ca3d-cf3f-c2effc9d6ca9@msgid.tls.msk.ru>
 <1f1c6fa9-a9cc-b169-1c9a-57008752efb4@physik.fu-berlin.de>
 <644a53ea-852e-b60c-973d-10e37096d99e@msgid.tls.msk.ru>
 <f8dfadb7-2ebc-212f-dad6-81ed5093120f@physik.fu-berlin.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f66be948-5b4b-9418-b414-e76563f1a010@msgid.tls.msk.ru>
Date: Mon, 22 Feb 2021 18:15:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f8dfadb7-2ebc-212f-dad6-81ed5093120f@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.02.2021 18:09, John Paul Adrian Glaubitz wrote:

> OK, I was wondering this because qemu-user-static still pulls in the binfmt-support
> package:

sure. Debian does not _depend_ on systemd still (I don't want this flamewar). To me
it is binfmt-support which should adopt to systemd-binfmt, translating its actions
to the systemd equivalents, - this way there will be no need to implement *both*
binfmt-support and systemd-binfmt in every package using binfmts.

> Other distributions such as Fedora have already switched to systemd-binfmt.

This is true for distributions who completely switched to systemd. In Debian
it is optional and Debian still can use runit or sysvinit or something else.
At least in theory :)

Thanks,

/mjt

