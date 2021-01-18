Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0F2FA550
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:57:25 +0100 (CET)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WuD-0004n0-2o
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Wss-0004J7-EU
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Wso-0003cO-Cv
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610985356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgv/vOo0cKwN5UEirMBvjTR+wBczbrgg8KoK/oi9fT8=;
 b=WTOddkPWGo1pkheOv4KiatZDd1+7lQMQuJx5eoaa45ctzH0PtF191mZyFwiw559DruJVUp
 T8i5DbyUuF86MsC6Pk3mJS8CGJCQ8Ydq3lshzO5EDMULJ6PWws593wlqWHZzNbOZgGW/iQ
 4yUfiQaAvDc7/zVfThDiXBWGw6Wr5rQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-XTzyUj-yNU29n_X7snzhbw-1; Mon, 18 Jan 2021 10:55:52 -0500
X-MC-Unique: XTzyUj-yNU29n_X7snzhbw-1
Received: by mail-ej1-f71.google.com with SMTP id x22so5297407ejb.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 07:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cgv/vOo0cKwN5UEirMBvjTR+wBczbrgg8KoK/oi9fT8=;
 b=mGD73zJg8xpRYZkbI8VYaBkjzZ7uA5wXOut8MsxG5ORbnL+X7dDmSllAFy0Z0IAMJl
 ulsXutLq4JzTk7t//TK3G3AWxC9ouOuHcJoXeUXtDSiZDBgBWt5fTEeCkF7UDAIx5N0O
 xqELrmdKEddYa1oGNaAtX7NGi6aTsDTkUrWuLHx5/Fl2hv6CZPmah6thWJzXyxZMb/+U
 20K2iaHWTZYrAiT8C8c1Sb8SZg+ooo1LUR8MXXQekJLoKtIXwVnK7FyNchCe4ajn1L7i
 EchsmLKUEjCzMeuzhlit9q8QpMc3rLTEQn0qPAxBQbPGte3xaoIzqeFjxUDQjQKvnLIF
 2gag==
X-Gm-Message-State: AOAM531N1yBydt7VBmc8x3YU4NU78Wd4ScFX05PCPVzw2FFdX1wTNhFd
 WQOBxOG671Gv83er0MlA2wT2nVUdQ48ThkW5XwXM7axRfrOqI9ft9C6DqYR91H5QM5Kp3YE4daU
 eUborRhhQLmZh3s8=
X-Received: by 2002:a17:906:a453:: with SMTP id
 cb19mr207669ejb.459.1610985351633; 
 Mon, 18 Jan 2021 07:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfzFOXzEg41XKZd7ypxEdqmlvDV5lj3zEgncHh1ApcYC3S6zvLKHOZz7mDLUNN7eiCD+A4fQ==
X-Received: by 2002:a17:906:a453:: with SMTP id
 cb19mr207656ejb.459.1610985351359; 
 Mon, 18 Jan 2021 07:55:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z24sm10889757edr.9.2021.01.18.07.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 07:55:50 -0800 (PST)
Subject: Re: [PATCH 1/2] block: Separate blk_is_writable() and
 blk_supports_write_perm()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210118123448.307825-1-kwolf@redhat.com>
 <20210118123448.307825-2-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a35ee6f1-e5b5-1261-16df-e986c5a05a03@redhat.com>
Date: Mon, 18 Jan 2021 16:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118123448.307825-2-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alxndr@bu.edu, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 1:34 PM, Kevin Wolf wrote:
> Currently, blk_is_read_only() tells whether a given BlockBackend can
> only be used in read-only mode because its root node is read-only. Some
> callers actually try to answer a slightly different question: Is the
> BlockBackend configured to be writable, by taking write permissions on
> the root node?
> 
> This can differ, for example, for CD-ROM devices which don't take write
> permissions, but may be backed by a writable image file. scsi-cd allows
> write requests to the drive if blk_is_read_only() returns false.
> However, the write request will immediately run into an assertion
> failure because the write permission is missing.
> 
> This patch introduces separate functions for both questions.
> blk_supports_write_perm() answers the question whether the block
> node/image file can support writable devices, whereas blk_is_writable()
> tells whether the BlockBackend is currently configured to be writable.
> 
> All calls of blk_is_read_only() are converted to one of the two new
> functions.
> 
> Fixes: https://bugs.launchpad.net/bugs/1906693
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/sysemu/block-backend.h |  3 ++-
>  block/block-backend.c          | 19 ++++++++++++++++---
>  hw/block/dataplane/xen-block.c |  2 +-
>  hw/block/fdc.c                 |  9 +++++----
>  hw/block/m25p80.c              |  6 +++---
>  hw/block/nand.c                |  2 +-
>  hw/block/nvme-ns.c             |  7 ++++---
>  hw/block/onenand.c             |  2 +-
>  hw/block/pflash_cfi01.c        |  2 +-
>  hw/block/pflash_cfi02.c        |  2 +-
>  hw/block/swim.c                |  6 +++---
>  hw/block/virtio-blk.c          |  6 +++---
>  hw/block/xen-block.c           |  2 +-
>  hw/ide/core.c                  |  2 +-
>  hw/misc/sifive_u_otp.c         |  2 +-
>  hw/ppc/pnv_pnor.c              |  2 +-
>  hw/scsi/scsi-disk.c            | 10 +++++-----
>  hw/scsi/scsi-generic.c         |  4 ++--
>  hw/sd/sd.c                     |  6 +++---
>  hw/usb/dev-storage.c           |  4 ++--
>  20 files changed, 57 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


