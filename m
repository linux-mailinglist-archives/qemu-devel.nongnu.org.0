Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2C68AF2C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObp3-0008G7-0n; Sun, 05 Feb 2023 05:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pObp0-0008Fq-7C
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pOboy-0004hR-4T
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675591226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x6Wu53dQREPaWjN2F0WV43ST2m/1rV+/y/+m3BeMvb0=;
 b=dYJo3bmccyH+BASw+BGFD0/KCBXcKhx0rhVPY/0+Naf127xqrbK5zrtxAmOjUxjZ6lcyKW
 SK6K/HWIllJerhNpG01gthil7hzxm3chM4RqkCWnKSY9KdcHk/byCXFIYIcddvgGnT/Own
 iMPwugORbIAZsU/67w0AaMvdVpQUvTk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-0H6UwB-ZM4CLokRDQNEnqQ-1; Sun, 05 Feb 2023 05:00:24 -0500
X-MC-Unique: 0H6UwB-ZM4CLokRDQNEnqQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003da1f6a7b2dso7300694wmb.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6Wu53dQREPaWjN2F0WV43ST2m/1rV+/y/+m3BeMvb0=;
 b=Grl1Wbkf1/lcERTtkRIWpEcNGMSlkK3nQobltvJB7xYki1gNmMizgcmJZ4U4lwEqeo
 8M0uesC5OCMWoJdze3S/vKtbZxJYSAvHtI3aXK8HO6Ky625YlbW6zVrRMR/7RVOtjqJY
 YLRszI8wkGOs4ZWrLL64FxK6CFu6cXqtjYO29+PkdM9qvRoP2kcSfSXWbdwxtmKalKUN
 zLpHn37BVl+BnY50P3+R/ghnOUT09EEeh2v9WQxbVdKCNr2eLAplUToidzLhWY9Ugsvm
 LFL5jXR6fgGGhYqvsxKwPeGDUsGHkt/PY3+ibsQBZGlzRno+Fj3d+hlXf8dA2rhlRBwT
 Qr7Q==
X-Gm-Message-State: AO0yUKUODTQJ68OC6T8VUsFPruvPSEcTW004GbajiyssVhm5lrOz0pPb
 Q+RDvhv1Hr7WLoYJfuvgJBqUP7baYUcb8r3NVUl32yAbXpZxYfLuhDyzWjxah8BzSacQtUOZOY9
 fGdKlb6G5+SqBRhE=
X-Received: by 2002:a5d:5c09:0:b0:2be:5c4a:de6b with SMTP id
 cc9-20020a5d5c09000000b002be5c4ade6bmr15042581wrb.3.1675591223364; 
 Sun, 05 Feb 2023 02:00:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8H7HVA2reIwU7zvc1S6E21unsR8BzH3rJEEHpvR+WuwjZ4V9MVSILp1Zjt4iuNn7poJxj1lQ==
X-Received: by 2002:a5d:5c09:0:b0:2be:5c4a:de6b with SMTP id
 cc9-20020a5d5c09000000b002be5c4ade6bmr15042568wrb.3.1675591223192; 
 Sun, 05 Feb 2023 02:00:23 -0800 (PST)
Received: from redhat.com ([2.52.129.177]) by smtp.gmail.com with ESMTPSA id
 b12-20020adff90c000000b002c3e89039casm368430wrr.12.2023.02.05.02.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:00:22 -0800 (PST)
Date: Sun, 5 Feb 2023 05:00:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 alvaro.karsz@solid-run.com, Shannon Nelson <snelson@pensando.io>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
Message-ID: <20230205045833-mutt-send-email-mst@kernel.org>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
 <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
 <a7367dec-2f96-c748-8f62-7bd03c3de263@oracle.com>
 <CAJaqyWe3d0i85DS2+yS9nZ6dZkcXyOEmYng-vKVk=6G3Ty-mfg@mail.gmail.com>
 <fbb445f5-05c5-dea4-b694-9b001e342091@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbb445f5-05c5-dea4-b694-9b001e342091@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sat, Feb 04, 2023 at 03:04:02AM -0800, Si-Wei Liu wrote:
> For network hardware device, I thought suspend
> just needs to wait until the completion of ongoing Tx/Rx DMA transaction
> already in the flight, rather than to drain all the upcoming packets until
> avail_idx.

It depends I guess but if device expects to recover all state from just
ring state in memory then at least it has to drain until some index
value.


