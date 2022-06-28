Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089655C01C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:16:52 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68H5-0006W6-4G
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68DO-0001kn-TN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68DJ-00076Q-Lv
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656411175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwgMd1G9YElCPbJqt1ZEqaTaaipXCODemBbkAUBZ3/g=;
 b=QW/p+Gk8CM/7CRcu2oU0HT+90mdJ+aluzV9RKqRdP00lkv1dgWsbhC0wZCLR0voIGAZtdw
 a/i4XkcOy/Sft4K2q87XjnN5h3fTjCoweyCNEJHiNJHJ8NG6XMaTGTpeiRzVLg5sijnEp4
 8ihVuy/oo7jgROGdBtg6yKWFQSsBgNw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-Ylnn2qf2MzOZGzUewk5niw-1; Tue, 28 Jun 2022 06:12:54 -0400
X-MC-Unique: Ylnn2qf2MzOZGzUewk5niw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j19-20020a05600c191300b003a048196712so3556684wmq.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AwgMd1G9YElCPbJqt1ZEqaTaaipXCODemBbkAUBZ3/g=;
 b=m9n+EZqjTfjOx+n50idAqr3by68U0yWm5aQjGWo06jokmvufs/YTJuDqlZ/lZw+Ji0
 thwrQP8ENxZzFGYR371ZAAOeeR1OWT1JRkZBtu1mFmQHxaexje7ixzTpntGEv6I1YR0d
 JpU1JB4TH40o17q0VFpiWBQfMNeVQGYLDxbx9g2UEE0b1K+n0SbSO/+ERF9y+t3Qe5/3
 auKuc8YMnFD1OO+/NAV9GTCTF8alxkJErkrh3fHFkHrPVOYDHSetW0OWga2w3dOmhvWB
 LVgdEIGUNRUpsgf0moRmUMpS9h8np3qg7sTR0c4sHt+I1B4A82SA8qhLib/LGlwj8kez
 Whcw==
X-Gm-Message-State: AJIora/duvIU/kDh7uXJxHutBK9GdzaQptvmt0sHBGPbBeO/aFpWPuor
 EmZlDTATBAsZGc4HFV13UTCH89u3Kx1V6tV86NfwN9yDsr/upU2B5REp5urBlHjgR/7fJ+vF1ub
 Z7VNl8EHy9nLuRqI=
X-Received: by 2002:a05:600c:583:b0:39c:3637:b9f with SMTP id
 o3-20020a05600c058300b0039c36370b9fmr26241857wmd.79.1656411173267; 
 Tue, 28 Jun 2022 03:12:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s7KOfyzI67CUqFERZeW242fNJD/1EqADBdzYzkob910Zo2yK7YO6LJoP5I7i8wj6Ie6hEN/w==
X-Received: by 2002:a05:600c:583:b0:39c:3637:b9f with SMTP id
 o3-20020a05600c058300b0039c36370b9fmr26241821wmd.79.1656411173002; 
 Tue, 28 Jun 2022 03:12:53 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c404800b003a050a391e8sm2765995wmm.38.2022.06.28.03.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:12:52 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:12:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628060727-mutt-send-email-mst@kernel.org>
References: <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yrq6anPW60FkjmK6@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Jun 28, 2022 at 09:23:06AM +0100, Daniel P. Berrangé wrote:
> So bundling a pre-built biosbits in QEMU appears to mean that we're in
> turn going to unexpectedly bundle a bunch of other 3rd party projects
> too, all with dubious license compliance.

Well looks like classical mere aggregation to me ... license issues
need to be figured out if we are to distribute things but I think
this is basically what distros do anyway.

And I doubt we want to support arbitrary versions of grub etc,
they are very distro specific tools.
I don't see why we can't have the resulting ISOs in some submodule -
nothing requires us to distribute it in qemu tarballs.

-- 
MST


