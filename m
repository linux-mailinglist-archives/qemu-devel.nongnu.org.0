Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D79C4224E8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:22:59 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiXC-0002YZ-Mq
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXiUF-0007Wp-Mh
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXiUB-0001m1-VS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633432791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jSEoGefmUeGkSybYMs4wv84kOLOkJayuJH9HK8KPy34=;
 b=W0d1HTb7ZyI2GtnLlYJVAVf2ZSlO/YKqVKTapdAbO09jSIiYVn64n55Bj/0pZkuJGiSCdJ
 wyFu7BtWYURFdGHQv7fMQiDt+tn26CgSzy+fUDGTlB2PWSmAvQMYc9hPCq17HkgwAKZCZT
 BMYyXI2L2njOTiuWqsb0GMy1XOm4+sg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-I-eR-54lM2mF3PCFuGrihw-1; Tue, 05 Oct 2021 07:19:49 -0400
X-MC-Unique: I-eR-54lM2mF3PCFuGrihw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so20280055edi.12
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 04:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jSEoGefmUeGkSybYMs4wv84kOLOkJayuJH9HK8KPy34=;
 b=VPNssCBozKH+iajXJLRVt1RNbT1RZkIvdfBe5j5UpvW4lp21TOEeMmeGJPYuNUB1b/
 sW0ba8wmSYfJybpe54BBbpX1V8WWRZYF3P5j1SimnyJWiHr0SogNc7mw0/P9WkR9cwf5
 AuT5HtPIfp54lDL6/M0cLP51HRG96kLM7rfjWt9civkku5Ynulc2wi/qIE7AJLP5XOJ8
 rCal2imGTSiYtDnWteLHUYmeIT/xmioE+ovwJOYPsJswlZZIq/wPivqL45VAi9cFTJlr
 F2jEsUIaHy4pXJ8g4qRwFzoIwmpVQC36Uhr8AmFoapaofSowJir7+KuPjGdEf2xQguH5
 Sl2Q==
X-Gm-Message-State: AOAM532vuEU5syCWr6ZZ8xxqlRCMXkYsU/DiI3oVlSC3BbQ+iJqm5Kj2
 khfB7ctRkqIORFoZ0fNX0fJkGLpKkiGtZYWRnmX0W+RIJ/gktC0bsUEH+vkrtAawuEAVSTXow4u
 g4S3I8EfNzCvaxok=
X-Received: by 2002:aa7:c4d4:: with SMTP id p20mr10747481edr.210.1633432788330; 
 Tue, 05 Oct 2021 04:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdRoEkyNnwry05skb7AJ3fWoGhxqSrSrshv/yXG/o9u89199lpUCJr5EeCpKGubkYacImhpA==
X-Received: by 2002:aa7:c4d4:: with SMTP id p20mr10747435edr.210.1633432788107; 
 Tue, 05 Oct 2021 04:19:48 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t14sm7679086ejf.24.2021.10.05.04.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:19:47 -0700 (PDT)
Date: Tue, 5 Oct 2021 07:19:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <20211005071300-mutt-send-email-mst@kernel.org>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <54ce3304-ee62-4e95-eb4c-7ea1a81f30a0@redhat.com>
 <3198289.vhBqKWSW6W@silver>
MIME-Version: 1.0
In-Reply-To: <3198289.vhBqKWSW6W@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 01:10:56PM +0200, Christian Schoenebeck wrote:
> On Dienstag, 5. Oktober 2021 09:38:53 CEST David Hildenbrand wrote:
> > On 04.10.21 21:38, Christian Schoenebeck wrote:
> > > At the moment the maximum transfer size with virtio is limited to 4M
> > > (1024 * PAGE_SIZE). This series raises this limit to its maximum
> > > theoretical possible transfer size of 128M (32k pages) according to the
> > > virtio specs:
> > > 
> > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#
> > > x1-240006
> > I'm missing the "why do we care". Can you comment on that?
> 
> Primary motivation is the possibility of improved performance, e.g. in case of 
> 9pfs, people can raise the maximum transfer size with the Linux 9p client's 
> 'msize' option on guest side (and only on guest side actually). If guest 
> performs large chunk I/O, e.g. consider something "useful" like this one on 
> guest side:
> 
>   time cat large_file_on_9pfs.dat > /dev/null
> 
> Then there is a noticable performance increase with higher transfer size 
> values. That performance gain is continuous with rising transfer size values, 
> but the performance increase obviously shrinks with rising transfer sizes as 
> well, as with similar concepts in general like cache sizes, etc.
> 
> Then a secondary motivation is described in reason (2) of patch 2: if the 
> transfer size is configurable on guest side (like it is the case with the 9pfs 
> 'msize' option), then there is the unpleasant side effect that the current 
> virtio limit of 4M is invisible to guest; as this value of 4M is simply an 
> arbitrarily limit set on QEMU side in the past (probably just implementation 
> motivated on QEMU side at that point), i.e. it is not a limit specified by the 
> virtio protocol,

According to the spec it's specified, sure enough: vq size limits the
size of indirect descriptors too.
However, ever since commit 44ed8089e991a60d614abe0ee4b9057a28b364e4 we
do not enforce it in the driver ...

> nor is this limit be made aware to guest via virtio protocol 
> at all. The consequence with 9pfs would be if user tries to go higher than 4M, 
> then the system would simply hang with this QEMU error:
> 
>   virtio: too many write descriptors in indirect table
> 
> Now whether this is an issue or not for individual virtio users, depends on 
> whether the individual virtio user already had its own limitation <= 4M 
> enforced on its side.
> 
> Best regards,
> Christian Schoenebeck
> 


