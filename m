Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907664CFD74
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:54:45 +0100 (CET)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBwq-0007qZ-Ka
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRAfX-0006ee-Bm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:32:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRAfV-0007RH-14
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9h+Ol5a0FezfwEzpY/FMFt1pb3HESwoTiCMfa/HZ98U=;
 b=EgxeIq6Hz8LtgJwdX1o1aHwmrIe6Oauxn6V4ESiSp7OVDJ/8ISheo/M0QMkYz1/F0lQqHx
 gWFpPyMOgTR4kc8+O9eW21v572woEXGtE23g3M+ZpWXD0Icv0ofuv88wZiW/T+MOg/nAoa
 Ub2OQulUFT2Y3Jn8skfh6QPqJwifffc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-9thGlu6XOjio5UJSrbYBbQ-1; Mon, 07 Mar 2022 05:32:42 -0500
X-MC-Unique: 9thGlu6XOjio5UJSrbYBbQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 62-20020a1c0241000000b003898de01de4so1523907wmc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9h+Ol5a0FezfwEzpY/FMFt1pb3HESwoTiCMfa/HZ98U=;
 b=vFnd6rC6iV/79qdjjL5l5jQPbE+YYwvlNUziUKhKhuD4gB2y/fDgUGOFJVBEwGyj6z
 8DrBh3KwH7wBD99yHxTx6TWHVyGBbdXprWjjCs2ar7D2h5+VYycDVgSiHidDquGSK6TJ
 b7fuoBnzxdAQf2sd5F4Rnk/+4rkFdbypcBSjC7NheX4wKuvUo2zrqKCgdmOsQcXrJSim
 DRhlgUgiZEdVE6mvuxJZNm4VMheTQ4piRz1BLRFb1SfCKOvksoqK2/H/fRx7zWxxGD83
 6Ya83QjpqgccgoOieVgFn7R46KeJI2n4n4jbUQT3sFR4Hz8E8iKztR8jwKLs3V9J3HxW
 hBJw==
X-Gm-Message-State: AOAM533L+Mj6624mjL74GPvxAiE4E5QrwAMNqn83KOcb1bX0U8+1IOa0
 Pa+upZY6x4Owffrun38Pmmnly2oyziNfjBiOQiGpgBReojnpPhuREpbP4bICJxLgTCX6QIs6K6J
 eRruy7qhBqJMaiKA=
X-Received: by 2002:a5d:584a:0:b0:1fc:a885:4d4a with SMTP id
 i10-20020a5d584a000000b001fca8854d4amr402483wrf.662.1646649160603; 
 Mon, 07 Mar 2022 02:32:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBCrQ6KwuPM2fdVMfm81TvFQYmA57TfhacKYn+xu9Y3IoYr1hF1raicidWZMd7gj8d1IIyiw==
X-Received: by 2002:a5d:584a:0:b0:1fc:a885:4d4a with SMTP id
 i10-20020a5d584a000000b001fca8854d4amr402462wrf.662.1646649160324; 
 Mon, 07 Mar 2022 02:32:40 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm10590684wro.26.2022.03.07.02.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:32:39 -0800 (PST)
Date: Mon, 7 Mar 2022 10:32:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
Message-ID: <YiXfRe9qRHC+dVi5@work-vm>
References: <0ffe2660-4bae-9a84-e981-687b2c7a8877@suse.de>
 <5c028590-d71b-91a8-9ee6-d43cd162ec13@suse.de>
MIME-Version: 1.0
In-Reply-To: <5c028590-d71b-91a8-9ee6-d43cd162ec13@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 3/5/22 2:20 PM, Claudio Fontana wrote:
> > 
> > Hello all,
> > 
> > I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
> > when used in libvirt commands like:
> > 
> > 
> > virsh save domain /dev/null
> > 
> > 
> > 
> > I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
> > 
> > With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
> > 
> > This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
> > 
> > Here is the bisection for this particular drop in throughput:
> > 
> > commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
> > Author: Daniel P. Berrangé <berrange@redhat.com>
> > Date:   Fri Feb 19 18:40:12 2021 +0000
> > 
> >     migrate: remove QMP/HMP commands for speed, downtime and cache size
> >     
> >     The generic 'migrate_set_parameters' command handle all types of param.
> >     
> >     Only the QMP commands were documented in the deprecations page, but the
> >     rationale for deprecating applies equally to HMP, and the replacements
> >     exist. Furthermore the HMP commands are just shims to the QMP commands,
> >     so removing the latter breaks the former unless they get re-implemented.
> >     
> >     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > 
> > git bisect start
> > # bad: [5c8463886d50eeb0337bd121ab877cf692731e36] Merge remote-tracking branch 'remotes/kraxel/tags/kraxel-20220304-pull-request' into staging
> > git bisect bad 5c8463886d50eeb0337bd121ab877cf692731e36
> > # good: [6cdf8c4efa073eac7d5f9894329e2d07743c2955] Update version for 4.2.1 release
> > git bisect good 6cdf8c4efa073eac7d5f9894329e2d07743c2955
> > # good: [b0ca999a43a22b38158a222233d3f5881648bb4f] Update version for v4.2.0 release
> > git bisect good b0ca999a43a22b38158a222233d3f5881648bb4f
> > # skip: [e2665f314d80d7edbfe7f8275abed7e2c93c0ddc] target/mips: Alias MSA vector registers on FPU scalar registers
> > git bisect skip e2665f314d80d7edbfe7f8275abed7e2c93c0ddc
> > # good: [4762c82cbda22b1036ce9dd2c5e951ac0ed0a7d3] tests/docker: Install static libc package in CentOS 7
> > git bisect good 4762c82cbda22b1036ce9dd2c5e951ac0ed0a7d3
> > # bad: [d4127349e316b5c78645f95dba5922196ac4cc23] Merge remote-tracking branch 'remotes/berrange-gitlab/tags/crypto-and-more-pull-request' into staging
> > git bisect bad d4127349e316b5c78645f95dba5922196ac4cc23
> > # bad: [d90f154867ec0ec22fd719164b88716e8fd48672] Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging
> > git bisect bad d90f154867ec0ec22fd719164b88716e8fd48672
> > # good: [dd5af6ece9b101d29895851a7441d848b7ccdbff] tests/docker: add a test-tcg for building then running check-tcg
> > git bisect good dd5af6ece9b101d29895851a7441d848b7ccdbff
> > # bad: [90ec1cff768fcbe1fa2870d2018f378376f4f744] target/riscv: Adjust privilege level for HLV(X)/HSV instructions
> > git bisect bad 90ec1cff768fcbe1fa2870d2018f378376f4f744
> > # good: [373969507a3dc7de2d291da7e1bd03acf46ec643] migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
> > git bisect good 373969507a3dc7de2d291da7e1bd03acf46ec643
> > # good: [4083904bc9fe5da580f7ca397b1e828fbc322732] Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210317' into staging
> > git bisect good 4083904bc9fe5da580f7ca397b1e828fbc322732
> > # bad: [009ff89328b1da3ea8ba316bf2be2125bc9937c5] vl: allow passing JSON to -object
> > git bisect bad 009ff89328b1da3ea8ba316bf2be2125bc9937c5
> > # bad: [50243407457a9fb0ed17b9a9ba9fc9aee09495b1] qapi/qom: Drop deprecated 'props' from object-add
> > git bisect bad 50243407457a9fb0ed17b9a9ba9fc9aee09495b1
> > # bad: [1b507e55f8199eaad99744613823f6929e4d57c6] Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
> > git bisect bad 1b507e55f8199eaad99744613823f6929e4d57c6
> > # bad: [24e13a4dc1eb1630eceffc7ab334145d902e763d] chardev: reject use of 'wait' flag for socket client chardevs
> > git bisect bad 24e13a4dc1eb1630eceffc7ab334145d902e763d
> > # good: [8becb36063fb14df1e3ae4916215667e2cb65fa2] monitor: remove 'query-events' QMP command
> > git bisect good 8becb36063fb14df1e3ae4916215667e2cb65fa2
> > # bad: [8af54b9172ff3b9bbdbb3191ed84994d275a0d81] machine: remove 'query-cpus' QMP command
> > git bisect bad 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
> > # bad: [cbde7be900d2a2279cbc4becb91d1ddd6a014def] migrate: remove QMP/HMP commands for speed, downtime and cache size
> > git bisect bad cbde7be900d2a2279cbc4becb91d1ddd6a014def
> > # first bad commit: [cbde7be900d2a2279cbc4becb91d1ddd6a014def] migrate: remove QMP/HMP commands for speed, downtime and cache size
> > 
> > 
> > Are there some obvious settings / options I am missing to regain the savevm performance after this commit?
> 
> Answering myself: 

<oops we seem to have split this thread into two>

> this seems to be due to a resulting different default xbzrle cache size (probably interactions between libvirt/qemu versions?).
> 
> When forcing the xbzrle cache size to a larger value, the performance is back.

That's weird that 'virsh save' is ending up using xbzrle.

> > 
> > I have seen projects attempting to improve other aspects of performance (snapshot performance, etc), is there something going on to improve the transfer of RAM in savevm too?
> 
> 
> Still I would think that we should be able to do better than 600ish Mb/s , any ideas, prior work on this,
> to improve savevm performance, especially looking at RAM regions transfer speed?

My normal feeling is ~10Gbps for a live migrate over the wire; I rarely
try virsh save though.
If you're using xbzrle that might explain it; it's known to eat cpu -
but I'd never expect it to have been used with 'virsh save'.

Dave


> Thanks,
> 
> Claudio
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


