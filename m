Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D6C3A6AEC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:50:33 +0200 (CEST)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsorA-0005Gk-Iw
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lsoSv-0007rT-SE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lsoSs-0007lQ-Nc
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623684325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fr1kT2dDfPEc3+mTzzipry+ZdcNibqIk7kn0DcwOYT4=;
 b=dXybSG/+d/bevbUoxjQfet+Dk7knbxYVxk24Dcz2/Z3g2bVLaerHhpq3KFPeHNRgQHMzlF
 sSI7umhrqB99xuRm85fAMvP/0iivx1ULGWnps+u7xXzgSiVPuqz/WBN+QUCfLujEu9Pi4D
 1Y4zO9pep8nVS0DHj6rwysZfNY8cu2Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-HUTDapwcP3KnL8frTgUU0Q-1; Mon, 14 Jun 2021 11:25:23 -0400
X-MC-Unique: HUTDapwcP3KnL8frTgUU0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v20-20020a05600c2154b029019a6368bfe4so129988wml.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fr1kT2dDfPEc3+mTzzipry+ZdcNibqIk7kn0DcwOYT4=;
 b=jIl3KcFMy21UdLF/TQY2JDDayYiViUFcNgTRt/A1D33DwGjC2FHZryMSO6QNX+jQ6X
 2gf6JoYh8qrYeDg526JBaPeyQGpBk1d3tqNIIUjfIXwCpJXcK6XOtIeSxOkWvFQQBnbv
 MsQYoox3VNdnCPE+g3uDgQCW/InN5xALSMmOvgPsHgpQ4OAzg5OCYmXNIv9u4oIuTZ4r
 mCyaskBD7pESK+1tHIT1aIVjbKGwLDmPw3lcSyjuklvGApuzQVgSItobruw143O3Jf/7
 Dsyds9kiFFyqo39Vg3yWjZ2KxxCJRlLICZfDV9DQuPmlm5Vjc7jNVizRt+87dZxDriMC
 J6zg==
X-Gm-Message-State: AOAM530ee8qrEibV275k4USzr2xO2TixBa4bGdp0DWRL8PHCMKottffY
 nSuLWKFCPFEm8XCSeYAG1AWKxlpKTfJ2HrIsugks0orL4Es9Np/bWkWTIaYJYzpj3KPk8t+ifym
 741lsrLReFDofi9Y=
X-Received: by 2002:a5d:494c:: with SMTP id r12mr19137141wrs.421.1623684321919; 
 Mon, 14 Jun 2021 08:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIxXhqumcj/k4/7PxU+6ky1CRuQxN/JbTByJDsh1HxHBOwDpYFoXrcRkL9OCm2Wd7c9Rl3ow==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr19137109wrs.421.1623684321683; 
 Mon, 14 Jun 2021 08:25:21 -0700 (PDT)
Received: from [192.168.0.5] (ip4-95-82-160-17.cust.nbox.cz. [95.82.160.17])
 by smtp.gmail.com with ESMTPSA id r2sm17134043wrv.39.2021.06.14.08.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:25:21 -0700 (PDT)
Subject: Re: [PATCH] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210611114606.320008-1-philmd@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <3d9db4c8-49f3-9313-ba6a-20e225eedcfb@redhat.com>
Date: Mon, 14 Jun 2021 17:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611114606.320008-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, qemu-stable@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 1:46 PM, Philippe Mathieu-Daudé wrote:
> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
> -ENOMEM in case of error. The driver was correctly handling the
> error path to recycle its volatile IOVA mappings.
> 
> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
> DMA mappings per container", April 2019) added the -ENOSPC error to
> signal the user exhausted the DMA mappings available for a container.
> 
> The block driver started to mis-behave:
> 
>   qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>   (qemu)
>   (qemu) info status
>   VM status: paused (io-error)
>   (qemu) c
>   VFIO_MAP_DMA failed: No space left on device
>   qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
> 
> Fix by handling the -ENOSPC error when DMA mappings are exhausted;
> other errors (such -ENOMEM) are still handled later in the same
> function.
> 
> An easy way to reproduce this bug is to restrict the DMA mapping
> limit (65535 by default) when loading the VFIO IOMMU module:
> 
>   # modprobe vfio_iommu_type1 dma_entry_limit=666
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Michal Prívozník <mprivozn@redhat.com>
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Michal, is it still possible for you to test this (old bug)?
> 

Unfortunately I no longer have access to the machine. But, IIRC it was
fairly easy to reproduce - just passthrough any NVMe disk using NVMe
disk backend (-blockdev '{"driver":"nvme", ...).

Sorry,
Michal


