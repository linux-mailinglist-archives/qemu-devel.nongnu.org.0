Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E12C529B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:10:53 +0100 (CET)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFAp-000894-Pd
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiF9Q-0007kH-7u
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiF9M-00072E-Bl
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606388958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Sk7pvM6C6yq+yZvSSCmMxo16rcvXcLgi0aKoqQipec=;
 b=Ix56y+MJ0AM6KNXCXPGx5Ih7348OsNlYH7h2uHYD384WOzqn48TjiXb2192VwhNKMIvGjx
 s6gTaUm45c9Ti4hkxWBjGZWP9DIxX/ugpoFFuDSXQmFFieUf8y9xtu+UnmnwOkSpspNtyS
 Yz/5hWaKMhor85BD515Q5zOwCpEeyyI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-qJVk9IFcNvqIhrvxXA9S7w-1; Thu, 26 Nov 2020 06:09:16 -0500
X-MC-Unique: qJVk9IFcNvqIhrvxXA9S7w-1
Received: by mail-wr1-f71.google.com with SMTP id i7so1127691wro.6
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Sk7pvM6C6yq+yZvSSCmMxo16rcvXcLgi0aKoqQipec=;
 b=OnbRwMKFtRwUws/Qpmkn1YZXGvLuFEgT19YZ2fUtLWy6mBrrb4ej70MrIX52E9T9Lp
 uQ6hi+Fk1tgGrG7aJ+6GE1N4gEEn+pNuhwxBDsb6lkmlM+u3rK9Qo+u0oMW6xtjJytVU
 XLP3mL4qubKi+/JvP8nKTlkXEE0I8XP0o+lWszH66ZgiuLImKeyukQ0hdFKZH8wMGtGo
 KxsSvmyx8bPBUjXC28HXhoNO8l+T0xpxxa52dp7xuXNFDnoFfxJ6FwXeF2mc7jsb5QYM
 kcxMnfPR3L8yu7rONltGDSi3MBfBLt3NutOnxP8gVMBBa0DyR9ZVPowg5N3hkJfV3BzW
 KnYw==
X-Gm-Message-State: AOAM530HvCgdmVuoKFBH1Lsuf4Mjafpw/dxvDYLDl2JmeqwDMm+IWgIG
 Twur2iiuXint7LxbupjVhwhRFv0iNzghVc+lEHvPOvKw/5op4DQjt8F76s+a7IvuWmCvMbQjY0k
 17PfcoajJObvtXxw=
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr3156936wrt.372.1606388955602; 
 Thu, 26 Nov 2020 03:09:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6oWlbuZDWtt7NrWy+cNoGVuf1sfO+0KnXJqZcHqotyBbnNDJmSZ4N7W0jeRS7pWh7Vkj9aQ==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr3156907wrt.372.1606388955363; 
 Thu, 26 Nov 2020 03:09:15 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c64sm7736391wmd.41.2020.11.26.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 03:09:14 -0800 (PST)
Date: Thu, 26 Nov 2020 06:09:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126051838-mutt-send-email-mst@kernel.org>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
MIME-Version: 1.0
In-Reply-To: <20201125201322.urze5b7vwaa2t5sy@tartarus>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> > > > Hello,
> > > > 
> > > > We recently found out that some softwares are effectively crashing
> > > > when they detect qemu's `OEM ID` or `OEM table ID` in the ACPI tables.
> > > > 
> > > > I see no reason not to expose the setting to the user/command-line. A
> > > > previous patch has been submitted in 2015[1] but did not get through
> > > > because (if I understand correctly) using the IDs on the `SLIC`, `BXPC`
> > > > and `RSDT` tables were enough at the time.
> > > > 
> > > > If you agree, I am willing to forward port the patches of M. Jones but I
> > > > need to ask how it would work `Signed-Off`-wise ?
> > > 
> > > On this point, the patch I sent was actually written by
> > > Michael Tokarev, I was only trying to get them upstream.
> > > 
> > > Rich.
> > 
> > I think at least one of the issues is that e.g. UEFI at least
> > seems to assume unique OEM table IDs e.g. for SSDTs.
> > 
> > So let's try to be more specific please, which software
> > crashes, what does it want to see and in which table.
> 
> I'm sorry I cannot give you the name of the crashing software due to a
> company policy. But I can tell you that if either `BOCHS ` or `BXPC` is
> present in any of the tables it will crash. Any (or at least the few
> that I threw at it) other string will work so it seems it's some kind
> of DRM-related hypervisor detection.

Hmm I'm not sure how far we want to go with this. If software vendors
want to detect a hypervisor there will always be a way.
How are we sure we are not starting an arms race here?

Also which of the IDs matter?  OEMID? OEM Table ID? Creator ID?


> As for the uniqueness of the table IDs, I guess it would be sane to keep
> the same pattern (id+table sig) but allowing the first 4 bytes to be
> overridden.
> 
> [...]

It's certainly possible, it's just very specific to just this DRM scheme.
Not sure what's a better way to do it:
  qemu -acpidefault oem_id=ABCD,oem_table_id=EFGHIJKL
is probably going too far since then table IDs are not unique.

Also I'd probably use machine properties for this, the need here
is baroque enough that we don't want a dedicated option.

> 
> -- 
> Antoine 'xdbob' Damhet


