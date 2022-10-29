Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C83A612160
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:25:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooh8l-0004gC-Tv; Sat, 29 Oct 2022 04:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooh8f-0004fn-Sl
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooh8e-0002f7-4k
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667031859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUQJAZu5P8YNzlqbPkbZTbHTi8R7eHQNkbcr9tuj84g=;
 b=Gbk4xAvWZFJF0ZqeEg9LF23gVe68K/bgabuj8A+ii8864U93RRP4O0AA0wmJjCXA7Fcl9B
 e/iX7dycqvzaitPAZwLh1cHnTAHrqDhj2msHklmxKXEK7ceCeVD4/1pV87WTVnsCbypMQ7
 EJKOPyVwy/S+j1hGcFtvNRe2IQSDdSk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-eFB63lTKOKyRk5_5XJratg-1; Sat, 29 Oct 2022 04:24:15 -0400
X-MC-Unique: eFB63lTKOKyRk5_5XJratg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i128-20020a1c3b86000000b003cf4ff1b917so3424937wma.2
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 01:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUQJAZu5P8YNzlqbPkbZTbHTi8R7eHQNkbcr9tuj84g=;
 b=0CspsKwrAVMGUXobp5JGdm7BtMftzvZnHcOCnTKQVZOCVKopvvOrc2ffAefP/qc6S9
 zIpMtHPsXImZTc/3rUPtCjfH9efgZZ9AVpnEqoZ8Fu2X5cEHBefL/pAt233BoJpelNK0
 d1Y2e1+366C7uYwII0oH4bTqd5XTQNeAXqh3/SPCBnuVqMdt0Er6VhpY8O4B5/FIgNfx
 bT/wcImjj3vUfq7CiEQ0vkqJBx3ToEmtIgg6mw5N1mQt1HXH71zm6LRP2KO4YwaniJ8N
 aSA6CdLJA92WEHny/GWBTR3qDh3Fprhms/OUeDdzLd6E8XXI4FVHzESM7i25TesaNScM
 RHmQ==
X-Gm-Message-State: ACrzQf39AyZqhzKh+sskS94Gi3tElTJzaYNHcqjJFETe4qVVwtZh2Ldp
 jM/xk82/f36jIXsqb846LLcGS11Q2JPVXNys+7LxcbOyScWI+b+/BSbP8+g2SerO9MqkiMA5gDw
 8EMAyiI4//Yd76bg=
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id
 p5-20020a1c7405000000b003cf55ea6520mr1846586wmc.46.1667031854696; 
 Sat, 29 Oct 2022 01:24:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7H7fNyUIZBjHk8XydohqlPAnNP+rwoFjxks5oZzFxyltFj5wsGkaVAUyHH3cuCsgt/NS6Rvw==
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id
 p5-20020a1c7405000000b003cf55ea6520mr1846579wmc.46.1667031854491; 
 Sat, 29 Oct 2022 01:24:14 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f7-20020a1c6a07000000b003a3170a7af9sm946730wmc.4.2022.10.29.01.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:24:13 -0700 (PDT)
Date: Sat, 29 Oct 2022 04:24:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/4] Endianess and coding style fixes for SVQ event idx
 support
Message-ID: <20221029042349-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028160251.268607-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 06:02:47PM +0200, Eugenio Pérez wrote:
> Some fixes that did not get in time for the last net pull request.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Jason's tree since he has some bits this depends on.

> Eugenio Pérez (4):
>   vhost: Delete useless casting
>   vhost: convert byte order on SVQ used event write
>   vhost: Fix lines over 80 characters
>   vhost: convert byte order on avail_event read
> 
>  hw/virtio/vhost-shadow-virtqueue.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> -- 
> 2.31.1
> 


