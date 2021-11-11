Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6344D31B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:23:17 +0100 (CET)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5Ma-0000Dm-Ll
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ml5Jj-0007AS-Mh
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ml5Je-00041z-UG
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636618813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUPyFRYCzcyMWwwHb4KeWuwPqch2061FAWTuKXOS1jU=;
 b=fywo11FHvkO2ttCRaz/K0My9JPd5fxsMs2IsfeoajCgOVPr6VODzgABYDIW64XjSXPBX9K
 I55p/nk56LBaXZmT35xKJypXhMMJyzg7foAvKLkA5gR/NyzusDmo3J9j5FJ4zWjMeS9PWs
 gkbf2bqxRauf8n+46ojBEeVy+tZ44CI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-aQurlGMePu-1hHSIOyS4CQ-1; Thu, 11 Nov 2021 03:20:12 -0500
X-MC-Unique: aQurlGMePu-1hHSIOyS4CQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso732538wrh.20
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 00:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fUPyFRYCzcyMWwwHb4KeWuwPqch2061FAWTuKXOS1jU=;
 b=BnxUlNGNFGSUKyHHoE0egoMeHCY/ZI3Sz7b57C9atD4eQWxu0f8bQ9JNmckgowh9Wr
 Q/uRzAolw0q76cAi6x0RVZyKlXuOsQgVzlQXDur2zVf1SLh7qvHjwWB988ReNElse180
 CbYjXl67LB9otzKMnSpMWhuk8UutQjyWkZTDfgV51XiZYisHnEKtxg+Og2bjBxMmMxvR
 XRxahJnGOPv/o7uvNINMaAwwBWd/1jCQeDXMfsInbDGxHKsFICrZAyr+rhFcXy/hebq4
 7YdrvCB3jP6hJuddmRnLaQE3kQlxbftbvdMf80D9/c0ZKSda1q94aBAEQ+Kd3i8Op7KC
 xMnw==
X-Gm-Message-State: AOAM532/Cd/WrxH43gfrgfYo09l8rRuU+ZCwdko/j3sDbdDOT3bk1ipu
 5N+axCmhi98ybu2AjK8/3Mu5MTYOgTA2QcRJPJqHEQC5tl7Uq29fOnZqp+zggZoBVeIplKpqej/
 e//rK02ik5kY3YNo=
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr6753116wri.308.1636618811038; 
 Thu, 11 Nov 2021 00:20:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9SLif6us2IYSAl7ngv0KqxxlWAsG4Yq6dyw+WVVICl/sKMPGKHitQ0QDD/DFM3gZH2uaqEg==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr6753079wri.308.1636618810804; 
 Thu, 11 Nov 2021 00:20:10 -0800 (PST)
Received: from redhat.com ([2.55.129.247])
 by smtp.gmail.com with ESMTPSA id u5sm2214224wrg.57.2021.11.11.00.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:20:10 -0800 (PST)
Date: Thu, 11 Nov 2021 03:20:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111031646-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 08:53:06AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > Given it's a bugfix, and given that I hear through internal channels
> > that QE results so far have been encouraging, I am inclined to bite the
> > bullet and merge this for -rc1.
> 
> Fine with me.
> 
> > I don't think this conflicts with Julia's patches as users can still
> > disable ACPI hotplug into bridges.  Gerd, agree?  Worth the risk?
> 
> Combining this with Julia's patches looks a bit risky to me and surely
> needs testing.  I expect the problematic case is both native and acpi
> hotplug being enabled.
>  When the guest uses acpi hotplug nobody will
> turn on slot power on the pcie root port ...

I'm not sure I understand what the situation is, and how to trigger it.
Could you clarify pls?

> I'd suggest to just revert to pcie native hotplug for 6.2.

Hmm that kind of change seems even riskier to me. I think I'll try with
Igor's patches.

> Give acpi
> hotplug another try for 7.0, and post patches early in the devel cycle
> then instead of waiting until -rc0 is released.
> 
> take care,
>   Gerd


