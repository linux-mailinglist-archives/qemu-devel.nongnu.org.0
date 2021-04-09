Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D4359CB5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:09:56 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUp1P-0007U1-FY
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUp0D-0006wC-4x; Fri, 09 Apr 2021 07:08:41 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUp0B-0008HB-Ni; Fri, 09 Apr 2021 07:08:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so2993152pjg.5; 
 Fri, 09 Apr 2021 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7H3JxhIRoh5c/32Y3lGmbIaslzah1mRNlLyeMVSOQBw=;
 b=l5Mvd4kxiTbzLL0DJvOME2+WduhF+GqWqE4mDLjWdZKWEAAAGV6vwCKFSZBznxWkVl
 ZcFn6cr48vgag0MVk9ZSXiXKOmtSX2CQrnT+UKIEuYqQrLeXESCcpSYcr+W0a3vCq6Hc
 WzzIcyEROa3IFAz5BdB/fOlkgNiQ5LjVikdrrvyjqZTuzU1FZWIQ0H90GAd9QQQMPjv3
 dLa9rHDPgmI6oDdPp+DjkEP1KPqXfQRW0pKwbFewmpmAhGdzi8EY+MWRDc4Uq/Z/Yzto
 Y8KMJ0YQrmRxHQSjOnLjm4UBdLPs/nFy+i8tuo+2EZcyF3XFsiGRhSglho2o2koVrlTV
 vbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7H3JxhIRoh5c/32Y3lGmbIaslzah1mRNlLyeMVSOQBw=;
 b=P/qSN6wjxE0Fh96xxSvc15dnJGW7kuyF9wTi5IWdAbF7thiMzSx23/CwcHaDKhcJKq
 eRu6sqq+Yy2AkAE6H41Yixt+f5RwMVFOyiJ9jbVZIwupCZJVAoiy3FY277aAJXns0rAI
 aDEm95iA3EUP6yBfZLE9akGy34lr6XX9k6zdQZ7T56UlLe2Y5A4kunFFcavNFElwNlqP
 hewS017kGZrlwMImV591HJSb2uoKtjxSn8lmZoGh75UI/OL1T+bg4qkb2sGe+T1NMzNk
 mGhvV8jQ16S2WISHwFCSZo1EVxOBu5IRoenM1rvSQ+vT/rLkjwFRt1Zt2D3GLiOoOD8U
 BkMA==
X-Gm-Message-State: AOAM531pNZtMvamWiKqVzg3WVX9lG1Gt3fZU7B/eES5HjUB7UMdJDOQ3
 y5Ivg4amroMjiSZvnXLhTo4=
X-Google-Smtp-Source: ABdhPJzJGJpvixxThnwuOAStmQEuT12jSBh4uzFgK+a6WLg0dqg+TMPBAEti4avYA3PN1dYQhH5zEA==
X-Received: by 2002:a17:902:988d:b029:e8:dd65:e2b5 with SMTP id
 s13-20020a170902988db02900e8dd65e2b5mr12520582plp.36.1617966517740; 
 Fri, 09 Apr 2021 04:08:37 -0700 (PDT)
Received: from localhost ([58.127.46.74])
 by smtp.gmail.com with ESMTPSA id s7sm2078504pjr.18.2021.04.09.04.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 04:08:37 -0700 (PDT)
Date: Fri, 9 Apr 2021 20:08:35 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/2] hw/block/nvme: store aiocb in compare
Message-ID: <20210409110835.GD2085@localhost>
References: <20210408193709.435939-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210408193709.435939-1-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1036.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-04-08 21:37:08, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> nvme_compare() fails to store the aiocb from the blk_aio_preadv() call.
> Fix this.
> 
> Fixes: 0a384f923f51 ("hw/block/nvme: add compare command")
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

