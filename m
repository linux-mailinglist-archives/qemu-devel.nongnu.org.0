Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED13E4897
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 17:23:00 +0200 (CEST)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD77C-0007xq-KF
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 11:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mD76B-0007H4-6T
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mD766-0003Jk-Dp
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628522507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+81y37F7y6lU7HtjadpvTosGJlCp/L0jMgpQgQlv5PQ=;
 b=TnUtU7tLOAqbnV70I4SDAsZ579R8PpwdM3ABqEFDinlvnbeMQXw+HYtf/p5XkoJIF3qICc
 2WnG76bPz/beNB/SdlJTcYHPx9qo8CVKore2C2Mnm7pOLUrZWsfmDCHZ+b8epZlVA+7oHj
 kOsipoaap0Rsw1zHjlHQgk7QOQbL+EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-3zgN4OzwPZm8xUm3TZS7cA-1; Mon, 09 Aug 2021 11:21:44 -0400
X-MC-Unique: 3zgN4OzwPZm8xUm3TZS7cA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801CB802920
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 15:21:43 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 174DA5C1D0;
 Mon,  9 Aug 2021 15:21:30 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 74186220261; Mon,  9 Aug 2021 11:21:30 -0400 (EDT)
Date: Mon, 9 Aug 2021 11:21:30 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 07/10] virtiofsd: Add lo_inode.fhandle
Message-ID: <YRFH+vE30fwgGmu8@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-8-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-8-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 05:01:31PM +0200, Max Reitz wrote:
> This new field is an alternative to lo_inode.fd: Either of the two must
> be set.  In case an O_PATH FD is needed for some lo_inode, it is either
> taken from lo_inode.fd, if valid, or a temporary FD is opened with
> open_by_handle_at().
> 
> Using a file handle instead of an FD has the advantage of keeping the
> number of open file descriptors low.
> 
> Because open_by_handle_at() requires a mount FD (i.e. a non-O_PATH FD
> opened on the filesystem to which the file handle refers), but every
> lo_fhandle only has a mount ID (as returned by name_to_handle_at()), we
> keep a hash map of such FDs in mount_fds (mapping ID to FD).
> get_file_handle(), which is added by a later patch, will ensure that
> every mount ID for which we have generated a handle has a corresponding
> entry in mount_fds.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c      | 116 ++++++++++++++++++++++----
>  tools/virtiofsd/passthrough_seccomp.c |   1 +
>  2 files changed, 102 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 292b7f7e27..487448d666 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -88,8 +88,25 @@ struct lo_key {
>      uint64_t mnt_id;
>  };
>  
> +struct lo_fhandle {
> +    union {
> +        struct file_handle handle;
> +        char padding[sizeof(struct file_handle) + MAX_HANDLE_SZ];
> +    };
> +    int mount_id;
> +};
> +
> +/* Maps mount IDs to an FD that we can pass to open_by_handle_at() */
> +static GHashTable *mount_fds;
> +pthread_rwlock_t mount_fds_lock = PTHREAD_RWLOCK_INITIALIZER;
> +

How about if we move this hash table inside "struct lo_data". That seems to
be one global data structure keeping all the info. Also it can be
cleaned up during lo_destroy().

Thanks
Vivek


