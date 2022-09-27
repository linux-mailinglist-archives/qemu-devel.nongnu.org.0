Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC845ECF43
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:25:34 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odI56-0003FZ-VL
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odHzt-0005mS-7D
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odHzq-0004cX-LD
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664313605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+S9WsUma7wYgM+5xApA9p2tGKBL3bPA5JjTUn5e9nHo=;
 b=AMOD5ugdfEfIB6EHYF6P3bLucCaSI3ykF3eWpJvivwXbhbaEf/zQhMqe42Jz+mR0rhGygH
 MjTNfhR38c6mF7mtd3VjgrUmXcfaSqRWlBxECQUtFchlFt9jSur6NHAhyIZ0XBxwh2utck
 bk68Mx9iIodzelMKYKORIIbrz+QoxXo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-sJa4nEtvPMiUtwTbR4h6Ow-1; Tue, 27 Sep 2022 17:20:04 -0400
X-MC-Unique: sJa4nEtvPMiUtwTbR4h6Ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 p36-20020a05600c1da400b003b4faefa2b9so6093222wms.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=+S9WsUma7wYgM+5xApA9p2tGKBL3bPA5JjTUn5e9nHo=;
 b=OMlj1WnBDUdbvLBkCvnml8SxY5ZhMEqu1jYAcmqlXu39heqraXCAxI5QKlIc8yqFtT
 5IIMvvbVKYMfwgwrErUnxrI+e4mo3nLfjo0M/ShXWv2XLHzMOnRY07gXXXg+329dO0LC
 4Z4QlCjaBWYyfBs/MEgflmPmQICs6qCiL57R4X9dzFIXhcnQ5YX/fUhiANxyUTJ9HjX7
 6D2FwDgeJeaZkbWp1luJ2vKeygX1w9KAinN9rizDoMr2dMzVIUpfsbvmTyyLSx+J/KwC
 XsJBb2He/YymJJ6X1ZmHLiCgU5oqAxFGXOlo+vKOgER00qg6t2RzE9lNvy7Ck6SKnrBP
 8enw==
X-Gm-Message-State: ACrzQf2TPOR+Qh+RT6x8RDPGPAWDNXXfnK+5YAbQWXQ88HQW4g7DYEEO
 E1wqaK8ggkn64X2RCCRpnFcpqkQCJv+8gV9uR0YUbG+5R70eSQsdXVEJxxyWcn0zaMR896lFCML
 DiACm8qnDqHLtC5k=
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id
 bi6-20020a05600c3d8600b003b4b65fa393mr4325112wmb.0.1664313603164; 
 Tue, 27 Sep 2022 14:20:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44sDqgaKPDJ8gpBzmqd548Vmibp/8pu8JZxpsmGo5fyVENS4wfDGhSn/6HPifZs1bBdhkTsQ==
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id
 bi6-20020a05600c3d8600b003b4b65fa393mr4325096wmb.0.1664313602899; 
 Tue, 27 Sep 2022 14:20:02 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 z10-20020a1cf40a000000b003b4868eb6bbsm3331350wma.23.2022.09.27.14.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 14:20:02 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:19:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220927171838-mutt-send-email-mst@kernel.org>
References: <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Sep 27, 2022 at 03:37:39PM +0530, Ani Sinha wrote:
> > > > > > >
> > > > > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > > > > > the binaries in some other repo first. Everything else hinges on that. We
> > > > > > > can fix the rest of the bits later incrementally.
> > > > > >
> > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > > > > > keep the binaries?
> > > > >
> > > > > Can we please conclude on this?
> > > > > Peter, can you please fork the repo? I have tried many times to reach
> > > > > you on IRC but failed.
> > > >
> > > > Probably because of travel around KVM forum.
> > > >
> > > > I think given our CI is under pressure again due to gitlab free tier
> > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > Can Ani just upload binaies to qemu.org for now?
> > >
> > > I agree with Michael here. Having a full ci/cd job for this is
> > > overkill IMHO. We should create a repo just for the binaries, have a
> > > README there to explain how we generate them and check in new versions
> > > as and when needed (it won't be frequent).
> > > How about biosbits-bin repo?
> >
> > If QEMU is hosting binaries, where any part contains GPL code, then we
> > need to be providing the full and corresponding source and the build
> > scripts needed to re-create the binary. Once we have such scripts it
> > should be trivial to trigger that from a CI job. If it isn't then
> > we're doing something wrong.
> 
> I was thinking of commiting the build scripts in a branch of
> https://gitlab.com/qemu-project/biosbits-bits.
> This would separate them from the main source. The scripts would build
> a version of qemu-bits based on the version information passed to it
> from the environment.
> Before I committed the scripts, I wanted to check whether we would
> want to do that or have a separate repo containing the binaries and
> the build scripts.
> Seems we want the former.

A separate repo is standard imho. Don't see any advantages to
abusing git branches like that.

> As for the gitlab-ci, I looked at the yaml file and the qemu ones
> looks quite complicated. Can someone help me generate one based on the
> build script here?
> https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> 
> > The CI quota is not an issue, because
> > this is not a job that we need to run continuously. It can be triggered
> > manually as & when we decide we need to refresh the binary, so would
> > be a small one-off CI quota hit.
> >
> > Also note that gitlab is intending to start enforcing storage quota
> > on projects in the not too distant future. This makes it unappealing
> > to store binaries in git repos, unless we genuinely need the ability
> > to access historical versions of the binary. I don't believe we need
> > that for biosbits.
> >
> > The binary can be published as a CI artifact and accessed directly
> > from the latest artifact download link. This ensures we only consume
> > quota for the most recently published binary artifact. So I don't see
> > a compelling reason to upload binaries into git.
> >
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> >


