Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6B5E6BD9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:39:59 +0200 (CEST)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obS3C-0006Zv-Qj
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obS0g-0001rD-PZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obS0c-00040l-9d
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663875435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne69p765D3Uek/clo1GGJgzG0W7Ytpk4y73XJkEvzmw=;
 b=JVVLJiCrGPZ0Mm97kJYyQKHaRvi0nrFDg9DLPtyTV7M2VAS3XJ8nNGJwNw5+9dg+1MKas+
 pwz6Z/+ERAeiHoXloMOJ9Ye6Ia3q1+KaHQV3wRfFQRCn6SJJzWI9Qgj20A2gB71l1zaY4b
 cVMlyfH/z7VHJ4tog2gyGVkQn5/PtaQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-S3Bo5zbeNFaRrHm1zh4pNg-1; Thu, 22 Sep 2022 15:37:13 -0400
X-MC-Unique: S3Bo5zbeNFaRrHm1zh4pNg-1
Received: by mail-qv1-f69.google.com with SMTP id
 oj15-20020a056214440f00b004ac6db57cacso7121244qvb.17
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ne69p765D3Uek/clo1GGJgzG0W7Ytpk4y73XJkEvzmw=;
 b=4VoSjCVWpmeKGJosc5XGjK5inhkwOR2j+zyagZ2B8aprE7+GPfkeaNvFRPfSQwBUfQ
 lBgLP7Fv+gTYUSYpuPBIIJtP0xvMbCIM675yso8uIhRxo4b6MKTF7KsaJTahqm7Dgh3Z
 gdzNVSEi7GlzIm5prNW5sbtQ4VLNR5igH0WCk6fWL/pUTfK/VhA+dGX5bx/uGxH446hZ
 6BzHorhZDDgHbQIPAd8sq7fCP3tRipiupvb1q9IWy7sTX0LHTYz5Qlsh2eZx6jpqiglQ
 b2Ef8KmcW2YpmutDsD6e+ClVE5riGH4Whfod3OTRZXAFekPPB4xAyVh5upv5mop89VeB
 yM3A==
X-Gm-Message-State: ACrzQf0jhaKgUcyQhpHRmGWB1u2cRiNbKMArDpkITJ3upLHzBHx/fCDJ
 pWkpV3ljhDoYnoPUVsGSqqliZfckdMXCl412+AI4a6F9RmcARd30jPY/fxa7wt8p/j7bYZ+5M/y
 CU6QGk6rNN/Ne/Vg=
X-Received: by 2002:a0c:f084:0:b0:49e:7bc1:26a3 with SMTP id
 g4-20020a0cf084000000b0049e7bc126a3mr4064796qvk.107.1663875433325; 
 Thu, 22 Sep 2022 12:37:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM780hkgW4g3ArN0Q5IMb+NwssIc1tqUNfkHSX95RI/HMyMjOXjQFduSkl9xHINnnZfWQ9UY/w==
X-Received: by 2002:a0c:f084:0:b0:49e:7bc1:26a3 with SMTP id
 g4-20020a0cf084000000b0049e7bc126a3mr4064783qvk.107.1663875433094; 
 Thu, 22 Sep 2022 12:37:13 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 o26-20020ac8555a000000b0035ce8965045sm3989496qtr.42.2022.09.22.12.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 12:37:12 -0700 (PDT)
Date: Thu, 22 Sep 2022 15:37:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/5] migration: Fix race on qemu_file_shutdown()
Message-ID: <Yyy5Z0lZ6oTnBp8g@xz-m1.local>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-3-peterx@redhat.com>
 <YyyUMYfLxs0/QY41@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyyUMYfLxs0/QY41@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 05:58:25PM +0100, Daniel P. Berrangé wrote:
> On Tue, Sep 20, 2022 at 06:37:57PM -0400, Peter Xu wrote:
> > In qemu_file_shutdown(), there's a possible race if with current order of
> > operation.  There're two major things to do:
> > 
> >   (1) Do real shutdown() (e.g. shutdown() syscall on socket)
> >   (2) Update qemufile's last_error
> > 
> > We must do (2) before (1) otherwise there can be a race condition like:
> > 
> >       page receiver                     other thread
> >       -------------                     ------------
> >       qemu_get_buffer()
> >                                         do shutdown()
> >         returns 0 (buffer all zero)
> >         (meanwhile we didn't check this retcode)
> >       try to detect IO error
> >         last_error==NULL, IO okay
> >       install ALL-ZERO page
> >                                         set last_error
> >       --> guest crash!
> > 
> > To fix this, we can also check retval of qemu_get_buffer(), but not all
> > APIs can be properly checked and ultimately we still need to go back to
> > qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.
> > 
> > Maybe some day a rework of qemufile API is really needed, but for now keep
> > using qemu_file_get_error() and fix it by not allowing that race condition
> > to happen.  Here shutdown() is indeed special because the last_error was
> > emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
> > error triggers so we won't miss those ones, only shutdown() is a bit tricky
> > here.
> 
> The ultimate answer really is to stop using QEMUFile entirely and just
> do migration with the QIOChannel objects directly. The work I did in the
> last cycle to remove the QEMUFileOps callbacks was another piece of the
> puzzle in moving in that direction, by ensuring that every QEMUFile is
> now backed by a QIOChannel. All QEMUFile is doing now is adding the I/O
> caching layer and some convenience APIs for I/O operations.
> 
> So the next step would be to add a  QIOChannelCached class that can wrap
> over another QIOChannel, to add the I/O buffering functionality that
> currently exists in QEMUFile. Once that's done, it'd be at the stage
> where we could look at how to use QIOChannel APIs for VMstate. It would
> likely involve wiring up an Error **errp  parameter into a great many
> places so we get synchronous error propagation instead of out-of-band
> error checking, so a phased transition would need to be figured out.

Yes, Error** sounds very good to have.

So far I'm not satisfied with qemufile api majorly because of that error
handling, especially on *get() interfaces.

Besides that, do you have anything else in mind that would make
QIOChannelCached better than qemufile (e.g. on how we do caching)?

Thanks,

-- 
Peter Xu


