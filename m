Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E24558877
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 21:15:29 +0200 (CEST)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4SIZ-0007vB-M1
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 15:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o4SH6-0007Ba-Rg
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 15:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o4SGs-0001hQ-NO
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 15:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656011621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HbOx7NtOCRHvRKKTsiS4u3GFHV72/I3MuXcBBBw3zo=;
 b=eix13p/wVd+b7UEPJUvNAcl9Ye0NsgHqTkGUCfcJv/Jd7kCUG67k67K9CdPW2R57mz3OtM
 JfkYfBxW5hinsH1s359yBsK4/1kyWJPhdV8QPgXutG4hORrdrhTMEZENOueGaCeSnGZRjL
 6qNQHDS0sPbhGgGkskxw6PdU5AQcAYw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-k2HUIs1NMNOZN6SunZf5GA-1; Thu, 23 Jun 2022 15:13:40 -0400
X-MC-Unique: k2HUIs1NMNOZN6SunZf5GA-1
Received: by mail-il1-f200.google.com with SMTP id
 x9-20020a92dc49000000b002d95bdbcb3fso1225088ilq.21
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 12:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4HbOx7NtOCRHvRKKTsiS4u3GFHV72/I3MuXcBBBw3zo=;
 b=7vL4gE4lioVoFKXQLIT4wREVjs+FuEMTToKFKt6TakZ4qgh77jDMfOLfyisMETgFpb
 7/F4Z8qgFiO973Y2NEacBkg6CatQt3XwPyaL2NIsQwptxDyEkD0UWNPDn/wYDKEYdaYB
 ZzaOccl6l10oPdjGrAh4XuJsNxmFsudOmvSG70LZ9D7v4YTmNDBgT4rMB0VqovhOBdRx
 EFOKfF1cDHF58g1dLVQ5iVr5ENiuVEKE0KaZRRv106DSVSXPB+X2hBTR02kuOnpev7BN
 ClpUQ2t3DKnTalf0H7YgmHbYeVYEoxsU60y3gVUHSiLfablGl/oKF2WIXD1TwHeMYFTp
 Xtbg==
X-Gm-Message-State: AJIora/1n1q+2hoqpnnCIu5nYyB+CAS+iaTmaSdQ/+gvpNqmwIIZH7ed
 6qSmSAtdbjtDL9gMs4xHBU+V21/zMP4Tmx788W+I27034Vk9JKhjOLSevtGKAhNrz42Hz2JC7XM
 5Bj8i3OIAmn++MHs=
X-Received: by 2002:a05:6638:2113:b0:339:e689:6fb3 with SMTP id
 n19-20020a056638211300b00339e6896fb3mr3676232jaj.169.1656011619501; 
 Thu, 23 Jun 2022 12:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZW99bO24wkm6qVcD2yxML0kCW22zoy+/demBmHX8FQpgBJvdgefodV+YrJgXPqYpKAOCseA==
X-Received: by 2002:a05:6638:2113:b0:339:e689:6fb3 with SMTP id
 n19-20020a056638211300b00339e6896fb3mr3676217jaj.169.1656011619220; 
 Thu, 23 Jun 2022 12:13:39 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a5d9290000000b00672f405e911sm115083iom.38.2022.06.23.12.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 12:13:38 -0700 (PDT)
Date: Thu, 23 Jun 2022 15:13:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrS7YHglHhhDMvbP@xz-m1.local>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrN381XWrhTFStlp@xz-m1.local>
 <YrQot90/2gzdh/gt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrQot90/2gzdh/gt@redhat.com>
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

On Thu, Jun 23, 2022 at 09:47:51AM +0100, Daniel P. Berrangé wrote:
> > Hmm, when I wanted to run the whole bunch of the migration-test again I
> > found that precopy tls test hangs (/x86_64/migration/precopy/unix/tls/psk).
> > Though for this time it also hangs for me even with the master branch, so
> > maybe not anything wrong with this specific pull req but still something
> > needs fixing..
> 
> That pre-existing test has been runnnig by default in CI for a while
> now, under different OS builds, so I'm surprised. Is there anything
> especially unusual / different about your setup that could explain
> why you see hang that we don't get anywhere else ?

TL;DR: I think it's not run in CI?

Please see ufd_version_check(), as when uffd not detected we'll skip the
whole thing.

We really need to apply this patch, soon-ish..

  https://lore.kernel.org/all/20210615175523.439830-2-peterx@redhat.com/

I can easily reproduce the hang on two x86_64 hosts I have, with current
master commit (2b049d2c8dc01de750410f8f1a4eac498c04c723).  Or am I the only
one?

So I think it also means we don't run migration unit tests on non-Linux
OSes for sure because uffd was never there, meanwhile it also requires
(mostly) root privilege even for Linux hosts so if the sysctl knob was not
set properly (on sysctl.unprivileged_userfaultfd=1) the test can be skipped
too.

When I was changing migration code in the past few months (at least after
I'm aware CI was probably not running it), I ran migration-test manually
with root, but that's not ideal...

-- 
Peter Xu


