Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D04D4D85
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:46:39 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKzu-00048k-O4
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSKpt-0005K1-KK
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSKpr-0004SL-Un
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646926575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6I/MNRAV9bC37kVWRUWoZeRIUyLMkwB6+N+HlkZtxg=;
 b=Zwiss0hs0Q01T813XOhG9dXhPdRVI4XcFHBnD1+mWAjwsWyD7BqePCK21Vgw0DobAjWyth
 jYQW7ssh7HhoGnzJp1HEZuC8UQwxqVlBOsgTT5fsvsql5KshZFkaixBiocaMDajkBvX45N
 DYjFEKiz7sVimkbdACHND3JRhERnOi8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-CO1mSN-3Nz2Co-VWlPlOfA-1; Thu, 10 Mar 2022 10:36:14 -0500
X-MC-Unique: CO1mSN-3Nz2Co-VWlPlOfA-1
Received: by mail-ej1-f69.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so3315508ejc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 07:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6I/MNRAV9bC37kVWRUWoZeRIUyLMkwB6+N+HlkZtxg=;
 b=YRVnO3+iE3O2N3Ig6kQOitz6r0rGmXkwo0fjPULlUDlYLvg9Whss2eB3NsBDLAUB/e
 Z8bNruBJsc5WMfsOT5/jj5j8pQKNo1Okks0qql5GpphVBPcke6nEcsB89aS+R/7yBm4v
 h1T6hd1Kcs6/pq+PMoD5Mt+28rbLx3CxaG5+u1yAKZD7loD0eqTn85FFQZQwLEFLx3zu
 KcHZxU+Q4mlwFynxyHb+i59MVU45qSoftYUc5TVT2CivYrSqbrpMpBTmO7u+ZbwjoxZU
 1PSxygp4lLm8t9OAkH8iHnIpDdX+6MGqj9nxxTjT7dHmQEn1ECCBetHSiHUxFfZiAhft
 pAzQ==
X-Gm-Message-State: AOAM532It9ODshbH+LQYx7pU/+njGVbxZ25WuAQCLTV8tCM/9POnKsYs
 CAExQY/e3DUC3vmjupEIYBlhuMQuXrwj1HWXNH9MdGfcvq3/4GhNs3sE9fHzS1efkOG5muNl+7X
 hAWsMdKfG1ougfdY=
X-Received: by 2002:a17:906:2a50:b0:6da:ed06:b029 with SMTP id
 k16-20020a1709062a5000b006daed06b029mr4680416eje.506.1646926572450; 
 Thu, 10 Mar 2022 07:36:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/LJVCZDvk0JhFRzpFsw0UsmU/ZVQq1HSYb+ytoJCGF85Xn9gAKr7IuGjEELsb5zE2kE5gLw==
X-Received: by 2002:a17:906:2a50:b0:6da:ed06:b029 with SMTP id
 k16-20020a1709062a5000b006daed06b029mr4680401eje.506.1646926572200; 
 Thu, 10 Mar 2022 07:36:12 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170906708700b006da8440d642sm1953254ejk.113.2022.03.10.07.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 07:36:11 -0800 (PST)
Date: Thu, 10 Mar 2022 16:36:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU device refcounting when device creates a container MR
Message-ID: <20220310163610.7f782922@redhat.com>
In-Reply-To: <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
 <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
 <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 16:56:21 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 9 Mar 2022 at 16:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 9 Mar 2022 at 16:21, Paolo Bonzini <pbonzini@redhat.com> wrote:  
> > >
> > > On 3/9/22 11:33, Peter Maydell wrote:  
> > > > Hi; does anybody know how device reference counting is supposed
> > > > to work when the device creates a "container" MemoryRegion which
> > > > it then puts some of its own subregions in to?
> > > >
> > > > As far as I can see when you do memory_region_add_subregion it
> > > > increases the refcount on the owner of the subregion. So if a
> > > > device creates a container MR in its own init or realize method
> > > > and adds sub-MRs that it owns to that container, this increases
> > > > the refcount on the device permanently, and so the device won't
> > > > ever be deinited.  
> > >
> > > The unparent method is supposed to break reference cycles.
> > >
> > > In the case of QOM, unparent calls unrealize, so unrealize should remove
> > > the subregions it created.  

well, making it asymmetric doesn't sound nice.
I think unrealize() should deal only with stuff initialized in
realize(), and instance_finalize() undo whatever  instance_init() did.
And if we got beyond Device type, i.e. directly inherited from "Object"
(/me thinking about backends) attempt to hijack unrealize() won't help.

> > It seems asymmetric for unrealize to undo something that was
> > done in instance_init, though. I would expect unrealize to
> > undo the effects of realize, and instance_finalize to undo
> > the effects of instance_init.  
> 
> ...also, in the device-introspect-test where I see this problem,
> unrealize is never going to be called anyway, because the device
> is only put through "instance_init" and then dereffed (which
> does not result in instance_finalize being called, because the
> refcount is still non-zero).

question is why introspected device is deferred instead of being
destroyed if it's no longer needed?

> 
> -- PMM
> 


