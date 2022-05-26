Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571153504C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 15:59:53 +0200 (CEST)
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuE1j-0000rr-Uv
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 09:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuE03-00005w-OQ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 09:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuE01-0005wa-1w
 for qemu-devel@nongnu.org; Thu, 26 May 2022 09:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653573479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Keqb2UJI42tvqGFRjGG2qF2Fs4hdlp6Bl66xVqvodwI=;
 b=GiU2sHzEM+llSJf0KwrxLGEBfPF+FtA1noDKvEe8xOPUob0zkX2hZxISynZeWu1d7y70r7
 ZenDdqj8GpfdT7wguB3q7I7qYrx9GelVGGfx2yvfi0rSrCx86i8ZtSnXw+4cuElcb9Qvp5
 qs1HqiDav2qbq+AQ1K6PzkfwUSc2fzs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-h0fjC8ZcMrqvKAAShhd-3A-1; Thu, 26 May 2022 09:57:58 -0400
X-MC-Unique: h0fjC8ZcMrqvKAAShhd-3A-1
Received: by mail-ej1-f70.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso856574ejy.19
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 06:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Keqb2UJI42tvqGFRjGG2qF2Fs4hdlp6Bl66xVqvodwI=;
 b=e59w3PVbVkU5pz26u/5n0mWZ+ZV6WQh+p5mDGgtWOj9zKIBggqZZrYKeMRqqu/xnqK
 jfmktHvKTskKxE3qG10JGXIa1WZAOEcMYAD7WRzT/SQJYR6Jwex2ebnsx87ZwsADgbYK
 /1FWO4oYR2ZtsE1uvFabhPOo6khyFi8Lx+gd1uovlut6QKZz9PSz/PKG3tSeJm6R9Lf3
 hllSydts23MQXc2dlIz0ulAY6QKzxYXbkbfavi6xFrrCSyZW/oA4/mxPQBnBjUfnjxh7
 i+4c7bMniaKRh+07inSeoOe/6s2ILmcdYSKISJtFl/1hQZRPAIxXbt8nGqFp5Bs6pKwP
 Kk5w==
X-Gm-Message-State: AOAM532ctqVJfZvw4JpHmSZ0YSXpPMATUOirfGeu/kq1OFHT8wMtJ6VM
 TyZylolRPCrKNkov6/CuAWPHN+n/S3S4N2Yg2bZn+9Paf6G1/UMFBMTjsJSMDJr4NFXtSoz94xy
 CqcAa8SAxGM5Dpjo=
X-Received: by 2002:a17:907:d1d:b0:6fe:f789:31e with SMTP id
 gn29-20020a1709070d1d00b006fef789031emr15858226ejc.697.1653573477252; 
 Thu, 26 May 2022 06:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhYLoasdoKxCinh/4NcRmZRHxL0+LxkfCvidfimuR+8ly/GOIX16bb03GmYdoiKmzf/lAM5w==
X-Received: by 2002:a17:907:d1d:b0:6fe:f789:31e with SMTP id
 gn29-20020a1709070d1d00b006fef789031emr15858203ejc.697.1653573477002; 
 Thu, 26 May 2022 06:57:57 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a1709063e0200b006f3ef214e5bsm517685eji.193.2022.05.26.06.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 06:57:56 -0700 (PDT)
Date: Thu, 26 May 2022 15:57:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 ani@anisinha.ca, minyard@acm.org, stefanb@linux.vnet.ibm.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH 28/35] acpi: pvpanic-isa: use
 AcpiDevAmlIfClass:build_dev_aml to provide device's AML
Message-ID: <20220526155755.54257a64@redhat.com>
In-Reply-To: <20220518122602-mutt-send-email-mst@kernel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-29-imammedo@redhat.com>
 <20220516163547-mutt-send-email-mst@kernel.org>
 <20220517081351.vnx2xryjxason3dd@sirius.home.kraxel.org>
 <20220518122602-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 May 2022 12:29:25 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 17, 2022 at 10:13:51AM +0200, Gerd Hoffmann wrote:
> > That problem isn't new and we already have a bunch of aml_* stubs
> > because of that.  I expect it'll work just fine, at worst we'll
> > have to add a stub or two in case some calls are not covered yet.  
> 
> Right but adding these stubs is a bother, we keep missing some.
> If possible I'd like the solution to be cleaner than the status quo.
> Is adding a wrapper instead of setting a method directly such
> a big problem really?
> 


here is stub based ACPI decoupling for isa devices we currently
have in the tree:

https://gitlab.com/imammedo/qemu/-/commits/decouple_build_aml_v1/

If it looks acceptable to you, I can prep/post it first and
then rebase this series on top to reduce unnecessary churning.
 


