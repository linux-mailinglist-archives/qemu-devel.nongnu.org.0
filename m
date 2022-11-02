Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46429615A94
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 04:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq4Ub-0007Pi-PP; Tue, 01 Nov 2022 23:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oq4UZ-0007P6-Ds; Tue, 01 Nov 2022 23:32:39 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oq4UX-0002n0-KE; Tue, 01 Nov 2022 23:32:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7974FB82055;
 Wed,  2 Nov 2022 03:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC847C433D6;
 Wed,  2 Nov 2022 03:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667359952;
 bh=4sPaz7joPFXGepysS3iHatc/y0ipXa1G1+/AAEBp5BQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRnRwqQtorEN574DXSv/IYhEFoUgvvaq/4FasU3bnwwRe5rE8KMY2oXNKmFWvPJpY
 xr8M9HuYLGSlx0SCqurfxySH764MbhBhnw74Jru8picuZvGIUTmNNF+mLqTlDu6o0S
 eOL7U5q5rF3FoXftC9BwDH7sssn3dECZ27Z5/3mtou3yRgkLKAbOjes0FaRIAhaumD
 IYL6h6zWp+ZZGqD7OKI7f8xQCRfbnD5wFzdqdioj2v621rb+iIRseZ21IUHV6YFfI2
 7FN57FNG73pdk8LVPGQqCTq7h3oeuUK09n9Yz7rD36Z9ivLmvEQOAXHxndhLzxn6A6
 4dk+3BK9RWG2w==
Date: Tue, 1 Nov 2022 20:32:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, nsoffer@redhat.com
Subject: Re: [PATCH 2/2] file-posix: add statx(STATX_DIOALIGN) support
Message-ID: <Y2HkziU7YVYv4KWJ@sol.localdomain>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101190031.6766-3-stefanha@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ebiggers@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 01, 2022 at 03:00:31PM -0400, Stefan Hajnoczi wrote:
>      /* Let's try to use the logical blocksize for the alignment. */
> -    if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0) {
> -        bs->bl.request_alignment = 0;
> +    if (!bs->bl.request_alignment) {
> +        if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0) {
> +            bs->bl.request_alignment = 0;
> +        }
>      }
>  
>  #ifdef __linux__
> -    /*
> -     * The XFS ioctl definitions are shipped in extra packages that might
> -     * not always be available. Since we just need the XFS_IOC_DIOINFO ioctl
> -     * here, we simply use our own definition instead:
> -     */
> -    struct xfs_dioattr {
> -        uint32_t d_mem;
> -        uint32_t d_miniosz;
> -        uint32_t d_maxiosz;
> -    } da;
> -    if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >= 0) {
> -        bs->bl.request_alignment = da.d_miniosz;
> -        /* The kernel returns wrong information for d_mem */
> -        /* s->buf_align = da.d_mem; */
> +    if (!bs->bl.request_alignment) {

This patch changes the fallback code to make the request_alignment value from
probe_logical_blocksize() override the value from XFS_IOC_DIOINFO.  Is that
intentional?

> +        if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >= 0) {
> +            bs->bl.request_alignment = da.d_miniosz;
> +            /* The kernel returns wrong information for d_mem */
> +            /* s->buf_align = da.d_mem; */

Has this bug been reported to the XFS developers (linux-xfs@vger.kernel.org)?

- Eric

