Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75284A7635
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 17:52:17 +0100 (CET)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFIrg-0006BI-8G
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 11:52:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nFHt7-0001Do-Mk
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nFHt4-0004Vl-NB
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643816977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQPZ7sUUIEqXH0vqeyT8LbVL44Z+HK2Ym53JX3cXjCE=;
 b=ed333u+++Fge1myLyX7ES7HRpOAFaB7a8QgIPnqwT7FSJDdritiqwzWs7kpmQhpr5KLb1R
 8rWjB46c0Fpwg0Mf0tdycCg7OOas7YzWWD8MkIOFaP95tLI+5aZ4enca4gqwowJRs4CjZe
 mXYiZJ9xctE346snalQVDAvKIhB/Rfw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-klviIzH4NAuxwC0GCOMSog-1; Wed, 02 Feb 2022 10:49:36 -0500
X-MC-Unique: klviIzH4NAuxwC0GCOMSog-1
Received: by mail-il1-f198.google.com with SMTP id
 m9-20020a92cac9000000b002bafb712945so11099358ilq.17
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 07:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=CQPZ7sUUIEqXH0vqeyT8LbVL44Z+HK2Ym53JX3cXjCE=;
 b=QlerJvc0IkZy10s7uADzay1mdatH72D4CNX4Nla9sMOMBhuCbHwZUfYjEfLACO439i
 pnfYTytIsgiVhZezOhTexYvuRnVUFRMDcfqBgwoHy5WWOUYvv/rsvroQp6Xpj7/tpAr+
 7dyQI+SgCnQr7Ct4Jsk0AxYLbzKs2BnFVtT4l1i7MeZQVZwYwAWqsqHgKXdLzFH3rvhE
 dwNMxYHBRtgRdbxfQfoBTpCJwVoSBiu+O1EV2S5A2neo9E0WXRuBcXBmwrHQ4ehuMQRJ
 hfojb5nKmRw82zA71GBhhOhmmtv+DVU9y7xmNwoS+gXPk3f4EWmFq1Qfr0fpyoPG6mIJ
 G+1g==
X-Gm-Message-State: AOAM533269pMVWl18zgu8nm2NLX3S3WAB7Zh92OAE2A27aRdirTTDAN5
 e2sIJxqBvGIuPKYASMBIw6rxcwExkUymL+bBfuSh/TGTN5Kg8LdkgObP6Y2CJIMLn4NvvMLr9QF
 ONVWJitSzlx3VH6U=
X-Received: by 2002:a05:6638:3183:: with SMTP id
 z3mr15243434jak.259.1643816975867; 
 Wed, 02 Feb 2022 07:49:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8yNK26MqKmUAZswvyC/AjhumNV5YfqAK8w3uPbVYqLTUm722R2W426T1FAh/ESWbLjEsIRg==
X-Received: by 2002:a05:6638:3183:: with SMTP id
 z3mr15243412jak.259.1643816975533; 
 Wed, 02 Feb 2022 07:49:35 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id u8sm21180661ilb.39.2022.02.02.07.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 07:49:35 -0800 (PST)
Date: Wed, 2 Feb 2022 08:49:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220202084933.6a7dc35f.alex.williamson@redhat.com>
In-Reply-To: <20220202050526-mutt-send-email-mst@kernel.org>
References: <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <CAFEAcA-f6ZBgAtKr-nUFTR8nfMGVWF=uExoRaMajN7t6wU7f7g@mail.gmail.com>
 <20220202050526-mutt-send-email-mst@kernel.org>
Organization: Red Hat
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 " <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 05:06:49 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Feb 02, 2022 at 09:30:42AM +0000, Peter Maydell wrote:
> > > I/O port space is always the identity mapped CPU address space unless
> > > sparse translations are used to create multiple I/O port spaces (not
> > > implemented).  I/O port space is only accessed by the CPU, there are no
> > > device initiated I/O port transactions, so the address space relative
> > > to the device is irrelevant.  
> > 
> > Does the PCI spec actually forbid any master except the CPU from
> > issuing I/O port transactions, or is it just that in practice nobody
> > makes a PCI device that does weird stuff like that ?
> > 
> > thanks
> > -- PMM  
> 
> Hmm, the only thing vaguely related in the spec that I know of is this:
> 
> 	PCI Express supports I/O Space for compatibility with legacy devices which require their use.
> 	Future revisions of this specification may deprecate the use of I/O Space.
> 
> Alex, what did you refer to?

My evidence is largely by omission, but that might be that in practice
it's not used rather than explicitly forbidden.  I note that the bus
master enable bit specifies:

	Bus Master Enable - Controls the ability of a Function to issue
		Memory and I/O Read/Write Requests, and the ability of
		a Port to forward Memory and I/O Read/Write Requests in
		the Upstream direction.

That would suggest it's possible, but for PCI device assignment, I'm
not aware of any means through which we could support this.  There is
no support in the IOMMU core for mapping I/O port space, nor could we
trap such device initiated transactions to emulate them.  I can't spot
any mention of I/O port space in the VT-d spec, however the AMD-Vi spec
does include a field in the device table:

	controlIoCtl: port I/O control. Specifies whether
	device-initiated port I/O space transactions are blocked,
	forwarded, or translated.

	00b=Device-initiated port I/O is not allowed. The IOMMU target
	aborts the transaction if a port I/O space transaction is
	received. Translation requests are target aborted.
	
	01b=Device-initiated port I/O space transactions are allowed.
	The IOMMU must pass port I/O accesses untranslated. Translation
	requests are target aborted.
	
	10b=Transactions in the port I/O space address range are
	translated by the IOMMU page tables as memory transactions.

	11b=Reserved.

I don't see this field among the macros used by the Linux driver in
configuring these device entries, so I assume it's left to the default
value, ie. zero, blocking device initiated I/O port transactions.

So yes, I suppose device initiated I/O port transactions are possible,
but we have no support or reason to support them, so I'm going to go
ahead and continue believing any I/O port address space from the device
perspective is largely irrelevant ;)  Thanks,

Alex


