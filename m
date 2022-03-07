Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9304CFD69
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:50:46 +0100 (CET)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBsz-0003Yu-90
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRBaz-0005zs-RM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRBaw-00009d-9E
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646652725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvqJ82Zc5Ormem//5KJuv2ek7NC0CCFHKhMzuCs4rbc=;
 b=d2Tg994ZhvWPd5TG4yBgDq5OJJZ0ZUsGGXU76j6MW7ERbUIpBBjacZLu/l5sHTUYMsl73r
 o1o+6NTcijg0Lx3yVZGPoNlj1Fxc5LGwGQYC+xUkzEnyCmFQHY1bE5+ZJ+9fICOYNyzQQ8
 sLNN6XOYpqmI3FzKGOJZe7+9s15ifLk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-jZ9GPjNoPeKxNdNaEv-OMA-1; Mon, 07 Mar 2022 06:32:02 -0500
X-MC-Unique: jZ9GPjNoPeKxNdNaEv-OMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c231400b00389886f6b23so4509964wmo.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tvqJ82Zc5Ormem//5KJuv2ek7NC0CCFHKhMzuCs4rbc=;
 b=KJPSszY5QJsehoXjx5xbai0Msz6oTpLRdwWvOXRwdG41RfsKZbMu9YbkrgcYEd+1Yj
 7hByC/TQ7gnSrMPKI+AJpwJXCMypES9k7QT5c2aG/lpJZ0GpcIeD2rkfnpT9T1FBNP2x
 bFt6z4Yta0Q6YzsCDshp8DbaYK+4c41hzn/qaG6faROgtk+C1rWW9pCVLuJwL7kU2qXZ
 uBMLah3fCvetZNPu4kMJnxTzGMXFxi5UN2Uv7J4NuoAlu32A49wdR8tyDywRiLkCZG3b
 cB4CqdypLkvXJVjk0N6qq6Vuw0jmJ0kFIeF/R4H341WILDHxFDeDvyVWjswstZsKEnwK
 lZ+w==
X-Gm-Message-State: AOAM530UHDxn2XhDxe8sWhZ9d+quHpcuEKLoLUOnx0rHWIO+LiYY9/5r
 E0+RTmTpDlxMP8pILdxixBDpRrJDuP0qIr3S7PSSBNwPVPBHGmp8FqTtrfW+lCB4eB8lRZlx9K2
 y2Gm5I80rQsFFh/M=
X-Received: by 2002:a5d:5850:0:b0:1fc:a7d7:e33b with SMTP id
 i16-20020a5d5850000000b001fca7d7e33bmr716173wrf.157.1646652720544; 
 Mon, 07 Mar 2022 03:32:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPUWMqRT1jURDw7N1Mw2kr+wTTNjlADCxURO7fjBg72FFd0JgmuY16XZYJW0/Uj+CrYILqNg==
X-Received: by 2002:a5d:5850:0:b0:1fc:a7d7:e33b with SMTP id
 i16-20020a5d5850000000b001fca7d7e33bmr716149wrf.157.1646652720264; 
 Mon, 07 Mar 2022 03:32:00 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b00381614e5b60sm20335696wmq.34.2022.03.07.03.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 03:31:59 -0800 (PST)
Date: Mon, 7 Mar 2022 11:31:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
Message-ID: <YiXtLZxyTMfEZ384@work-vm>
References: <0ffe2660-4bae-9a84-e981-687b2c7a8877@suse.de>
 <5c028590-d71b-91a8-9ee6-d43cd162ec13@suse.de>
 <YiXfRe9qRHC+dVi5@work-vm>
 <29a4b12d-a4b9-1652-22ea-0a273ca8f1b5@suse.de>
MIME-Version: 1.0
In-Reply-To: <29a4b12d-a4b9-1652-22ea-0a273ca8f1b5@suse.de>
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
> On 3/7/22 11:32 AM, Dr. David Alan Gilbert wrote:
> > * Claudio Fontana (cfontana@suse.de) wrote:
> >> On 3/5/22 2:20 PM, Claudio Fontana wrote:
> >>>
> >>> Hello all,
> >>>
> >>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
> >>> when used in libvirt commands like:
> >>>
> >>>
> >>> virsh save domain /dev/null
> >>>
> >>>
> >>>
> >>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
> >>>
> >>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
> >>>
> >>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
> >>>
> >>> Here is the bisection for this particular drop in throughput:
> >>>
> >>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
> >>> Author: Daniel P. Berrangé <berrange@redhat.com>
> >>> Date:   Fri Feb 19 18:40:12 2021 +0000
> >>>
> >>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
> >>>     
> >>>     The generic 'migrate_set_parameters' command handle all types of param.
> >>>     
> >>>     Only the QMP commands were documented in the deprecations page, but the
> >>>     rationale for deprecating applies equally to HMP, and the replacements
> >>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
> >>>     so removing the latter breaks the former unless they get re-implemented.
> >>>     
> >>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >>>
> >>>
> >>> git bisect start
> >>> # bad: [5c8463886d50eeb0337bd121ab877cf692731e36] Merge remote-tracking branch 'remotes/kraxel/tags/kraxel-20220304-pull-request' into staging
> >>> git bisect bad 5c8463886d50eeb0337bd121ab877cf692731e36
> >>> # good: [6cdf8c4efa073eac7d5f9894329e2d07743c2955] Update version for 4.2.1 release
> >>> git bisect good 6cdf8c4efa073eac7d5f9894329e2d07743c2955
> >>> # good: [b0ca999a43a22b38158a222233d3f5881648bb4f] Update version for v4.2.0 release
> >>> git bisect good b0ca999a43a22b38158a222233d3f5881648bb4f
> >>> # skip: [e2665f314d80d7edbfe7f8275abed7e2c93c0ddc] target/mips: Alias MSA vector registers on FPU scalar registers
> >>> git bisect skip e2665f314d80d7edbfe7f8275abed7e2c93c0ddc
> >>> # good: [4762c82cbda22b1036ce9dd2c5e951ac0ed0a7d3] tests/docker: Install static libc package in CentOS 7
> >>> git bisect good 4762c82cbda22b1036ce9dd2c5e951ac0ed0a7d3
> >>> # bad: [d4127349e316b5c78645f95dba5922196ac4cc23] Merge remote-tracking branch 'remotes/berrange-gitlab/tags/crypto-and-more-pull-request' into staging
> >>> git bisect bad d4127349e316b5c78645f95dba5922196ac4cc23
> >>> # bad: [d90f154867ec0ec22fd719164b88716e8fd48672] Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging
> >>> git bisect bad d90f154867ec0ec22fd719164b88716e8fd48672
> >>> # good: [dd5af6ece9b101d29895851a7441d848b7ccdbff] tests/docker: add a test-tcg for building then running check-tcg
> >>> git bisect good dd5af6ece9b101d29895851a7441d848b7ccdbff
> >>> # bad: [90ec1cff768fcbe1fa2870d2018f378376f4f744] target/riscv: Adjust privilege level for HLV(X)/HSV instructions
> >>> git bisect bad 90ec1cff768fcbe1fa2870d2018f378376f4f744
> >>> # good: [373969507a3dc7de2d291da7e1bd03acf46ec643] migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
> >>> git bisect good 373969507a3dc7de2d291da7e1bd03acf46ec643
> >>> # good: [4083904bc9fe5da580f7ca397b1e828fbc322732] Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210317' into staging
> >>> git bisect good 4083904bc9fe5da580f7ca397b1e828fbc322732
> >>> # bad: [009ff89328b1da3ea8ba316bf2be2125bc9937c5] vl: allow passing JSON to -object
> >>> git bisect bad 009ff89328b1da3ea8ba316bf2be2125bc9937c5
> >>> # bad: [50243407457a9fb0ed17b9a9ba9fc9aee09495b1] qapi/qom: Drop deprecated 'props' from object-add
> >>> git bisect bad 50243407457a9fb0ed17b9a9ba9fc9aee09495b1
> >>> # bad: [1b507e55f8199eaad99744613823f6929e4d57c6] Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
> >>> git bisect bad 1b507e55f8199eaad99744613823f6929e4d57c6
> >>> # bad: [24e13a4dc1eb1630eceffc7ab334145d902e763d] chardev: reject use of 'wait' flag for socket client chardevs
> >>> git bisect bad 24e13a4dc1eb1630eceffc7ab334145d902e763d
> >>> # good: [8becb36063fb14df1e3ae4916215667e2cb65fa2] monitor: remove 'query-events' QMP command
> >>> git bisect good 8becb36063fb14df1e3ae4916215667e2cb65fa2
> >>> # bad: [8af54b9172ff3b9bbdbb3191ed84994d275a0d81] machine: remove 'query-cpus' QMP command
> >>> git bisect bad 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
> >>> # bad: [cbde7be900d2a2279cbc4becb91d1ddd6a014def] migrate: remove QMP/HMP commands for speed, downtime and cache size
> >>> git bisect bad cbde7be900d2a2279cbc4becb91d1ddd6a014def
> >>> # first bad commit: [cbde7be900d2a2279cbc4becb91d1ddd6a014def] migrate: remove QMP/HMP commands for speed, downtime and cache size
> >>>
> >>>
> >>> Are there some obvious settings / options I am missing to regain the savevm performance after this commit?
> >>
> >> Answering myself: 
> > 
> > <oops we seem to have split this thread into two>
> > 
> >> this seems to be due to a resulting different default xbzrle cache size (probably interactions between libvirt/qemu versions?).
> >>
> >> When forcing the xbzrle cache size to a larger value, the performance is back.
> > 
> > That's weird that 'virsh save' is ending up using xbzrle.
> 
> virsh save (or qemu savevm..) seems to me like it uses a subset of the migration code and migration parameters but not all..
> 
> > 
> >>>
> >>> I have seen projects attempting to improve other aspects of performance (snapshot performance, etc), is there something going on to improve the transfer of RAM in savevm too?
> >>
> >>
> >> Still I would think that we should be able to do better than 600ish Mb/s , any ideas, prior work on this,
> >> to improve savevm performance, especially looking at RAM regions transfer speed?
> > 
> > My normal feeling is ~10Gbps for a live migrate over the wire; I rarely
> > try virsh save though.
> > If you're using xbzrle that might explain it; it's known to eat cpu -
> > but I'd never expect it to have been used with 'virsh save'.
> 
> some valgrind shows it among the top cpu eaters;
> 
> I wonder why we are able to do more than 2x better for actual live migration, compared with virsh save /dev/null ...

What speed do you get if you force xbzrle off?

Dave

> Thanks,
> 
> Claudio
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


