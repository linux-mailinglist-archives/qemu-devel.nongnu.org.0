Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449162FF902
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 00:42:25 +0100 (CET)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2jaq-00043D-B2
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 18:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2jZa-00033M-1x; Thu, 21 Jan 2021 18:41:06 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2jZY-0006Zs-Hy; Thu, 21 Jan 2021 18:41:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id g15so2695824pjd.2;
 Thu, 21 Jan 2021 15:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fJBswATF6Zjdit9uaBgq8yjkYx/L7CNiw+aa5C9WnQ8=;
 b=fmCzWs9IyvWjl9tywkRFfbZ/m18MxnQLOPMibNyuNIzMqUQRBbCuWpJa+ciQmwzM7m
 4F+cXv+BCieuYG0ZioQis+adEeKnfP20Ymw61H2nfyI1xTPxsjsin5WlmMxyuGM6K/7t
 tIQTfrrpIE5B0c+R+jSfgLdLItZK2FwWauXS58IXeGyr58RWjxgtHodXYWL6ae+HZcPt
 qCt2/ctaD1UhjAVNqLpZzWM+85PdI+/jmmQtl7oHDs16lw62rMmhfuX1Enbk1d81NpAC
 Vaf2qIUpBUwjRWaQUTM6wScl15pfM6C6sTIH3B7ULAbUBM3UaQTuuppzZB7YWfaNH1P9
 DjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fJBswATF6Zjdit9uaBgq8yjkYx/L7CNiw+aa5C9WnQ8=;
 b=nkzLXZgV3e4/qK1U86EDS/WadcaKZjZzRvxmF57T3HufjhSbMVhz6xpN0vVRcAaxeE
 yxOqs07r1UCYIAi2/qSAAbMgNSiTa19jxlSaBoTPxAV85wCUr9Mg+D2fdUP28sIbXS5D
 pZSd2FUdjWX2MnOt8veYWipweKmJi1GyD7tbBU+q8EdNPH3y3dK1p7YLYuSPEx5tUTte
 /VTEEdZLG8GXMXgftIpCySGL0RL5qqxzha1BEssjJvYhP72C9nOdQqVMeHvqYh1mFnwK
 niZSJSwn17LLdV8teYzC9KXvFESqvecoU/+8vhXm5V9L5Ig3g4fTkoARNWYnXjoAxSDk
 GFtQ==
X-Gm-Message-State: AOAM531NzT37MHc+NVbIT5z5V2jnvYhTlcARueMrerZAFWmF5coENvf0
 v51hlyKdqaNbLxii0uV5EWE=
X-Google-Smtp-Source: ABdhPJyPN05L0AOSnLTa0kLaE8//lgMnIfgRKoIfOeP3nx/LvPi6L+6qStHUd+bnAlL8z/f7YW8UhQ==
X-Received: by 2002:a17:902:8bcc:b029:dc:45d9:f8b2 with SMTP id
 r12-20020a1709028bccb02900dc45d9f8b2mr1905884plo.62.1611272462696; 
 Thu, 21 Jan 2021 15:41:02 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x125sm6335082pgb.35.2021.01.21.15.41.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jan 2021 15:41:02 -0800 (PST)
Date: Fri, 22 Jan 2021 08:41:00 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V4 2/6] hw/block/nvme: support to map controller to a
 subsystem
Message-ID: <20210121234100.GB2746@localhost.localdomain>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
 <20210121220908.14247-3-minwoo.im.dev@gmail.com>
 <20210121230338.GC1727271@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210121230338.GC1727271@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-21 15:03:38, Keith Busch wrote:
> On Fri, Jan 22, 2021 at 07:09:04AM +0900, Minwoo Im wrote:
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -23,6 +23,7 @@
> >   *              max_ioqpairs=<N[optional]>, \
> >   *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
> >   *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
> > + *              ,subsys=<subsys_id> \
> 
> For consistency, the ',' goes in the preceeding line.

I have no idea what happened here :(.  Will fix it. Thanks!

