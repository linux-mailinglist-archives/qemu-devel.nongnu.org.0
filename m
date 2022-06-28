Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DB55C044
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:38:12 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68bj-0001fG-AU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68ZT-0007Gz-KY
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68ZR-0002xO-4s
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656412548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkHgea5URE+0ZsSYYmCu8jv6VaDBMJkFy1wQsvuRHPA=;
 b=DtOBmoPhHNRoPd+Q19npw4uHJsx0GWfOmulJrck3doHMMBhkme1rb0hrxgzi4A3UP2hpiX
 xTGYWiZX7uA23ZU8NGtimvCg4mA3DsxMlh2V9RXmVFi3DEqF6rnU8ZpBSYEx8m46WrUWFt
 lWyw4iaT7oS2gijdHNHud+MByfmnscc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-lwqOWou1NluZdyuSH6FL3g-1; Tue, 28 Jun 2022 06:35:47 -0400
X-MC-Unique: lwqOWou1NluZdyuSH6FL3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 n7-20020adfc607000000b0021a37d8f93aso1718741wrg.21
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LkHgea5URE+0ZsSYYmCu8jv6VaDBMJkFy1wQsvuRHPA=;
 b=D01Y77As5Ptl5R4ZL9gujI97b1TUl+xfLIOqWOyGal/HeBZ0KbMG72ZPGvagyem5Tw
 hVbsxW3sPX9ebMB28JRMfhxNEjNpjp38qivrEIBmvDJM2vLt+SbFBRYtdHPiuCAtMCQg
 GpQ1asjqWdo49qpJn46792eOVj05I4SwUH0RZVkwTI+U+6eQkn7BgMlmnoouXrULXhKx
 c64mJuA/9kURFnx9CzJgy6dhMPgrwR06iFX7iFLLMKDa0abUIDj9zprAqQ07QGyMH6Aj
 Fh3La4QbI8Xgg6Fv81yy8JTZzvtCfPtNC3h/e+SJhMHPalrHuweEEmG5Fomxc+fy5yoy
 XEDw==
X-Gm-Message-State: AJIora9Yqwixf8HfmjAugEgoyZgwFSDqBDcrW2ivJrrXkLxJE0lQDAFe
 XAvX7lmYWz28aMFEymxvpEocmYAhpsq5LDO0fQSkY+zmDoQe1uzbcBQdJ/y9z1qQdEX5UYFXapM
 InHIXupNdGNmGGL8=
X-Received: by 2002:a5d:5602:0:b0:21b:a332:4d48 with SMTP id
 l2-20020a5d5602000000b0021ba3324d48mr16966998wrv.555.1656412546116; 
 Tue, 28 Jun 2022 03:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vn0K5zYnyHIUs4MnxRZVl+anXlbU6aC2uYszjzpWGePGYjcNKPgzQca/HjDF9WApqmdTPOJA==
X-Received: by 2002:a5d:5602:0:b0:21b:a332:4d48 with SMTP id
 l2-20020a5d5602000000b0021ba3324d48mr16966976wrv.555.1656412545848; 
 Tue, 28 Jun 2022 03:35:45 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 bs30-20020a056000071e00b0021bb9071374sm11802158wrb.53.2022.06.28.03.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:35:45 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:35:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, imammedo@redhat.com
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Message-ID: <20220628063041-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <Yrq3HUEghZ7IFh//@redhat.com>
 <CAARzgwzDdQGQ81bNAOg6t=4rhfdkQjunscT+x=sUOEp92R=cmg@mail.gmail.com>
 <YrrSk+HPXqCc/Jz3@redhat.com>
 <20220628061307-mutt-send-email-mst@kernel.org>
 <YrrWOAqLCvtoeu1v@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrWOAqLCvtoeu1v@redhat.com>
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

On Tue, Jun 28, 2022 at 11:21:44AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 06:16:06AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 11:06:11AM +0100, Daniel P. Berrangé wrote:
> > > Ok, with that kind of size, it is definitely not something we want to
> > > be committing to git either,
> > 
> > Not to qemu git I think.
> > 
> > > nor consuming via a submodule since the
> > > latter would bloat the release tarballs too.
> > 
> > Hmm - why? We don't have to put the submodule in the tarball if we don't
> > want to. People consuming tarballs probably do not need these tests
> > anyway - just a basic smoketest is all that is needed.
> 
> That feels very dubious. Upstream doesnt test every scenario that users
> build & run in. Especially with Fedora rawhide we've often found problems
> which upstream QEMU missed, particularly where new GCC releases have bugs
> causing subtle mis-compilation of code.
> 
> With regards,
> Daniel

IMHO these tests are not really useful for that.

What they do is verify that our ACPI tables are sane -
in addition to the manual review with disassembler we do currently.

We already have tests that verify that qemu generates expected ACPI
tables and that is enough for what you describe.

A miscompiled qemu will generate acpi tables that differ from expected
ones and the simple bit for bit test will fail.
No need to run acpipica within guest.




> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


