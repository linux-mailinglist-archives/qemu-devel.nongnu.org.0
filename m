Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC43CEAE6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:11:44 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Xjz-00005F-GO
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m5Xio-0007kV-My
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m5Xil-0007Qc-5p
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626718226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7E75RurH3Abt1mNVao2b/WRX7Gc289+50W2lN6Q3xDk=;
 b=f8xvSUueKk+pHZLINnaw9FdTopdmxs9twFFnCIipUfqHeYR8pWXH2T9SsMKBZYinlf5MGm
 eXrhHOXS7LKC4eeu+UZF7Kx0YP/iwFrLgVpj4GdCceEkCm5IPGL1NZvfI6jpWj2G+/+gy4
 wIGr07D3v/0onwP+5uzShhbF9R+3kyI=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-w3MWbR1FPuCqrvGmN64iqQ-1; Mon, 19 Jul 2021 14:10:23 -0400
X-MC-Unique: w3MWbR1FPuCqrvGmN64iqQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 g4-20020a9d6b040000b02904cdecce70a8so8991369otp.22
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 11:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=7E75RurH3Abt1mNVao2b/WRX7Gc289+50W2lN6Q3xDk=;
 b=nzU84zWNMy1cmojn0CIyFriCLD2QDk6ppXCSsCCVkXn2so6t7e6Zc56EjsjXfJ5ACN
 UXCGUbWZHXxGFzH3o5V9Ncp40tlDE40eqlRvNibl12b/SpwgsflMBLRB3MR/ahuFSHh1
 8yIe6vwlfqsKljWUnKoXeq/whRRfd76Fg+215uZw7ZcsemOmNsh34JM7xVRXlz9C9VKV
 L8Tj2Gwot19P2OIf9cvbXr63UMmDuCK/bjvL2hFV9DSIC5lEZAbEO5IkWFW+TY2k+K2P
 R+/yoLN/cgRMejD1AOGF+FN4+IodG3Hw4MZNFD4gvuTUL3fRhEvZpEQvvoC2Z6Vk5auS
 0Rzg==
X-Gm-Message-State: AOAM533Uv4a8SRiRcXF916UAML33LQ1GleFQxhGa3xJbyo/KLJYdrqW2
 zCuBWZLi0BIBII31tCbmL97EslAEUkcXwmjYf/PWve72vcMjV9R71PC7omKszPwLZ8kGXhCRfxW
 qGp8f8F2sXlhgNOU=
X-Received: by 2002:a05:6830:2a0f:: with SMTP id
 y15mr2941124otu.198.1626718223124; 
 Mon, 19 Jul 2021 11:10:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQX56qbaR3Hio/F/NRsWm73vQn8+BOYEL+6ntjhm3Xiw6174vRYjqC70izyylrtRVzzL95qQ==
X-Received: by 2002:a05:6830:2a0f:: with SMTP id
 y15mr2941097otu.198.1626718222945; 
 Mon, 19 Jul 2021 11:10:22 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id v203sm3975848oib.37.2021.07.19.11.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:10:22 -0700 (PDT)
Date: Mon, 19 Jul 2021 12:10:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V5 17/25] vfio-pci: cpr part 2
Message-ID: <20210719121021.6babb9ff.alex.williamson@redhat.com>
In-Reply-To: <be26577b-8df6-a8b5-fe06-ea33552aa472@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
 <20210716145133.4aa3f341.alex.williamson@redhat.com>
 <be26577b-8df6-a8b5-fe06-ea33552aa472@oracle.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 13:44:08 -0400
Steven Sistare <steven.sistare@oracle.com> wrote:

> On 7/16/2021 4:51 PM, Alex Williamson wrote:
> > On Wed,  7 Jul 2021 10:20:26 -0700
> > Steve Sistare <steven.sistare@oracle.com> wrote:
> >   
> >> Finish cpr for vfio-pci by preserving eventfd's and vector state.
> >>
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >> ---
> >>  hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 116 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index 0f5c542..07bd360 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c  
> > ...  
> >> @@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice  
> > *vdev)  
> >>      g_free(phys_config);
> >>  }
> >>  
> >> +static int vfio_pci_pre_save(void *opaque)
> >> +{
> >> +    VFIOPCIDevice *vdev = opaque;
> >> +    PCIDevice *pdev = &vdev->pdev;
> >> +    int i;
> >> +
> >> +    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
> >> +        error_report("%s: cpr does not support vfio-pci INTX",
> >> +                     vdev->vbasedev.name);
> >> +    }  
> > 
> > You're not only not supporting INTx, but devices that support INTx, so
> > this only works on VFs.  Why?  Is this just out of scope or is there
> > something fundamentally difficult about it?
> > 
> > This makes me suspect there's a gap in INTx routing setup if it's more
> > than just another eventfd to store and setup.  If we hot-add a device
> > using INTx after cpr restart, are we going to find problems?  Thanks,  
> 
> It could be supported, but requires more code (several event fd's plus other state in VFIOINTx
> to save and restore) for a case that does not seem very useful (a directly assigned device that
> only supports INTx ?). 

It's not testing that the device *only* supports INTx, it's testing
that the device supports INTx _at_all_.  That effectively means this
excludes anything other than an SR-IOV VF.  There are plenty of valid
and useful cases of assigning PFs, most of which support INTx even if
we don't expect that's their primary operational mode.  Thanks,

Alex


