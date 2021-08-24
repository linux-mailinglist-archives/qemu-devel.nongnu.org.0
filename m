Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223713F620C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:52:27 +0200 (CEST)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYiw-0007kT-7K
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYh4-0006wa-D4
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYgy-0005Mx-Pu
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629820223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fireB/LHgPhb+rwE7DiSE6HwznhclT0QsVIrE7ykW98=;
 b=e0CKFeUDMxv3XtWKu+iEu+1+up5nI8m4C5XaR/+tmcSCEPc2WNmxbgmX4BbjaVkIej/GTT
 mZy4DdH0Tnl9avhKehe6RWGmhmyowQ8ducFEASK4LYKlyVkRDncXr26VGKfdGjbZL0hLZ4
 HZE1/4bubTOrJxNTPgM2w+VzrtwE8YU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-qLIWlVocNzSdgx_X9C-OMQ-1; Tue, 24 Aug 2021 11:50:22 -0400
X-MC-Unique: qLIWlVocNzSdgx_X9C-OMQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 iw1-20020a0562140f2100b0035f58985cecso15138932qvb.10
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fireB/LHgPhb+rwE7DiSE6HwznhclT0QsVIrE7ykW98=;
 b=jz0U4mOuGHsHrOiGlTpS4li+R2yZEfdaFL2cEUQMWzC/57oAbSKb3p+S6fhD9VYVcH
 Aems1F6ycSA/bxkZhHUw8smXTXFbDVlNlyJ/lbRiq87C963FWU/XGs8245R+vwcrR4gs
 ZtkW83iWYevx02oiYEfkUcY0z8GapajOeQeE4bk4IJW67v+QVD8cB8ckMZJGdu0YdqMp
 aLxpRD0V5km9cj8GXXc+/SxAFJmwSusH32OxF5BUVJC6Vl2xsKFQBgs7T2t4/sRRmd97
 stKfNzWmn3zrr8LyiNisyMtvZURTF7qqvmRE4CepmIJAXAITBn9Pwm+fWX4f8QIqlrE2
 lIsA==
X-Gm-Message-State: AOAM5321zMjdVsh6TE6jXFM4aSmNWvL7wCY6uU0npcaMvyw4r1UKCWhb
 gXIIhe621oIGsl5jE2qIIed8niiAULuU5q6w3oQLJB3hn3xCqZ5odl+l3YTsJaiuxkQW6dB8k1h
 1bPJfk2KGQWtB8a8=
X-Received: by 2002:a05:622a:1910:: with SMTP id
 w16mr34573657qtc.227.1629820221851; 
 Tue, 24 Aug 2021 08:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBj0iYM0cUGaqCs+gR9kq+Hf+DXqS01lErQEMQ01Afd9ykIBVq0QRbQb4YjTAayKPQx3hMrA==
X-Received: by 2002:a05:622a:1910:: with SMTP id
 w16mr34573625qtc.227.1629820221625; 
 Tue, 24 Aug 2021 08:50:21 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id j18sm11075638qkg.31.2021.08.24.08.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 08:50:21 -0700 (PDT)
Date: Tue, 24 Aug 2021 11:50:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSUVO7sVsgsZiCHF@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org>
 <YSQjBX9SwzgNGiag@t490s>
 <CACGkMEttajn8xihZCw8UYVHxGu1wE8eDoEhuc7Ug7_Q_aKCyRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEttajn8xihZCw8UYVHxGu1wE8eDoEhuc7Ug7_Q_aKCyRQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 10:52:24AM +0800, Jason Wang wrote:
> It looks to me this doesn't solve the issue of using virtio-mmio with vhost?

No IOMMU supported for any of the MMIO devices, right?  Or am I wrong?  Thanks,

-- 
Peter Xu


