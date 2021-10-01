Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668B41E922
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 10:37:06 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWE2T-0002UO-1k
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 04:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWE1R-0001ef-87
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWE1O-0008Ic-Ks
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633077357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYY8JIGpHJzXitNyvnZqcxWn6NnjN61w6YxlLvuig7U=;
 b=SDC95MtcMC7BoyXZvZ63cXtQpkNtBLfmD4nlei//gXTYwanTT+ZuJCD9sEdXdrpL/br++4
 UVvSmo1ChxQxbsz8hHZYmvYPZM4WJ4LRTlqzr2hRCa6cfaYqgZV4D3Pqcjil8KqFgYdBoU
 UdCea/D+chnk0wSYfqWtYmaxWEOGFNQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-2D6JHHGfMB6FVJGsRZ_1Cg-1; Fri, 01 Oct 2021 04:35:54 -0400
X-MC-Unique: 2D6JHHGfMB6FVJGsRZ_1Cg-1
Received: by mail-wm1-f71.google.com with SMTP id
 129-20020a1c0187000000b0030d4081c36cso918464wmb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 01:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SYY8JIGpHJzXitNyvnZqcxWn6NnjN61w6YxlLvuig7U=;
 b=Y8QwrAMueI7KFN2zf753Gzjl+bob5bHyJQ2dZSyNjOpE53LBGoba8uMugBMWaFvrPo
 wxqkYE+7Z/U5Y/KNJOwMnRj7X5/Hh4yIheYiXMK3/d45MnhIQhuR2E9vpFFi4JlLNlPi
 R6VPgEQ31hQv+HwURuYd/oplo7wPCpGSFKZJXXrrDiaa4B/IYbjKHoO25RWG20ekRKsN
 OV2s2jCbhJRDLhppq6V72KDMs3zbSFyorTQNEsDKSTkgEGZkk0bJKapvxsoMr0DBK06X
 iivFrE+iBzog9+vMNebhByr+WCTd+52i6AvvSwASSVgvpTxdtoqoFZI8Aix6sJPfQri8
 LfqQ==
X-Gm-Message-State: AOAM531IC+E/2mvLra94vFb7dM16BDIl75EW+hRYNQ7L1eKoqZmzyvFn
 uat6HlZ+m8ch1sZ3tajhA/1klDyZ91fnSU7eUxQE/euFmljwtk0qxk8fLBGvDD13BEC0X+gWaAG
 0XfhXFd2Dd0FGs90=
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr10969480wri.141.1633077353490; 
 Fri, 01 Oct 2021 01:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdBt7DnZ6F3VILk4VFjXQ3d6SPEUJ+DnywFMANzAkfcAx11AO0ZzrPjnvMJeBICMs64yUGTQ==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr10969441wri.141.1633077353183; 
 Fri, 01 Oct 2021 01:35:53 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m5sm6141097wms.41.2021.10.01.01.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 01:35:52 -0700 (PDT)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
From: Thomas Huth <thuth@redhat.com>
Subject: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Message-ID: <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
Date: Fri, 1 Oct 2021 10:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927044808.73391-5-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, peter.maydell@linaro.org,
 dbarboza@redhat.com, aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk,
 groug@kaod.org, wainersm@redhat.com, Alexander Graf <agraf@csgraf.de>,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2021 06.48, David Gibson wrote:
> There are a nunber of old embedded ppc machine types which have been little
> changed and in "Odd Fixes" state for a long time.  With both myself and
> Greg Kurz moving toward other areas, we no longer have the capacity to
> keep reviewing and maintaining even the rare patches that come in for those
> platforms.
> 
> Therefore, remove our names as reviewers and mark these platforms as
> orphaned.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>   MAINTAINERS | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2060b46f9..1ecb5716c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1236,24 +1236,18 @@ F: hw/openrisc/openrisc_sim.c
>   PowerPC Machines
>   ----------------
>   405
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Odd Fixes
> +S: Orphan
>   F: hw/ppc/ppc405_boards.c

Related question: Does *anybody* know how to still use the ref405ep or taihu 
board in QEMU? We just got another ticket asking for the related firmware image:

  https://gitlab.com/qemu-project/qemu/-/issues/651

And if you google for 'ppc405_rom.bin', I only find pages where people are 
asking basically the same question, e.g.:

  https://lists.nongnu.org/archive/html/qemu-devel/2007-08/msg00252.html (in 
2007 already! And no answer)

  https://github.com/Xilinx/qemu/issues/36 (in 2019, no answer)

  https://lists.libreplanet.org/archive/html/qemu-ppc/2019-12/msg00263.html 
(in 2019, no answer about bios location)

  https://lkml.org/lkml/2020/4/25/61 (in 2020, no answer)


Seems like the Linux kernel removed support for the 405ep board here:

 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=548f5244f1064c9facb19c5e9

... to me this all sounds like these 405 boards are pretty dead code in QEMU 
right now, so if nobody has a clue how to use them, I'd suggest to mark them 
as deprecated and remove them in a couple of releases?

  Thomas


