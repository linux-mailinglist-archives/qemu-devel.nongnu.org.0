Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C842E6E95FC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:41:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUW9-0003li-S8; Thu, 20 Apr 2023 09:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUW5-0003lK-GI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUW3-0005QJ-Ps
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 iw7-20020a05600c54c700b003f16fce55b5so1170749wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998002; x=1684590002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/GiG+Nst/1MJjUfnBePcObQL8ovvkVXUYIAzxiDMAvw=;
 b=N01w+0tV15vawofusJhYNrRm5ORcEtfZ0ry9sdj4Pw02eBe4DdzvXjAumMEc7D5hjm
 QqpBF8AqT8NOA/bBR5G2chpRptcvD5tVJwSx9knt1hfLTAnB5ZwaIPYaP0gpyMW3Xy39
 Hq2hhmqtMcpvrwvcB7hTE/UpaMVLoewWn5MfNo5TMHOe6KvpQ25ag1IM3mgjwHqYwvSu
 ZaAXHVihzqQmg8jo8Q5kBnro8pwpCrADL2rc2uu87XQgafSiWUH5VtIs6fZiy4h1HGLM
 gGzVSp1Sk85w/LxzSWSPmfNrtDn2H+KvmA6KfH10aDrTLyek3Nq0f9GGVDTnXeNbsl0X
 TT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998002; x=1684590002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GiG+Nst/1MJjUfnBePcObQL8ovvkVXUYIAzxiDMAvw=;
 b=JnKWk4ACKq0eDFF1SHrXHfDNpaRFWj/NOK14+hbk/qJ6hfhcPjOpq1mwbtrGRVIsP9
 6IIksMO6XTKyewl8ergucxQXwmcSS5qGy40uaVCGa33tEfS8fvQjvQzEzLkqTiC0ujqe
 g5NakCR2BlrnzNDu8LxpHcFYbwfW4IN2IRSW5zP2L1duPDa2xpoHS/FgPLiQWzteDB+U
 y7/tzaZ0QMHTBzgurUPg/6U3RBEDFazs3wL+yvXQv9zOBo+tggR+2utd9ssFzvcv845i
 0L2891NikkVG7jklVnLmx4xB9v4VpQSePSJAlqHT2K65BAnapgJ4XZPwgWPvBxy9yHG6
 quGQ==
X-Gm-Message-State: AAQBX9d5r/FQ0YudHetXLMKqkoVqd0jApIuRuK0SjT5bJ8o1kYWbTgGa
 nZKxnE4YICWhhcHRzFQ71Bj9mA==
X-Google-Smtp-Source: AKy350bCAvGEny4oQbcK6hW+EriPXZ9h1014EIUuUtSNCjgSOgE+vXvCzTLS1YG+SVNb9B5PGSUOYQ==
X-Received: by 2002:a7b:c8c9:0:b0:3f1:7b8d:38ec with SMTP id
 f9-20020a7bc8c9000000b003f17b8d38ecmr1157488wml.35.1681998002127; 
 Thu, 20 Apr 2023 06:40:02 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm5547824wmq.35.2023.04.20.06.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:40:01 -0700 (PDT)
Message-ID: <1e1f3a54-7113-7929-38a1-23d97bfa4d45@linaro.org>
Date: Thu, 20 Apr 2023 15:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 00/20] block: remove aio_disable_external() API
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Hanna Reitz <hreitz@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, eesposit@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

On 20/4/23 13:37, Stefan Hajnoczi wrote:
> v3:
> - Resend full patch series. v2 was sent in the middle of a git rebase and was
>    missing patches. [Eric]
> - Apply Reviewed-by tags.

> Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)

It seems kevin/block-next got rebased and doesn't contain 087bc644b76.

Based on 3d1ba50c4b ("vmdk: make vmdk_is_cid_valid a coroutine_fn")
I get:

Applying: hw/qdev: introduce qdev_is_realized() helper
Applying: virtio-scsi: avoid race between unplug and transport event
Applying: virtio-scsi: stop using aio_disable_external() during unplug
Applying: block/export: only acquire AioContext once for 
vhost_user_server_stop()
error: patch failed: util/vhost-user-server.c:346
error: util/vhost-user-server.c: patch does not apply
Patch failed at 0004 block/export: only acquire AioContext once for 
vhost_user_server_stop()

Hmm patch #4 is already merged as commit 2957dc40a2, let's skip it:

$ git am --skip
Applying: util/vhost-user-server: rename refcount to in_flight counter
Applying: block/export: wait for vhost-user-blk requests when draining
Applying: block/export: stop using is_external in vhost-user-blk server
Applying: hw/xen: do not use aio_set_fd_handler(is_external=true) in 
xen_xenstore
Applying: block: add blk_in_drain() API
Applying: block: drain from main loop thread in bdrv_co_yield_to_drain()
Applying: xen-block: implement BlockDevOps->drained_begin()
Applying: hw/xen: do not set is_external=true on evtchn fds
Applying: block/export: rewrite vduse-blk drain code
Applying: block/export: don't require AioContext lock around 
blk_exp_ref/unref()
Applying: block/fuse: do not set is_external=true on FUSE fd
Applying: virtio: make it possible to detach host notifier from any thread
Applying: virtio-blk: implement BlockDevOps->drained_begin()
Applying: virtio-scsi: implement BlockDevOps->drained_begin()
Applying: virtio: do not set is_external=true on host notifiers
Applying: aio: remove aio_disable_external() API
error: patch failed: util/fdmon-epoll.c:131
error: util/fdmon-epoll.c: patch does not apply
Patch failed at 0020 aio: remove aio_disable_external() API

Now this clashes with commit e62da98527 ("aio-posix: fix race between 
epoll upgrade and aio_set_fd_handler()").

Indeed reverting both e62da98527 / 2957dc40a2, I can apply your
series.

