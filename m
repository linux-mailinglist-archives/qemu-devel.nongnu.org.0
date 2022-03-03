Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F64CC9FD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 00:22:25 +0100 (CET)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPum7-0005YS-Rj
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 18:22:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nPukz-0004rC-45
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nPukv-00070y-9I
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646349667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxLpc9UKsAV1whWhbmYoiyLogAsP+vTi55DD1u7JIUI=;
 b=ZI/9U2FWCiWaxNePln93eJEPYULHXCXzR//RdHoEMWvXdZNwsmtM3Hfs65M5uKgWPg0Ych
 maRRFuVwlNFH51YVxLvFVmaAFReSuD5t6TFJb1W6OP3fH3oRYZnZedq3ItlHN/o0ANIR+2
 uvXCFG9TB9VK+pz38FgczS7VdJVQifE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-o5RsCIKmMbON6-jBHRl_sg-1; Thu, 03 Mar 2022 18:21:06 -0500
X-MC-Unique: o5RsCIKmMbON6-jBHRl_sg-1
Received: by mail-oi1-f197.google.com with SMTP id
 o2-20020a0568080bc200b002d64d89d460so4173000oik.17
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 15:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=kxLpc9UKsAV1whWhbmYoiyLogAsP+vTi55DD1u7JIUI=;
 b=zPVys686XFq5o5BQVycCadz7FhAei7HRnWYyBHRrFv2CEUjIlqoOnb1y5+QXw25G1K
 k4BudgJR/Go7XhvNYJumBRrdphlEp60Jr+ExYfic6aaux5Jjnz7pL9wqzO4ar2bx23ZB
 eG5Tr+3uM2Gjkb0op4dTJjFjBa+y3G3Nd0EB+YKkGo/HksLU75PjdsGoArSo0rnT/bIc
 XMjLaWGiDC1VCdgScaHIIZQAhMwldvQKS4TBTUUjfK2sBxLRRFOJsiRMDwuKR9kgfaoy
 coUFmll25Da4+S09H7nWEqxNIS2N3/1OJ+3wBUrKp7omtA1ql1/UDqKHHaOwrVnsknih
 6y0A==
X-Gm-Message-State: AOAM532uPDEsk4BTFDt5DQNgUZ9+wOc4NrzrkZs7r9E4yzl2uNeU/020
 PFx/JtYlY0sDUo5Ug15TSnmne/MeKCfV2jCds/KHdI9r6HbkzQykPVyFQiRllO6N8o9rqgGR8CS
 lsiCWU3BiZHSqsGE=
X-Received: by 2002:a05:6808:199a:b0:2d7:94b1:1b5b with SMTP id
 bj26-20020a056808199a00b002d794b11b5bmr6788714oib.59.1646349665999; 
 Thu, 03 Mar 2022 15:21:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy28P3h5gFr2lRX2azvNUJO7he4SP8NQBKmdPuoqgdeDpOTwmjPriPNWmOic9XpWgyhe47fFg==
X-Received: by 2002:a05:6808:199a:b0:2d7:94b1:1b5b with SMTP id
 bj26-20020a056808199a00b002d794b11b5bmr6788692oib.59.1646349665763; 
 Thu, 03 Mar 2022 15:21:05 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l19-20020a056830239300b005adc1d88a0fsm1583580ots.79.2022.03.03.15.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:21:05 -0800 (PST)
Date: Thu, 3 Mar 2022 16:21:03 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 18/29] vfio-pci: refactor for cpr
Message-ID: <20220303162103.0dbe93a1.alex.williamson@redhat.com>
In-Reply-To: <1640199934-455149-19-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-19-git-send-email-steven.sistare@oracle.com>
Organization: Red Hat
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Dec 2021 11:05:23 -0800
Steve Sistare <steven.sistare@oracle.com> wrote:

> +    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
...
> +    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
...
> +    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
...
> +    ret = vfio_notifier_init(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
...
> +        vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
...
> +    vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
...
> +    const char *name = "kvm_interrupt";
...
> +    if (vfio_notifier_init(vdev, &vector->kvm_interrupt, name, nr)) {
...
> +        vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, name, nr);
...
> +        vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, name, nr);
...
> +    vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, "kvm_interrupt", nr);
...
> +    if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", nr)) {
...
> +        if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", i)) {
...
> +            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
...
> +            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
...
> +    if (vfio_notifier_init(vdev, &vdev->err_notifier, "err", 0)) {
...
> +        vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
...
> +    vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
...
> +    if (vfio_notifier_init(vdev, &vdev->req_notifier, "req", 0)) {
...
> +        vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
...
> +    vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);

Something seems to have gone astray with "err" and "req" vs
"err_notifier" and "req_notifier".  The pattern is broken.  Thanks,

Alex


