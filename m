Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF91D5F771D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:57:48 +0200 (CEST)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogl35-0002ed-8w
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogknn-0000tb-Rz
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogknl-0002K4-U3
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HSd5nFWGOBDThHVQmOgpohCBT3r7IspVbNKeq6tGMSs=;
 b=XxugYZLyT+jO/8k3uUPukAafgBLyBkjfbJu6B7XxLBLfjVRV+o5bvCallIA6+MSXhCICgG
 5aL2yjQGX98N84oKLVKlbfazOaQ3NymRYuFmNymTuL8pLQrJkwZZnsfrPZ/kypQNRg3nUk
 MxQdccOF8EfiDFdMf4p6xzpIQ3KsFC8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-l1lpNKbUNGy676pmFFGQLg-1; Fri, 07 Oct 2022 06:41:56 -0400
X-MC-Unique: l1lpNKbUNGy676pmFFGQLg-1
Received: by mail-qt1-f198.google.com with SMTP id
 s1-20020ac85281000000b003943f02f2e4so2794597qtn.16
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSd5nFWGOBDThHVQmOgpohCBT3r7IspVbNKeq6tGMSs=;
 b=BbMVITRYXtNmvv36sNEmBefE0ssN6fL1SySqgbVZt/DFxd3cbJ5onBK7V2cruWhmUt
 bDtj9h8uTZvDBJNoY0KSdieVdjG8rPEEOd5P7/1tJA9wD8KdAKRMJVQGM4vzOkhhbGPg
 pBPYG3YTFgq2kRuwPHgsby4Wqo5eLrb7C2yY0J7kbCfBwBRqVoLAr0l6JsovgQxmc4nk
 EPrdBkRTAe56vzFRSGpbXZScGIXmHj75rU8nUOoL9lakoIhgFNgE+sZLodhJfGhIVkP7
 P3U8QKIY67Y8IDJUdb8QmGkCnYYeIPIOiWxOmCZoW7NKk/s27gIgYrHAY5nTdd3GqXa7
 nCvg==
X-Gm-Message-State: ACrzQf10B6wncZ7rNtW/DG+B9HxQULM70B1dZoLZwKWY7qOooKQ/8E8g
 Yctyd3q2pOx9nPwv9A85HH+N355H9g/e4nw2aHOZLfAeO1CeVzxlayfHct0qsWtXceeKHPFGinu
 5addZwYR6rwca9T0=
X-Received: by 2002:a05:620a:2495:b0:6ce:bbe6:5bb4 with SMTP id
 i21-20020a05620a249500b006cebbe65bb4mr3080585qkn.674.1665139315706; 
 Fri, 07 Oct 2022 03:41:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4z3RPKW7xqkjzkLlsIjcVmO6kLwXsy2W26/MMEiBo8YvCijGS/njLC6VM2AUpPTO/5d4AJEA==
X-Received: by 2002:a05:620a:2495:b0:6ce:bbe6:5bb4 with SMTP id
 i21-20020a05620a249500b006cebbe65bb4mr3080571qkn.674.1665139315476; 
 Fri, 07 Oct 2022 03:41:55 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-222.retail.telecomitalia.it.
 [79.46.200.222]) by smtp.gmail.com with ESMTPSA id
 t13-20020ac8530d000000b0035d0a021dcasm1790099qtn.63.2022.10.07.03.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 03:41:54 -0700 (PDT)
Date: Fri, 7 Oct 2022 12:41:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: Re: [PATCH v6 04/13] block: pass size to bdrv_unregister_buf()
Message-ID: <20221007104147.eomrzcfoxbjcy4dm@sgarzare-redhat>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-5-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221006213507.645402-5-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 05:34:58PM -0400, Stefan Hajnoczi wrote:
>The only implementor of bdrv_register_buf() is block/nvme.c, where the
>size is not needed when unregistering a buffer. This is because
>util/vfio-helpers.c can look up mappings by address.
>
>Future block drivers that implement bdrv_register_buf() may not be able
>to do their job given only the buffer address. Add a size argument to
>bdrv_unregister_buf().
>
>Also document the assumptions about
>bdrv_register_buf()/bdrv_unregister_buf() calls. The same <host, size>
>values that were given to bdrv_register_buf() must be given to
>bdrv_unregister_buf().
>
>gcc 11.2.1 emits a spurious warning that img_bench()'s buf_size local
>variable might be uninitialized, so it's necessary to silence the
>compiler.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> include/block/block-global-state.h          | 5 ++++-
> include/block/block_int-common.h            | 2 +-
> include/sysemu/block-backend-global-state.h | 2 +-
> block/block-backend.c                       | 4 ++--
> block/io.c                                  | 6 +++---
> block/nvme.c                                | 2 +-
> qemu-img.c                                  | 4 ++--
> 7 files changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


