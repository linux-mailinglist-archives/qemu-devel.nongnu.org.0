Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A629332DF2A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:37:56 +0100 (CET)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHzPf-0002TN-N3
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzOu-0001y9-AN
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzOs-00069q-NJ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614908225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MCpJClpii5jLSVnkDw5NbhagtpiLnMIFFBBcF7ABog=;
 b=W7tZiNkUaQq9Bl5s5BSdKFW3U33L6TXo4HSrjsYLk6jWImmhKWTzcTIxCLCLtOg6dlH78C
 vrkSkHdpSnn1AAGXHYxMcnq3rfN8YNz+L5NvtSVmOvLWHJ5LkNx/eP8X2I+UVjLe1CNvMN
 Hr4fFz9b1IKqfAed1xQ9rst29fNgMDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-cICpQhqzNgOUgp5xxf2VGQ-1; Thu, 04 Mar 2021 20:37:04 -0500
X-MC-Unique: cICpQhqzNgOUgp5xxf2VGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A699F1005D45;
 Fri,  5 Mar 2021 01:37:02 +0000 (UTC)
Received: from [10.10.118.103] (ovpn-118-103.rdu2.redhat.com [10.10.118.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 186B75D9C6;
 Fri,  5 Mar 2021 01:37:02 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] simplebench/bench-backup: add --count and
 --no-initial-run
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-8-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a105bef9-9f0d-6380-1b65-d93830408907@redhat.com>
Date: Thu, 4 Mar 2021 20:37:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304101738.20248-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
> Add arguments to set number of test runs per table cell and to disable
> initial run that is not counted in results.
> 
> It's convenient to set --count 1 --no-initial-run to fast run test
> onece, and to set --count to some large enough number for good
> precision of the results.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/bench-backup.py | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
> index a2120fcbf0..519a985a7f 100755
> --- a/scripts/simplebench/bench-backup.py
> +++ b/scripts/simplebench/bench-backup.py
> @@ -155,7 +155,9 @@ def bench(args):
>                   'qemu-binary': path
>               })
>   
> -    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
> +    result = simplebench.bench(bench_func, test_envs, test_cases,
> +                               count=args.count,
> +                               initial_run = not args.no_initial_run)

The double negative feels odd; "initial_run = args.initial_run" would 
read better and avoid changing behavior, but maybe that's intentional.

>       with open('results.json', 'w') as f:
>           json.dump(result, f, indent=4)
>       print(results_to_text(result))
> @@ -211,4 +213,10 @@ def __call__(self, parser, namespace, values, option_string=None):
>      both: generate two test cases for each src:dst pair''',
>                      default='direct', choices=('direct', 'cached', 'both'))
>   
> +    p.add_argument('--count', type=int, default=3, help='''\
> +Number of test runs per table cell''')
> +
> +    p.add_argument('--no-initial-run', action='store_true', help='''\
> +Don't do initial run of test for each cell which doesn't count''')
> +
>       bench(p.parse_args())
> 


