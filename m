Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F72955C009
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:03:12 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o683q-0007uB-KU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o681N-0005eM-81
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o681J-0004Zq-LQ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZDck5oReZ6VqL9Rw+EQr1yLcLzMYe8CxyA8/AFuqFk=;
 b=NnSXAN3zJerRPLnd6/4dKQvTYy6Hzvkk7COX199myrtkEFn1Z2LKT0TsF6ZRrzNLdiRNcT
 mZjrZ8WZyZqXja5Sc2nnlUY/rimSSXGhbTdatSVH2sq5hvKUGS3TGKuJMoGSLz32XZ5XRs
 1qausnAQUCk4S3TWTPS6IMj61R6ZjNc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-iVEgY5YwM_eAuurEA-JN2w-1; Tue, 28 Jun 2022 06:00:31 -0400
X-MC-Unique: iVEgY5YwM_eAuurEA-JN2w-1
Received: by mail-wr1-f70.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso1679428wra.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EZDck5oReZ6VqL9Rw+EQr1yLcLzMYe8CxyA8/AFuqFk=;
 b=zkihZUR3fwfH2ikMYjQReQr2zCqbT/H5SRfNlznxxYbDZ+0aNF3Z7l2QTpbfQgbdz8
 8aqK2mfXLB8VjIIr+G9Y5B2oQcxftwsDmt99LGATkamAZHwY58rQr+SOrsWNN1fhlnGg
 JCcEonz9Y3+TV2nyYJ++GAsXOoGv0EHfidmHBC+JDwUIyvDXopbHw8R4rlrUYvSC+QEc
 l4uD5Gj33maJwQxlKJ4XIuZY+GIKpow+Wbb668s9xyUx8xnwWN8lRn5Dyti6fj31EjaT
 CX6bunEeUhzlVAM1C4dOOKzTcZkfs7HsAcV3NuuvAEmbOxRyjrve8Y9en21M0eA/4w6Z
 rgqg==
X-Gm-Message-State: AJIora+2L80bMtYGPB8XGdV/2i//EYkNGfFqWSXj5cibmInSPHAfklmm
 DUsmDG+8q8CKhxSF2fVqEiEzX61fQQl9mL2MKJ1s70QrQoqLZUCeRXPkZBoFRHEiQ++tLwB/vdU
 EwVO/prpIxTF/1I8=
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id
 d7-20020a056000114700b0021b93db701amr16257281wrx.447.1656410430594; 
 Tue, 28 Jun 2022 03:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tochfmwDYXmZeYcHR+E3w1LLgWCEVoInFZRWPb8zj1LgMIMOsdl8SR2J2DyBi74BPDIqKAug==
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id
 d7-20020a056000114700b0021b93db701amr16257254wrx.447.1656410430318; 
 Tue, 28 Jun 2022 03:00:30 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003a05621dc53sm1049415wmc.29.2022.06.28.03.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:00:29 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:00:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628055626-mutt-send-email-mst@kernel.org>
References: <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrqyWhu8ThAcUGI4@redhat.com>
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

On Tue, Jun 28, 2022 at 08:48:42AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> > On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > > > > > > > > > No problem with that. So that's venv. But do we need pip and pulling
> > > > > > > > > > packages from the net during testing?
> > > > > > > > > 
> > > > > > > > > We do that too. See requirements.txt in tests/
> > > > > > > > > Following two are downloaded:
> > > > > > > > > avocado-framework==88.1
> > > > > > > > > pycdlib==1.11.0
> > > > > > > > > 
> > > > > > > > > Also see this line in Makefie.include:
> > > > > > > > > 
> > > > > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > > > > > > > 
> > > > > > > > Right but that's avocado since it pulls lots of stuff from
> > > > > > > > the net anyway.
> > > > > > > > Are the libraries in question not packaged on major distros?
> > > > > > > 
> > > > > > > Currently I only need this:
> > > > > > > https://github.com/python-tap/tappy
> > > > > > > which is the basic TAP processing library for python.
> > > > > > > 
> > > > > > > It seems its only installed through pip:
> > > > > > > https://tappy.readthedocs.io/en/latest/
> > > > > > > 
> > > > > > > I do not think this is packaged by default. It's such a basic library
> > > > > > > for parsing test output that maybe we can keep this somewhere within
> > > > > > > the python src tree? Not sure ...
> > > > > > 
> > > > > > It's pretty small for sure. Another submodule?
> > > > > 
> > > > > Unlike BITS, this one is likely going to be maintained for a while and
> > > > > will receive new releases through
> > > > > https://pypi.org/project/tap.py/
> > > > > so forking is OK but someone has to keep this updated.
> > > > > 
> > > > > I am open to anything. Whatever feels right is fine to me.
> > > > 
> > > > John Snow is currently working on the "Pythonification" of various QEMU
> > > > bits, I think you should loop him into this discussion, too.
> > > > 
> > > >   Thomas
> > > 
> > > submodule does not mean we fork necessarily. We could have
> > > all options: check for the module and use it if there, if not
> > > use one from system if not there install with pip ..
> > > But yea, I'm not sure what's best either.
> > 
> > submodules create a dependency on an internet connection, too. So before you
> > add yet another submodule (which have a couple of other disadvantages), I
> > think you could also directly use the venv here.
> 
> Definitely not submodules.
> 
> We need to get out of the mindset that submodules are needed for every new
> dependancy we add. Submodules are only appropriate if the external project
> is designed to be used as a copylib (eg the keycodemapdb tool), or if we
> need to bundle in order to prevent a regression for previously deployed
> QEMU installs where the dependancy is known not to exist on all our
> supported platforms.
> 
> This does not apply in this case, because the proposed use of tappy is
> merely for a test case. Meson just needs to check if tappy exists and if
> it does, then use it, otherwise skip the tests that need it. The user can
> arrange to install tappy, as they do with the majority of other deps.

I think that's reasonable, except I think we should
make configure do the checks as that is when users see the output
of what is available.

By the way, it might make sense
to have a script setting up developer dependencies for qemu
for major platforms.

> If John's venv stuff is relevant, then we don't even need the meson checks,
> just delegate to the venv setup.

IIUC venv does not install things itself. pip does.

> Regardless, no submodules are needed or desirable.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


