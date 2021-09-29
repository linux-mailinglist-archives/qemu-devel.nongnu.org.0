Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690A41C248
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:09:32 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWWp-0002U9-0B
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mVWPL-0004cJ-1Z; Wed, 29 Sep 2021 06:01:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mVWPF-0007dS-Fm; Wed, 29 Sep 2021 06:01:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3E6D140495;
 Wed, 29 Sep 2021 13:01:30 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id E306B8E;
 Wed, 29 Sep 2021 13:01:29 +0300 (MSK)
Subject: Re: [PATCH] virtio-net : Add check for VIRTIO_NET_F_MAC
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org
References: <20210929065215.21549-1-lulu@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <8566c96d-5a61-fec7-f898-e5ac0937fd06@msgid.tls.msk.ru>
Date: Wed, 29 Sep 2021 13:01:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929065215.21549-1-lulu@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -94
X-Spam_score: -9.5
X-Spam_bar: ---------
X-Spam_report: (-9.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.09.2021 09:52, Cindy Lu wrote:
> For vdpa device, if the host support VIRTIO_NET_F_MAC
> we need to read the mac address from hardware, so need
> to check this bit, the logic is
> 1 if the host support VIRTIO_NET_F_MAC and the mac address
>     is correct, qemu will use the mac address in hardware
> 2.if the host not support , qemu will use the mac from cmdline

So if hw supports NET_F_MAC, cmdline-provided parameter will
silently be ignored?

s/host not support/host does not support this feature/

> 3.if the cmdline not provide mac address, qemu will use radam mac
> address

s/not/does not/
s/radam/random/

Thanks,

/mjt

