Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7D6D230B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG71-00028z-Vi; Fri, 31 Mar 2023 10:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piG6y-00023J-O0
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piG6w-0000sL-DQ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680274333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2LPw2B8Vj+gH1I/JFtauXNhFjrMVhk4mtWyi4cJla8=;
 b=PK5KGNC8ii0Ph87WaxzqSD2BandNbUtK/qFF6SwdEQAFp/qlIqdK/ahj4/Mimgg9HisOaL
 VO676h84Gtuu1D6oVa9GFC6itvtnTeFg5EGcajorzcoRzutKToNTLF9O9D/pVINBDZchAG
 z/rMQDvmCX9RnhwBjVBAKO5aRdTBzEE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-7yCJU21APmabCS1xXvl4bg-1; Fri, 31 Mar 2023 10:52:11 -0400
X-MC-Unique: 7yCJU21APmabCS1xXvl4bg-1
Received: by mail-qv1-f70.google.com with SMTP id
 w2-20020a0cc242000000b00583d8e55181so9828084qvh.23
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274331; x=1682866331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2LPw2B8Vj+gH1I/JFtauXNhFjrMVhk4mtWyi4cJla8=;
 b=eE299p4YjMzkLkGO+XOm9wZlaz34u0vH1EHsd/r/XvK8Uj5QIQNfOutIoCe19Ok5c8
 g2rtO5ccCwZePqTif65mxTyquVFLpIC1/1GK5JaPgL0kNuO5c585BiKTdmzGK30/J6Zb
 ljIQs2jWojccVQrRJePck+nYFSFrIxoYBP1sgyWl84zBMYqjPvipo8QJu+L0W+Q8g8+z
 iRZdqjvgPOXNTvEaJOdv+lY+uvNRlvn5FtaBcTdMJqcdF7ldySM7wrlHyYb6As8mR3Lp
 hsADYxCBoEKAyj6zwuya1iqpEk7rCTheh+aSWBcLm8U9160Urr1vyMNzLzYFGUBGgB1H
 6FjQ==
X-Gm-Message-State: AAQBX9fGu2ozjx3W7Kmd8WOEVF2BcD7iV2XjATXAR9BZgHArwDw46n7w
 COpDf+umzHmGTqFXTArEkBzSiFUDf2xAOrhBBvQyBYhtnetNuGWuMOaafniBjqujAQg1ZEeJZ9k
 +LUOASOC2kbXQQ+c=
X-Received: by 2002:a05:6214:300f:b0:5da:b965:1efd with SMTP id
 ke15-20020a056214300f00b005dab9651efdmr42385579qvb.2.1680274331443; 
 Fri, 31 Mar 2023 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQ1QLGiMD0VhRz6hJTQ4lkX8LK+g2I73f/78v6Jd2CM35Wa9IE9H99mGsO2wdrRdC3pe4J4g==
X-Received: by 2002:a05:6214:300f:b0:5da:b965:1efd with SMTP id
 ke15-20020a056214300f00b005dab9651efdmr42385562qvb.2.1680274331185; 
 Fri, 31 Mar 2023 07:52:11 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05620a0b5500b0074236d3a149sm705285qkg.92.2023.03.31.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:52:10 -0700 (PDT)
Date: Fri, 31 Mar 2023 10:52:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCbzmZXz3JG/jElA@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edp5oukh.fsf@suse.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> >> Outgoing migration to file. NVMe disk. XFS filesystem.
> >> 
> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> >>   10m -v`:
> >> 
> >> migration type  | MB/s | pages/s |  ms
> >> ----------------+------+---------+------
> >> savevm io_uring |  434 |  102294 | 71473
> >
> > So I assume this is the non-live migration scenario.  Could you explain
> > what does io_uring mean here?
> >
> 
> This table is all non-live migration. This particular line is a snapshot
> (hmp_savevm->save_snapshot). I thought it could be relevant because it
> is another way by which we write RAM into disk.

I see, so if all non-live that explains, because I was curious what's the
relationship between this feature and the live snapshot that QEMU also
supports.

I also don't immediately see why savevm will be much slower, do you have an
answer?  Maybe it's somewhere but I just overlooked..

IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
"we can stop the VM".  It smells slightly weird to build this on top of
"migrate" from that pov, rather than "savevm", though.  Any thoughts on
this aspect (on why not building this on top of "savevm")?

Thanks,

> 
> The io_uring is noise, I was initially under the impression that the
> block device aio configuration affected this scenario.
> 
> >> file:           | 3017 |  855862 | 10301
> >> fixed-ram       | 1982 |  330686 | 15637
> >> ----------------+------+---------+------
> >> fixed-ram + multifd + O_DIRECT
> >>          2 ch.  | 5565 | 1500882 |  5576
> >>          4 ch.  | 5735 | 1991549 |  5412
> >>          8 ch.  | 5650 | 1769650 |  5489
> >>         16 ch.  | 6071 | 1832407 |  5114
> >>         32 ch.  | 6147 | 1809588 |  5050
> >>         64 ch.  | 6344 | 1841728 |  4895
> >>        128 ch.  | 6120 | 1915669 |  5085
> >> ----------------+------+---------+------
> >
> > Thanks,
> 

-- 
Peter Xu


