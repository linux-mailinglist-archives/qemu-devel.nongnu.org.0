Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D42CD917
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 15:28:57 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkpbM-0000fC-Ov
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 09:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1kkpZt-0008Ec-5X
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:27:25 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:59566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1kkpZn-0006lx-HO
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:27:24 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3EP3oH006817;
 Thu, 3 Dec 2020 14:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=ubmv6guzh4Ko/NToJ76RAl6bgxq23OGF0n7QUoKRgn8=;
 b=Jb+0PvY3MxrhZmCEpopHSdi+YFmklq7taWwO3db4+5jUaMFwMwYdlzSKfpB6X1bpA29w
 e8RzWoLp5qG4aQO6QS/dszU17FWu+U7EoOwXFSdAh960E0QtRtms8P0pzrbTfj0BHwAg
 /tjkTCn50hrs4BWFB+m/aNtqAuv3/zdfTt/s5K9PENBHk/wsI2wY56uCiPVe+QfqVgTa
 XVvJT2p+AUT07UQUir9Rns9/LoIYpo1T0kp2I0Br5z7OynWhV54IWu2oG/DRNJ/6iLtR
 AtlvPciRYccGKhTzJiOsKaXqqKafxS3YDBXCChtJQ1HJ2MKxscqVAjfZaxGQe7ySBPFP JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 353c2b6a1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 14:27:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3EQOZR154422;
 Thu, 3 Dec 2020 14:27:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3540aw7knf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 14:27:13 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B3ERBld018681;
 Thu, 3 Dec 2020 14:27:11 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 14:27:11 +0000
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id EB164251EB53; Thu,  3 Dec 2020 14:27:08 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: avoid double-fetches by default
In-Reply-To: <20201202164214.93867-1-alxndr@bu.edu>
References: <20201202164214.93867-1-alxndr@bu.edu>
Date: Thu, 03 Dec 2020 14:27:08 +0000
Message-ID: <m2k0tz55j7.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=915
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=921 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030088
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darren.kenny@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2020-12-02 at 11:42:14 -05, Alexander Bulekov wrote:
> The generic fuzzer can find double-fetch bugs. However:
> * We currently have no good way of producing qemu-system reproducers for
>   double-fetch bugs. Even if we can get developers to run the binary-blob
>   reproducers with the qemu-fuzz builds, we currently don't have a minimizer for
>   these reproducers, so they are usually not easy to follow.
> * Often times the fuzzer will provide a reproducer containing a
>   double-fetch for a bug that can be reproduced without double-fetching.
>
> Until we find a way to build nice double-fetch reproducers that
> developers are willing to look at, lets tell OSS-Fuzz to avoid
> double-fetches.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 262a963d2e..07ad690683 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -916,6 +916,7 @@ static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
>      g_assert(t->opaque);
>  
>      config = t->opaque;
> +    setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
>      setenv("QEMU_FUZZ_ARGS", config->args, 1);
>      setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
>      return generic_fuzz_cmdline(t);
> -- 
> 2.28.0

