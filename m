Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDD6621A4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:32:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoO2-0003Dr-FL; Mon, 09 Jan 2023 04:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pEoNt-00039U-Fn
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pEoNs-0004kp-0f
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673256239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y/ye6nhtO7Elz/d4Jv2aPfIBe/neeAFuLoECmtpJhLY=;
 b=VxuQbuo37DG7QZmxMRxhruzT99cenobcUxQLj9IERDhAMBY3NkjBwaguExQD7dwgvrZYih
 8Zk+x2v3wLPf1CTRjbTC+L+z6xTRDpRquQ2m0xqa5VIbTipySBx/u4uRW99rJHwEQX65G5
 S65trA4u2qwfmqywqXl8752NNQBdbEA=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-9cQIEb-PODet83HHtSwS9A-1; Mon, 09 Jan 2023 04:23:57 -0500
X-MC-Unique: 9cQIEb-PODet83HHtSwS9A-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-150f42d958eso1961046fac.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y/ye6nhtO7Elz/d4Jv2aPfIBe/neeAFuLoECmtpJhLY=;
 b=r5GPxZaFSRcYo7+pVn8DBBoG4iJ85Pfa9M8icB3VEZfBzondsacMKe3fETe5zhqgeG
 s4gjvd4dqgdY70lUFyxEai0lKDkTbXtjRjPHDgJwwe+9zngHstfM4qcn09qHvLPScbVm
 sZkAvIQVlqwCda4tA6ZSZR0NhMhOz6rMQwZQGKCW98ZSwHnyfyqmbje54Rit6Aggksef
 l9DW8cDzB3cRWXtcyA7zgqR7lRW9TTkyfaBUGFF0Z/mYk2/rWZhMnkvpTBLBsRACsl+o
 BdGZsJANJO4c6MMOOVAtJO96cCy7V3CHtmyvqWLoIzHiXka//YwUr0G8MbduAIBM6vZ3
 CSWQ==
X-Gm-Message-State: AFqh2krQ8vq596Idv0HsNYh0JhGrX8l81BM+MvGMSTZXJEDy+bbgu5jS
 z0UqIa9mJqEU5XhN7CnLb8KNb7qgsizFy2BPqYu2N5wkA/Gwc44W03+rF2ZcfVoBvOu889dhr5K
 fptEzy+vbjLIIDDm3tu4nuLQ789ywmWM=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr2725087oiy.35.1673256237168; 
 Mon, 09 Jan 2023 01:23:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs10+VJVYi27B7n5X70PhD4nyNp1le64zCX/NxLGSzJ1kPEe8yquVAMQ+rdUaJ+7ic7DroKx3wEvYFyIxau2sA=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr2725085oiy.35.1673256236932; Mon, 09 Jan
 2023 01:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20221230202710.115187-1-blue@cmd.nu>
In-Reply-To: <20221230202710.115187-1-blue@cmd.nu>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Jan 2023 17:23:45 +0800
Message-ID: <CACGkMEseLO_8iVjLZ5VXwJcC+irmHpSu+G0Cn=7zmESCf=NVxA@mail.gmail.com>
Subject: Re: [PATCH] net: Increase L2TPv3 buffer to fit jumboframes
To: Christian Svensson <blue@cmd.nu>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Dec 31, 2022 at 4:27 AM Christian Svensson <blue@cmd.nu> wrote:
>
> Increase the allocated buffer size to fit larger packets.
> Given that jumboframes can commonly be up to 9000 bytes the closest suitable
> value seems to be 16 KiB.
>
> Tested by running qemu towards a Linux L2TPv3 endpoint and pushing
> jumboframe traffic through the interfaces.
>
> Signed-off-by: Christian Svensson <blue@cmd.nu>

Queued.

Thanks

> ---
>  net/l2tpv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index 5852e42738..3d5c6d11d3 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -42,7 +42,7 @@
>   */
>
>  #define BUFFER_ALIGN sysconf(_SC_PAGESIZE)
> -#define BUFFER_SIZE 2048
> +#define BUFFER_SIZE 16384
>  #define IOVSIZE 2
>  #define MAX_L2TPV3_MSGCNT 64
>  #define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)
> --
> 2.36.2
>


