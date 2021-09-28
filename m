Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7141AD3F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:47:23 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAdu-0008UY-1N
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVAXK-0006bv-Bx; Tue, 28 Sep 2021 06:40:37 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVAXI-0001WN-6N; Tue, 28 Sep 2021 06:40:33 -0400
Received: from [192.168.15.226] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 276732077F;
 Tue, 28 Sep 2021 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632825627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VeYW+5Kmw2ExDP0Tw7mCMKnZ4pZNj6wMZk+Z8wenOVs=;
 b=5JsLOYwimlAq4+NO5585hR+JOisQD9Y3XO6a8/puEnIpILifvs5PpCuu9lkCFLNufNFvWg
 lUGHBwxzxqv68gJXdKoz69+70ay4mzY96FUL55jMm5z9Rtd3pxAmbH4Rw9g6EtMU+RZ22q
 0G9Fs8CJpsNrOYPYfcFXgksyVnB/CBI=
Message-ID: <55d7b2c8-56fa-b157-be2c-df43f7548fe6@greensocs.com>
Date: Tue, 28 Sep 2021 12:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] qemu-options: Tweak [, maxcpus=cpus] to [,
 maxcpus=maxcpus]
Content-Language: en-US-large
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210928093157.14620-1-wangyanan55@huawei.com>
 <20210928093157.14620-2-wangyanan55@huawei.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210928093157.14620-2-wangyanan55@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.136,
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
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/28/21 11:31, Yanan Wang wrote:
> In qemu-option.hx, there is "-smp [[cpus=]n][,maxcpus=cpus]..." in the
> DEF part, and "-smp [[cpus=]n][,maxcpus=maxcpus]..." in the RST part.
> Obviously the later is right, let's fix the previous one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5c1b0311c0..dcd9595650 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -200,7 +200,7 @@ SRST
>   ERST
>   
>   DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [[cpus=]n][,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
> +    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>       "                set the number of CPUs to 'n' [default=1]\n"
>       "                maxcpus= maximum number of total CPUs, including\n"
>       "                offline CPUs for hotplug, etc\n"
> 

