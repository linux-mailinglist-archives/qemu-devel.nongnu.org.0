Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5DB6D247C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:55:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piH5t-0001od-HR; Fri, 31 Mar 2023 11:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piH5r-0001oO-6o
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:55:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piH5p-00062w-9h
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680278107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fRLmgQcap3HACl/CXNIg3bbMEMEfIewFf3qGKToOfbU=;
 b=FdSr/xuFUtzW/n1GQ1oB+pZ2BY4zzuWEB8IqIGYFXMZSODWvFN+tkxKAc/n70vNUW0yk3x
 szeuUxJoPJmqGJhtlOTJVKXNksmaB+W6L5/18qwyZQ6NPCuZgmEn6hO098aR9DenR0scYG
 reFtyYPJSv4UV8v3fXyeusdQkcxj5Dg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-pg3RdX-JP5i_XnEfFCSWGA-1; Fri, 31 Mar 2023 11:55:06 -0400
X-MC-Unique: pg3RdX-JP5i_XnEfFCSWGA-1
Received: by mail-qt1-f197.google.com with SMTP id
 h6-20020ac85846000000b003e3c23d562aso14894905qth.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 08:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680278105; x=1682870105;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRLmgQcap3HACl/CXNIg3bbMEMEfIewFf3qGKToOfbU=;
 b=gKVrhHKYsWn/V93/BbyBLmfZsnuSPhvLLztsslLrFZsNlk95ZHHe92ndqs5TOR/wFV
 2YF3EVp+NekEGJX1Wavd+x5cvhNsT4H2zmm786WfU4o36yrc7BryAcBlxxQ1Vubo0gn9
 Vn7e8Xq5SYISLQ7onfbJ31lfl4XksViNAT/G4pEKWQN1ye/DzfXA+2Mpw+HT3pnawExk
 /qoBCRM80OW9Tkunx8PPFGhmAgrh121NLcCF7ONTGz85/iBe+tKoBTlQhSX6a0hgnGLj
 SO78tINHuPnaLRpiky8Nt4M1uol87f+V/PS1MBI8qDmshP4xFkwlPnKqKQARnid9Hjwn
 UP9A==
X-Gm-Message-State: AO0yUKXDE+T186UIjbG372qR6gs621A/4X85uHkSbq7bLxczYunvv78d
 eMDqyXptqT2XRlk1DRtNUbdBiQIEcsUFm1hVF0Upjlt1G2Re0Kv/N4SZbhEi5/6VAExX15iNfq4
 7VoYEJpVu6s+SUy4=
X-Received: by 2002:a05:622a:3c9:b0:3b8:36f8:830e with SMTP id
 k9-20020a05622a03c900b003b836f8830emr43956484qtx.6.1680278105414; 
 Fri, 31 Mar 2023 08:55:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set+PCcDhB0q+K2ElwxTWDsnc5xD8LPTxe7Fgu6hQ5kW19WS10r40hNkCI3eqWgDyxB8f98P0VQ==
X-Received: by 2002:a05:622a:3c9:b0:3b8:36f8:830e with SMTP id
 k9-20020a05622a03c900b003b836f8830emr43956447qtx.6.1680278105062; 
 Fri, 31 Mar 2023 08:55:05 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 p137-20020a37428f000000b00746772d78a6sm764811qka.2.2023.03.31.08.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 08:55:04 -0700 (PDT)
Date: Fri, 31 Mar 2023 11:55:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCcCV8PIsuvab1lO@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
 <878rfdos4a.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878rfdos4a.fsf@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> >> >> Outgoing migration to file. NVMe disk. XFS filesystem.
> >> >> 
> >> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> >> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> >> >>   10m -v`:
> >> >> 
> >> >> migration type  | MB/s | pages/s |  ms
> >> >> ----------------+------+---------+------
> >> >> savevm io_uring |  434 |  102294 | 71473
> >> >
> >> > So I assume this is the non-live migration scenario.  Could you explain
> >> > what does io_uring mean here?
> >> >
> >> 
> >> This table is all non-live migration. This particular line is a snapshot
> >> (hmp_savevm->save_snapshot). I thought it could be relevant because it
> >> is another way by which we write RAM into disk.
> >
> > I see, so if all non-live that explains, because I was curious what's the
> > relationship between this feature and the live snapshot that QEMU also
> > supports.
> >
> > I also don't immediately see why savevm will be much slower, do you have an
> > answer?  Maybe it's somewhere but I just overlooked..
> >
> 
> I don't have a concrete answer. I could take a jab and maybe blame the
> extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
> of bandwidth limits?

IMHO it would be great if this can be investigated and reasons provided in
the next cover letter.

> 
> > IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> > "we can stop the VM".  It smells slightly weird to build this on top of
> > "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> > this aspect (on why not building this on top of "savevm")?
> >
> 
> I share the same perception. I have done initial experiments with
> savevm, but I decided to carry on the work that was already started by
> others because my understanding of the problem was yet incomplete.
> 
> One point that has been raised is that the fixed-ram format alone does
> not bring that many performance improvements. So we'll need
> multi-threading and direct-io on top of it. Re-using multifd
> infrastructure seems like it could be a good idea.

The thing is IMHO concurrency is not as hard if VM stopped, and when we're
100% sure locally on where the page will go.

IOW, I think multifd provides a lot of features that may not really be
useful for this effort, meanwhile using those features may need to already
pay for the overhead to support those features.

For example, a major benefit of multifd is it allows pages sent out of
order, so it indexes the page as a header.  I didn't read the follow up
patches, but I assume that's not needed in this effort.

What I understand so far with fixes-ram is we dump the whole ramblock
memory into a chunk at offset of a file.  Can concurrency of that
achievable easily by creating a bunch of threads dumping altogether during
the savevm, with different offsets of guest ram & file passed over?

It's very possible that I overlooked a lot of things, but IMHO my point is
it'll always be great to have a small section discussing the pros and cons
in the cover letter on the decision of using "migrate" infra rather than
"savevm".  Because it's still against the intuition at least to some
reviewers (like me..).  What I worry is this can be implemented more
efficiently and with less LOCs into savevm (and perhaps also benefit normal
savevm too!  so there's chance current savevm users can already benefit
from this) but we didn't do so because the project simply started with
using QMP migrate.  Any investigation on figuring more of this out would be
greatly helpful.

Thanks,

-- 
Peter Xu


