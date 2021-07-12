Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE83C604F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:18:19 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ydO-0000mh-KA
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m2ycB-00005s-Hj
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m2ycA-0003Nn-4o
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626106620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hv4m93hmoudOevzGUzFxzEjRFWqYizzI6pHJhlPwIo0=;
 b=EaWxgtEC9KEbrgRsXwZCeCTf87afbr0M7nqM6ylMo7bkwuSdkT2mqSnAbxHyhHfnno02QA
 hwZ407U+IYp7jbdnKc0LkK48sCAgwM82W2yuN2siSDQ2HDvqruwJqKsL8NYqkcrFXQ9lz9
 KdQb00Bxtmxhw2m5We1gktYmvNMD/SU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-R1uyNb0tNVOk5TTridEesQ-1; Mon, 12 Jul 2021 12:16:59 -0400
X-MC-Unique: R1uyNb0tNVOk5TTridEesQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1fb02902082e9b2132so7534021wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 09:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hv4m93hmoudOevzGUzFxzEjRFWqYizzI6pHJhlPwIo0=;
 b=pOeffEbkQ0M6v2LFDo75d4r9yJjsZOzP56PejGq1yHFW8OiZxzHuWUj8h1SUjw3kj2
 SyfUrX+2uIgQ7OloanXd++Sq90r+DUZWo/+NE7cuKeDlgDrcqmlxiGythbBwZPrRQBV7
 gMONbVEVEdfAZQuigMAW5McxK6ssvhjL4JlyiaTfuSAFLmEvJMslVwMJXqRsd4n5n2dA
 YBxGXRUgna2pCCPg5m6N2E0QryEvdC5QSrc6lflikzWOQN3laE8Khfl3CzG1JR+bYKBq
 OtnJhLCd8jHg9UrMv0NFGhpo5NUKQOLP5chSnG7mnsOt6KXJLU2KQngS5yxT4VqvrulR
 jMmQ==
X-Gm-Message-State: AOAM533QpvLp8jEliuU5QeOloPb68BirOrQWJ2yeX1jO8uzwoiAkS+Gy
 TCAo6x5htvOXJEcm0wR+BK2lHx8F4ty7CEVwFg25sanVdVTzOrILaeFWTHMRrx/YUXV5nOQdtUc
 DwHe+XHFpJEBZwuw=
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr14947721wrd.200.1626106618455; 
 Mon, 12 Jul 2021 09:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuWXAOlvcvmFmv8M6/I60QDW7+lh/3hblT43L11NLgeijLJdr4cQXCiexPwU/a6XZY3DSKRQ==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr14947690wrd.200.1626106618278; 
 Mon, 12 Jul 2021 09:16:58 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id s6sm4879504wrt.45.2021.07.12.09.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 09:16:57 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:16:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
Message-ID: <YOxq979AtHz/0IPP@work-vm>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
 <YOxS6R5NADizMui2@work-vm>
 <14ebb720-1aee-fb3f-bd49-e41139e64b14@amd.com>
MIME-Version: 1.0
In-Reply-To: <14ebb720-1aee-fb3f-bd49-e41139e64b14@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 armbru@redhat.com, qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Brijesh Singh (brijesh.singh@amd.com) wrote:
> 
> 
> On 7/12/21 9:34 AM, Dr. David Alan Gilbert wrote:
> > > 
> > > $ cat snp-launch.init
> > > 
> > > # SNP launch parameters
> > > [SEV-SNP]
> > > init_flags = 0
> > > policy = 0x1000
> > > id_block = "YWFhYWFhYWFhYWFhYWFhCg=="
> > 
> > Wouldn't the 'gosvw' and 'hostdata' also be in there?
> > 
> 
> I did not included all the 8 parameters in the commit messages, mainly
> because some of them are big. I just picked 3 smaller ones.

It would be good to have a full example, even if one of them was
something like:

  stuff = ".....<upto 4096 bytes>...."

so we'd just be able to get more of an idea.

Dave

> -Brijesh
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


