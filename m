Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9233CE15
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 07:48:31 +0100 (CET)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM3VF-0002wZ-Rp
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 02:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM3U9-0002VS-4C; Tue, 16 Mar 2021 02:47:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM3U7-00054w-Jm; Tue, 16 Mar 2021 02:47:20 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c17so4561646pfv.12;
 Mon, 15 Mar 2021 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=YRZV3iuTIe5Hrs4JSc6xGK1OogM6BuJTgtawVeJlJJ53eZe+xIS+6ItHhYfTk2rJHN
 DdTlIt0ZgdC/EaZzKvIOIHYVhz73QQAQsNVit7D0wZoi5tclsaaqWNBSmYa+GCPTzbMs
 TeZnf8hHocGeuahHqINXJBBqT670v+7GM7JrjvSHT834YTs4dp+77nvcu9n5B+yOwquX
 YR5JAIKxnPno9wnGNIEbV+C7k+OoYED68W4jVxyg5k63h5FPIJ6jzhsfX4xrsY9FRpXM
 rD4H7kW6hDc9cCGJURu9ws8d+xyLZ206Pfj5cR6z8Bv4D5akHtVVJk6PNEBtC0mFWY5d
 h0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=IE15WFtA5J/QvQBETAo38iedGUEEQ6WIcExxv9MhZka0ZEhgtVtvq4uS086JhalR0r
 2bAQwHLr+hKByna0EOJ5aOoTdGJlqqEY3kfOndYA8o9LYcjOapWQxsV+YtgfBs0L5kqK
 idxsNqxW/IpQqbn269m8At2QauvepZc8pIWKUwt3JLlHLjEKggCTDu5cMCOTiETK7Tch
 Hu9KYEuqe8SebyoJhjtkGpNbdoRF0lsemnVhbRKcRq6xsOGusXy5ilQdx4fTcZYqpCxo
 krBctDGM0gYq6ZcUXxAr4GjluP4o58/6/4pT6pXW5J3fdM4nYB9HnPA8WmdtR+AEehb1
 HXrA==
X-Gm-Message-State: AOAM531dw9KstZzoDdXolTOv22Tzs+vTEKLhGERAFBtoN4PsvlUaLlBb
 jq1ZpNYJgERhyYnWaeWVzok=
X-Google-Smtp-Source: ABdhPJxCw9wEc4ct/AEmdMFxiXB4VO09Qcc0bLkx8FWSqZmp9sRSeATDZglOaZI5m4FNoMzumYSbHQ==
X-Received: by 2002:a63:1303:: with SMTP id i3mr2606782pgl.32.1615877236931;
 Mon, 15 Mar 2021 23:47:16 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c25sm14584938pfo.101.2021.03.15.23.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 23:47:16 -0700 (PDT)
Date: Tue, 16 Mar 2021 15:47:14 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 07/13] hw/block/nvme: prefer runtime helpers instead
 of device parameters
Message-ID: <20210316064714.GA23761@localhost.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-8-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210310095347.682395-8-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42b.google.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

