Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE641F80B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 01:07:52 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWRd9-0007OI-0r
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 19:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRZh-0004sz-Sk
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRZe-0001LP-Hr
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633129450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra1lHhjZUOTCnmEE8WM3NAbcqn1BizoBSiNbor47Qa4=;
 b=DDBwJXAebSG+2edx7ETGJtbVGBxImdGprk4GGzLv95YSMyaZLeM1tJHPGkfynFdpj9pqiF
 iRCk/7szM/6f3CKSMsZszxi6TlbDiLaUlHRC5FtNsmMeImwzyOm/ncZvI9XqEXQ39nOtye
 f1MaxJqROIfEqyjDyaSwn7HGF+0w8DY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-EukDonprM5a6dwef2e3D0w-1; Fri, 01 Oct 2021 19:04:09 -0400
X-MC-Unique: EukDonprM5a6dwef2e3D0w-1
Received: by mail-ot1-f71.google.com with SMTP id
 m12-20020a0568301e6c00b005469f1a7d70so7573183otr.15
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 16:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ra1lHhjZUOTCnmEE8WM3NAbcqn1BizoBSiNbor47Qa4=;
 b=GljKs5ykn/QGmnhKak9HcuC2WwaRIhzoJUQdY7Z5p/fuPKM4IzZLNud30pgG0y2GC1
 EE2DDFCSfropioxqgBCvFXj//Hlz0in02OVohY1swbw7F1xkZYSnAxm9jyTgfnUQPTPb
 UUL/qoCtH8KrIwKdKfZFRbLJ0ReAVLQq9LybM4jGowa1mNq6TuPskxMOovabDcQlOZil
 XvOfUP+kPMWE3BNLFSw2ziPN31M4qoiu3rBoFvFr3CS7ZV6ukcJ8USkbpPWC0SIYIWoo
 bg4R+jSrQlZBnHo/xxIagNDnlui+LZW3dfIBx8ti7YJCKyNu00Q8nSsTr255+TkTKlco
 CCtA==
X-Gm-Message-State: AOAM532Ys8fl8a9FP1wSVVe86pIDXWdjElYpnGJ1wwy9NYuvcbxnGXrL
 56ObReBXGlNX4tyr6yIPekOSzckoOWMdP8qxWiaYOEGmjGgFHLxZLUKCZRL1pnYQkeTZ/zmOUGa
 VqrmvUZbQa5DbKC0=
X-Received: by 2002:a9d:655a:: with SMTP id q26mr393777otl.130.1633129448478; 
 Fri, 01 Oct 2021 16:04:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCZXZGPRMlxePPZjmoVfEFhSy5zNu2c79PsRqoKEvj5+Fh8FD/36m2qguTS9f/CkYt4aGVZg==
X-Received: by 2002:a9d:655a:: with SMTP id q26mr393764otl.130.1633129448261; 
 Fri, 01 Oct 2021 16:04:08 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id g12sm1423797oof.6.2021.10.01.16.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 16:04:07 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:04:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v3 4/9] msix: simplify the conditional in
 msix_set/unset_vector_notifiers
Message-ID: <20211001170405.085fa9e1.alex.williamson@redhat.com>
In-Reply-To: <20210920230202.1439-5-longpeng2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-5-longpeng2@huawei.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sep 2021 07:01:57 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> 'msix_function_masked' is synchronized with the device's config,
> we can use it to replace the complex conditional statementis in
> msix_set/unset_vector_notifiers.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/pci/msix.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331cd0b..67682289af 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -592,8 +592,7 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>      dev->msix_vector_release_notifier = release_notifier;
>      dev->msix_vector_poll_notifier = poll_notifier;
>  
> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +    if (!dev->msix_function_masked) {
>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>              ret = msix_set_notifier_for_vector(dev, vector);
>              if (ret < 0) {
> @@ -622,8 +621,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
>      assert(dev->msix_vector_use_notifier &&
>             dev->msix_vector_release_notifier);
>  
> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +    if (!dev->msix_function_masked) {
>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>              msix_unset_notifier_for_vector(dev, vector);
>          }

This appears to be a cleanup that's not required for the functionality
of this series.  I'd suggest proposing it separately.  Same for the
patch 5/9 in this series.  If it makes a functional difference it
should be described in the commit log.  Thanks,

Alex


