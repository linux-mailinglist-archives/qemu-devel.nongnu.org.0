Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46D40EDA5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 01:00:39 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR0Mw-0008Pc-4y
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 19:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mR0JG-0002jo-KE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 18:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mR0JE-0003Yt-OJ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 18:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631833006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LV58a/Hu4lou4bneREe3wXsDiURadG/0ew4pilP2wpI=;
 b=V6puXyDj87bs8xw0vDtIzXN1dMhm9cWROUJFTC1v6cVyDlIzjJZKs1CizS6vbAL3ygK7k9
 7whZ2YnL4VDpnF6TLMWU46BxX7hUXsI4GWpTN7lPtILQgO4JFWqoD92vb4S42cMLkhYTMQ
 p6QfjBSFlw0JQugIxLEfTccDNA/K9Zs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-PwKFPDAaMF-USqNv_tkSQg-1; Thu, 16 Sep 2021 18:56:44 -0400
X-MC-Unique: PwKFPDAaMF-USqNv_tkSQg-1
Received: by mail-ed1-f69.google.com with SMTP id
 h24-20020a50cdd8000000b003d8005fe2f8so2954327edj.6
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 15:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LV58a/Hu4lou4bneREe3wXsDiURadG/0ew4pilP2wpI=;
 b=DYaOA7q0D4WKlRwVvKAnVE7scokjPP8tucB1eEQw88GIcYcPyW75MxQJcbxS6YrfJg
 VnnnDnbLKeSf2KUCwBXwR7fbsZ0z+vf0Db35RtzPFeVZSmYgooIfJ3pK5EK9vuRFNuz2
 Goe4VvjO3OptX12WI0iXybZmhq7xCx5BtfF0tSAKjEEEAJ5Xe+QcKmqPfFqMvBCbND4v
 qzW2UTnhPpxObVz4iuMTb3YIaOMq5L6h3NhNBEuWtdQIU0/GoAlTIz2L+tQClTv2CZmZ
 hahtveVQ+rmxU8A1J8ni0mbWxhoxYkn2AphsADEIfUXcN+Sg9kuP/RsK7ZKPc0OMOFjt
 THxA==
X-Gm-Message-State: AOAM533I8xtZ3AJPzouDKOs51FdHQhrRrvqhM5hMXvW4fqp/IKhgnp+J
 2LCKL0UW8/A81ZfWmYzEAtHiKc+AIxhsB1rKXEygp6DPz26DlYJLBAf674KKlnSQCCu/axefIZy
 735MGMIRlEPVdQ04=
X-Received: by 2002:a17:906:7a09:: with SMTP id
 d9mr8817812ejo.116.1631833003012; 
 Thu, 16 Sep 2021 15:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDVLhMfxbWelADhGy+fK1e9f4MJCSd1UKx/lUjB3xzGeU1y5pXmRyZzdGxVz2KZUshs1B/tQ==
X-Received: by 2002:a17:906:7a09:: with SMTP id
 d9mr8817786ejo.116.1631833002722; 
 Thu, 16 Sep 2021 15:56:42 -0700 (PDT)
Received: from redhat.com ([176.12.194.242])
 by smtp.gmail.com with ESMTPSA id n18sm1616802ejg.36.2021.09.16.15.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 15:56:42 -0700 (PDT)
Date: Thu, 16 Sep 2021 18:56:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: hw/i386/acpi: fix conflicting IO address range for acpi pci
 hotplug in q35
Message-ID: <20210916185427-mutt-send-email-mst@kernel.org>
References: <20210916132838.3469580-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20210916132838.3469580-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: philmd@redhat.com, Igor Mammedov <imammedo@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 06:58:35PM +0530, Ani Sinha wrote:
> Here's sending v2.
> 
> changelog :
> v1: original patch.
> v2: typo fixed. reviewed-by tags added.


Thanks, tagged!
Ani pls make sure the voer letter in the series has
subject

[PATCH 0/3] hw/i386/acpi: fix conflicting IO address range for acpi pci
 hotplug in q35


using --cover-letter with git format-patch will do this automatically.

It will also include diffstat and other useful info.


> This issue has been reported here:
> https://gitlab.com/qemu-project/qemu/-/issues/561
> 
> We have disucssed this issue at length here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html
> 
> This issue affects Qemu version 6.1.
> 
> Patch 1 : allows q35 DSDT table changes.
> Patch 2 : actual fix.
> Patch 3: updates DSDT table blobs.
> 
> 


