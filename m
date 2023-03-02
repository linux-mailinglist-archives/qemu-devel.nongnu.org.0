Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD86A816D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhLZ-0001dt-Ex; Thu, 02 Mar 2023 06:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXhLW-0001Ql-V9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXhLV-0006wb-H7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677757417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAiF2Qw9ZH5wbEi7MkMCAKOw0vminbMbhvvampX9yCE=;
 b=Qsmdr+AWNJdtrS3GmKswhZrSPm68joc6GqIeIP6HPsSXfzJCfrv9IzonKj6U18lAOOi3Np
 azdnH/IGFJ+2Ee9ftGdjPHttZRCsxK9ItuA4YSKK65m/vMmIGTihahAJ1IK9wc00EceGO1
 uqgnMUOYqtij0woAMIunkJQibkhfkeY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-be4B7BHBP4e6RhNgTFCblw-1; Thu, 02 Mar 2023 06:43:35 -0500
X-MC-Unique: be4B7BHBP4e6RhNgTFCblw-1
Received: by mail-wm1-f69.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5665040wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677757414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAiF2Qw9ZH5wbEi7MkMCAKOw0vminbMbhvvampX9yCE=;
 b=H0c/9CWcHwVrE0CJCSNC2F3casWicd3obp3iXMDLPiYBzEpqgbxM5P03vrS6lA+FLX
 BN75ohtejCgiakDDAH7jJcl+6jm7H6PcoZt9/otR08yssuqm/oyLiuB+KguP9dtr2T/S
 FDqtXOH428YdYI03JNqE6UnBEZNj4SeNpwpWmQT/udvN6alEzhvJ6JzwkRaAZugMO9kY
 cJ6BUZrjKYHT+42p2dCX0XXKhy59Iv2/dZJv2KX40oX5t9Z4xKMdvv4CHY1smSXOs/DO
 PRRk5gtPegItZpocy7f1WivMyq4YrdLMKFRURjQd5MLT+bR6ynWhI7w35GP+HyPSBzRM
 opBg==
X-Gm-Message-State: AO0yUKUQPvCcDRgnqp+boGgzlGztjYCSk+edlVWVu0oPoaT5eH423u1Q
 N2UzEAdA1tko7VnCWoOuaTMI+7txll8GUAq1AgmvBkCk5rSflZ9+Ju5ZZuvix+tcYHp8zHWiuN2
 xSROrhBVr6Ls5onI=
X-Received: by 2002:a5d:658f:0:b0:2c5:3cfa:f7dc with SMTP id
 q15-20020a5d658f000000b002c53cfaf7dcmr7777923wru.7.1677757414367; 
 Thu, 02 Mar 2023 03:43:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9NFUjgVSes/kUGT6iUWt81AqDIpeKjnS6VnHra0YJW+x8mx4HzysMZNjc1RPM6eK1G3d0WzQ==
X-Received: by 2002:a5d:658f:0:b0:2c5:3cfa:f7dc with SMTP id
 q15-20020a5d658f000000b002c53cfaf7dcmr7777910wru.7.1677757414099; 
 Thu, 02 Mar 2023 03:43:34 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm15314431wrw.83.2023.03.02.03.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 03:43:33 -0800 (PST)
Date: Thu, 2 Mar 2023 06:43:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>,
 alvaro.karsz@solid-run.com, Lei Yang <leiyang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
Message-ID: <20230302064234-mutt-send-email-mst@kernel.org>
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
 <20230301163325-mutt-send-email-mst@kernel.org>
 <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 12:30:52PM +0100, Eugenio Perez Martin wrote:
> > You need to pass this to guest. My point is that there is no reason to
> > get it from the kernel driver. QEMU can figure out whether the flag is
> > needed itself.
> >
> 
> Ok, I can see now how the HW device does not have all the knowledge to
> offer this flag or not. But I'm not sure how qemu can know either.
> 
> If qemu opens /dev/vhost-vdpa-N, how can it know it? It has no way to
> tell if the device is sw or hw as far as I know. Am I missing
> something?
> 
> Thanks!

This is what I said earlier.  You can safely assume vdpa needs this
flag. Only exception is vduse and we don't care about performance there.

-- 
MST


