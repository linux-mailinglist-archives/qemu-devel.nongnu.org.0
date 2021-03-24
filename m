Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BC346E93
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:20:02 +0100 (CET)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsBl-0000a7-4i
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lOsAc-00005q-Or
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:18:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:51517
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lOsAZ-0002Vz-In
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:18:50 -0400
HMM_SOURCE_IP: 172.18.0.48:10613.1694293100
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-110.184.65.177?logid-468a1797a12d45cd91184434cab0e644
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 18D2C2800A0;
 Wed, 24 Mar 2021 09:18:38 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 468a1797a12d45cd91184434cab0e644 for
 dgilbert@redhat.com; Wed Mar 24 09:18:42 2021
X-Transaction-ID: 468a1797a12d45cd91184434cab0e644
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v1] tests/migration: introduce multifd into guestperf
To: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <cover.1616171924.git.huangy81@chinatelecom.cn>
 <cfeeb04d17ad932c42a9871294058b77429ad1b7.1616171924.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <4a492050-4a4a-724a-b328-6d69643e86b4@chinatelecom.cn>
Date: Wed, 24 Mar 2021 09:18:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cfeeb04d17ad932c42a9871294058b77429ad1b7.1616171924.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc thuth@redhat.com and berrange@redhat.com

Please review, thanks

在 2021/3/20 1:04, huangy81@chinatelecom.cn 写道:
> From: Hyman <huangy81@chinatelecom.cn>
> 
> Guestperf tool does not cover the multifd-enabled migration
> currently, it is worth supporting so that developers can
> analysis the migration performance with all kinds of
> migration.
> 
> To request that multifd is enabled, with 4 channels:
> $ ./tests/migration/guestperf.py \
>      --multifd --multifd-channels 4 --output output.json
> 
> To run the entire standardized set of multifd-enabled
> comparisons, with unix migration:
> $ ./tests/migration/guestperf-batch.py \
>      --dst-host localhost --transport unix \
>      --filter compr-multifd* --output outputdir
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   tests/migration/guestperf/comparison.py | 14 ++++++++++++++
>   tests/migration/guestperf/engine.py     | 16 ++++++++++++++++
>   tests/migration/guestperf/scenario.py   | 12 ++++++++++--
>   tests/migration/guestperf/shell.py      | 10 +++++++++-
>   4 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/migration/guestperf/comparison.py b/tests/migration/guestperf/comparison.py
> index ba2edbe..c03b3f6 100644
> --- a/tests/migration/guestperf/comparison.py
> +++ b/tests/migration/guestperf/comparison.py
> @@ -121,4 +121,18 @@ def __init__(self, name, scenarios):
>           Scenario("compr-xbzrle-cache-50",
>                    compression_xbzrle=True, compression_xbzrle_cache=50),
>       ]),
> +
> +
> +    # Looking at effect of multifd with
> +    # varying numbers of channels
> +    Comparison("compr-multifd", scenarios = [
> +        Scenario("compr-multifd-channels-4",
> +                 multifd=True, multifd_channels=2),
> +        Scenario("compr-multifd-channels-8",
> +                 multifd=True, multifd_channels=8),
> +        Scenario("compr-multifd-channels-32",
> +                 multifd=True, multifd_channels=32),
> +        Scenario("compr-multifd-channels-64",
> +                 multifd=True, multifd_channels=64),
> +    ]),
>   ]
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index e399447..fab3957 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -188,6 +188,22 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>                                      1024 * 1024 * 1024 / 100 *
>                                      scenario._compression_xbzrle_cache))
>   
> +        if scenario._multifd:
> +            resp = src.command("migrate-set-capabilities",
> +                               capabilities = [
> +                                   { "capability": "multifd",
> +                                     "state": True }
> +                               ])
> +            resp = src.command("migrate-set-parameters",
> +                               multifd_channels=scenario._multifd_channels)
> +            resp = dst.command("migrate-set-capabilities",
> +                               capabilities = [
> +                                   { "capability": "multifd",
> +                                     "state": True }
> +                               ])
> +            resp = dst.command("migrate-set-parameters",
> +                               multifd_channels=scenario._multifd_channels)
> +
>           resp = src.command("migrate", uri=connect_uri)
>   
>           post_copy = False
> diff --git a/tests/migration/guestperf/scenario.py b/tests/migration/guestperf/scenario.py
> index 28ef36c..de70d9b 100644
> --- a/tests/migration/guestperf/scenario.py
> +++ b/tests/migration/guestperf/scenario.py
> @@ -29,7 +29,8 @@ def __init__(self, name,
>                    post_copy=False, post_copy_iters=5,
>                    auto_converge=False, auto_converge_step=10,
>                    compression_mt=False, compression_mt_threads=1,
> -                 compression_xbzrle=False, compression_xbzrle_cache=10):
> +                 compression_xbzrle=False, compression_xbzrle_cache=10,
> +                 multifd=False, multifd_channels=2):
>   
>           self._name = name
>   
> @@ -56,6 +57,9 @@ def __init__(self, name,
>           self._compression_xbzrle = compression_xbzrle
>           self._compression_xbzrle_cache = compression_xbzrle_cache # percentage of guest RAM
>   
> +        self._multifd = multifd
> +        self._multifd_channels = multifd_channels
> +
>       def serialize(self):
>           return {
>               "name": self._name,
> @@ -73,6 +77,8 @@ def serialize(self):
>               "compression_mt_threads": self._compression_mt_threads,
>               "compression_xbzrle": self._compression_xbzrle,
>               "compression_xbzrle_cache": self._compression_xbzrle_cache,
> +            "multifd": self._multifd,
> +            "multifd_channels": self._multifd_channels,
>           }
>   
>       @classmethod
> @@ -92,4 +98,6 @@ def deserialize(cls, data):
>               data["compression_mt"],
>               data["compression_mt_threads"],
>               data["compression_xbzrle"],
> -            data["compression_xbzrle_cache"])
> +            data["compression_xbzrle_cache"],
> +            data["multifd"],
> +            data["multifd_channels"])
> diff --git a/tests/migration/guestperf/shell.py b/tests/migration/guestperf/shell.py
> index f838888..8a809e3 100644
> --- a/tests/migration/guestperf/shell.py
> +++ b/tests/migration/guestperf/shell.py
> @@ -122,6 +122,11 @@ def __init__(self):
>           parser.add_argument("--compression-xbzrle", dest="compression_xbzrle", default=False, action="store_true")
>           parser.add_argument("--compression-xbzrle-cache", dest="compression_xbzrle_cache", default=10, type=int)
>   
> +        parser.add_argument("--multifd", dest="multifd", default=False,
> +                            action="store_true")
> +        parser.add_argument("--multifd-channels", dest="multifd_channels",
> +                            default=2, type=int)
> +
>       def get_scenario(self, args):
>           return Scenario(name="perfreport",
>                           downtime=args.downtime,
> @@ -142,7 +147,10 @@ def get_scenario(self, args):
>                           compression_mt_threads=args.compression_mt_threads,
>   
>                           compression_xbzrle=args.compression_xbzrle,
> -                        compression_xbzrle_cache=args.compression_xbzrle_cache)
> +                        compression_xbzrle_cache=args.compression_xbzrle_cache,
> +
> +                        multifd=args.multifd,
> +                        multifd_channels=args.multifd_channels)
>   
>       def run(self, argv):
>           args = self._parser.parse_args(argv)
> 

-- 
Best regard

Hyman Huang(黄勇)

