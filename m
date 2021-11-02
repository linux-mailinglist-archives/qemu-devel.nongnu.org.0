Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EDB442731
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:42:34 +0100 (CET)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhnVC-00085O-0U
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhnTN-0007K5-KR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhnTL-0006zd-1d
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635835238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YpSYiElX1vC2sLYikgTCiRFWMBP//gUovfysFepZbj8=;
 b=LHLB+Q2swTE8y1MHeyIdrUkjNUMxxpsCpUlho8PMIPeUwfGDZauG24vVhyI67S/g8R/JY2
 AfdsX8808rEgtnUKDzwlK9XItmVRuN3Rny27d7MYo2qwFxU4R7+giUlHbglVu1br4JrgMo
 w6a9NTMQk9dtEpBO26Bj2qjIuGzMN9E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-LWH29JgGNfCkPwSrwUT1Cw-1; Tue, 02 Nov 2021 02:40:35 -0400
X-MC-Unique: LWH29JgGNfCkPwSrwUT1Cw-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so17776393edl.17
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 23:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YpSYiElX1vC2sLYikgTCiRFWMBP//gUovfysFepZbj8=;
 b=WbOcmHL9DqjUQc5Dv6ND8CFiNem9ZOCSkfubWKdWXPFGXnATau67X6qI9rccN3GeyD
 k7WRRCJZWqztOvhuY2B2VOj0iFUPg4nMCIDnLg2tOqo0dZCx7uiFBaBle08hM/w7jtJQ
 1EbsPdkVGI80E93ODJrZZUfjygDhHY0HewnnoNJg7HHV0mlasOTRtJnDXSuE493N7Ui5
 r5UIC2BBhgOLEBsgYK3basioq4mZw8sXbt6ID9Vg4KHtRy3/abXGEUF6eOL1eCSPhW2A
 /eELNJ8vBYwGoxzDIssoWlmTLL+XP9kal1uO4jzQW+2V7tczIC98QFj4ZgRNgHRb931Z
 sCNg==
X-Gm-Message-State: AOAM5333m/K32BtJcV5ksofhh7vOJbRHu0hA1zGagVggGzDwgB/MHF4d
 18Bz/3ozVXjyN2/eOb7DHU1NA97ru1cOH7noOUN+miS0KGsF1uiFXoGEhpVnJ2RaLcphpLOj3Q0
 wMG63S5dgLxTCMSw=
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr42833484ejc.173.1635835234103; 
 Mon, 01 Nov 2021 23:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ciG0jmj4me+A2dJbUIhShsi/2b5UmEgt8T9GTpNg3KDi/lgL3j6E5iDiLFSI1hvkTrJsLw==
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr42833455ejc.173.1635835233867; 
 Mon, 01 Nov 2021 23:40:33 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:b499:edfc:9aad:137a:a971])
 by smtp.gmail.com with ESMTPSA id q9sm10777442edd.66.2021.11.01.23.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 23:40:33 -0700 (PDT)
Date: Tue, 2 Nov 2021 02:40:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 0/5] pci/iommu: Fail early if vfio-pci detected before
 vIOMMU
Message-ID: <20211102023923-mutt-send-email-mst@kernel.org>
References: <20211028043129.38871-1-peterx@redhat.com>
 <YYCQuEJEST485pTp@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YYCQuEJEST485pTp@xz-m1.local>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 09:15:59AM +0800, Peter Xu wrote:
> On Thu, Oct 28, 2021 at 12:31:24PM +0800, Peter Xu wrote:
> > Note that patch 1-4 are cleanups for pci subsystem, and patch 5 is a fix to
> > fail early for mis-ordered qemu cmdline on vfio and vIOMMU.  Logically they
> > should be posted separately and they're not directly related, however to make
> > it still correlated to v1 I kept them in the same patchset.
> > 
> > In this version I used pre_plug() hook for q35 to detect the ordering issue as
> > Igor suggested, meanwhile it's done via object_resolve_path_type() rather than
> > scanning the pci bus as Michael suggested.
> > 
> > Please review, thanks.
> 
> Michael,
> 
> Would you consider review/pick patches 1-4 first?  The last patch needs further
> discussion, and I would like to address it separately in the future.
> 
> Thanks,

I did just that yesterday.

> -- 
> Peter Xu


