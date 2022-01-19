Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B164935E9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 08:55:12 +0100 (CET)
Received: from localhost ([::1]:56324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA5oE-00044o-T6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 02:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nA5Ww-0006Ws-MQ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 02:37:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nA5Wl-0004UT-MM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 02:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642577825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBfGKAVjNReJbbJX6oY1AzNZjfQ5uO0hcUC9R++P40M=;
 b=KT6Bq0hx7gqJzGbQMWQpOpgzejbivy/WRQaAdsfjxLu6slUHeVz7Mb5QFm2kQv2IgcpjKz
 d+pIV2l4d++1CaiSErzTvm/Xg6FzYpZGZOVi3MD0vY/8j5YBtprLVkJ1ZaJbRV6pJbBRUe
 chXAx+EDzMZQGL5OvxtgmIHCSWnRpUA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-VhFMzq8uNvCQKUNA6_vQoQ-1; Wed, 19 Jan 2022 02:37:01 -0500
X-MC-Unique: VhFMzq8uNvCQKUNA6_vQoQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 j1-20020aa7c341000000b0040417b84efeso1345323edr.21
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 23:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBfGKAVjNReJbbJX6oY1AzNZjfQ5uO0hcUC9R++P40M=;
 b=12/5ey50WDG7s9iSCHLLHIura0X314RtmMi4dgXURVVayhG9CgbISlSBIQE3LWto5B
 AJKKhJdCLAHasTb3f9Po2KeQSpI7NL5UU8vmprrCvBhfIHSyZAjztBsIorNMZP1MS3Zc
 9QxFN1hllXzbryWXWPeJK3qIQZwHVbDAMlFbEysoCUrYNTNsf27fJvNeJLBS+Qhs1fFg
 GJiH/3a9+eeP4zi66Rg9np8v99ThmZ25nym0S0R7p3PJvSQgEr50IbMlKdP/4zZ3Euq6
 jJQAi5FAWGZGNAWdsO9VRdEljptYhHc2m5bFdFbDAKbnosJzudpCy+NaPfGP7Nvy7CKH
 BNXQ==
X-Gm-Message-State: AOAM531atC+S+cYna439cVevrrcDXaYvD33D+1CpYsCnSzeZRRMOg7hB
 JvEAdLSGS4PbOAq85Frzyv/CFx2oAGFuqjmteqgMRAISZeX5X0VUih/WM9HvNNrzafvSLFJKSBG
 cfZLkJgi+0a4ptxU=
X-Received: by 2002:aa7:d04f:: with SMTP id n15mr3411720edo.261.1642577820590; 
 Tue, 18 Jan 2022 23:37:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4BVHpuZ5yqDd/Zu2CCUNBYtSKY4ut2KsVJj0nyYzo1Bksv21Kp86FOsOzsU1Botvm6X/9KQ==
X-Received: by 2002:aa7:d04f:: with SMTP id n15mr3411701edo.261.1642577820410; 
 Tue, 18 Jan 2022 23:37:00 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 4sm6097261ejc.160.2022.01.18.23.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 23:36:59 -0800 (PST)
Date: Wed, 19 Jan 2022 08:36:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH] hw/smbios: Add table 4 parameter, "processor-id"
Message-ID: <20220119083658.200bb541@redhat.com>
In-Reply-To: <CAO=notxVi7-pGoJS9kXuEcC8nBdhEbW=+Wu6V5qP7UVvzubcNQ@mail.gmail.com>
References: <20220106223316.3661625-1-venture@google.com>
 <20220111141332.4e0de6af@redhat.com>
 <CAO=notxVi7-pGoJS9kXuEcC8nBdhEbW=+Wu6V5qP7UVvzubcNQ@mail.gmail.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, Titus Rwantare <titusr@google.com>,
 Peter Foley <pefoley@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 09:15:42 -0800
Patrick Venture <venture@google.com> wrote:

> On Tue, Jan 11, 2022 at 5:13 AM Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Thu,  6 Jan 2022 14:33:16 -0800
> > Patrick Venture <venture@google.com> wrote:
> >  
[...]
> > > diff --git a/qemu-options.hx b/qemu-options.hx
> > > index ec90505d84..3c51b6cf8f 100644
> > > --- a/qemu-options.hx
> > > +++ b/qemu-options.hx
> > > @@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> > >      "                specify SMBIOS type 3 fields\n"
> > >      "-smbios  
> > type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"  
> > >      "  
> > [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"  
> > > +    "              [,processor-id=%d]\n"
> > >      "                specify SMBIOS type 4 fields\n"
> > >      "-smbios type=11[,value=str][,path=filename]\n"
> > >      "                specify SMBIOS type 11 fields\n"  
> >
> > missing update of SRST part
> >  
> 
> I grepped for SRST, where is this that I need to update also?

option definition has 2 parts DEF() and SRST that follows right
after it, the later is used as help text for the option
SRST                                                                             
``-smbios file=binary`` 
...

> 
> Thanks!


