Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB125BA08
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 07:18:13 +0200 (CEST)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDhdT-0006w5-KF
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 01:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kDhYH-00067O-PG
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 01:12:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kDhYE-0003Fn-Kq
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 01:12:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 73A3240017;
 Thu,  3 Sep 2020 08:12:35 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 93CA610;
 Thu,  3 Sep 2020 08:09:46 +0300 (MSK)
Subject: Re: [RFC 3/3] virtio-gpu: make the IO handler reentrant
To: Li Qiang <liq3ea@163.com>, mst@redhat.com, kraxel@redhat.com,
 dmitry.fleytman@gmail.com, jasowang@redhat.com, alxndr@bu.edu,
 peter.maydell@linaro.org, pbonzini@redhat.com
References: <20200902162206.101872-1-liq3ea@163.com>
 <20200902162206.101872-4-liq3ea@163.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <01e9f449-00c8-5a9d-b212-4df0147b6e5c@msgid.tls.msk.ru>
Date: Thu, 3 Sep 2020 08:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902162206.101872-4-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:12:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.324,
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
Cc: liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.09.2020 19:22, Li Qiang wrote:
..
> @@ -809,6 +809,10 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
>  {
>      struct virtio_gpu_ctrl_command *cmd;
>  
> +    if (atomic_read(&g->in_io)) {
> +        return;
> +    }
> +    atomic_set(&g->in_io, 1);

Can't we race in these two instructions? Both
threads atomic_reads at the same time, both see zero,
and both are trying to set it to 1, no?

Just asking really, b/c despite of the atomic_ prefix,
to me this look a bit unsafe..

Thanks,

/mjt

