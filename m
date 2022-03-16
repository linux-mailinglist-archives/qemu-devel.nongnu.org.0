Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EAF4DAE9E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:03:57 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURRc-00081D-5K
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:03:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUR4m-00024R-Pe
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 06:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUR4j-0006Z3-V6
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 06:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647427216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRLkhQfQToxA5+hkWqJgW9X5nBe2S5atJt3u9xZIFUY=;
 b=iS5eaJqtLSKcnvJw/MxhSXAlWDpRrAKchv6NJT8Ql0lvy5S97EHfNmerENuuOPmX/Wtxpt
 m7ox8oYZIw7UplEEUTsjPLda6pski2IbHazpDdSOHLMcPGaTvtBXVFh8jZBste3R+eQI5x
 ZMxBtMzazmHEEFS/XyrmYDubuaUgWqU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-ZChQRkA5MqawzXrMKx7qXw-1; Wed, 16 Mar 2022 06:40:15 -0400
X-MC-Unique: ZChQRkA5MqawzXrMKx7qXw-1
Received: by mail-pf1-f197.google.com with SMTP id
 x205-20020a627cd6000000b004f6e1b97b45so1598838pfc.18
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 03:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jRLkhQfQToxA5+hkWqJgW9X5nBe2S5atJt3u9xZIFUY=;
 b=RLiUWjhjTC3o3aSNqu6kJrLrqHMfaoU9gj+MolhQKX8+64hLP6Bisp9mj6HHhYn0yf
 CTiYgWpJXZUOBkdKtkkeXdf1jx+hzeE7z1LxOtozah3Fk0p9jJKU+JQdWp1Ein3Zaow2
 cxi4VD4OWOuyKUmNIieD7DSgZvMIMBMHMP/lttSCQJOo4M/nIoUeOTNsGPi28CiRRryV
 9alTuedPu+zXcvR+8XB6uWRUeV4EL2KVYcjntPAv5cyTebnQ20m2+iuDgDtfwUiuqqKt
 L+27oxiyroeYygqthG6OQbQAroD1HiGo/alpkDzbl6YyS21AZIxB93a9gBQ63vcvRfM/
 qZsQ==
X-Gm-Message-State: AOAM533y+1E+qT4g2FYyUboHq+rPqsY8rM4ErTtxVAr3xouKdk818gCW
 Zdzkllu6WPtFryIzgCGRZXkLDU+sK24OQ0ZE8Ny5Wz+ac92tX/NXv4lMEf5dawoOT+cWUluNxtw
 tkhzBcXKSfq4XNZI=
X-Received: by 2002:a05:6a00:168a:b0:4f7:e161:83cd with SMTP id
 k10-20020a056a00168a00b004f7e16183cdmr12580598pfc.56.1647427214504; 
 Wed, 16 Mar 2022 03:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZS4CPqHOKs+sAtWudcqlt8q7t22k99QgygfPbEHrPpiZYPDZzIeBw68tpm91UAky2fXtwiQ==
X-Received: by 2002:a05:6a00:168a:b0:4f7:e161:83cd with SMTP id
 k10-20020a056a00168a00b004f7e16183cdmr12580577pfc.56.1647427214193; 
 Wed, 16 Mar 2022 03:40:14 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.128])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00134100b004f78df32666sm2685484pfu.198.2022.03.16.03.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 03:40:13 -0700 (PDT)
Date: Wed, 16 Mar 2022 18:40:08 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjG+iHCmCXRPIV1m@xz-m1.local>
References: <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
 <YjAul3GIWmB3+v0P@xz-m1.local> <YjB1XXzIsJWtSR4E@redhat.com>
 <YjFZ84Wdz6jpSekr@xz-m1.local> <YjG1AGhai1QvDdrd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YjG1AGhai1QvDdrd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 09:59:28AM +0000, Daniel P. Berrangé wrote:
> On Wed, Mar 16, 2022 at 11:30:59AM +0800, Peter Xu wrote:
> > On Tue, Mar 15, 2022 at 11:15:41AM +0000, Daniel P. Berrangé wrote:
> > > > I still remember you mentioned the upper layer softwares can have
> > > > assumption on using only 1 pair of socket for migration, I think that makes
> > > > postcopy-preempt by default impossible.
> > > > 
> > > > Why multifd is different here?
> > > 
> > > It isn't different. We went through the pain to extending libvirt
> > > to know how to open many channels for multifd. We'll have todo
> > > the same with this postcopy-pre-empt. To this day though, management
> > > apps above libvirt largely don't enable multifd, which is a real
> > > shame. This is the key reason I think we need to handle this at
> > > the QEMU level automatically.
> > 
> > But I still don't undertand how QEMU could know about those tunnels, which
> > should be beyond QEMU's awareness?
> > 
> > The tunneling program can be some admin initiated socat tcp forwarding
> > programs, which by default may not allow >1 socket pairs.
> > 
> > Or maybe I have mis-understood on what's the tunneling we're discussing?
> 
> I dont think I was talking about tunneling at all, just QEMU
> migration protocol options !

Ah. :)

> 
> If an app is tunnelling QEMU's migration protocol over some
> channel, that isn't important to QEMU - regardless whether a
> passed in 'fd:' protocol FD is a direct TCP socket, or a
> UNIX socket for a tunnel, QEMU works the same way. In one
> of my other replies I mention a way to make 'fd:' work with
> an arbitrary number of channels, by using an event from QEMU
> to request the app provide additional FDs.

I very much agree on the whole concept of what you proposed, either on the
new negotiation phase itself, or the idea that with the negotiation phase
we can try to auto-enable some features we not used to.

What I wanted to express is we can't enable either preempt mode or multifd
automatically from qemu even with them, because these two are quite special
IMHO in that qemu doesn't know whether the mgmt app can handle the multiple
socket pairs.  Yes we could teach qemu to dynamically accept new "fd"s, but
again IMHO that still needs to be intervened by the mgmt app.

Thanks,

-- 
Peter Xu


