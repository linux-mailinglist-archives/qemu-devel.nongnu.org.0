Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825A2F3B9A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:46:13 +0100 (CET)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQYN-000727-Nf
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kzQWT-0006cV-46
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:44:13 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kzQWP-0001PT-UR
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:44:12 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AD4B7746552;
 Tue, 12 Jan 2021 21:44:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7F67574645F; Tue, 12 Jan 2021 21:44:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7DB2474645B;
 Tue, 12 Jan 2021 21:44:03 +0100 (CET)
Date: Tue, 12 Jan 2021 21:44:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <20210112165859.225534-2-stefanha@redhat.com>
Message-ID: <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021, Stefan Hajnoczi wrote:
> It is possible to repeat the --trace option to specify multiple
> patterns. This may be preferrable to users who do not want to create a
> file with a list of patterns.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> docs/devel/tracing.rst | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index 4ebf8e38ea..8777c19d14 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -22,10 +22,15 @@ events::
> This output comes from the "log" trace backend that is enabled by default when
> ``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
> 
> -More than one trace event pattern can be specified by providing a file
> -instead::
> +Multiple patterns can be specified by repeating the ``--trace`` option::
> +
> +    $ qemu --trace "kvm_*" --trace "virtio_*" ...

QEMU options are single dash with double dash accepted for compatibility 
but help and other docs have single dash so these (and below) should be 
-trace. (Also a bit less typing for otherwise already way too long command 
lines.)

Regards,
BALATON Zoltan

> +
> +When patterns are used frequently it is more convenient to store them in a
> +file to avoid long command-line options::
>
>     $ echo "memory_region_ops_*" >/tmp/events
> +    $ echo "kvm_*" >>/tmp/events
>     $ qemu --trace events=/tmp/events ...
> 
> Trace events
> -- 
> 2.29.2

