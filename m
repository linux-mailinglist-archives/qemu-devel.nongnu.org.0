Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74245397D6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 22:12:27 +0200 (CEST)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw8E4-0006V6-L7
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 16:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nw8Cc-0005h2-Cf
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nw8CZ-0006Hs-NC
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654027850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8hHVyEAQxBkrAEoQoJO4ho4T7qHQSD5hH6S88q4XwgQ=;
 b=MPZU0b29Qnt2dmxAfGEdgH6CoPtciswm7whA55EE0eEYS/9He+wiQuSvmjxrtwG0zhEvCc
 2yqwLKPunDC5SYBHV/EMv8fqXzzJbv0VDxwcmdTBLWqHKpP+6ELXRWayHGnX3q10afMC4r
 /klxwXBTLvlr3rwMqcR1ZnUYDNcVpUU=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-cDmC14_3NOiTm5yk_SslSA-1; Tue, 31 May 2022 16:10:49 -0400
X-MC-Unique: cDmC14_3NOiTm5yk_SslSA-1
Received: by mail-io1-f72.google.com with SMTP id
 z22-20020a5e8616000000b0066576918849so7456786ioj.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 13:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=8hHVyEAQxBkrAEoQoJO4ho4T7qHQSD5hH6S88q4XwgQ=;
 b=TMftB4VROTdS9kgD+uP4Zwy6ETEUlpt8mSJw9FgBvLHd3g33JWZ0HCK0haoS7YeicD
 a4qEK/SZ4u45zHn1O4AwVO4ZczD1khXdNEq3mun/pecVRdcGStrbQBJIk0sVsWxN3nJ/
 yeKJrM8PqUrwjtilimZTXLTdYOIZFC7ZLgQ4kLfYYgdh64vsaDaErnE8Tj8zNT4VMJQ2
 DcgEkXSp6qAy3I2TR7+EhEXvyqEIrvs7Bx5CDirwawgE6QnQdL2wqA8jFpxaRsrAAwsW
 3HtWzlbmr9sljfCaTH1SUFWxJBEkcEr2QEWPsvtEwnLjIWD5oMSCR1WqxSxi7JATRHhB
 IJKA==
X-Gm-Message-State: AOAM532NSZ9u4T9RSqjvHr4BLy7OZE5toPhesksxU8n6+PqFJYO44RfN
 YuhPbCygLitsMN9pXvQO7G+xnO14RdIHcenzDPsBpbVUDOOzPZHkEisnDTzPnt8pBGomGSfkrCr
 bd1WX+d5Ij6MUPcc=
X-Received: by 2002:a05:6e02:198e:b0:2cf:4a7a:faf8 with SMTP id
 g14-20020a056e02198e00b002cf4a7afaf8mr30566386ilf.206.1654027848531; 
 Tue, 31 May 2022 13:10:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2g3oZ5JhehjGT55Swhf8H4DRc/C3kEUH/R045griqnz8HehhIMF8iSElNgjXsfxTTtzmrhA==
X-Received: by 2002:a05:6e02:198e:b0:2cf:4a7a:faf8 with SMTP id
 g14-20020a056e02198e00b002cf4a7afaf8mr30566356ilf.206.1654027848271; 
 Tue, 31 May 2022 13:10:48 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o12-20020a056e02102c00b002d18e3dcb67sm4820649ilj.46.2022.05.31.13.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 13:10:47 -0700 (PDT)
Date: Tue, 31 May 2022 14:10:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, "f4bug@amsat.org"
 <f4bug@amsat.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com"
 <bleal@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Message-ID: <20220531141046.04b448e5.alex.williamson@redhat.com>
In-Reply-To: <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 May 2022 15:01:57 +0000
Jag Raman <jag.raman@oracle.com> wrote:

> > On May 25, 2022, at 10:53 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > 
> > On Tue, May 24, 2022 at 11:30:32AM -0400, Jagannathan Raman wrote:  
> >> Forward remote device's interrupts to the guest
> >> 
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> include/hw/pci/pci.h              |  13 ++++
> >> include/hw/remote/vfio-user-obj.h |   6 ++
> >> hw/pci/msi.c                      |  16 ++--
> >> hw/pci/msix.c                     |  10 ++-
> >> hw/pci/pci.c                      |  13 ++++
> >> hw/remote/machine.c               |  14 +++-
> >> hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
> >> stubs/vfio-user-obj.c             |   6 ++
> >> MAINTAINERS                       |   1 +
> >> hw/remote/trace-events            |   1 +
> >> stubs/meson.build                 |   1 +
> >> 11 files changed, 193 insertions(+), 11 deletions(-)
> >> create mode 100644 include/hw/remote/vfio-user-obj.h
> >> create mode 100644 stubs/vfio-user-obj.c  
> > 
> > It would be great if Michael Tsirkin and Alex Williamson would review
> > this.  
> 
> Hi Michael and Alex,
> 
> Do you have any thoughts on this patch?

Ultimately this is just how to insert callbacks to replace the default
MSI/X triggers so you can send a vector# over the wire for a remote
machine, right?  I'll let the code owners, Michael and Marcel, comment
if they have grand vision how to architect this differently.  Thanks,

Alex


