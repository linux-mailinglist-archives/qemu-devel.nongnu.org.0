Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0104A6E70
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 11:12:36 +0100 (CET)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFCcs-0005Rt-Od
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 05:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFCXY-0004Xt-O3
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:07:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFCXV-0000Zh-TH
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643796420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYOwJGiOleSFKBiigA+akn+lzOPscYMZU5oJgoiTG+s=;
 b=biep63fDY8MDDLZWbNneo3i81Aelb1GJf0aYQlBWo2YVHfhD3ZqEX0HkUU/fA8vWbkVM5l
 lRbjZWubU7bonee2r/kkLgebZdAW9in65MtKQt9ZqvfU1BvuzcllNHVSC58IELb/nVVihh
 rIeeWgTOWtNKg9l2J7nG18ltmhAwPJc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-P8q1i76YOyibiub8qmg_Ug-1; Wed, 02 Feb 2022 05:06:59 -0500
X-MC-Unique: P8q1i76YOyibiub8qmg_Ug-1
Received: by mail-ed1-f70.google.com with SMTP id
 f21-20020a50d555000000b00407a8d03b5fso10063685edj.9
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 02:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bYOwJGiOleSFKBiigA+akn+lzOPscYMZU5oJgoiTG+s=;
 b=cmkM5dNV6VRkqLLNzZAdM/5NaZGWNdiQMxU/ste5lN+2d44l9MUVj3rQ4rqmhU1K2U
 gUjiwyKnvtTkXXSzcoJkMNU5AXD75dPl3Tx4wbUIY0EHEP0CzwKDFnMD96hs6anGKBxu
 JsCcf1h/3vdOxv3wGmuEkFOrBQRgGPHdgNFg0YvxDTwDanPR5INd3fpMz5QeoWbfr7vh
 s4Uh/VnUuaWiwfVr1Zl8PuMQB0sqUsUvHdYqTFDFTFYq/9Du13Ictv4maEx18scNURt4
 RuCT8GS5Cy++EWvjQe1yd1sRrUJdZvQbRYPAtM9Ue64r2IwvSBDytJ19QAsUDvAvJVQK
 phyQ==
X-Gm-Message-State: AOAM531ChUWJjT0yeM4qrgo3SrK0eY6S5BA8WM8Y0R7RdKK5nQ4HGrRR
 N4oDCstsMFKX51JYWIWbEW4McT4GO+yh51gHDTqBDtPe3oBds+AF2rWP4cR1+o5TfYtS1Ho8L6R
 38fRTKD7LuRlZTDg=
X-Received: by 2002:a05:6402:438d:: with SMTP id
 o13mr29025842edc.258.1643796418075; 
 Wed, 02 Feb 2022 02:06:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpnuZ8hKYADuB3wUCQCcOlbQ2oNxBJ6qmZ+9mYgACreeAtlgoT39xYevDI0YEa/RwrkO/oPw==
X-Received: by 2002:a05:6402:438d:: with SMTP id
 o13mr29025816edc.258.1643796417892; 
 Wed, 02 Feb 2022 02:06:57 -0800 (PST)
Received: from redhat.com ([2.52.5.34])
 by smtp.gmail.com with ESMTPSA id s9sm20734814edj.48.2022.02.02.02.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 02:06:56 -0800 (PST)
Date: Wed, 2 Feb 2022 05:06:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220202050526-mutt-send-email-mst@kernel.org>
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
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-f6ZBgAtKr-nUFTR8nfMGVWF=uExoRaMajN7t6wU7f7g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 09:30:42AM +0000, Peter Maydell wrote:
> > I/O port space is always the identity mapped CPU address space unless
> > sparse translations are used to create multiple I/O port spaces (not
> > implemented).  I/O port space is only accessed by the CPU, there are no
> > device initiated I/O port transactions, so the address space relative
> > to the device is irrelevant.
> 
> Does the PCI spec actually forbid any master except the CPU from
> issuing I/O port transactions, or is it just that in practice nobody
> makes a PCI device that does weird stuff like that ?
> 
> thanks
> -- PMM

Hmm, the only thing vaguely related in the spec that I know of is this:

	PCI Express supports I/O Space for compatibility with legacy devices which require their use.
	Future revisions of this specification may deprecate the use of I/O Space.

Alex, what did you refer to?

-- 
MST


