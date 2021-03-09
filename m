Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AB3323CC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:18:49 +0100 (CET)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaO0-0005xx-Qu
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJaIz-00022F-DO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJaIv-0005RE-6i
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615288411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/h/qPO3Oaa7gOJMO7Ztb7QxyFaaYV0WGiqQsXDt3FU=;
 b=a/yQKGITf4pYx9iepelY3zJ3SQPPxsD8eVQEAOR8oEvfU9JVLLsP1w0J7r+yQEKYd5UF9I
 OpfS7KN4MHhb0qjoca1h5KP9li1SQsDFu9Nq4pgCu9lj30siUZirLKOskZPaLUu2yaF86+
 nuFhTldlwW5bpYGtM1JBsFQWA3iGwug=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-aVsivXw-NOK4xDlQ63W7JQ-1; Tue, 09 Mar 2021 06:13:30 -0500
X-MC-Unique: aVsivXw-NOK4xDlQ63W7JQ-1
Received: by mail-wr1-f72.google.com with SMTP id s10so6276170wre.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D/h/qPO3Oaa7gOJMO7Ztb7QxyFaaYV0WGiqQsXDt3FU=;
 b=po48AFiQh+2fk+bJNl7VEj6TD2y9pdxXxZ5GDeCJ/cwjR/IfXp4xdBvY9oVSpvlDbW
 ZiKTOOJW204hM8g5Pq55hNRdE9GnCZaBpexk73bwGhxhQ2lCQR2Jiv+s9sDBJVz9NHBM
 WwkiBy5h4f2Brx9T8zuHn1lmouBjQnFfAC5VJ3wIZjA6DRm//UUBK1wZPixV9/lRhXDR
 lVFprWsZyHBRZJuW0mMCfRma0iOoHqYW6N2x6T0b/U3/afiNmQtSEKagu4fXOq1Kw6Qm
 Mcc0jLp25xlwzR0m2pFjVk3+nDSjYgrMpxqc55ti1Rk/Lvc4J0Go1G8ysVO4QY6YS/bO
 hedA==
X-Gm-Message-State: AOAM530OB4vl8Vul3XJcMccgRoaOGZ/l8AYZH3nUmFkO2TFso2/r4P8g
 JO3Sag/tIYwvMkiVRiV46DB/Bi1ch7Wc64n1s4StzytxNMLP0a8/5BL1MYeBLaj+xlZC1OjYSpR
 +/irQ7X26TT2JsJA=
X-Received: by 2002:a5d:4521:: with SMTP id j1mr27069812wra.354.1615288408920; 
 Tue, 09 Mar 2021 03:13:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRsduoQKBTGJxlqWIYfquAqRuXK8LZX1NIVMWEbr/2NTsb4B2FRI5vGT7hyZGCZs3lofqY3g==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr27069790wra.354.1615288408736; 
 Tue, 09 Mar 2021 03:13:28 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id b131sm3613282wmb.34.2021.03.09.03.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 03:13:28 -0800 (PST)
Date: Tue, 9 Mar 2021 12:13:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] virtio-net: calculating proper msix vectors on init
Message-ID: <20210309111326.wwjt4kxikrmtqbwz@steredhat>
References: <20210309042314.45817-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309042314.45817-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 12:23:14PM +0800, Jason Wang wrote:
>Currently, the default msix vectors for virtio-net-pci is 3 which is
>obvious not suitable for multiqueue guest, so we depends on the user
>or management tools to pass a correct vectors parameter. In fact, we
>can simplifying this by calculating the number of vectors on realize.
>
>Consider we have N queues, the number of vectors needed is 2*N + 2
>(#queue pairs + plus one config interrupt and control vq). We didn't
>check whether or not host support control vq because it was added
>unconditionally by qemu to avoid breaking legacy guests such as Minix.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
>Changes since v1:
>- Fix typo in the commit log
>- Explain the magic number during vectors calculation
>---
> hw/core/machine.c          |  1 +
> hw/virtio/virtio-net-pci.c | 10 +++++++++-
> 2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


