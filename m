Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2B68E49A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:50:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXie-00019v-7N; Tue, 07 Feb 2023 18:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPXiX-00018Z-TF
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPXiV-0004kK-Uf
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675813779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unYaIRoJnFKgcDqk9T3DNlKrEYdv8MB4hiw715We7ZI=;
 b=Xxs1024hsnK3HkFz4PgkdNCr4fKly18BOrXEnxnKbbKbnKT77GvQLOpXxyqAb4IcAG2XiV
 +9jkM8DUMR0JonYErv1wniXeRaMgNupgacs0o5TLaKVAXEw0aGTJFLfW+YSkgfevcd0T/p
 1N6VSkQdi4/WMtl4BVVmLBqeTF+MRp8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-6RBR1KYoOLuEDyKQyNATdA-1; Tue, 07 Feb 2023 18:49:38 -0500
X-MC-Unique: 6RBR1KYoOLuEDyKQyNATdA-1
Received: by mail-io1-f72.google.com with SMTP id
 d73-20020a6bb44c000000b0072805fbd06aso10324759iof.17
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=unYaIRoJnFKgcDqk9T3DNlKrEYdv8MB4hiw715We7ZI=;
 b=GW2jq7QXyhlWMIyGpd7RZXH+ykGOHWX43vpSfB+9oPiUqe2NgiVYIqHaEt+M7h65cC
 IXIFIkHcA/2Gb1cLzBSTuQjMpb0KNJ45Qgo43QFA6VP2feZ4XU+5csgbrpurLgrLkubC
 7ejRupUml2skSRGrUE+FzMDXXStU5+GdfpYhhP5kGsgbCdoNNPo7vN0sy8SXLUDCBqQm
 7v9hnHT8dq1p+25k4CShJrygNsw06NtYvJGEk0hYGMPCiQyGYjKUk1Ke5oc3q5qhO6Ey
 8E7WjbC0cbcJFHAuyXFhrUHbHk1l4bIDapj3ap9OUwnsJlj+yYrGdbZIaOF3DsTbfIRh
 PJJg==
X-Gm-Message-State: AO0yUKWBR+QfZ3ZJ1B+frGRhhKkX8FLyIWTtNcDk85bvH4wkVpyk+rZ3
 OBTxJVujyVr2oqrH1WGZQ4YH7CH0thvYXDzCSiQZvzQouRGp/uFRLWsxcqLZiHZPFtNLErrP1g8
 QXs7Kbfg4l/aO93g=
X-Received: by 2002:a05:6e02:1c26:b0:313:aa36:a4f1 with SMTP id
 m6-20020a056e021c2600b00313aa36a4f1mr6245340ilh.1.1675813777468; 
 Tue, 07 Feb 2023 15:49:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+uHVseIcSNXMNXrWAh2FbsGuv7ur9dnV3ML9aAbGil31oVqkuue17AMIVwUHbkeCPL0xFn/Q==
X-Received: by 2002:a05:6e02:1c26:b0:313:aa36:a4f1 with SMTP id
 m6-20020a056e021c2600b00313aa36a4f1mr6245313ilh.1.1675813777270; 
 Tue, 07 Feb 2023 15:49:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 bo14-20020a056638438e00b0039e8c12414asm4828877jab.164.2023.02.07.15.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 15:49:36 -0800 (PST)
Date: Tue, 7 Feb 2023 16:49:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v9 14/14] docs/devel: Align VFIO migration docs to v2
 protocol
Message-ID: <20230207164934.26833971.alex.williamson@redhat.com>
In-Reply-To: <20230206123137.31149-15-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-15-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 6 Feb 2023 14:31:37 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Now that VFIO migration protocol v2 has been implemented and v1 protocol
> has been removed, update the documentation according to v2 protocol.
>=20
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  docs/devel/vfio-migration.rst | 68 ++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 38 deletions(-)

A note about the single device limitation should be added here.  Thanks,

Alex


