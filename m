Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1E2C53A2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:13:28 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiG9P-0003hb-Vb
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kiG3q-0002BT-5Z
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:07:42 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:51641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kiG3n-0002Fi-OY
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:07:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A359B1FEC5F;
 Thu, 26 Nov 2020 13:07:35 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 26 Nov
 2020 13:07:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017a8ab3fb-4e31-460a-8f95-ed6f7cb74178,
 3D9671329B6E73EAAA72C004E5562AE56C463AC8) smtp.auth=groug@kaod.org
Date: Thu, 26 Nov 2020 13:07:34 +0100
From: Greg Kurz <groug@kaod.org>
To: Alex Chen <alex.chen@huawei.com>
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
Message-ID: <20201126130734.56f2a84a@bahia.lan>
In-Reply-To: <20201126101624.55714-1-alex.chen@huawei.com>
References: <20201126101624.55714-1-alex.chen@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 12e4a73d-b486-4a6b-addd-d533006ebef0
X-Ovh-Tracer-Id: 11134868607857695139
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehvddgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeiihhgrnhhgrdiihhgrnhhghhgrihhlihgrnhhgsehhuhgrfigvihdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 10:16:24 +0000
Alex Chen <alex.chen@huawei.com> wrote:

> Only one of the options -s and -f can be used. When -f is used,
> the fd is created externally and does not need to be closed.

The process running virtfs-proxy-helper has its own copy of
the fd inherited from its parent. And this fd will be closed
eventually when the process terminates.

> When -s is used, a new socket fd is created, and this socket fd
> needs to be closed at the end of main().
> 

Same here, the new socket fd is closed when the process
terminates.

The only justification to merge such a change would be if
the code was sitting in some other function, in which
case we should indeed do proper rollback. But it is main()
here, so this patch isn't needed.

> Reported-by: Euler Robot <euler.robot@huawei.com>

Can you provide a copy of the report in case I'm
missing something ?

> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  fsdev/virtfs-proxy-helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 15c0e79b06..339d477169 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
>      process_requests(sock);
>  error:
>      g_free(rpath);
> +    if (sock_name) {
> +        close(sock);
> +    }
>      g_free(sock_name);
>      do_log(LOG_INFO, "Done\n");
>      closelog();


