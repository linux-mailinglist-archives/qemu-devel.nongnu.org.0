Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8FC4AD447
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:03:16 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMP4-0007L7-Rr
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nHLEZ-0003Ht-8h
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nHLEX-0005TI-FE
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644306496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkhdTAAIhZ+jM63Puw33wIm+RUfDLQa78T0RS6V/3qs=;
 b=OjV1cgmDYPUtWzCs9IblS+Ussun2SJlBKT18Gn05SRc2ZzEPcOoc8xAuYRBPaeLZXElbIb
 zoSBEiZgj0e5uvjMp+24XBkNIggUBXA6OQpRX9lWrdZ9gYpXDZGS/HhcWdq9O2hEA+7BG7
 3ZTbyPC3xdyfVcXlH6wPONkIP8QoPHs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-i4CK8ImBPS2ciudGeXEcNQ-1; Tue, 08 Feb 2022 02:48:14 -0500
X-MC-Unique: i4CK8ImBPS2ciudGeXEcNQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m4-20020a50cc04000000b0040edb9d147cso8390413edi.15
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkhdTAAIhZ+jM63Puw33wIm+RUfDLQa78T0RS6V/3qs=;
 b=fUld/vv6PC9/vj6lRr00YBxMB6zsJ2sd4or1dbmhgLBLXdBUb/IkvMUY0dOAsbG0C9
 TGw8TOIo/18Hn/09lIq1D5bEDSeMnmfC/EJqFXFsgBAYcW/nBFJWqhBkKWmqZgirY/9e
 jFDyRoaLdtYMAXP2hmC3UyRwwGWQmIYLA9opLr6lnkESg6ZsvMZ1Q6M/DDJd/pdb6ADP
 6AE17DiIYN4s0Vl372HYOICDyqcsC+6vdAvBLtpQnN6wB6CHHnZKvDf8bBi20ipTrbLL
 m+gDmTzv0LJgMw09se/ghdZOMsWB0fQk3OxJOJ7BtScdA0yU8QUQxkzGc0k1tGQiK2nG
 RbMQ==
X-Gm-Message-State: AOAM5321DpS2ISTSsQuTJ5YgUKeMd39xGKhtTYCZy+wP3qWP43P7m8uk
 PIFWv9ugLnbqFdOeVPdrbXvCCunY4Fn7D4u3C77/d+JsGWBwQOg+CZOyXDeCj+FMeXqiBDi427n
 PyOQ/hUg713UORQ8=
X-Received: by 2002:a05:6402:881:: with SMTP id
 e1mr3114804edy.234.1644306493230; 
 Mon, 07 Feb 2022 23:48:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIa4inh8cFkxly23PDZtxbc+cXYEMtFCmVFOovSeXI4jdUTQq4koJc0RjxZriQQWX+XsYURg==
X-Received: by 2002:a05:6402:881:: with SMTP id
 e1mr3114789edy.234.1644306493054; 
 Mon, 07 Feb 2022 23:48:13 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id de24sm1283888ejc.112.2022.02.07.23.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:48:12 -0800 (PST)
Date: Tue, 8 Feb 2022 08:48:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests
 due to handle overlap
Message-ID: <20220208084811.0127206d@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2202072040490.2536804@anisinha-lenovo>
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
 <alpine.DEB.2.22.394.2202072040490.2536804@anisinha-lenovo>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: gsomlo@gmail.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 20:42:35 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> >
> > So question is it is worth to have legacy SMBIOS code and introduce a
> > new handle layout + memory_region re-sizable SMBIOS tables like we did
> > with ACPI ones.
> >
> > That way we we will be free to change SMBIOS tables at will without a
> > risk of breaking migration and without need to add compat knob for every
> > change to keep src and dst binary compatible.
> >  
> 
> Could you please point me to the change on the acpi side so that I can
> study it and look into the refactoring for smbios side?
> 

I'd suggest to start looking at acpi_add_rom_blob() and how it evolved to
the current code. Eventually you should find a commit introducing resizable
memory_regions introduced by Michael, it I recall correctly it was around
that time when we switched ACPI tables to memory regions.


