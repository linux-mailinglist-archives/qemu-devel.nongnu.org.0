Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0F5AE279
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:27:50 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTvx-0004PP-7r
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVToT-0008T9-6m
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVToP-0002O7-4L
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662452400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CHH+w10/6aKNeXA6qm3GkaomtHQ+n9zapcvyEm+bIio=;
 b=AK7fuVGlnedD3IeGb/kmtUC9qBDOBGaxlzDcUc18sJ12T4/tL8QOzv14UMokW8GptgvnDS
 fc4U0p/iuV9+dB35iY0ZivBOtaxu4n/sIr+9CrNI+uY5gNxvu7tiIZahfWkN18bPjnA6/u
 s+2x58q2plBVvWQG/rKbLeoRzQ5Floo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-clhDxJ6pM36rAzcBVw3ABw-1; Tue, 06 Sep 2022 04:19:57 -0400
X-MC-Unique: clhDxJ6pM36rAzcBVw3ABw-1
Received: by mail-ej1-f69.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso3164842ejb.14
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CHH+w10/6aKNeXA6qm3GkaomtHQ+n9zapcvyEm+bIio=;
 b=X7d1GLlem4KuHV57eX3mPmiwe5wMcNYG1L0jUkARvpz+t7mdBk3O3rBghIGCxxIh43
 l2eDRMsUksbx30dryJZlBfMDcYOGKQRuuprMcicKFeajEaTTorw3ciEjqtwzxk2/XhaM
 vx+ige2WUc6gwnomBbLyQ1BihojrIZCWt4NadtnVhmsMpK2OW5AbcQKYpOtgOEcpYWHN
 Mv/bdadYXU6ebkZVXhSWq+ZlTeecWx2quyQ/PkywYY0xVFnlO9OL3PZoxmPLBr1oCXE9
 u3/c6dOmtN5AkynMXPR4er9lg8IWvY7744QHorbFgIG6bwDQh6OwKkBShjKQRkRF1mlh
 dyzw==
X-Gm-Message-State: ACgBeo2Xl94cSWf7oldLNeMUrrZJc9RwucvL6ss848QjMFweqMgoAiSi
 2l1shmEtGMO0sY89+fgfkH1qEUjuUD3UppxU9un5kZPuwhDzb8JOpRIZLewTA03PN/BO/SHbL5Y
 tgmm5vtqndDLw3tI=
X-Received: by 2002:a05:6402:35cf:b0:448:84a9:12cf with SMTP id
 z15-20020a05640235cf00b0044884a912cfmr33165002edc.51.1662452395919; 
 Tue, 06 Sep 2022 01:19:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56yct+zVj/EiQSkaQS8386GuVHSvNHSqb5r+O5ss9tDm7PMkmGgpV6zhpJwjoxLkoV3uuiNg==
X-Received: by 2002:a05:6402:35cf:b0:448:84a9:12cf with SMTP id
 z15-20020a05640235cf00b0044884a912cfmr33164979edc.51.1662452395668; 
 Tue, 06 Sep 2022 01:19:55 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 q13-20020aa7d44d000000b0044eb5b922bdsm1928210edr.24.2022.09.06.01.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:19:54 -0700 (PDT)
Date: Tue, 6 Sep 2022 04:19:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 thuth@redhat.com, berrange@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
Message-ID: <20220906041904-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <CAARzgwxUvkQSaoguyRYA5VSsvRzAYOYpbpzyDE+D1RvOyqEcug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwxUvkQSaoguyRYA5VSsvRzAYOYpbpzyDE+D1RvOyqEcug@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Sep 06, 2022 at 11:56:33AM +0530, Ani Sinha wrote:
> On Thu, Jul 14, 2022 at 6:54 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > Changelog:
> > > > v2:
> > > >  - a new class of python based tests introduced that is separate from avocado
> > > >    tests or qtests. Can be run by using "make check-pytest".
> > > >  - acpi biosbits tests are the first tests to use pytest environment.
> > > >  - bios bits tests now download the bits binary archives from a remote
> > > >    repository if they are not found locally. The test skips if download
> > > >    fails.
> > > >  - A new environment variable is introduced that can be passed by the tester
> > > >    to specify the location of the bits archives locally. test skips if the
> > > >    bits binaries are not found in that location.
> > > >  - if pip install of python module fails for whatever reaoson, the test skips.
> > > >  - misc code fixes including spell check of the README doc. README has been
> > > >    updated as well.
> > > >  - addition of SPDX license headers to bits test files.
> > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > >
> > > > For biosbits repo:
> > > >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > > >    The build script generates the zip archive and tarball used by the test.
> > >
> > > So far so good, I think it's ok for a start. It's probably a good idea
> > > to host the source on qemu.org. Peter - any objection to this?
> >
> > Dan was looking at v1 from the point of view of how we handle the
> > guest binary blobs for these tests -- I'd rather defer to him rather
> > than taking the time to get up to speed on the issue myself.
> 
> Ok let's resurrect this discussion again. What are we going to do with
> bios bits? Put it in git.qemu.org then?
> I have put a lot of time and effort into this work and I believe this
> will add another valuable tool to test acpi stuff, so I am not going
> away :-)

This makes sense to me. Peter, ok? Could you create a repo for Ani if
yes?

-- 
MST


