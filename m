Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FFC431326
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:18:39 +0200 (CEST)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOn0-0002Pk-Uz
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcOkO-0000t8-V6
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mcOkN-00030v-K6
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634548552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTN8zOIfI1WvHf0Oikwm+Yh3KRyiSoNVV6Q4t9QRtZs=;
 b=NwSW3rwQUWsgnM4HrW7zWvoYpNB18gKq+GSsUOvIDPiCponj4fpkun8qH4PN7Rej+K76fp
 jeyO23ZAml4jsussruFNp7vE0f8FrV6VemzKevVJEDPcX2jlnKdMorqqwasTICeoxx79ow
 WtANuYHfZr2YcH/kBoSgVHam46nxH74=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-OzRri7ZGPkuUJjuJoYEtiw-1; Mon, 18 Oct 2021 05:15:51 -0400
X-MC-Unique: OzRri7ZGPkuUJjuJoYEtiw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so13777226edq.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uTN8zOIfI1WvHf0Oikwm+Yh3KRyiSoNVV6Q4t9QRtZs=;
 b=fxI5fKW93phbODUMfiEQ+++0pPnBvt1WI7jkE1E07OO3q/mtwYoxVPqhDonk18q5yg
 knhSNfEN6eEipepwIQL9lZTSmn9Iin4hkEBBIA/CDNxA6iH5Mh3SKfhdQYTDNGMTZ3AS
 Idt0YYf5nb4CS5w53Avmra1t/Mke3kF2/8SbOow7PGs+Wgfof1GJEZDYcgYMJ2rkutAN
 3Tq51cyf3RhFpdMt2bjV3y8jJlVHmgbu4mfSMzVFf6tmBU44TCGzH7CyUrL+GAsQSVqR
 CRRPZ4Z2Z24t/Zk48+tUAVDiX5V4GLuQAHDZSY5IESlCGwO/x9RPxDyOhRw/W0YQehVc
 biOA==
X-Gm-Message-State: AOAM530+WiFH91VbsI5KZkCCvbe4Tb9mC8jCm5NcJ6D+ocwgVwApowjJ
 qhZLOePeuq5b957dN1nNyNcriPDCm6ytts6w9yIOjd6Cx2Hyr+nRD8A0kzG/41xUIgtKNunQqjt
 bqgtdIh0RwSQPb1U=
X-Received: by 2002:aa7:cb41:: with SMTP id w1mr43209722edt.327.1634548549942; 
 Mon, 18 Oct 2021 02:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx30oIX/+Ug3FvHspHTtkdF7zPjyCzKUtAKQWRcXsp4Wh/D1lfCsh9jDf0+zgx3GqNnqtcnzw==
X-Received: by 2002:aa7:cb41:: with SMTP id w1mr43209709edt.327.1634548549772; 
 Mon, 18 Oct 2021 02:15:49 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id e13sm8494236eje.95.2021.10.18.02.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:15:49 -0700 (PDT)
Date: Mon, 18 Oct 2021 11:15:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH v4 2/3] vdpa: Add vhost_vdpa_section_end
Message-ID: <20211018091547.4l6mscjuqhyi2rr3@steredhat>
References: <20211014141236.923287-1-eperezma@redhat.com>
 <20211014141236.923287-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014141236.923287-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 04:12:35PM +0200, Eugenio Pérez wrote:
>Abstract this operation, that will be reused when validating the region
>against the iova range that the device supports.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 22 +++++++++++++++-------
> 1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


