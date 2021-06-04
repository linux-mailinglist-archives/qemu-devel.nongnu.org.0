Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22D39C239
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:19:14 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpHDl-0004Kf-Db
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lpHCa-0003dF-6Q
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lpHCW-0006RS-70
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622841473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OI6zsPfx5okuSaahk8+HGebatqzqVlKR7FYmZQsVsLk=;
 b=Jtq9Y4Jz+khNdUIZ9h5xjMHmsN8LgX+aptOj++MQ/HjKLyoEh7MdWUIMZxrcaI4QfhBVrV
 F3bLFQZeBm6zyuzBne6Jp1TAOz6LIFbZeQGuRml5chFlbhz8oykbATQjHdsH0md7RDPO5X
 GI21d512KFXnvksBQX7By7+Pgkh/5Lo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-pCBN5OiAOX-hgcQjD1tlmw-1; Fri, 04 Jun 2021 17:17:52 -0400
X-MC-Unique: pCBN5OiAOX-hgcQjD1tlmw-1
Received: by mail-oo1-f71.google.com with SMTP id
 n62-20020a4a53410000b0290246a4799849so5723141oob.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OI6zsPfx5okuSaahk8+HGebatqzqVlKR7FYmZQsVsLk=;
 b=WCP37BwtZYJrBctKvAViHcPrz3pE35ESqt3OmwSJ7JEhr4MSLHaMbJe8w8LKuW9pJw
 Fdhgnrq8ZtAgD1KI67fNd6TaFmXbhl/kzwHdCE/Xwgma46XrFCOyyn6ai8RzLYNfJe+Q
 i7u9K5XgRp2Ir/A93mTWnNe74c6Lzs+kNcePwDQq4q04MTkeeF4ACNg6h0+WlcAmu84T
 //NZanytDwC+iR6pRIvXtfN1voJz1w4NcSTppLoZJBleqvIsmHdnI0n9pVaoYfWsh3WJ
 sg2a2L7xMI43yELOVZLJuS5vxLFJPMpRgihP++ndxrW/x8m+qWCVaoROuPTPqozTCmB0
 GCLw==
X-Gm-Message-State: AOAM532q47x+cBsck416zjLzoIsVKaC6XikFBg1oJpd7B2xomUqaFyq4
 Al0H6Hmd/b0FT7ZLG/ipRudigVtBZ+1yWfU9+y2oPAQ0oGoRvVkse+xQG/MS2n98EKEx8FmHd+v
 87PP9tSccj+oGBkY=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr5157850ooh.80.1622841471386; 
 Fri, 04 Jun 2021 14:17:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6KjIo2nKhml7WLd/fBiAVJU8fMe/l0OFwAulbZMkBZGAfhX1+d3ywlWFMUYkiPrSlvZGOmw==
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr5157844ooh.80.1622841471199; 
 Fri, 04 Jun 2021 14:17:51 -0700 (PDT)
Received: from [192.168.0.112] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 q6sm676461oot.40.2021.06.04.14.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:17:50 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH 0/9] virtiofsd: Allow using file handles
 instead of O_PATH FDs
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org, virtio-fs@redhat.com
References: <20210604161337.16048-1-mreitz@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <1ee5dea9-64d9-dc33-bc29-9caea1d59f07@redhat.com>
Date: Fri, 4 Jun 2021 16:17:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604161337.16048-1-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 11:13 AM, Max Reitz wrote:
> Hi,
> 
> This is the C virtiofsd equivalent to
> https://gitlab.com/virtio-fs/virtiofsd-rs/-/merge_requests/26.  As such,
> the summary is pretty much the same:
> 
> Storing an O_PATH file descriptor in every lo_inode object means we have
> a lot of FDs open, which is sometimes bad.  This series adds an option
> (-o inode_file_handles) that will make virtiofsd attempt to generate a
> file handle for new inodes and store that instead of an FD.  When an FD
> is needed for a given inode, we open the handle.
> 
> To accomplish this, lo_inode.fd is should not be accessed directly
> anymore, but only through helper functions (mainly lo_inode_fd() and
> lo_inode_open()).  A TempFd object is added to hide the difference
> between FDs that are bound to the lo_inode object (and so need not be
> closed after use) and temporary FDs from open_by_handle_at() (which do
> need to be closed after use).
> 
> To prevent the problem I spent a long time talking about (if we don’t
> have an FD open for every inode, the inode can be deleted, its ID
> reused, and then the lookup in lo_data.inodes will find the old deleted
> inode), patch 7 adds a second hash table lo_data.inodes_by_handle that
> maps file handles to lo_inode objects.  (Because file handles include a
> generation ID, so we can discern between the old and the new inode.)
> 
> Patch 9 is completely optional, but I just really felt compelled to
> write it.
> 
> 
> Max Reitz (9):
>   virtiofsd: Add TempFd structure
>   virtiofsd: Use lo_inode_open() instead of openat()
>   virtiofsd: Add lo_inode_fd() helper
>   virtiofsd: Let lo_fd() return a TempFd
>   virtiofsd: Let lo_inode_open() return a TempFd
>   virtiofsd: Add lo_inode.fhandle
>   virtiofsd: Add inodes_by_handle hash table
>   virtiofsd: Optionally fill lo_inode.fhandle
>   virtiofsd: Add lazy lo_do_find()
> 
>  tools/virtiofsd/helper.c              |   3 +
>  tools/virtiofsd/passthrough_ll.c      | 809 +++++++++++++++++++++-----
>  tools/virtiofsd/passthrough_seccomp.c |   2 +
>  3 files changed, 667 insertions(+), 147 deletions(-)
> 

For the series:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


