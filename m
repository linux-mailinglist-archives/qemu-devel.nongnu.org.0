Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8F359CA4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:07:04 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoya-0005Qc-Ul
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUox5-0004Vw-F6; Fri, 09 Apr 2021 07:05:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUox2-00069z-5b; Fri, 09 Apr 2021 07:05:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so2989333pjg.5; 
 Fri, 09 Apr 2021 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mvfskGBMn+giMd72llWWOMby99isjyjFIhNPFY9sLRk=;
 b=iiBor9w1+yK1pMNVg+7G3Vmi879FAQjnhRABksYg/68Eaa6qSKIp8zO0VaDUjVG4jG
 JIM3L8GRGTWZvDWs6HPTgMNRenzio3lgLuxBal3Q1jhbKTrCyX8m2fA/XS5I8sTJIEbZ
 bX237Jkn+lLocA6nPS9tgz8gYqdVeFv9vqReIfuFLNuWuV3QMT9531ZhrBZLvSCrtnEz
 aRcGeVB1nf3GOsFn/irp3r5tslRgDq7HgaE27m2Im6o5cL4MCbxUbB4kMPD1mfixnGEn
 jVOVxYTbfxy0pf5kE/MxHZX/kCg9nB2CSITwwEv+FPMFtGcmse/TffCA8V95kwkuXDEa
 KUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mvfskGBMn+giMd72llWWOMby99isjyjFIhNPFY9sLRk=;
 b=nwM+3SsYHdqcfbudRykNbZNBDBMg3nauDkhncM6EdgFe42MKD0uTVOSdSuS0MoMl2E
 RbHa9nurXYOMVhLo948gtlQ3iPNEgVBjKJ5e9IoCB0BrH/rwzWMhNOfrq7BG74es197I
 d3DL7JAd54tHhLVY8d8HWZ5ZF0B6cohf/zy30ihPETFsdvMLNdqVBbZeqjUjdckLc4Jx
 vJgCGvzx2rIdxCYfq1G6L4u9JTCunABFVmYsQ6FP9TSBhAdI/22IZFGDI0DQi892k2cJ
 KML8UwJOgy67SLMRuu8UwFyohjORS7Yy8Sliv5RwvfRmN4t+GpZc/c/lJxfp/OjSbUx0
 vw9A==
X-Gm-Message-State: AOAM533+eastvT41afvrtQHF5UOULimeU9YtxyFMP2Bvrnexvb4TTUAI
 XxnH8Hs6nYZ/iyc0+4GHAcg=
X-Google-Smtp-Source: ABdhPJyKSnPDh6jD3NqsZteu4uJPEZcrpYbwrBYdIpaQ/JUh9HpgC7qDl9wHmYMo5RwKSj5HTWXS/g==
X-Received: by 2002:a17:90b:b08:: with SMTP id
 bf8mr13391374pjb.116.1617966321100; 
 Fri, 09 Apr 2021 04:05:21 -0700 (PDT)
Received: from localhost ([58.127.46.74])
 by smtp.gmail.com with ESMTPSA id b7sm1984814pfd.55.2021.04.09.04.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 04:05:20 -0700 (PDT)
Date: Fri, 9 Apr 2021 20:05:18 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <20210409110518.GC2085@localhost>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210409074402.7342-1-anaidu.gollu@samsung.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, kbusch@kernel.org,
 stefanha@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-04-09 13:14:02, Gollu Appalanaidu wrote:
> NSZE is the total size of the namespace in logical blocks. So the max
> addressable logical block is NLB minus 1. So your starting logical
> block is equal to NSZE it is a out of range.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 953ec64729..be9edb1158 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
>              uint64_t slba = le64_to_cpu(range[i].slba);
>              uint32_t nlb = le32_to_cpu(range[i].nlb);
>  
> -            if (nvme_check_bounds(ns, slba, nlb)) {
> +            if (nvme_check_bounds(ns, slba, nlb) || slba == ns->id_ns.nsze) {

This patch also looks like check the boundary about slba.  Should it be
also checked inside of nvme_check_bounds() ?

