Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379865815CD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:59:35 +0200 (CEST)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGM20-0007qn-7r
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLyz-0004P1-0Q
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLyp-0001ND-9j
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658847372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w/3e5GaWC+K2bLeW8CFafcwdLVTo2NmxLjdWWOcqHmU=;
 b=F8fzvg7Ns21ThAdJL86pK+1cvX/cUUnOofd39skWm/OzbpwDE9SMclJI9rctAqJDrmd5+7
 emsZ0FB3Y8TxDn+YI1kfu+OMihOtY0JVYCLM1Sm0HyLnuRCWt/hVxMJi7CD8WiZPT1Qc36
 hKXSa9i8pYdfy0r50q8Q/KuGec59wRQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-rHPFIg05N3adivjF_SJG5Q-1; Tue, 26 Jul 2022 10:56:10 -0400
X-MC-Unique: rHPFIg05N3adivjF_SJG5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 r9-20020a1c4409000000b003a2fdeea756so7080151wma.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=w/3e5GaWC+K2bLeW8CFafcwdLVTo2NmxLjdWWOcqHmU=;
 b=zo7dup7v75bbNIu/0MytlAdYbWnEFTh6gkWrAt4tT93uiwlmL3MkeJ547Hl70e2MaP
 ox3ZdCyBi3gTAvP2QqzLvIydERURlwXkao2YTFhRpMe8a+GwCFqUxYF3tu6adnzCewj5
 qilxXdhcC0pr2gFjuXFtdT9he1FZMTkqO94OwyoksQunqCctUhF/UdQCju6C3U2AStZO
 W7QLgIbNNefzMNjjCrlQypYW8+Y/Z3mxRJgRRPC62d4ULkMlmVmBU+AATaWxFkiLyPXS
 /ZFsOFQfCw5RBwf89E5/Hu69Ze/pkCGHwgeoRf3U/GtOD2HxdZQWwBhK59tSPG/MlvWW
 ZxaA==
X-Gm-Message-State: AJIora+yDkgqvtXSknVMZSJHycBdjWSWuK0WGEKKXXBlAe/8kyodPKAz
 v49BriTiE6T41uO8QlMIvfgYWU/jJCKyQ+MP4vkBmFrZDTNH9FypMOt2DS+a/HCKS57Tj5/revM
 dslNCFYagOxwMjyg=
X-Received: by 2002:a5d:5956:0:b0:21e:b904:750b with SMTP id
 e22-20020a5d5956000000b0021eb904750bmr928619wri.467.1658847369633; 
 Tue, 26 Jul 2022 07:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0GEPK/HB8NHv+uQMMEvwGn5683ZgrXJV5l0diPMDQc1E98t+fAx+B2Xnla0w2OxDl44XvpQ==
X-Received: by 2002:a5d:5956:0:b0:21e:b904:750b with SMTP id
 e22-20020a5d5956000000b0021eb904750bmr928601wri.467.1658847369260; 
 Tue, 26 Jul 2022 07:56:09 -0700 (PDT)
Received: from redhat.com ([2.55.4.105]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c205500b003a2eacc8179sm18738652wmg.27.2022.07.26.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:56:08 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:56:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, parav@nvidia.com
Subject: Re: [PATCH v2 0/2] vhost-user: Support vhost_dev_start
Message-ID: <20220726105512-mutt-send-email-mst@kernel.org>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20220712105501.688628-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712105501.688628-1-yajunw@nvidia.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 01:54:59PM +0300, Yajun Wu wrote:
> The motivation of adding vhost-user vhost_dev_start support is to
> improve backend configuration speed and reduce live migration VM
> downtime.
> 
> Today VQ configuration is issued one by one. For virtio net with
> multi-queue support, backend needs to update RSS (Receive side
> scaling) on every rx queue enable. Updating RSS is time-consuming
> (typical time like 7ms).
> 
> Implement already defined vhost status and message in the vhost
> specification [1].
> (a) VHOST_USER_PROTOCOL_F_STATUS
> (b) VHOST_USER_SET_STATUS
> (c) VHOST_USER_GET_STATUS
> 
> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
> device start and reset(0) for device stop.
> 
> On reception of the DRIVER_OK message, backend can apply the needed setting
> only once (instead of incremental) and also utilize parallelism on enabling
> queues.
> 
> This improves QEMU's live migration downtime with vhost user backend
> implementation by great margin, specially for the large number of VQs of 64
> from 800 msec to 250 msec.
> 
> Another change is to move the device start routines after finishing all the
> necessary device and VQ configuration, further aligning to the virtio
> specification for "device initialization sequence".

I think it's best to merge this after the 7.1 release.
I've tagged this but pls ping me after the release
just to make sure it's not lost. Thanks!

> [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html#introduction
> 
> v2:
> - add setting status bit VIRTIO_CONFIG_S_FEATURES_OK
> - avoid adding status bits already set
> 
> Yajun Wu (2):
>   vhost: Change the sequence of device start
>   vhost-user: Support vhost_dev_start
> 
>  hw/block/vhost-user-blk.c | 18 ++++++----
>  hw/net/vhost_net.c        | 12 +++----
>  hw/virtio/vhost-user.c    | 74 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 90 insertions(+), 14 deletions(-)
> 
> -- 
> 2.27.0


