Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8643CE6F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:12:30 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflXQ-00019y-Kx
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mfkvY-0005N5-FU
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mfkvQ-0006ol-V3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635348791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LbTw5RdCBbk7mSqMfjlgY/jo+9kargrdnPczNL3830=;
 b=jH5zoeRNSw2lxhojSkd7ctHaDa3FyI6Flbwj0/nHVmFo2jJoS1Q3fx0YZ2a9SerNlWWa85
 eEcpCwIvd/tdH/Akk7RPeyn3LFSzC35OO4cxkxSqKozcXHb6rI5CwzjHnhokuN38WVpXFE
 YmvdxzxoKae6HwsvhL8DKacfkdW8w9A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-fCCyX1qKMNO7mbSfHWKEHw-1; Wed, 27 Oct 2021 11:33:10 -0400
X-MC-Unique: fCCyX1qKMNO7mbSfHWKEHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso1435176wme.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4LbTw5RdCBbk7mSqMfjlgY/jo+9kargrdnPczNL3830=;
 b=yTi6vgucI8ZzWgIyKApIcjcogD1I2KeL3ylumtU/kmJCgf1ayL12rcQHO190iER0sr
 BQ5UegaGgAlM7JKkZE6DEzwhmpT+hMesGeYJ0lD8/VSC3+9HT7xW2umyOGa9ghlaPVhI
 CQptWiD3YGFDLT3xNPTw5W6k6foVBndhfh99byKoVYSNkdwYLFngN7iiCSuF4VOtR6qK
 lxpb6S2UCRkW/Fwt/ijLIciDbrOMCT2LPxzWZYjDDxmfxEjTR6IHPUkVUR+3aqu0FqS1
 aRfJoScxuJ5DtR9ZBehRG7SKCzBNW6W6X8txkYJtt9fWKTyX9ui44wRkjKaXNSQ9ymW0
 lX7w==
X-Gm-Message-State: AOAM532ZeQxFWZZ7qiyjhd120WSMDCSDiflOz1znbRMX3d9+DgvBldei
 1uOcjR+F4ai4Jj9DcPimY5qjHdJbSZUrPPYEw5p+BcChrhLGrDJhD5ndIC3V1MW3U/xRVUdbytU
 tpd+41nOvIyR+x70=
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr36722078wrn.291.1635348789103; 
 Wed, 27 Oct 2021 08:33:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpQZUP2sBX55AWGDuLgHVqCKu1ZKjs2Z/KakgNx4x2sxb1c8gCRSsxKWcnL4FHm9zGTfYvwQ==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr36722028wrn.291.1635348788870; 
 Wed, 27 Oct 2021 08:33:08 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:a543:72f:c4d1:8911:6346])
 by smtp.gmail.com with ESMTPSA id r1sm122264wmq.15.2021.10.27.08.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 08:33:08 -0700 (PDT)
Date: Wed, 27 Oct 2021 11:33:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
Message-ID: <20211027113245-mutt-send-email-mst@kernel.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
 <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
 <8fc703aa-a256-fdef-36a5-6faad3da47d6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8fc703aa-a256-fdef-36a5-6faad3da47d6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 04:11:38PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/27/21 16:04, David Hildenbrand wrote:
> > On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
> >> On 10/27/21 14:45, David Hildenbrand wrote:
> >>> Let's return the number of free slots instead of only checking if there
> >>> is a free slot. Required to support memory devices that consume multiple
> >>> memslots.
> >>>
> >>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>> ---
> >>>  hw/mem/memory-device.c    | 2 +-
> >>>  hw/virtio/vhost-stub.c    | 2 +-
> >>>  hw/virtio/vhost.c         | 4 ++--
> >>>  include/hw/virtio/vhost.h | 2 +-
> >>>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> >>> -bool vhost_has_free_slot(void)
> >>> +unsigned int vhost_get_free_memslots(void)
> >>>  {
> >>>      return true;
> >>
> >>        return 0;
> > 
> > Oh wait, no. This actually has to be
> > 
> > "return ~0U;" (see real vhost_get_free_memslots())
> > 
> > ... because there is no vhost and consequently no limit applies.
> 
> Indeed.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

confused. are you acking the theoretical patch with ~0 here?


