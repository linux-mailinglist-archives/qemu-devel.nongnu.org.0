Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB584E541A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:16:14 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1mX-00022p-F6
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:16:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nX1d5-0005Rb-0k
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:06:27 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51779
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nX1d2-0002hM-9Q
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:06:26 -0400
HMM_SOURCE_IP: 172.18.0.188:50776.285208127
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id BC1042800B5;
 Wed, 23 Mar 2022 22:06:14 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 344411e1add54fddae8cd36b89087eec for
 qemu-devel@nongnu.org; Wed, 23 Mar 2022 22:06:16 CST
X-Transaction-ID: 344411e1add54fddae8cd36b89087eec
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <924ec893-261e-0b3b-0a70-112572eda59e@chinatelecom.cn>
Date: Wed, 23 Mar 2022 22:06:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] tests/migration: Introduce dirty-ring-size option into
 guestperf
To: qemu-devel <qemu-devel@nongnu.org>
References: <cover.1647437453.git.huangy81@chinatelecom.cn>
 <1d82d5667757fa42e359415a879ec05c54471295.1647437453.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <1d82d5667757fa42e359415a879ec05c54471295.1647437453.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Guoyi Tu <tugy@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?B?6KKB5piO5rWp?= <yuanmh12@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "wucy11@chinatelecom.cn" <wucy11@chinatelecom.cn>,
 "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 baiyw2@chinatelecom.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

Hi, what do you think of this patch.

在 2022/3/16 21:39, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Guestperf tool does not enable diry ring feature when test
> migration by default.
> 
> To support dirty ring migration performance test, introduce
> dirty-ring-size option into guestperf tools, which ranges in
> [1024, 65536].
> 
> To set dirty ring size with 4096 during migration test:
> $ ./tests/migration/guestperf.py --dirty-ring-size 4096 xxx
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   tests/migration/guestperf/engine.py   | 6 +++++-
>   tests/migration/guestperf/hardware.py | 8 ++++++--
>   tests/migration/guestperf/shell.py    | 7 ++++++-
>   3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 87a6ab2..3d3f6bd 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -304,7 +304,6 @@ def _get_common_args(self, hardware, tunnelled=False):
>               cmdline = "'" + cmdline + "'"
>   
>           argv = [
> -            "-accel", "kvm",
>               "-cpu", "host",
>               "-kernel", self._kernel,
>               "-initrd", self._initrd,
> @@ -315,6 +314,11 @@ def _get_common_args(self, hardware, tunnelled=False):
>               "-smp", str(hardware._cpus),
>           ]
>   
> +        if hardware._dirty_ring_size:
> +            argv.extend(["-accel", "kvm,dirty-ring-size=%s" % hardware._dirty_ring_size])
> +        else:
> +            argv.extend(["-accel", "kvm"])
> +
>           if self._debug:
>               argv.extend(["-device", "sga"])
>   
> diff --git a/tests/migration/guestperf/hardware.py b/tests/migration/guestperf/hardware.py
> index 3145785..f779cc0 100644
> --- a/tests/migration/guestperf/hardware.py
> +++ b/tests/migration/guestperf/hardware.py
> @@ -23,7 +23,8 @@ def __init__(self, cpus=1, mem=1,
>                    src_cpu_bind=None, src_mem_bind=None,
>                    dst_cpu_bind=None, dst_mem_bind=None,
>                    prealloc_pages = False,
> -                 huge_pages=False, locked_pages=False):
> +                 huge_pages=False, locked_pages=False,
> +                 dirty_ring_size=0):
>           self._cpus = cpus
>           self._mem = mem # GiB
>           self._src_mem_bind = src_mem_bind # List of NUMA nodes
> @@ -33,6 +34,7 @@ def __init__(self, cpus=1, mem=1,
>           self._prealloc_pages = prealloc_pages
>           self._huge_pages = huge_pages
>           self._locked_pages = locked_pages
> +        self._dirty_ring_size = dirty_ring_size
>   
>   
>       def serialize(self):
> @@ -46,6 +48,7 @@ def serialize(self):
>               "prealloc_pages": self._prealloc_pages,
>               "huge_pages": self._huge_pages,
>               "locked_pages": self._locked_pages,
> +            "dirty_ring_size": self._dirty_ring_size,
>           }
>   
>       @classmethod
> @@ -59,4 +62,5 @@ def deserialize(cls, data):
>               data["dst_mem_bind"],
>               data["prealloc_pages"],
>               data["huge_pages"],
> -            data["locked_pages"])
> +            data["locked_pages"],
> +            data["dirty_ring_size"])
> diff --git a/tests/migration/guestperf/shell.py b/tests/migration/guestperf/shell.py
> index 8a809e3..f87bce6 100644
> --- a/tests/migration/guestperf/shell.py
> +++ b/tests/migration/guestperf/shell.py
> @@ -60,6 +60,8 @@ def __init__(self):
>           parser.add_argument("--prealloc-pages", dest="prealloc_pages", default=False)
>           parser.add_argument("--huge-pages", dest="huge_pages", default=False)
>           parser.add_argument("--locked-pages", dest="locked_pages", default=False)
> +        parser.add_argument("--dirty-ring-size", dest="dirty_ring_size", default=0,
> +                            type=int)
>   
>           self._parser = parser
>   
> @@ -89,7 +91,10 @@ def split_map(value):
>   
>                           locked_pages=args.locked_pages,
>                           huge_pages=args.huge_pages,
> -                        prealloc_pages=args.prealloc_pages)
> +                        prealloc_pages=args.prealloc_pages,
> +
> +                        dirty_ring_size=args.dirty_ring_size)
> +
>   
>   
>   class Shell(BaseShell):

-- 
Best regard

Hyman Huang(黄勇)

