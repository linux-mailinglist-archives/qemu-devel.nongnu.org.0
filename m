Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0D662DB1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwK1-0004KC-Hh; Mon, 09 Jan 2023 12:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEwJy-0004Js-N4
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEwJw-0006ED-Kb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673286747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8uh4vwCxejcf4GREMTlcyPCtsMdW+TjlJfk4d8hAtI=;
 b=RdlOjZnWU+OyDyVgPh9ogr7Qm+GrQiusFtFck7NgRiT8jUO5sCT7GKne46W6xWK6SjW2E/
 wpiqN6zT6YCvhiLFlY/tiL9xg2PUa1nOtZH1s69fOX7yVtly56trHPSbS4kWsrJsx6TO6K
 PyxGjyu8Fy/o3cpkXGlAGQEoxXr4Xz0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-hKCZ5s1IPnebUTZ_MzYV3A-1; Mon, 09 Jan 2023 12:52:26 -0500
X-MC-Unique: hKCZ5s1IPnebUTZ_MzYV3A-1
Received: by mail-wr1-f69.google.com with SMTP id
 l18-20020adfa392000000b002bbd5c680a3so1002570wrb.14
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8uh4vwCxejcf4GREMTlcyPCtsMdW+TjlJfk4d8hAtI=;
 b=WFzIxcV+a3rsYhXzVFGCWYcoE/nvi5WFeMXoGraghUo5Bgo1h4EithZ3hAWRUbBdBk
 NMybBPWNh0ta9cslql5+a4a/Fkn1z09C54deKfshrsSTtAySBx8HyM51aDPcu8i3plSz
 bo41WH6ZeeYNfw+0TyBcg+ZX16h/HC3V+uq6iFtxd/C3eJ1wQpOO2gQwcvVUM6mG6tsb
 38rWk8tqkjvQVuVYXXkIPl4BKGFMEmEjHDnJHB6+lFMMi67q8+7jxFFbBsq7pYfakz4N
 hsw0avE082doI4Yu7mQxB8xLc7OOoAjbZDmFpTKaRxId7xH1GUDCanjnDclsfdyGvaFm
 NtkA==
X-Gm-Message-State: AFqh2krTRXNmwaaehIexPQEzQYGM2rgK+fjTRzCv43VHK4WijaxBflGl
 qlC+tXWHllhQTmlvEpFGNaN3l0OeIhNA1N6WFSEaU3XGkmOM9aqPK5AiWnvbQgt5McVgHlY5dE1
 hIFNxmdL1j9Elwcs=
X-Received: by 2002:adf:e9d1:0:b0:2bb:6d44:5bc with SMTP id
 l17-20020adfe9d1000000b002bb6d4405bcmr5206741wrn.17.1673286745124; 
 Mon, 09 Jan 2023 09:52:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfBWPNx2PNVlEFFKgucBrwdVWtm3lDHET4ZZTCVlwndbpd1fkBPjLHqCLBb0IJfVmRZroZQw==
X-Received: by 2002:adf:e9d1:0:b0:2bb:6d44:5bc with SMTP id
 l17-20020adfe9d1000000b002bb6d4405bcmr5206734wrn.17.1673286744941; 
 Mon, 09 Jan 2023 09:52:24 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a5d4707000000b00291f1a5ced6sm8980045wrq.53.2023.01.09.09.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:52:24 -0800 (PST)
Date: Mon, 9 Jan 2023 17:52:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Message-ID: <Y7xUVq9PT9ohGfCj@work-vm>
References: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* James Bottomley (jejb@linux.ibm.com) wrote:
> On Mon, 2023-01-09 at 16:59 +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Fri, Dec 16, 2022 at 08:32:44AM -0500, Stefan Berger wrote:
> [...]
> > > > I do see it because the *volatile state* cannot be extracted from
> > > > this device. The state of the PCRs is going to be lost.
> > > 
> > > All the objections you're raising are related to the current
> > > specifics of the implementation of the mssim remote server.
> > > While valid, this is of no concern to QEMU when deciding whether
> > > to require a migration blocker on the client side. This is 3rd
> > > party remote service that should be considered a black box from
> > > QEMU's POV. It is possible to write a remote server that supports
> > > the mssim network protocol, and has the ability to serialize
> > > its state. Whether such an impl exists today or not is separate.
> > 
> > We would normally want an example of a working implementation though
> > wouldn't we?
> > 
> > So I think it's fair to at least want some documentation; if it can
> > be documented and works, fine; if it doesn't work, then it needs a
> > blocker.
> 
> It works under limited circumstances ... in fact similar circumstances
> passthrough migration works under,

Well, not that similar - people expect passthrough migration to fail
because, being nailed to a physical servers hardware it's not likely to
migrate; where as you're creating a new virtual thing which people might
imagine is similar to the existing swtpm.  Their imagination might be
wrong and thus you need to say why.

> which is also not documented.  The

Inductive proof that we should have no good documentation doesn't get us
anywhere.

> external MSSIM TPM emulator has to be kept running to preserve the
> state.  If you restart it, the migration will fail.

Document that and we're getting there.

Dave

> James
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


