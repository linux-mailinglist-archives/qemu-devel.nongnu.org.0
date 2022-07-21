Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962A57CA32
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:04:53 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUvD-0007po-OT
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEUtQ-0006AT-97
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEUtL-0008R3-VC
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658404974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBiDH/zq439tWPrvLOfZdHGcaU1TMZy/D68ut4+6zvM=;
 b=RyaBQRBqFevL0tasg/XpJdz8THy9/AXLIomvGwVU08acWbf8hsYgtvD6RZsPhMGjijyoAB
 PvIctYB7qzk0Hp5qmH5BZxvcfXersrb39qWXyGTgiLUnOuaZEeThTmwY1ZK9b8fQLcnLxw
 yVCVr09Y/DyvRryDp0rEWqrN7CSdjfw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-v-LtIuTwOZ-KzPWGzAl0Bw-1; Thu, 21 Jul 2022 08:02:53 -0400
X-MC-Unique: v-LtIuTwOZ-KzPWGzAl0Bw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r127-20020a1c4485000000b003a2fdeea756so2726249wma.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MBiDH/zq439tWPrvLOfZdHGcaU1TMZy/D68ut4+6zvM=;
 b=tXOTdyIi5ZrF86Z3LjSNwOUcgpLMwzWzeCxYzmLty61IxNeG3TnGbQephxWVu56hwS
 CoMFdX4XL1Ymy7CZDY4JoE6DSjeUnrVa0vmK7FPY9EowYydRHbBtJ1ypOt85RYMa1UfZ
 FB0dtX7ecbVedz1S5vuCHo2vKMaxy6CGtwFSYNjTItRlWfoOcnkxBcNM3cfypXFThdu8
 IkXX5q1LsO8dnBE9qLRZadmJlOXCbbMem+dAYPM7K3vSJBVBkDI2aeibBjrHZqTkFfvk
 Qu4ZXeZ6tsiIhiQOeT5Bj3lLzInW7U1RSelGMUNx4jzKjSneDrvaTVQuxl38AV+SpVPZ
 uYrw==
X-Gm-Message-State: AJIora8j4q69Ta5f2KBECZlr11wopkNqUJzCMQHcw0KjeuHfgvVdQSfQ
 Tu5mFQWHCQ6Gb6LkDy2S1Ho+Cju3SFklM+E76kq25YBL99LIfUzKYbJ0rDdguTx9rIpY/SaEtAI
 +By/y4njrNSJRoBc=
X-Received: by 2002:adf:e544:0:b0:21d:6eed:bd0c with SMTP id
 z4-20020adfe544000000b0021d6eedbd0cmr33453495wrm.223.1658404972116; 
 Thu, 21 Jul 2022 05:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYF2wAhmNbjSj01MbzYIaVF4LAn/scL+SVm+TDsG0abhGmsXcDx42iih3unMQSFnfZ2X6qgg==
X-Received: by 2002:adf:e544:0:b0:21d:6eed:bd0c with SMTP id
 z4-20020adfe544000000b0021d6eedbd0cmr33453469wrm.223.1658404971745; 
 Thu, 21 Jul 2022 05:02:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003a33227e49bsm1426361wms.4.2022.07.21.05.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:02:51 -0700 (PDT)
Date: Thu, 21 Jul 2022 13:02:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] migration: Assert that migrate_multifd_compression()
 returns an in-range value
Message-ID: <YtlAaQ6QvFVdF826@work-vm>
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <20220721115207.729615-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721115207.729615-2-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Coverity complains that when we use the return value from
> migrate_multifd_compression() as an array index:
>   multifd_recv_state->ops = multifd_ops[migrate_multifd_compression()];
> 
> that this might overrun the array (which is declared to have size
> MULTIFD_COMPRESSION__MAX).  This is because the function return type
> is MultiFDCompression, which is an autogenerated enum.  The code
> generator includes the "one greater than the maximum possible value"
> MULTIFD_COMPRESSION__MAX in the enum, even though this is not
> actually a valid value for the enum, and this makes Coverity think
> that migrate_multifd_compression() could return that __MAX value and
> index off the end of the array.
> 
> Suppress the Coverity error by asserting that the value we're going
> to return is within range.
> 
> Resolves: Coverity CID 1487239, 1487254
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index e03f698a3ca..befd4c58a69 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2617,6 +2617,7 @@ MultiFDCompression migrate_multifd_compression(void)
>  
>      s = migrate_get_current();
>  
> +    assert(s->parameters.multifd_compression < MULTIFD_COMPRESSION__MAX);
>      return s->parameters.multifd_compression;
>  }
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


