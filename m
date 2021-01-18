Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9512FA05A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:51:04 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tzr-0004mt-Kc
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TxZ-0002FK-8S; Mon, 18 Jan 2021 07:48:41 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TxX-0000Qe-Kn; Mon, 18 Jan 2021 07:48:40 -0500
Received: by mail-pf1-x42c.google.com with SMTP id h10so10134409pfo.9;
 Mon, 18 Jan 2021 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ci2kbryIhLFn09vmeBliH6uVagjRgKxnuR99bRAqjPk=;
 b=H1Wecw5Bi7iOmBbhzMPptEqs5+eh3HdSmIeCaRryFFmZ+rn+AIr4nqxrvkWqRpSWSS
 MWQgAYI0E4X7JqkNTdYCX3ZjxvaABVNqGOFJgxVhONd/deAVa2PbA2oSmSDZuvqL/LeZ
 V3VnKW+3ZZ6lg6BMNkEyFyoXsgFIefDMr8+BTZyXo/iOH397YbnXNAgNzIUCWavQTHpf
 ANzutRhzEvwKNgYfuqxfIs9YXG5ZwVYO/Mf/1RUZ7b3XXcq0QJNy3iQwODQfaWBXU2Su
 VGf9tYbFQUosGW8asw8u9M7/eGBuHmV+B6OgHwNLdEMWVb//MGSxVdcogNap9jL0ZiDx
 0sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ci2kbryIhLFn09vmeBliH6uVagjRgKxnuR99bRAqjPk=;
 b=KeZzUj85EvrvSYtJkTN+5q3hcFGzUwLfdZ4NbBms6bWIFHrPxS+HxZwcAuvqmmdMg6
 VSF4ozFb1T0QDAQnpbfiYhdXvpuppRE0v+y9lDWir0bddtTb8/M+irqLbJamIv3Cvj16
 w/qbM/O2PHvSb3yS4f7mHuAs77EHl9fOjiw80z5WAUONV9Krl+aeVXpqdnY/XR8EUdSo
 s37RL/UDOCZEWKC7vfI0WPUUcDNqRLrDTIWRRdIYPQgCnb2le/3iYYr+l5ABzkqpDH3A
 Y44XXiEMYno4BjKUwM52O9mlrMLE2QZb6FsVKKHlMxRlSC18X8o6u94srHQ9vlkN3Gzm
 f1ZQ==
X-Gm-Message-State: AOAM5337MIbr07CgU8L/Z7hbzssYtCdjxab8a4yao/xbnhX95TDaU/9K
 b/ejLcRgEwFhcsvIthfwT78=
X-Google-Smtp-Source: ABdhPJxXsqsct55b03aj2gTHhX0BDs02KL9juqsnPeiAsEkAL2Mmb+KiS2GfMVt875XNVMPLzahy3A==
X-Received: by 2002:a62:79d7:0:b029:1b8:aed7:92c with SMTP id
 u206-20020a6279d70000b02901b8aed7092cmr1384749pfc.49.1610974117568; 
 Mon, 18 Jan 2021 04:48:37 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id b18sm16358488pfi.173.2021.01.18.04.48.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:48:37 -0800 (PST)
Date: Mon, 18 Jan 2021 21:48:34 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 04/12] hw/block/nvme: move msix table and pba to BAR 0
Message-ID: <20210118124834.GD18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-5-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21-01-18 10:46:57, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> In the interest of supporting both CMB and PMR to be enabled on the same
> device, move the MSI-X table and pending bit array out of BAR 4 and into
> BAR 0.

Nice!

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Minwoo Im <minwoo.im.dev@gmail.com>

Thanks,

