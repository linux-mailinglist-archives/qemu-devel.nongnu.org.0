Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B801946E679
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 11:18:55 +0100 (CET)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvGVq-0001Wz-BH
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 05:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mvGTg-0000UH-1R
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mvGTc-00035o-KQ
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639044994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skSdkMP3/Z5ledz3SKJURFKwF+2QK06u2MtL2wrAHEA=;
 b=eJ3PPnqGbgDhaOFwlkM/pWlsQIi+recOU/k/PNnRCXZzMyx/m2uDqlH2c4YmJC153IL2IV
 Osh0vpH9yIMFTkPN1Bobj65JcZFSRAKVMJRZseojpDEyUS+J2QuUaMWm/j/RA2z3upqyrX
 rU7B6ID90F2sIjtr8dQd5ubBGymX0xw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-431-XIsIRlTTPuWEEYKW-4ZvAA-1; Thu, 09 Dec 2021 05:16:33 -0500
X-MC-Unique: XIsIRlTTPuWEEYKW-4ZvAA-1
Received: by mail-qk1-f198.google.com with SMTP id
 br9-20020a05620a460900b0046ad784c791so6372811qkb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 02:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=skSdkMP3/Z5ledz3SKJURFKwF+2QK06u2MtL2wrAHEA=;
 b=cBej3BGE1RTrnIrrGe4ImMSlj8rZnIJnISbpx7R84EIqTFepN8KntZZs6gCL28bQcr
 vOLy4xEx93187ILW1U21KvmHDjYL7GHam2FqnoFIFWA/kN1MB32txjCEP8U+1frBi9Z4
 8wSfHD85t4yY2X4s8XWhESiJ9QYKg6gXyj7owZ1Iv7MvJ48TgRQwN0nHgeTqSP3ePNS4
 +XM/A0kvHUKzIJz8RrCak15I3U7uaKPmcyUpmPmcCCgbclsfjV5CGMmCE7fOUpAtVK9h
 kFEFMN12+3uOiFoTFzx0KxxTubGaJY8nB1GX09W/zYFwWmYoAB7CKo702C+I6RjqUsoq
 XMuQ==
X-Gm-Message-State: AOAM530yRQtB72m0Vk0bdBKJaOW42DavKtzYt34/W9Zyr7BEiOSQaIgG
 t6RGAS7V0/qbTNSIzcvBE3SwppUinTkdpezejFJJx99fWDx1bvy0Vr6YYJtv/PjlB+JZ7WAuam8
 RSPmaxXfmLBEjg08=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr15827165qtw.78.1639044993491; 
 Thu, 09 Dec 2021 02:16:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRJ/jy5gwTgSypAPgE1xPC61ttuND6x5A5qbkOiCsntHwUEjX6o68lu/SOhEC/Ll9Ki4cxXQ==
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr15827126qtw.78.1639044993273; 
 Thu, 09 Dec 2021 02:16:33 -0800 (PST)
Received: from steredhat (host-87-21-203-138.retail.telecomitalia.it.
 [87.21.203.138])
 by smtp.gmail.com with ESMTPSA id y18sm3753945qtx.19.2021.12.09.02.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:16:32 -0800 (PST)
Date: Thu, 9 Dec 2021 11:16:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/6] aio-posix: split poll check from ready handler
Message-ID: <20211209101626.t5fkmsnjxwjveb5i@steredhat>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
 Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 01:23:30PM +0000, Stefan Hajnoczi wrote:
>v3:
>- Fixed FUSE export aio_set_fd_handler() call that I missed and double-checked
>  for any other missing call sites using Coccinelle [Rich]
>v2:
>- Cleaned up unused return values in nvme and virtio-blk [Stefano]
>- Documented try_poll_mode() ready_list argument [Stefano]
>- Unified virtio-blk/scsi dataplane and non-dataplane virtqueue handlers [Stefano]
>
>The first patch improves AioContext's adaptive polling execution time
>measurement. This can result in better performance because the algorithm makes
>better decisions about when to poll versus when to fall back to file descriptor
>monitoring.
>
>The remaining patches unify the virtio-blk and virtio-scsi dataplane and
>non-dataplane virtqueue handlers. This became possible because the dataplane
>handler function now has the same function signature as the non-dataplane
>handler function. Stefano Garzarella prompted me to make this refactoring.

Great clean up! Thanks for doing this, everything LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


