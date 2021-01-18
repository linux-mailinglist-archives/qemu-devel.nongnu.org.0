Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A42FA043
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:47:31 +0100 (CET)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1TwQ-0008KL-Gd
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TqI-0007NG-IH; Mon, 18 Jan 2021 07:41:10 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TqF-00060N-8O; Mon, 18 Jan 2021 07:41:09 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c12so10126342pfo.10;
 Mon, 18 Jan 2021 04:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RsKLyYQT1u7re3NnG9XSfr/PoCpdxe4Y/BT9as4ZKLo=;
 b=S6MWTNqJepZmFjlXURkiiRhPSWiPb5Cx5aCyw6kih3cHJc5RVHpsgZeMcH3q76/T6w
 jSHa1J/8bQGSQb9RyOU6F2dzR+/amerLVh0eQWJbpum7j5b6QK19IoIcwr7deQQu2PQr
 NleYJDti40xzKVeDrdAu5FZDNUcedV6HEFBgJions8L4/wRzu9u0FVQNYL1ztalEnU9a
 z1WklZZyL0LI5sXL4AFwbFphFcoadfSI/MHat+e8rkJkC/MHgaW7mAtSUPw9hFtwH6bE
 gacjPg0wRLTjnybY3+I9Z1Dk6DghSzuBpnn4lM5zLkrQdP0QbyxFHQkchBMpnkEguXvR
 EQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RsKLyYQT1u7re3NnG9XSfr/PoCpdxe4Y/BT9as4ZKLo=;
 b=jd+FbhEd45UkVEdxN3ark+taHjhiOoH20BrK+EekoAARAIP045H3jyuVFfmgq2Rx2V
 nzQlxYIcnR3q6O8ePPdNktOFN+5aIFD47/kwqWjaaZ9fvMGpXKB4E+W4WoqS0jNTMD9D
 RyCNGMxkEu28buGc2OZwBPbRGKQFpPtrbcdKxLtbA4rWPCY5fe1EUZxhVrTNl2icI6wH
 v+1jcSrM6woFpBX36TdVwDgK0cOL395BfCJzxSUtBK5qeWuo0zTfGy+Lb+Tazyl34lbS
 inYGxml/udSelOp9YUW0jwVkAUG9IS1JClOeo2UMprGtNu01NfWxltK0RSnzzzdC9l/R
 jXzA==
X-Gm-Message-State: AOAM533wBaBs5IjRVpMI9nopcvxDA9DPWAIuDKDNO2GIPtspxghbBbmn
 P6/KefOiVwK6THYxGZBTMaY=
X-Google-Smtp-Source: ABdhPJyMxt3CuDcB/3HTAYGOtJH3CvkcPUIJThWrE/agA13cwdM5HqH6wpYOD0C86NYfyAoyWLhWrg==
X-Received: by 2002:a63:2c9:: with SMTP id 192mr25564698pgc.325.1610973663472; 
 Mon, 18 Jan 2021 04:41:03 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id gz2sm16514400pjb.2.2021.01.18.04.41.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:41:03 -0800 (PST)
Date: Mon, 18 Jan 2021 21:41:00 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split
 writes
Message-ID: <20210118124100.GB18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42a.google.com
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

On 21-01-18 10:46:55, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> 64 bit registers like ASQ and ACQ should be writable by both a hi/lo 32
> bit write combination as well as a plain 64 bit write. The spec does not
> define ordering on the hi/lo split, but the code currently assumes that
> the low order bits are written first. Additionally, the code does not
> consider that another address might already have been written into the
> register, causing the OR'ing to result in a bad address.
> 
> Fix this by explicitly overwriting only the low or high order bits for
> 32 bit writes.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index bd7e258c3c26..40b9f8ccfc0e 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3781,19 +3781,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
>          break;
>      case 0x28:  /* ASQ */
> -        n->bar.asq = data;
> +        n->bar.asq = size == 8 ? data :
> +            (n->bar.asq & ~0xffffffff) | (data & 0xffffffff);
                             ^^^^^^^^^^^
If this one is to unmask lower 32bits other than higher 32bits, then
it should be:

	(n->bar.asq & ~0xffffffffULL)

Also, maybe we should take care of lower than 4bytes as:

	.min_access_size = 2,
	.max_access_size = 8,

Even we have some error messages up there with:

	if (unlikely(size < sizeof(uint32_t))) {
	    NVME_GUEST_ERR(pci_nvme_ub_mmiowr_toosmall,
			   "MMIO write smaller than 32-bits,"
			   " offset=0x%"PRIx64", size=%u",
			   offset, size);
	    /* should be ignored, fall through for now */
	}

It's a fall-thru error, and that's it.  I would prefer not to have this
error and support for 2bytes access also, OR do not support for 2bytes
access for this MMIO area.

Thanks!

