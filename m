Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB64252AA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:09:09 +0200 (CEST)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSCy-0002lg-NN
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mYS9W-0007r8-Sr
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mYS9U-0008KE-Fm
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608330;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8wlsJXr8oi58CoxyFl/DEDYl5DICG+6webUTI7uZ/Ho=;
 b=dIkbaBhR7gt5STqTgWB5NX5PYrKPNHbyBlIdrKWQu7R/cJU8YgvbWiloyIL1mpdouc4C6X
 uDe0McrJ6p/FkxhfXw7zKAWM78KP9FZzYIlfrVfLxYu3n53ioiQVBVxdEHibODXFKDcD2v
 WD2C1mE+oJrm2lTyoUzHo+IAKHgjSDA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-eIA17r-yPxCd33_0gxtElw-1; Thu, 07 Oct 2021 08:05:27 -0400
X-MC-Unique: eIA17r-yPxCd33_0gxtElw-1
Received: by mail-wr1-f69.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso4508393wrb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8wlsJXr8oi58CoxyFl/DEDYl5DICG+6webUTI7uZ/Ho=;
 b=yivU71AiTQhOhKVGZLHREijx8X4koUP3+5TD5oM8Hb1IgmgJTNqxUvLrs2pc95SoXO
 GydQT21hHGXyWMhbn5LJ8hvm/yftkTXyLDww1EVV51zzUt78OJy2Fm/Wnv3pfalr53iI
 NyVvC0XQp5tOjDdVW76ZqIp2I9di/oCXuLWuJ2iS7NUcpM7wAAJNfMEEDlRHWHwPLXtR
 YXEGHxugTXtIoDcjTeZlL21AR5SyKo3cV+mhsS4EI1AGVek0bixbzXax4meWhZStQ/qi
 W6FuJDJRRw4iHdxPbVITuhBTjC5x8z93t9EzdtdLFFqVnR97a8nAiuvnOlnmDvrQV+3W
 EWpw==
X-Gm-Message-State: AOAM530CxWhGmm9JjAr4nILKuI0UTonrX+ZdF07ZXqHkCRq8ThA5Dn7A
 wdqmJc2LnzUnIa35DEZkxFVNJAOJIe6zrLL8DArhDI3ErJIoMsZ/Z5g1qPB5AD4MsRkOOw5k2Yt
 EmKsXWMGEHXwrQ88=
X-Received: by 2002:a5d:6d02:: with SMTP id e2mr4971516wrq.198.1633608326360; 
 Thu, 07 Oct 2021 05:05:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm9cGfmWaLBPNuX74MGg7LBPI3k54ibsK6OVC0fUrTktgnsexVZt+W0ziQXYVV1phEXuMuEg==
X-Received: by 2002:a5d:6d02:: with SMTP id e2mr4971480wrq.198.1633608326146; 
 Thu, 07 Oct 2021 05:05:26 -0700 (PDT)
Received: from localhost (static-168-39-62-95.ipcom.comunitel.net.
 [95.62.39.168])
 by smtp.gmail.com with ESMTPSA id z16sm8543964wmk.6.2021.10.07.05.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 05:05:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v3 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
In-Reply-To: <20210910070255.509349-2-lizhijian@cn.fujitsu.com> (Li Zhijian's
 message of "Fri, 10 Sep 2021 15:02:54 +0800")
References: <20210910070255.509349-1-lizhijian@cn.fujitsu.com>
 <20210910070255.509349-2-lizhijian@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 07 Oct 2021 14:05:24 +0200
Message-ID: <87sfxddoqj.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> Previously, for the fsdax mem-backend-file, it will register failed with
> Operation not supported. In this case, we can try to register it with
> On-Demand Paging[1] like what rpma_mr_reg() does on rpma[2].
>
> [1]: https://community.mellanox.com/s/article/understanding-on-demand-paging--odp-x
> [2]: http://pmem.io/rpma/manpages/v0.9.0/rpma_mr_reg.3
>
> CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>

Reviewed-by: Juan Quintela <quintela@redhat.com>


