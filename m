Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B5D32DF31
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:45:22 +0100 (CET)
Received: from localhost ([::1]:40700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHzWr-00048P-Op
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzVC-0003JO-HM
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzV8-0000iH-10
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614908612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XttAGv6YvgBYV9c+jNszZDAQ4RKTvSeUFRT7lvBQg1w=;
 b=B/kHM7J4Qve01uRzb7X3OD/eJNmMHSXtbcQUMwP0IGbl4oBzee+Jr5QBi/i0/CSwxltGHW
 t0CoR1cp5qlS15F0QxQPMQYzgggv6aO+vqmqxGbdHAK08nNp/eKCWofQzr4nu7+TJ+oPDM
 KH6nTav2DIuEHastGVJZB9xCtJvDy78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-lnuIPhV2M1GwG5NWUaMIVw-1; Thu, 04 Mar 2021 20:43:31 -0500
X-MC-Unique: lnuIPhV2M1GwG5NWUaMIVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF53D184214F;
 Fri,  5 Mar 2021 01:43:29 +0000 (UTC)
Received: from [10.10.118.103] (ovpn-118-103.rdu2.redhat.com [10.10.118.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 104A450DD0;
 Fri,  5 Mar 2021 01:43:28 +0000 (UTC)
Subject: Re: [PATCH v2 6/8] simplebench/bench-backup: support qcow2 source
 files
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-7-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <64b9ca25-0bf4-fd80-c30b-6d95eea825fe@redhat.com>
Date: Thu, 4 Mar 2021 20:43:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304101738.20248-7-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
> Add support for qcow2 source. New option says to use test-source.qcow2
> instead of test-source. Of course, test-source.qcow2 should be
> precreated.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/bench-backup.py    | 5 +++++
>   scripts/simplebench/bench_block_job.py | 7 ++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
> index fbc85f266f..a2120fcbf0 100755
> --- a/scripts/simplebench/bench-backup.py
> +++ b/scripts/simplebench/bench-backup.py
> @@ -58,6 +58,8 @@ def bench(args):
>   
>           if src == 'nbd':
>               source = nbd_drv
> +        elif args.qcow2_sources:
> +            source = drv_qcow2(drv_file(dirs[src] + '/test-source.qcow2'))
>           else:
>               source = drv_file(dirs[src] + '/test-source')
>   
> @@ -199,6 +201,9 @@ def __call__(self, parser, namespace, values, option_string=None):
>   Use compressed backup. It automatically means
>   automatically creating qcow2 target with
>   lazy_refcounts for each test run''', action='store_true')
> +    p.add_argument('--qcow2-sources', help='''\
> +Use test-source.qcow2 images as sources instead of
> +test-source raw images''', action='store_true')
>       p.add_argument('--target-cache', help='''\
>   Setup cache for target nodes. Options:
>      direct: default, use O_DIRECT and aio=native
> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
> index 71d2e489c8..4f03c12169 100755
> --- a/scripts/simplebench/bench_block_job.py
> +++ b/scripts/simplebench/bench_block_job.py
> @@ -88,6 +88,11 @@ def get_image_size(path):
>       return json.loads(out)['virtual-size']
>   
>   
> +def get_blockdev_size(obj):
> +    img = obj['filename'] if 'filename' in obj else obj['file']['filename']
> +    return get_image_size(img)
> +

Well, as long as it works :)

> +
>   # Bench backup or mirror
>   def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
>       """Helper to run bench_block_job() for mirror or backup"""
> @@ -101,7 +106,7 @@ def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
>   
>           subprocess.run(['qemu-img', 'create', '-f', 'qcow2',
>                           target['file']['filename'],
> -                        str(get_image_size(source['filename']))],
> +                        str(get_blockdev_size(source))],
>                          stdout=subprocess.DEVNULL,
>                          stderr=subprocess.DEVNULL, check=True)
>   
> 

Reviewed-by: John Snow <jsnow@redhat.com>


