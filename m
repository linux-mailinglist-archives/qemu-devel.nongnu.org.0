Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064365F6B85
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:23:48 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTez-0005tL-77
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogSoH-0005a5-Ob
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogSoC-0007ps-BT
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6A/d98cBVigvX0DJpZ4OJ/nJz82KTkW4MwvhYIkZdgQ=;
 b=DWF4kIMHk/03auUvytwZof9zyxfyL5ryT5TeXL3ijAwfsjI6585ze/eykJTbzJhvWvbUr8
 sf+DPxylrFW+dLU867S1RR+cE+ZHj12I2x2dSfEnKWSWDaB0hovR1zRwOu6XmP+iPQtAqp
 ul/e6lUQIIroKG3mw2CelKVnGnVkzy8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-1WxkWONkPzeI53aQJCE9ig-1; Thu, 06 Oct 2022 11:29:10 -0400
X-MC-Unique: 1WxkWONkPzeI53aQJCE9ig-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a1c3502000000b003b535aacc0bso2766711wma.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6A/d98cBVigvX0DJpZ4OJ/nJz82KTkW4MwvhYIkZdgQ=;
 b=Kmg9COPfqiBxYa4ySJ9vfFh6cdUItITRs8DnaL9osVvQXlxnu/KArV3Lo6JkHyE3Gn
 4XKUP92PZfEsEyqngg34+g1Ve0gUUGdFnUdRORIugf46Ak1bM2QK2Lhf2CO5bpD+77dy
 yK9PyX2c5Vn1nVNEVfIlXWYgbcS6myoV2DuLxhrBEQZ+6zYpA0AiFOuPJq/TPQcYlIv4
 SeKy/JYp7luhCEAL5KpSQ3++Rv5WTVjof+uoBFkKzJader7+hprjfKQ4j2lOqBWODzeI
 XHC4pjVouBZanOsp+DW7JeVDLObPuCdKMIIrSZnuhZ7r0nJehszpNQlwUYtxa0sGSue2
 idDA==
X-Gm-Message-State: ACrzQf3uTWRavKP5dxG45VlLWKOIYGamKHKVNxZDom6ATZA9zjNjPE8b
 xU/LJLdueiAl/pLu9vgzISlRYRyj0OuGZ0P82m4gKDp3qPtfF2rzpekAsbOLEb9GGUiqyMVgI5Y
 pdyyc4sJadMosuOc=
X-Received: by 2002:adf:f9c9:0:b0:22e:3581:2422 with SMTP id
 w9-20020adff9c9000000b0022e35812422mr357740wrr.592.1665070149234; 
 Thu, 06 Oct 2022 08:29:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5m4UMrKv9QWRJLOxENkszbKmX6rOYObDv2A/XZzP+lQnZuO9y3noMg3nT11XDmlFlt4uA1bQ==
X-Received: by 2002:adf:f9c9:0:b0:22e:3581:2422 with SMTP id
 w9-20020adff9c9000000b0022e35812422mr357721wrr.592.1665070148945; 
 Thu, 06 Oct 2022 08:29:08 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c3b0700b003a1980d55c4sm6066909wms.47.2022.10.06.08.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:29:08 -0700 (PDT)
Date: Thu, 6 Oct 2022 11:29:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <20221006112753-mutt-send-email-mst@kernel.org>
References: <20221006113906.179963-1-mst@redhat.com>
 <27e666ae-0a91-1843-8eb0-c816ab261eb1@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27e666ae-0a91-1843-8eb0-c816ab261eb1@amsat.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 05:10:10PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Michael,
> 
> On 6/10/22 13:39, Michael S. Tsirkin wrote:
> > The most commmon complaint about submodules is that
> 
> Typo "common"
> 
> > they don't follow when one switches branches in the
> > main repo. Enable recursing into submodules by default
> > to address that.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   .gitmodules | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> 
> We have 3 kinds of submodule (or more?):
> 1/ required to *build* QEMU
> 2/ required to *test* QEMU
> 3/ only here for satisfies license of firmware blobs shipped with QEMU.
> 
> IIUC, long-term we want to move 3/ in another repository.
> 
> Could we only set "recurse=true" for 1/ ?
> 
> What is your use-case? Do we need it also for 2/ ?

The use case is avoiding git diff output simply by switching
branches. to serve that purpose all submodules need to be recurse=true
unless they never change.

> > diff --git a/.gitmodules b/.gitmodules
> > index aedd9a03d4..5f32332aff 100644
> > --- a/.gitmodules
> > +++ b/.gitmodules
> > @@ -1,69 +1,92 @@
> >   [submodule "roms/seabios"]
> >   	path = roms/seabios
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/seabios.git/
> >   [submodule "roms/SLOF"]
> >   	path = roms/SLOF
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/SLOF.git
> >   [submodule "roms/ipxe"]
> >   	path = roms/ipxe
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/ipxe.git
> >   [submodule "roms/openbios"]
> >   	path = roms/openbios
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/openbios.git
> >   [submodule "roms/qemu-palcode"]
> >   	path = roms/qemu-palcode
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/qemu-palcode.git
> >   [submodule "roms/sgabios"]
> >   	path = roms/sgabios
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/sgabios.git
> >   [submodule "dtc"]
> >   	path = dtc
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/dtc.git
> >   [submodule "roms/u-boot"]
> >   	path = roms/u-boot
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/u-boot.git
> >   [submodule "roms/skiboot"]
> >   	path = roms/skiboot
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/skiboot.git
> >   [submodule "roms/QemuMacDrivers"]
> >   	path = roms/QemuMacDrivers
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/QemuMacDrivers.git
> >   [submodule "ui/keycodemapdb"]
> >   	path = ui/keycodemapdb
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/keycodemapdb.git
> >   [submodule "roms/seabios-hppa"]
> >   	path = roms/seabios-hppa
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/seabios-hppa.git
> >   [submodule "roms/u-boot-sam460ex"]
> >   	path = roms/u-boot-sam460ex
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/u-boot-sam460ex.git
> >   [submodule "tests/fp/berkeley-testfloat-3"]
> >   	path = tests/fp/berkeley-testfloat-3
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/berkeley-testfloat-3.git
> >   [submodule "tests/fp/berkeley-softfloat-3"]
> >   	path = tests/fp/berkeley-softfloat-3
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/berkeley-softfloat-3.git
> >   [submodule "roms/edk2"]
> >   	path = roms/edk2
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/edk2.git
> >   [submodule "slirp"]
> >   	path = slirp
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/libslirp.git
> >   [submodule "roms/opensbi"]
> >   	path = roms/opensbi
> > +	recurse = true
> >   	url = 	https://gitlab.com/qemu-project/opensbi.git
> >   [submodule "roms/qboot"]
> >   	path = roms/qboot
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/qboot.git
> >   [submodule "meson"]
> >   	path = meson
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/meson.git
> >   [submodule "roms/vbootrom"]
> >   	path = roms/vbootrom
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/vbootrom.git
> >   [submodule "tests/lcitool/libvirt-ci"]
> >   	path = tests/lcitool/libvirt-ci
> > +	recurse = true
> >   	url = https://gitlab.com/libvirt/libvirt-ci.git
> >   [submodule "subprojects/libvfio-user"]
> >   	path = subprojects/libvfio-user
> > +	recurse = true
> >   	url = https://gitlab.com/qemu-project/libvfio-user.git


