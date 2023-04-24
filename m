Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50CB6EC6C7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 09:06:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqqFs-0003uL-8C; Mon, 24 Apr 2023 03:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pqqFq-0003u9-7Y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 03:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pqqFj-0005x3-Hu
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 03:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682319885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7sknfvl79fMUNapZC6tk/HRod7tEowFdnnEJrqP7Wk=;
 b=CF2Y/UphwOU/C3Nk+OG7MrnGgEKwUJf/W53Sji/IKIZgNT7xQQflDHc1zNipelvqWEiVK/
 A1qvzykGCtBU5l9u2fXg65F9tftSXc7siWNVZlctVNyLXr9BUGi5YNFNLbEBJihiW6jr3V
 XVQE6QbAjD6qnrCPYnEQ8amjFeSAcMU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-tf4nJLcpOiqTUUWWeMIf2w-1; Mon, 24 Apr 2023 03:04:43 -0400
X-MC-Unique: tf4nJLcpOiqTUUWWeMIf2w-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-b9963a72fd9so3051282276.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 00:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682319883; x=1684911883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l7sknfvl79fMUNapZC6tk/HRod7tEowFdnnEJrqP7Wk=;
 b=RbmdVM1/LCPEu/ECNYN+9FeycBFxkTA6HDyjzG4/aUxzAEtevfOT2xoMY3WoK+5pPv
 zLGllOVUYnrmavdcVQehT+sVHmbnIYeo3kVXZhP8eMZmEFiayn69e/3uBJGoxmV1M93Q
 /lL2a3kP3bpz9JHaNoRHoWEqbIdJpHFwtVBN0dqAgZJhUt81Vgo5WQWebJh2m6VegUBl
 10HnAXcdUFW5rf3ISiLMAh/RuYhlzaRaSOF1A8T1GgU/IKUpVnXB0s0z5Vxi6ByYgW0e
 e/s51EeWlJ3nYr0TLibGdqlfB9jWVqgawXJ1QUwJmIXXDgid/F3WTJYHiyX8PgvtPIq1
 cHRw==
X-Gm-Message-State: AC+VfDxatyd3v1IVg2lkusPL7I+5nMk2Ggak1v0hHvWw7yXZ5YmibFc0
 Rs9N4hHs4NOwwinegSo3/O1rfw1rOb8uQzwF+RXJfUPcNhRJ+6o1BVCHZRustKQQZimy14DWG8Y
 JOvXQ3mDAY3JVs9YVFDceHyGI8qBG36E=
X-Received: by 2002:a25:5502:0:b0:b99:96bb:21e4 with SMTP id
 j2-20020a255502000000b00b9996bb21e4mr1635954ybb.30.1682319883181; 
 Mon, 24 Apr 2023 00:04:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4s9DTmnhSDszZnqJFeqc1JqOCgtBxxNK5gKQxCYrU95YWfMgy6g+ka9slznQZlsD/mkzhM2pL/xL2nw7Pjt1s=
X-Received: by 2002:a25:5502:0:b0:b99:96bb:21e4 with SMTP id
 j2-20020a255502000000b00b9996bb21e4mr1635948ybb.30.1682319882991; Mon, 24 Apr
 2023 00:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681819697.git.ray90514@gmail.com>
 <CAJnb5S18+w9QX+W7CjnmB_eeo9RXsE-43otg1XRrvZJXP7EypA@mail.gmail.com>
In-Reply-To: <CAJnb5S18+w9QX+W7CjnmB_eeo9RXsE-43otg1XRrvZJXP7EypA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 24 Apr 2023 09:04:06 +0200
Message-ID: <CAJaqyWdP2b7+cQexvDM12+6TkJ+PDZok=xx61U52HNj=U8FPLQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] vhost-vdpa: cache Virtio states
To: Shao-Chien Chiang <ray90514@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sat, Apr 22, 2023 at 8:39=E2=80=AFAM Shao-Chien Chiang <ray90514@gmail.c=
om> wrote:
>
> Hi,
>
> I found a problem about cache.
>
> If there are several devices operating the same backend device, the
> cache might be inconsistent.
>

Hi Shao-Chien,

What do you mean by "several devices operating the same backend
device". The guest only sees "one virtio device per vhost-vdpa backend
device".

Thanks!

> I think we could handle this by checking if a device is the first
> device, but I'm not sure it will be feasible.
>
> Is there any better approach to this problem?
>
> Thank you!
>


