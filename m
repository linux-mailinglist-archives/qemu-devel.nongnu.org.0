Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B8403ADD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:43:31 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxrO-00006K-Cq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNxpi-0006N1-BJ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNxpf-0007ep-3e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631108501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8ealqYrj3dgeAAGSVTclyEM8X1UR7NF4NIOY48DEyk=;
 b=XfpMrMIFUJlmbDNGjCj8XrRVrYnhGs+v05p3h06Kb4mrG5O6enk4T+On+ZJJM3WnVtDj+X
 dSqDMvM6SA+UJg7+Ai9JwoF49CXAJUZJ2QsUJXo+aWXkVgf3a93ActclK4VPhWkV55PB5y
 zbMuPbkreuDCQcXiyCUXc3NDBGkzles=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-9m--i34UMtS26wcrcZBkHA-1; Wed, 08 Sep 2021 09:41:40 -0400
X-MC-Unique: 9m--i34UMtS26wcrcZBkHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 ch11-20020a0564021bcb00b003c8021b61c4so1086404edb.23
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 06:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u8ealqYrj3dgeAAGSVTclyEM8X1UR7NF4NIOY48DEyk=;
 b=qTsBhwTsI8N88ccojB6tqM2JSUxkP0l8GrWfQMuE5Cc93Z0CpG2TlcST/EbgPJDdqJ
 7PEeV9jBQjiUJJuW1m/ZXabc5hIS1DGwJPdBUKtre0YaxEqFwe0cxYk1hdfzmQsSpS4S
 7IOHtZNKfTgYpZuJqp0fj8J9m++lI5IA2a5odbEYEaatALSE/rWFdr7i8Uuoe7vy2RAz
 Kx20Dp1IUyX75Z6MDuKPW+mVUApsn+AwA1ZOd27tzdobldhL9p5yvIZ4b4nZQTdsb/RC
 pyBeo5FjY+QUuxitDrWh2G95GzzEafJ02fmd6OAO+bXH9NwRROrvxRqD4a9gOqYJmmO3
 T0rA==
X-Gm-Message-State: AOAM533fzW5/dKMfkXGtraZa/xgv+HbRT2jhTdW9/2WUO/Sojy8N/Q/h
 J66ueZLe5LkB9zXDU8trTwppho7YYHV3bSKG8jS1HW7hsyxX1+5sUquJlvRkTrfTR/jbA7gySwJ
 rfN1E5HnDxQLzcP4=
X-Received: by 2002:a17:906:1c99:: with SMTP id
 g25mr4086294ejh.521.1631108499467; 
 Wed, 08 Sep 2021 06:41:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWRjcyCUoz0G4ga39OGnus+4v0GVyamUdZbDbDpuezs09rygLKiBO1vWievGJ1d09qLvvULA==
X-Received: by 2002:a17:906:1c99:: with SMTP id
 g25mr4086267ejh.521.1631108499234; 
 Wed, 08 Sep 2021 06:41:39 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id h30sm1235178edz.40.2021.09.08.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:41:38 -0700 (PDT)
Date: Wed, 8 Sep 2021 15:41:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210908134135.xvidtghamwahbdqk@steredhat>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210907134756.apnxzgbvw2ztetag@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210907134756.apnxzgbvw2ztetag@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 03:47:56PM +0200, Stefano Garzarella wrote:
>On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
>>On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
>>>Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
>>>enabled the SEQPACKET feature bit.
>>>This commit is released with QEMU 6.1, so if we try to migrate a VM where
>>>the host kernel supports SEQPACKET but machine type version is less than
>>>6.1, we get the following errors:
>>>
>>>    Features 0x130000002 unsupported. Allowed features: 0x179000000
>>>    Failed to load virtio-vhost_vsock:virtio
>>>    error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
>>>    load of migration failed: Operation not permitted
>>>
>>>Let's disable the feature bit for machine types < 6.1, adding a
>>>`features` field to VHostVSock to simplify the handling of upcoming
>>>features we will support.
>>
>>IIUC, this will still leave migration broken for anyone migrating
>>a >= 6.1 machine type between a kernel that supports SEQPACKET and
>>a kernel lacking that, or vica-verca.
>
>This should be true for migrating from kernel that supports SEQPACKET 
>to a kernel lacking that.
>
>For vice-versa I'm not sure, since vhost_get_features() will disable 
>that feature if the host kernel doesn't support it, and the guest will 
>not have acked it.

I did some testing and the migration is only broken in the case of
kernel 5.14+ (SEQPACKET supported) -> kernel 5.13 (SEQPACKET not 
supported).

Vice-versa works well because the feature is not acked.

>
>>
>>If a feature is dependant on a host kernel feature we can't turn
>>that on automatically as part of the machine type, as we need
>>ABI stability across migration indepdant of kernel version.
>>
>
>How do we typically handle this?
>
>I wrongly thought it was an expected behavior that migrating a guest 
>using a vhost device from a new kernel to an old one can fail if not 
>all features are supported.
>
>I need to take a look at the other vhost devices.

I took a look at vhost-net and vhost-scsi and we don't seem to handle 
this case. Maybe I'm missing something...

So following your advice, the best thing would be to have this feature 
disabled by default and require the user to enable it explicitly so we 
are sure it is needed. At this point a migration to a kernel that 
doesn't support it is rightly broken.

Or is there something better we can do?

@Michael @Jason any thoughts?

Thanks,
Stefano


