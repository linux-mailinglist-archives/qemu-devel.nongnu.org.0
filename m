Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A132BCFE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:10:11 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZh4-0002WO-Qr
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHZYn-000844-PA
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:01:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHZYj-00060A-Q7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614808891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfOy0QGn+lT44t+vLUH3l9KhufeZmy8TTjG3ucL9lTk=;
 b=AUmNiyJrYOIk/5fslfV9iTSiR+eer5lcFrHDttJNdNnFl7kRvHpTGhEFcbZEd22cUYCxT2
 x7mVQ/6JubodSVVF0wRlIKLpOiY+fkvwB9dtQWvq/MA8G+B/ELZ2K7P0Un9iRPZEcAxYyv
 KeZrlguibkWRuNCDxx4pZUKyDrGdNCM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-rrXqoCpcPiiUylRj1E2T5w-1; Wed, 03 Mar 2021 17:01:29 -0500
X-MC-Unique: rrXqoCpcPiiUylRj1E2T5w-1
Received: by mail-ed1-f71.google.com with SMTP id i4so13166873edt.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 14:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PfOy0QGn+lT44t+vLUH3l9KhufeZmy8TTjG3ucL9lTk=;
 b=k6Revw/vN6NABcEndWdDUhzu+LsdC/NBrORbgnNOTK1YddPgjd7PbyQyMyjgK1NLGg
 Np92oq4Xol0kuzqk0GdrQmsjIThypbBI2roGd4923ueRJWLVDj/LkIxO/JO4pQf1bvoG
 3TV4aFKCGtjCNoyXDIW4hVUStfpJuP5Y17NWSWqeywyE6GTc9ddYNRGdfInJ2gYs1ZtI
 8I4XoN+fV7Ev349PhcA6YZ1cfHeO39Ey/bwSAGsHXLnGCmLu7S/UGqYsJeBwsn+XOeWl
 XZyGut1/YZxHeMJxqgubj5c10jFkCTkVO3jpMeB/dcd87rUK6LqRJk0GMxmy0gEyK2RZ
 G3UA==
X-Gm-Message-State: AOAM5312K/exH2OQFJx633UWAlUmobar6B87xqPh9C5PLWlxwJ8BOxFm
 IY+FsRUCVdkafRnPDkMLJGPOIHlfYCiTFwnNUezZSVwamE63O7GFzT7utFvEwRm1Zi4fMkTWvS/
 t+9eu+zisA0m/1Zk=
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr819945eja.468.1614808869542; 
 Wed, 03 Mar 2021 14:01:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuvG1F8GR4TM0qpjEQzqi16vF51TT3cDWmE7vF3XT+5BmK5Ox3d40YndT4v/Mb19cG2dzsCg==
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr819934eja.468.1614808869377; 
 Wed, 03 Mar 2021 14:01:09 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id n2sm22521110ejl.1.2021.03.03.14.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 14:01:08 -0800 (PST)
Date: Wed, 3 Mar 2021 17:01:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] vhost-user.rst: add clarifying language about
 protocol negotiation
Message-ID: <20210303165554-mutt-send-email-mst@kernel.org>
References: <20210303145011.14547-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210303145011.14547-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jiang Liu <gerry@linux.alibaba.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 02:50:11PM +0000, Alex Bennée wrote:
> Make the language about feature negotiation explicitly clear about the
> handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
> avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:
> 
>   https://github.com/rust-vmm/vhost/pull/24
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Jiang Liu <gerry@linux.alibaba.com>
> Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>
> 
> ---
> v2
>   - use Stefan's suggested wording
>   - Be super explicit in the message descriptions
> ---
>  docs/interop/vhost-user.rst | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 2918d7c757..7c1fb8c209 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -307,6 +307,18 @@ bit was dedicated for this purpose::
>  
>    #define VHOST_USER_F_PROTOCOL_FEATURES 30
>  
> +Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
> +bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
> +<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4130003>`_.
> +VIRTIO devices do not advertise this feature bit and therefore VIRTIO
> +drivers cannot negotiate it.
> +
> +This reserved feature bit was reused by the vhost-user protocol to add
> +vhost-user protocol feature negotiation in a backwards compatible
> +fashion. Old vhost-user master and slave implementations continue to
> +work even though they are not aware of vhost-user protocol feature
> +negotiation.
> +
>  Ring states
>  -----------
>  
> @@ -865,7 +877,8 @@ Front-end message types
>    Get the protocol feature bitmask from the underlying vhost
>    implementation.  Only legal if feature bit
>    ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
> -  ``VHOST_USER_GET_FEATURES``.
> +  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
> +  ``VHOST_USER_SET_FEATURES``.
>  
>  .. Note::
>     Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
> @@ -881,7 +894,8 @@ Front-end message types
>    Enable protocol features in the underlying vhost implementation.
>  
>    Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
> -  ``VHOST_USER_GET_FEATURES``.
> +  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
> +  ``VHOST_USER_SET_FEATURES``.
>  
>  .. Note::
>     Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support


Not really clear what does "It" refer to here.
Also, are we sure it's ok to send the messages and then send
VHOST_USER_SET_FEATURES with VHOST_USER_F_PROTOCOL_FEATURES clear?
Looks more like a violation to me ...


How about: It -> this bit
does not need to be -> before ... has been

so:

    Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
 -  ``VHOST_USER_GET_FEATURES``, and even before this bit has been
	acknowledged by VHOST_USER_SET_FEATURES.




> -- 
> 2.20.1


