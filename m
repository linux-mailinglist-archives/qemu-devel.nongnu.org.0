Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD955BC03
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:37:11 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5vTq-00029X-LL
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o5vPf-0007iI-CM
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 16:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o5vPb-0005wX-NO
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 16:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656361967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZ6Eh3JCxNlugFrvyr2kZoIEo5INIw4nMEBeJeT5GHU=;
 b=gpZu/un6rXho6nWgM+LYvhJf6UyLJqITZm4GiyIkQ+BKmIPntFbdF8E9qMuqPJlOOkX/v2
 /04+KcKL1SBEdTdhGqDTT/ARPCbvWAV2bijJARlyYp/BjPDEMXiM7ViHD58zZTnbdM+3sI
 OCIf3580fFut+aAzH8kmOcK96ZtiNlo=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-JTjLq2cbNomCninNCnjYxw-1; Mon, 27 Jun 2022 16:32:46 -0400
X-MC-Unique: JTjLq2cbNomCninNCnjYxw-1
Received: by mail-il1-f198.google.com with SMTP id
 w15-20020a056e021a6f00b002d8eef284f0so6190119ilv.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 13:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VZ6Eh3JCxNlugFrvyr2kZoIEo5INIw4nMEBeJeT5GHU=;
 b=7wz6oCbBoygn647+8lbbznnwLmj7Y0go659J0yY/y/fOWHlXlVlBrcJhc3VAg3yv/j
 nzRPEZewv4xoK1dP231VbiMO0HlgTvB87BjmOATwvhQRrvVE0dP7yr19LW5pci+c+p5g
 xX8JE5XMyYbwOrZp1z1E1HmQYdFEbeC6t+jpLOHENngldaRS09xDj5roBVZY20a/6pV5
 PIAkn5JalowKvtVyPz/J0T8skZN6MZcjEoOeZdOGYe6oVMdlzGTCQ05mzw2XMp0ap/aQ
 LbXlPS1G10VY7VBdsvE74HkMJ3xQv8A7xLs2VtBr/E6zjOG3DJgVenIiEN78Kkrbi1fW
 5U3Q==
X-Gm-Message-State: AJIora9ndMLai5ci/Z4hpbLIPGkqTnfQiawykDttlZlzmZnaVV7HVmCs
 Wqa7nnRtDh0WC31kBUuf2KNgM9edYIsCtrf0VyxuyDB64BFnJ2Jmt6+TRXJL3is7JjBevS2MsRr
 NofrhlkwEWI6kYTA=
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id
 p15-20020a056e02144f00b002d190c99047mr7944546ilo.211.1656361965476; 
 Mon, 27 Jun 2022 13:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbdlWZbaciwc73PZWqavw2VgKt4svrivSRy3YrWi+yf7gRqMpPNAdCbUrKsGowepA9adh0IQ==
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id
 p15-20020a056e02144f00b002d190c99047mr7944528ilo.211.1656361965255; 
 Mon, 27 Jun 2022 13:32:45 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05663822b200b00335c0e07abdsm5126564jas.14.2022.06.27.13.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:32:44 -0700 (PDT)
Date: Mon, 27 Jun 2022 16:32:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YroT6ld/XrZaUNf9@xz-m1.local>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrN381XWrhTFStlp@xz-m1.local>
 <YrQot90/2gzdh/gt@redhat.com> <YrS7YHglHhhDMvbP@xz-m1.local>
 <YrnBtWrjA5D8TlTP@redhat.com> <YrnCRR5r9x6Io8Ud@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrnCRR5r9x6Io8Ud@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Jun 27, 2022 at 03:44:21PM +0100, Daniel P. Berrangé wrote:
> On Mon, Jun 27, 2022 at 03:41:57PM +0100, Daniel P. Berrangé wrote:
> > On Thu, Jun 23, 2022 at 03:13:36PM -0400, Peter Xu wrote:
> > > On Thu, Jun 23, 2022 at 09:47:51AM +0100, Daniel P. Berrangé wrote:
> > > > > Hmm, when I wanted to run the whole bunch of the migration-test again I
> > > > > found that precopy tls test hangs (/x86_64/migration/precopy/unix/tls/psk).
> > > > > Though for this time it also hangs for me even with the master branch, so
> > > > > maybe not anything wrong with this specific pull req but still something
> > > > > needs fixing..
> > > > 
> > > > That pre-existing test has been runnnig by default in CI for a while
> > > > now, under different OS builds, so I'm surprised. Is there anything
> > > > especially unusual / different about your setup that could explain
> > > > why you see hang that we don't get anywhere else ?
> > > 
> > > TL;DR: I think it's not run in CI?
> > > 
> > > Please see ufd_version_check(), as when uffd not detected we'll skip the
> > > whole thing.
> > 
> > Our CI should be passing that check for the private runners eg
> > 
> > https://gitlab.com/qemu-project/qemu/-/jobs/2641920502
> > 
> > shows us running 35 tests
> > 
> >   2/178 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test         OK             65.57s   35 subtests passed
> > 
> > but yes, the container based jobs are all skipping
> > 
> > > 
> > > We really need to apply this patch, soon-ish..
> > > 
> > >   https://lore.kernel.org/all/20210615175523.439830-2-peterx@redhat.com/
> 
> BTW, I'd suggest re-sending that patch to bump it up in the inbox as
> its a year old at this point.

Indeed it already conflicts with the preempt series, I'll post one based on
that.  Thanks.

-- 
Peter Xu


