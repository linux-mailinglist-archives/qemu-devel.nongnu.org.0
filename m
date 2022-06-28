Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C916C55E51C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:55:51 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Bh0-00084k-UD
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6BdS-0003fz-Bm
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6BdQ-0007bj-Du
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656424327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnt5oc7gLxZB9J9iZOnM7dfk2SWBy3LEE5lXBRM+I00=;
 b=VbccKctsHctyFYDnehEtYiy4jBl30eE4G35JM5wiFnfQWUvnthDHcB5TT4D3cb+52+NxyX
 vUoi/R3WjJMQudSEot6Qhvi2fjHMFJ+bX5aD0IV/1P/jcs/eqVGoMuSdYOLxxj0jjY3Ph3
 0CtDdZGQEIW9XAwLjcsfPKrW25Qr3f0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-TxGjzR1sN2qGZKhALfIU7g-1; Tue, 28 Jun 2022 09:52:05 -0400
X-MC-Unique: TxGjzR1sN2qGZKhALfIU7g-1
Received: by mail-wr1-f72.google.com with SMTP id
 w12-20020adf8bcc000000b0021d20a5b24fso409744wra.22
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wnt5oc7gLxZB9J9iZOnM7dfk2SWBy3LEE5lXBRM+I00=;
 b=W4O8zng6IA3YsXh88bYFJttg7TsrXWrb3StcWgL1ZaEDo/RCt+obyEE3zc7kbjnOVw
 DlwUGagc2sRf47bcnZA0MA/9IsLafZARHKBriUP61pq2tUUop2YW/hYzk/JLq0aD/lsf
 1JlKTiP4Rzp9iEfbmCHHJL38iouX72wy5+xmy7E3MgHzQQWf7nts2XWSRZHAruhNqWNO
 XAVMXEJ3MDIK4SUNnhalxV/ypj2TxqXRPHkAMIcDzhI+d16L+7U3CVvoZIeCsfkSiBDJ
 M0BbfS4A06pQcBlFmwnYynH7C2u/KJf3g148bxx9HE8jsXccEkCKSAH2QDx4fVnz5C57
 aUxQ==
X-Gm-Message-State: AJIora9V2Uez+SdogU7u7+qdl8Wk9SzYagNJ8qQZtFFI8mTpTi4FPwRK
 J31Znv9v585p8LngpTFwQikbGDV1zy2K/Y3OWdUj/7ItLNokj3IzD8nhMYIBHPQ7obyaUu2S7AF
 UXH5evcfmp48RdNI=
X-Received: by 2002:a1c:7719:0:b0:3a0:31a6:4469 with SMTP id
 t25-20020a1c7719000000b003a031a64469mr21674957wmi.20.1656424324287; 
 Tue, 28 Jun 2022 06:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uS1y+QtSMduFZf2EyQiNSwNdK2CKunKBTquaQiZh7P5qUzTwf9ArIyIAGPQ8nQvtqwjCVggg==
X-Received: by 2002:a1c:7719:0:b0:3a0:31a6:4469 with SMTP id
 t25-20020a1c7719000000b003a031a64469mr21674934wmi.20.1656424324027; 
 Tue, 28 Jun 2022 06:52:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003974cb37a94sm21784243wmp.22.2022.06.28.06.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 06:52:03 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:52:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Leonardo Bras Soares Passos <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <YrsHgWbhifokl6yL@work-vm>
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
 <YrqzhFAePnnEl8A8@redhat.com>
 <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
 <Yrr77NfKtKcXTVCr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yrr77NfKtKcXTVCr@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Jun 28, 2022 at 09:32:04AM -0300, Leonardo Bras Soares Passos wrote:
> > On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > > > Some errors, like the lack of Scatter-Gather support by the network
> > > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> > > > zero-copy, which causes it to fall back to the default copying mechanism.
> > >
> > > How common is this lack of SG support ? What NICs did you have that
> > > were affected ?
> > 
> > I am not aware of any NIC without SG available for testing, nor have
> > any idea on how common they are.
> > But since we can detect sendmsg() falling back to copying we should
> > warn the user if this ever happens.
> > 
> > There is also a case in IPv6 related to fragmentation that may cause
> > MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
> > covered.
> > 
> > >
> > > > After each full dirty-bitmap scan there should be a zero-copy flush
> > > > happening, which checks for errors each of the previous calls to
> > > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > > > warn the user about it.
> > > >
> > > > Since it happens once each full dirty-bitmap scan, even in worst case
> > > > scenario it should not print a lot of warnings, and will allow tracking
> > > > how many dirty-bitmap iterations were not able to use zero-copy send.
> > >
> > > For long running migrations which are not converging, or converging
> > > very slowly there could be 100's of passes.
> > >
> > 
> > I could change it so it only warns once, if that is too much output.
> 
> Well I'm mostly wondering what we're expecting the user todo with this
> information. Generally a log file containing warnings ends up turning
> into a bug report. If we think it is important for users and/or mgmt
> apps to be aware of this info, then it might be better to actually
> put a field in the query-migrate stats to report if zero-copy is
> being honoured or not,

Yeh just a counter would work there I think.

> and just have a trace point in this location
> instead.

Yeh.

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


