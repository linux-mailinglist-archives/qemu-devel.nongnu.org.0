Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1C42B74C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:31:39 +0200 (CEST)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXnd-0001BQ-VH
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maXlQ-0008GI-0F
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maXlO-0005dO-BP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpQby8zU+sTJwyf5eLqZB2xon5KDF+cuqm30S24c1QI=;
 b=fmX9F5YWC8wnFT/Boo+K2UXvsyHCamuMC9R3ItVjXIKkUsR6fsuRYnY2x0rp29mZmUKtu8
 YauTQn1I8OGLdZ68tFT8sdiG3uuYt4LIPt5DrT37jabhVszAjexcF5Og9zJ0kkgyNwghii
 2Bu7jyQaxGevUUR338Ff7m3q6EI3FLc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-zFS6BHaUMqmX7RKQTQ1EEw-1; Wed, 13 Oct 2021 02:29:16 -0400
X-MC-Unique: zFS6BHaUMqmX7RKQTQ1EEw-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so1271644edl.17
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jpQby8zU+sTJwyf5eLqZB2xon5KDF+cuqm30S24c1QI=;
 b=dlCCLpkyykwMQOig6HyLsT1Av47FFkYN97gGq650soL3CkO2EHl4NlXU9eF9UPlXTt
 lf28oaKrPWfqWAuh3HOxNKlTAiHR/OUcPu5krZBnxg+nx2PyJac5ccKo1pHEHFN8dxgs
 3Fhf5ArTBcrIJAteCNv1m6o3abpHATERf67faY6jOoro7v9GSYSPd6KaXnSGGY6pwLa/
 n9NHICFjnspg7AciIi4hH+PWfye0aackLLuJ88A1rOR83JokOdIWnZ4G0KRE5YUC61Ag
 AXDNLF3ApDChovRGJLe1ZjFEcIGA8OnJYxwiDobyvJsObfru3iXbb7MBPrLUQY9gDNe7
 EP7w==
X-Gm-Message-State: AOAM532sRqjUPQ9y1NG050XiQ37+EJFd0Z45M+6arHEzZgNE6m83PVqJ
 7rUST2upcep8gtyfFolHL7DmR6gdCULaWZHEA9n6Ik6QXH7D+rCEz3ZDD/LFACUEauxkCD9seWO
 9F4y13MkTDIGLbGA=
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr6821962edu.283.1634106554988; 
 Tue, 12 Oct 2021 23:29:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOP4ZEDv6q/gLgqy9Hijanm00cPAOrxE4lFip0AU2Yo9/nysLgPjjRn0G6fzLIXSF2MFBNiw==
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr6821938edu.283.1634106554798; 
 Tue, 12 Oct 2021 23:29:14 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id bq4sm6087072ejb.43.2021.10.12.23.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:29:14 -0700 (PDT)
Date: Wed, 13 Oct 2021 08:29:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211013062912.ilm7bydayna6gmco@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <20211012103754.kbyd3du26rpsi3ie@gator.home>
 <20211012142754.1c4e5071@redhat.com>
 <20211012131308.45j7ofd4xwk42epv@gator>
 <20211012155321.256e8867@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012155321.256e8867@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 03:53:21PM +0200, Igor Mammedov wrote:
...
> > > 
> > > Instead of putting workaround in QEMU and then making them generic,
> > > I'd prefer to:
> > >  1. make QEMU to be able generate DT with memory-less nodes  
> > 
> > How? DT syntax doesn't allow this, because each node needs a unique
> > name which is derived from its base address, which an empty numa
> you are talking about memory@foo nodes, aren't you?

yes, memory@<address> nodes

...
> > 
> > > or use ACPI tables which can
> > >     describe memory-less NUMA nodes if fixing how DT is
> > >     parsed unfeasible.  
> > 
> > We use ACPI already for our guests, but we also generate a DT (which
> > edk2 consumes). We can't generate a valid DT when empty numa nodes
> does edk2 actually uses numa info from QEMU?
>

edk2 doesn't use it, but I'd prefer we generate a DT which describes
the user's input and what the ACPI tables describe. Maybe someday it
won't be possible, but so far we've managed.

Thanks,
drew


