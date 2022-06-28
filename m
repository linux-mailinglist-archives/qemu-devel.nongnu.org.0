Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A055BF61
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:20:16 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66SF-0000u9-UW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o65Mr-0002NN-1S
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o65Mo-0001My-9S
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656400233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NhQi4VS+Ju/Il9xzpRuzCfdrc1HfohUJOdvajR0KvW0=;
 b=J19uAx4DHXr1CIOAbwJ8zuATHMJGKLcRpWF1xhtfjcJOjAK3IT9mbkpfc0/VqQzgvegbz9
 3TdxGcunFA4jC8e42QPrk++nMIPsON6ouHynjr8RR4ca5Ctfbm5j7aOnAZLFIQEx6NLYia
 3a7NQ4H/cJsvM34XJvIKv7EXRpzgbv4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-yVA9xNKVPfmjC0AOcjLgjw-1; Tue, 28 Jun 2022 03:10:31 -0400
X-MC-Unique: yVA9xNKVPfmjC0AOcjLgjw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020a056402414800b0042d8498f50aso8953978eda.23
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NhQi4VS+Ju/Il9xzpRuzCfdrc1HfohUJOdvajR0KvW0=;
 b=Sju5QK+OH/ljpt6hcoFGdGshsnHJqwEM/iegRxFf58IlrG85hL8bs2VSUp6PrTEdi3
 KXAlJ9BfOK/5Z5Fuk8VejjTa1Sy1VLibWvg8+DAZCKrmiDRzJKqiJ5gWaOomBAn39S4A
 7RcLD3Xo/GTbS4jgQZpHlVPw0dWAh8EITMjEOsoLi5GeJ5RNzkwC4df3RxZ8clt0/X8j
 qiS6c+JX2aVLTOSDtwLPnMpQ847BtsVq5fvg666TxtOljnuRi4S5odXBgs4QFjdv2pn9
 XQKWPJLqw1ty55tZnUzeben25PnNOD6fyzWvCwXHN9VrNBqbaFQLWDs+pQPMO9fkA5R9
 Lutw==
X-Gm-Message-State: AJIora/ncDN2i2nvH+5T8dZQJNL1rEE2pTM+AZ0KaZf2O/20NEdmHC7Z
 z7bIgGLMq5Pt1gFrUX5upFm0zzYqBu3D6qeyN/WBn0OBLc4XgqNQG48itZGsVpaKfyOWZz6OWPB
 THwvB6FKEORZJMhg=
X-Received: by 2002:a17:907:6e01:b0:726:9a7b:59b7 with SMTP id
 sd1-20020a1709076e0100b007269a7b59b7mr11118848ejc.752.1656400230319; 
 Tue, 28 Jun 2022 00:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTZXmcDP5nMDUjCPdoxayv268nKQbR2j5331yBFOjx2ReutraOKmgNJIBVY6XXGFV/flGHIg==
X-Received: by 2002:a17:907:6e01:b0:726:9a7b:59b7 with SMTP id
 sd1-20020a1709076e0100b007269a7b59b7mr11118820ejc.752.1656400230083; 
 Tue, 28 Jun 2022 00:10:30 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 e5-20020a056402088500b0043566884333sm8937149edy.63.2022.06.28.00.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 00:10:29 -0700 (PDT)
Date: Tue, 28 Jun 2022 03:10:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628030749-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
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

On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > > > > > > No problem with that. So that's venv. But do we need pip and pulling
> > > > > > > packages from the net during testing?
> > > > > > 
> > > > > > We do that too. See requirements.txt in tests/
> > > > > > Following two are downloaded:
> > > > > > avocado-framework==88.1
> > > > > > pycdlib==1.11.0
> > > > > > 
> > > > > > Also see this line in Makefie.include:
> > > > > > 
> > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > > > > 
> > > > > Right but that's avocado since it pulls lots of stuff from
> > > > > the net anyway.
> > > > > Are the libraries in question not packaged on major distros?
> > > > 
> > > > Currently I only need this:
> > > > https://github.com/python-tap/tappy
> > > > which is the basic TAP processing library for python.
> > > > 
> > > > It seems its only installed through pip:
> > > > https://tappy.readthedocs.io/en/latest/
> > > > 
> > > > I do not think this is packaged by default. It's such a basic library
> > > > for parsing test output that maybe we can keep this somewhere within
> > > > the python src tree? Not sure ...
> > > 
> > > It's pretty small for sure. Another submodule?
> > 
> > Unlike BITS, this one is likely going to be maintained for a while and
> > will receive new releases through
> > https://pypi.org/project/tap.py/
> > so forking is OK but someone has to keep this updated.
> > 
> > I am open to anything. Whatever feels right is fine to me.
> 
> John Snow is currently working on the "Pythonification" of various QEMU
> bits, I think you should loop him into this discussion, too.
> 
>  Thomas

submodule does not mean we fork necessarily. We could have
all options: check for the module and use it if there, if not
use one from system if not there install with pip ..
But yea, I'm not sure what's best either.

-- 
MST


