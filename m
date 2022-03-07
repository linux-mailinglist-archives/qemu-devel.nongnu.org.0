Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983934CFED0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:34:18 +0100 (CET)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCZ7-0000Ki-0s
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRCTO-00028W-D8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRCTM-0001mt-Ke
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646656099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCcxPYCaMKIG9ujGg1h4+mnJNq9gDXZb+TNSbPMdjuc=;
 b=Mw5UCsJUESeRz10xleRag/4gMIyZIPxprXkWkk9oc3rfVEwstzrTbBpRGR8zjUF8fxSQj8
 v1mOZm8xbrftgPx9qRi3RReJCXtq7Sdj0o/MRhd+OnFJDYioCeMPPQ/NDxBs6XcOOrCXE1
 aJs5MXHlVS+qpMo3s4lbIx2loGK7GCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-nsYEvY7WOp-nbEcxiLcNsw-1; Mon, 07 Mar 2022 07:28:18 -0500
X-MC-Unique: nsYEvY7WOp-nbEcxiLcNsw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a26-20020a7bc1da000000b003857205ec7cso6165930wmj.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZCcxPYCaMKIG9ujGg1h4+mnJNq9gDXZb+TNSbPMdjuc=;
 b=bB5LH4NgDYkRGXeBduSiY3SaglUkR2O9qkXHJz1Xb0uYU1QoNWJyYkGGNfRQTyJY4K
 zmhsKO+Uyyalxbgfz7VDD1N14zh0lIZ9P68iFJC0+GXxtMTmNCJOOzNv8awnBPBX6372
 tsGD6hBkcZplenVtjcfJgvkYJJpe0mDwHaqXloh69v3cllnrKwqsl+Ip2MZf0V6YPWRi
 teMClzUqqkXl4I5j0cYlP/4PCksaMMMNNvcV1DTsu32m21f6hSrVkjp1bdT2FfIkRTnw
 BCXfsMgiaXPsmUxq1a22lNQSXamkGMgYJx0MpmmXMnOZxHtjEkvYpMDNII6FUQuHQgH2
 A3HA==
X-Gm-Message-State: AOAM533tBdi9CTpssEzO6PxCSUvwTvg0E1IeY6tqoqy2I/q15beBjhNC
 sp2bb76BWjX9c3FCW8ZhQV8bap3rXEgpdZtS3pKf4jIWsZ6ysFP4SZfuS+7NWJJTyVN8JULg15+
 X/OP5/SOgaJQi+bk=
X-Received: by 2002:adf:ef82:0:b0:1f0:1227:a38e with SMTP id
 d2-20020adfef82000000b001f01227a38emr7737168wro.596.1646656096828; 
 Mon, 07 Mar 2022 04:28:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdDaZZcQa3Yy+V0J9n0FGBA9BM5jTn1mYhCcwaXPKJgewoa6oKXR8yJrDsuM1iuz9gjxh3+Q==
X-Received: by 2002:adf:ef82:0:b0:1f0:1227:a38e with SMTP id
 d2-20020adfef82000000b001f01227a38emr7737151wro.596.1646656096499; 
 Mon, 07 Mar 2022 04:28:16 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm12289621wra.65.2022.03.07.04.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 04:28:16 -0800 (PST)
Date: Mon, 7 Mar 2022 12:28:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
Message-ID: <YiX6XSlVNw183PTV@work-vm>
References: <8826b03d-e5e9-0e65-cab7-ea1829f48e6c@suse.de>
 <YiXQHIWtHx5BocxK@redhat.com>
 <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com>
 <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
 <YiXzw8pF9If2/M7M@redhat.com>
 <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com>
 <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
MIME-Version: 1.0
In-Reply-To: <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
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
> On 3/7/22 1:20 PM, Daniel P. Berrangé wrote:
> > On Mon, Mar 07, 2022 at 01:09:55PM +0100, Claudio Fontana wrote:
> >> On 3/7/22 1:00 PM, Daniel P. Berrangé wrote:
> >>> On Mon, Mar 07, 2022 at 12:19:22PM +0100, Claudio Fontana wrote:
> >>>> On 3/7/22 10:51 AM, Daniel P. Berrangé wrote:
> >>>>> On Mon, Mar 07, 2022 at 10:44:56AM +0100, Claudio Fontana wrote:
> >>>>>> Hello Daniel,
> >>>>>>
> >>>>>> On 3/7/22 10:27 AM, Daniel P. Berrangé wrote:
> >>>>>>> On Sat, Mar 05, 2022 at 02:19:39PM +0100, Claudio Fontana wrote:
> >>>>>>>>
> >>>>>>>> Hello all,
> >>>>>>>>
> >>>>>>>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
> >>>>>>>> when used in libvirt commands like:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> virsh save domain /dev/null
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
> >>>>>>>>
> >>>>>>>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
> >>>>>>>>
> >>>>>>>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
> >>>>>>>>
> >>>>>>>> Here is the bisection for this particular drop in throughput:
> >>>>>>>>
> >>>>>>>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
> >>>>>>>> Author: Daniel P. Berrangé <berrange@redhat.com>
> >>>>>>>> Date:   Fri Feb 19 18:40:12 2021 +0000
> >>>>>>>>
> >>>>>>>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
> >>>>>>>>     
> >>>>>>>>     The generic 'migrate_set_parameters' command handle all types of param.
> >>>>>>>>     
> >>>>>>>>     Only the QMP commands were documented in the deprecations page, but the
> >>>>>>>>     rationale for deprecating applies equally to HMP, and the replacements
> >>>>>>>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
> >>>>>>>>     so removing the latter breaks the former unless they get re-implemented.
> >>>>>>>>     
> >>>>>>>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>>>>>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >>>>>>>
> >>>>>>> That doesn't make a whole lot of sense as a bisect result.
> >>>>>>> How reliable is that bisect end point ? Have you bisected
> >>>>>>> to that point more than once ?
> >>>>>>
> >>>>>> I did run through the bisect itself only once, so I'll double check that.
> >>>>>> The results seem to be reproducible almost to the second though, a savevm that took 35 seconds before the commit takes 2m 48 seconds after.
> >>>>>>
> >>>>>> For this test I am using libvirt v6.0.0.
> >>>
> >>> I've just noticed this.  That version of libvirt is 2 years old and
> >>> doesn't have full support for migrate_set_parameters.
> >>>
> >>>
> >>>> 2022-03-07 10:47:20.145+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-19"}^M
> >>>>  len=93 ret=93 errno=0
> >>>> 2022-03-07 10:47:20.146+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"id": "libvirt-19", "error": {"class": "CommandNotFound", "desc": "The command migrate_set_speed has not been found"}}
> >>>> 2022-03-07 10:47:20.147+0000: 134391: error : qemuMonitorJSONCheckError:412 : internal error: unable to execute QEMU command 'migrate_set_speed': The command migrate_set_speed has not been found
> >>>
> >>> We see the migrate_set_speed failing and libvirt obviously ignores that
> >>> failure.
> >>>
> >>> In current libvirt migrate_set_speed is not used as it properly
> >>> handles migrate_set_parameters AFAICT.
> >>>
> >>> I think you just need to upgrade libvirt if you want to use this
> >>> newer QEMU version
> >>>
> >>> Regards,
> >>> Daniel
> >>>
> >>
> >> Got it, this explains it, sorry for the noise on this.
> >>
> >> I'll continue to investigate the general issue of low throughput with virsh save / qemu savevm .
> > 
> > BTW, consider measuring with the --bypass-cache flag to virsh save.
> > This causes libvirt to use a I/O helper that uses O_DIRECT when
> > saving the image. This should give more predictable results by
> > avoiding the influence of host I/O cache which can be in a differnt
> > state of usage each time you measure.  It was also intended that
> > by avoiding hitting cache, saving the memory image of a large VM
> > will not push other useful stuff out of host I/O  cache which can
> > negatively impact other running VMs.
> > 
> > Also it is possible to configure compression on the libvirt side
> > which may be useful if you have spare CPU cycles, but your storage
> > is slow. See 'save_image_format' in the /etc/libvirt/qemu.conf
> > 
> > With regards,
> > Daniel
> > 
> 
> Hi Daniel, thanks for these good info,
> 
> regarding slow storage, for these tests I am saving to /dev/null to avoid having to take storage into account
> (and still getting low bandwidth unfortunately) so I guess compression is out of the question.

What type of speeds do you get if you try a migrate to a netcat socket?

Dave

> Thanks!
> 
> Claudio
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


