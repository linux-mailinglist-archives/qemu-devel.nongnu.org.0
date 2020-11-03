Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F42A49D0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:31:21 +0100 (CET)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyHI-0005V1-Gy
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kZxw0-0005bJ-VX
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:09:21 -0500
Received: from relay64.bu.edu ([128.197.228.104]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kZxvz-0000w5-1L
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:09:20 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0A3F8e3x002067
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 3 Nov 2020 10:08:44 -0500
Date: Tue, 3 Nov 2020 10:08:40 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: AlexChen <alex.chen@huawei.com>
Subject: Re: [PATCH] tests/qtest: Fix potential NULL pointer dereference in
 qos_build_main_args()
Message-ID: <20201103150840.we7qkja6zcbz7vzy@mozz.bu.edu>
References: <5FA16ED5.4000203@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5FA16ED5.4000203@huawei.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 10:09:16
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.374, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 QEMU <qemu-devel@nongnu.org>, bsd@redhat.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201103 2253, AlexChen wrote:
> In qos_build_main_args(), the pointer 'path' is dereferenced before
> checking it is valid, which may lead to NULL pointer dereference.
> So move the assignment to 'cmd_line' after checking 'path' is valid.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
>  tests/qtest/fuzz/qos_fuzz.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index b943577b8c..cee1a2a60f 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -70,7 +70,7 @@ static GString *qos_build_main_args(void)
>  {
>      char **path = fuzz_path_vec;
>      QOSGraphNode *test_node;
> -    GString *cmd_line = g_string_new(path[0]);
> +    GString *cmd_line;
>      void *test_arg;
> 
>      if (!path) {
> @@ -79,6 +79,7 @@ static GString *qos_build_main_args(void)
>      }
> 
>      /* Before test */
> +    cmd_line = g_string_new(path[0]);
>      current_path = path;
>      test_node = qos_graph_get_node(path[(g_strv_length(path) - 1)]);
>      test_arg = test_node->u.test.arg;
> -- 
> 2.19.1

