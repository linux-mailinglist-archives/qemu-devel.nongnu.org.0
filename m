Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A5340AD8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:03:30 +0100 (CET)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMw3V-000342-Lj
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaojun.zhao141@gmail.com>)
 id 1lMvwF-0007z0-AC; Thu, 18 Mar 2021 12:55:59 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiaojun.zhao141@gmail.com>)
 id 1lMvwD-0002Wp-Ky; Thu, 18 Mar 2021 12:55:58 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v2so1831314pgk.11;
 Thu, 18 Mar 2021 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=C07GHj9IeKSD+01ybHduXrUR4BI7f2USZ0GIHzZJ/tE=;
 b=rFsOAxEZOODDRZqeg8xGliF1ef3v5mDgQtqxVSdHc6PLwTajt8zsbCZf6NQOENhRfk
 vJDynGx5J5ma1UbRDzDw2jTtiMSO6+Tqv3EKPtE+YaLdgktgc2a23hVVVdwv87CylnT7
 myCFNmpw6oALntPPc2NDi2EpvDfIm7U2HZ8yD30TwUm1lck+HZzgmZXr5yLl8t3R6qlH
 RlH2NOOmlxp9VGzCNvBhtGkjIwbzKUZv2/USz8wP1A6g1y9FyzBdV+yu28MfhCAtuA3Q
 oYBTs9oQYWEFtT8RlYtKHrWGGG+Wq/1Tb15RX81QCCsnMAqqrHtzWOtC18wy3UBvdNzc
 +Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=C07GHj9IeKSD+01ybHduXrUR4BI7f2USZ0GIHzZJ/tE=;
 b=dblK1YYQW+Ki4eImQbUJIEwlo9Jod46pyESSnC0rMkFw2TdV52lbH82V9ScvF1SAWB
 n9jBrUngJ3fervxlttD/PPeeb+5c5iGCvq7oj2xYWvBTtxjxtKtTu6qqFCM9z6lIZiew
 msNeUAsjViTK2DFvR8GwSpd/QOg5Vb7BAI6rARqtL00mv+t8m+9m8PyO6CLZYNrU+3GI
 hyeWJqXfr/Pm54pa9p/NBDOjmwqBKXpGy9wkOiLLIFkMWyFJzV0CVO6ixAzGM+Jx2rIG
 IYNxFC+TI24h4y1O0hmf+BK6x+jGLShChMKsJHRLVNKkzk1qNoXpdiKUc9w/bNe70FQ+
 IPYA==
X-Gm-Message-State: AOAM530sBoINBSHp9S2uK7d6Cfp/MtpqRgwW+OMCPu57lQ/sJi5MmwWS
 F0PfYiiAWTs3DtnoC+2S1YI=
X-Google-Smtp-Source: ABdhPJxIhNQ6URU0LiIHWxCyWU/TEe5igKxWpx1kuGSaVeBbCWKXAzlCfgAMa9DKNKcwLD8m9e85aw==
X-Received: by 2002:a63:ea51:: with SMTP id l17mr7880906pgk.117.1616086555846; 
 Thu, 18 Mar 2021 09:55:55 -0700 (PDT)
Received: from slime ([139.198.121.254])
 by smtp.gmail.com with ESMTPSA id 205sm2880039pfc.201.2021.03.18.09.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 09:55:55 -0700 (PDT)
From: LKML <xiaojun.zhao141@gmail.com>
X-Google-Original-From: LKML <xiaojunzhao141@gmail.com>
Date: Fri, 19 Mar 2021 00:55:51 +0800
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Can not use hmp block_resize command with -blockdev option
Message-ID: <20210319004905.788b2ba3@slime>
In-Reply-To: <YFN9LtEBpVsykSwV@merkur.fritz.box>
References: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
 <ac58e1ea-6745-7e62-f8c2-68fceebe1c2d@redhat.com>
 <YFMwWFbRi6wNWFtG@merkur.fritz.box>
 <CAAeqyDsxuwuyeMR4zd-=LSSt3U-Ma-AzJmnqaBk0=V4zRzvGww@mail.gmail.com>
 <YFN9LtEBpVsykSwV@merkur.fritz.box>
Organization: personial
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=xiaojun.zhao141@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: zhao xiaojun <xiaojun.zhao141@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 17:17:50 +0100
Kevin Wolf <kwolf@redhat.com> wrote:

> Am 18.03.2021 um 16:15 hat zhao xiaojun geschrieben:
> > Thanks you, that's really good idea. And I also have the following
> > question:
> > 
> > There are some hmp and qmp commands in my scripts, they need the
> > device as an argument. Recently. i used the -blockdev replace the
> > -drive to specify the disk drive, then use  qmp's query_block to
> > query the device, but the device is NULL string. For the hmp's
> > block_resize, I can use qmp's block_resize do. But the other
> > commands(qpm's block-job-cancel etc.), they only support the device
> > argument. So I can only continue to use -drive to specify disk
> > drive.
> > 
> > I was trying to see the source(qemu v5.1.0):
> > qmp_query_device()  
> >   -> bdrv_query_info()  
> >       info->device = g_strdup(blk_name(blk))
> > the device is set to blk_name(blk), and the blk->name is set in
> > the monitor_add_blk()
> > 
> > the -blockdev:
> > qmp_blockdev_add()  
> >    -> bds_tree_init()
> >      -> bdrv_open()  
> >    ...
> > the qmp_blockdev_add() doesn't call the monitor_add_blk().
> > 
> > Questions:
> > Why can not qmp_blockdev_add() call the monitor_add_blk()?
> > Will the hmp and qmp commands that only support device as an
> > argument be compat with the -blockdev option?  
> 
> QMP doesn't have such commands. For commands that operate on the
> frontend (the guest device), they accept the id of the -device. For
> commands that relate to the backend, you can specify node-name.
> 
> It's only HMP that may not support these alternatives in some places.
> We can just extend it.
> 
> Kevin
> 

Ok, thank you very much.

Regards.

