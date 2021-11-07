Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBBC447284
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 11:23:00 +0100 (CET)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjfKF-0004n7-As
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 05:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjfJI-00045M-65
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 05:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjfJE-0000ND-8D
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 05:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636280514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atZ/pePHP/+NA64gKuXMrnkZMDn3k3mW+OH37h9DxL0=;
 b=iH0sBKDZHJkp9qX/qdECjL9uq0OlxN5uU8ESq3ys2Gwgk8LI5jar16n6BGhW0EMrhZNH5A
 XM8A1hUxFj8zH0YcjICzlcIHr+Qtua2tVVCJ6pOABCXUlUTS+5cFhpTfn1RXKqymPhfbSA
 bcM7bq9ilyrUJvLIRDSuC92Ahw1tRpM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-GJYkSnHdMS2K833thhnmSw-1; Sun, 07 Nov 2021 05:21:53 -0500
X-MC-Unique: GJYkSnHdMS2K833thhnmSw-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so2885612wro.21
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 02:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=atZ/pePHP/+NA64gKuXMrnkZMDn3k3mW+OH37h9DxL0=;
 b=7jiv8SONOIZo907ZETrpcPXKOBL0a5ZuxZPnhkxDyM7eg1Zjpa45SNdnlXz7o4tJQu
 CdH2wlWz+1NqIvDxpbUPltKiOKYyVk+JFmrBeVmCDWgXqZNp51CpzXXg+wnNMPwPbyA4
 iXqD6r1i6BS0YK0APzcp/qBUpfdmFJmlABbuVFdzEiBswt8z9r35fl9LuphJa9hHGLxJ
 TdGRXFjJAQEVHUUmy4S14kA6JKwT6O+9g36lmqrJse4lhRlVshBUM13Ehggeeh+lUw2T
 TmGj8V91AzU0yXpI55PFRnGAdNRAt3ErQAmhUDEeYMt1u8MdEapHYEPtK7SfnTh4IMXj
 ddIg==
X-Gm-Message-State: AOAM5338uHfQ3nBkaaB8CF7d0kDpZhKYjt5NXJAnxlAc4mkku2oTIwZ8
 oxTfB4YR7i2A2wEcLTwdsMKFAVGEV7Psdwc2Aw1IVchPIYUaStwsQPqClPDH91X/9k/y0N3YIdK
 Crj1GcUBN9SI0BGU=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr68805543wrq.17.1636280512566; 
 Sun, 07 Nov 2021 02:21:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCEewVH1OASVQ31el9e2Z4O/i0wt4tV7KOU+PlG2161rRgIcKJYPJIr6YcXG1iHgRfkCDAnA==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr68805499wrq.17.1636280512331; 
 Sun, 07 Nov 2021 02:21:52 -0800 (PST)
Received: from redhat.com ([2.55.155.32])
 by smtp.gmail.com with ESMTPSA id f6sm12732558wmj.40.2021.11.07.02.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 02:21:51 -0800 (PST)
Date: Sun, 7 Nov 2021 05:21:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
Message-ID: <20211107051832-mutt-send-email-mst@kernel.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
 <20211102072843-mutt-send-email-mst@kernel.org>
 <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
 <20211102111228-mutt-send-email-mst@kernel.org>
 <e4b63a74-57ad-551c-0046-97a02eb798e5@redhat.com>
 <20211107031316-mutt-send-email-mst@kernel.org>
 <f6071d5f-d100-a128-9f66-a801436aa78a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f6071d5f-d100-a128-9f66-a801436aa78a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 07, 2021 at 10:21:33AM +0100, David Hildenbrand wrote:
> Let's not focus on b), a) is the primary goal of this series:
> 
> "
> a) Reduce the metadata overhead, including bitmap sizes inside KVM but
> also inside QEMU KVM code where possible.
> "
> 
> Because:
> 
> "
> For example, when starting a VM with a 1 TiB virtio-mem device that only
> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
> in order to hotplug more memory later, we waste a lot of memory on
> metadata for KVM memory slots (> 2 GiB!) and accompanied bitmaps.
> "
> 
> Partially tackling b) is just a nice side effect of this series. In the
> long term, we'll want userfaultfd-based protection, and I'll do a
> performance evaluation then, how userfaultf vs. !userfaultfd compares
> (boot time, run time, THP consumption).
> 
> I'll adjust the cover letter for the next version to make this clearer.

So given this is short-term, and long term we'll use uffd possibly with
some extension (a syscall to populate 1G in one go?) isn't there some
way to hide this from management? It's a one way street: once we get
management involved in playing with memory slots we no longer can go
back and control them ourselves. Not to mention it's a lot of
complexity to push out to management.

-- 
MST


