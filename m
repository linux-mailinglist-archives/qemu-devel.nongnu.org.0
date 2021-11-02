Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447544309E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:40:01 +0100 (CET)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuxE-00080k-1y
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhuTV-0004aw-BN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhuTR-0004WY-FS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635862152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctmu+0Ps34o9dKPDYQWMMQd1gF0dlJoeUKE3PDEh2QI=;
 b=OEv0VndUCNu/1FWLo9RhSXNu4XkE7sd2YkyMd9hPiigT92K4SNrtGoTVfdO5uOZY3ejuYt
 8t9yC+mV2/cCnp9ARYbWH86nLr1AijsYIWrXLa0LReTKnxeA8qrb6ilh/8Gyn7F7dRnCe8
 Ff1GbzNGJD/CleRulGTMvZZRCKDmgOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-qq5VXqXsMpGb3IoYMpuViA-1; Tue, 02 Nov 2021 10:09:10 -0400
X-MC-Unique: qq5VXqXsMpGb3IoYMpuViA-1
Received: by mail-wr1-f69.google.com with SMTP id
 a2-20020a5d4d42000000b0017b3bcf41b9so4726637wru.23
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctmu+0Ps34o9dKPDYQWMMQd1gF0dlJoeUKE3PDEh2QI=;
 b=CCerUS7tVzjcdUYK6aoFGYn30yvAFdINiZRqmJrYDVXg3UldHmYRsV6ZuXlE8S4J4u
 D6VLHzxAcdQDFjrOIbn/cwB6G/4WL6sTgmp12EZ4mcH9zQDpOgaqCyclpNHxPq1bYcXv
 TcYRrA1GGQZ0uiJJ5/iUCNAH9Akgm/j6Fmm1sBW/Cqe5l+Og4W8IXTnoFxNweZsipeCv
 LUst4YtbMvkRxDhD9wGlv9BCi4xdOq94AF+HYz+JuIDwVIq10KBqisut97Tww5WtD6lg
 Xbf0EtjzQrFM1pnuHnWFv1rH1Tf4LWeFiPU0rPD5KDv5sDyWt3MmAFDm91+OveTQmMJb
 gFcA==
X-Gm-Message-State: AOAM533gmaCxUTkkuNL/7mdseGu4Oxcsndl7R0wYatRlJsn9Hxh4EcAK
 cmd14uw07uT6RtQhKdzuZ5WQuqytBX2ZJyRzyAfGAyw39Xnn15q4o0nru0U+Xq3FHDLgD3j5GnL
 4gt6l5JTNDimL7ZI=
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr14329079wrr.303.1635862149619; 
 Tue, 02 Nov 2021 07:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyuOP0+yeI7bhRocu9X/YJDTObPwn80QViNBih/n/fxfDp8EhHO5i6j+mqGPDyvS3uFIicWA==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr14329040wrr.303.1635862149421; 
 Tue, 02 Nov 2021 07:09:09 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id f81sm2859279wmf.22.2021.11.02.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 07:09:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v2 1/1] vhost: Fix last queue index of devices with no cvq
In-Reply-To: <20211102114059.1917341-2-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Tue, 2 Nov 2021 12:40:59 +0100")
References: <20211102114059.1917341-1-eperezma@redhat.com>
 <20211102114059.1917341-2-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 15:09:07 +0100
Message-ID: <87k0hqk5to.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
Y> The -1 assumes that all devices with no cvq have an spare vq allocated
> for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This is an invalid
> device by the standard, so just stick to the right number of device
> models.
>
> This is not a problem to vhost-net, but it is to vhost-vdpa, which
> device model trust to reach the last index to finish starting the
> device.
>
> Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the
> virtio device")
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Much clearer, thanks.


