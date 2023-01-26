Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97E67D0A4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:51:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4VZ-000882-Vr; Thu, 26 Jan 2023 10:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL4VO-00086M-3D
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL4VM-0003Z6-Fk
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674748175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAexpT0hu1/S3XWo4hDP6RfdoTXBwKXRCA5a5B27XZU=;
 b=BUWHtP/H2VFssNDmLu2rdbDKbLuQK/tYOlsxDx9NVYV4saFQhEGwzE25FfjYQp14RvIW4H
 fWnJJ8cx7U7ztYSZWkk3BDMHt3bsw61tAH1lMI3pNq+G9xirKa1fiCD/WWb2yfqf9W3KJn
 zxnvA/vjPMOtGqJ37IsCarH7pBzhPZU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-RvfcirjCNkuZWT0wGiVl3g-1; Thu, 26 Jan 2023 10:49:34 -0500
X-MC-Unique: RvfcirjCNkuZWT0wGiVl3g-1
Received: by mail-qk1-f198.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso1246564qko.11
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XAexpT0hu1/S3XWo4hDP6RfdoTXBwKXRCA5a5B27XZU=;
 b=gfry5vQmAwcqHsgFXWsqD5XPEmGezcHNFGAypLf3eD58CXCqOPZLEWZuA3o664a/md
 DlK8DwPNigfSvTDPcuztS2g+orKFcx9u8zZew52AhAE4zL3iwlFFYPpZX4qztHJ4syxh
 v79grp4r+ifFpIOQ7jEBNdjJ+7iEPDdc6g08f6RX4rAZdeZ7mZIs50E0gyZ1NvtR5G2U
 OaEhSknH3+RStIXNBOXH+ibYJWpw5bbEbjSMel+CDmpCRTmk8szI7peGe1Uc/nVbHNjS
 7j1PuEWWKsc5tZNdphkKd4kTkH/wAtdkfyEritZZzzMEI9OIV50Ko8vF2rOxXi1soMTN
 zHAg==
X-Gm-Message-State: AFqh2kogJ90J+ooiFmg41G258HNlxOCJjwN1QfWzhuk+GIiT7ar0q5mv
 OdQQ2Jlr35Fxb+hkPNvGY7x2hto13glnOnZ4UUG6EapLb5dP6oAmkvYHicC8XEkoJW+rDe803kY
 1eSuayYKlDruULvQ=
X-Received: by 2002:ac8:71c4:0:b0:3a7:f3f0:483 with SMTP id
 i4-20020ac871c4000000b003a7f3f00483mr47067117qtp.60.1674748173424; 
 Thu, 26 Jan 2023 07:49:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWI0VfEXVSfU1o/pC9SMRaZhOBeehX2SikDy8egeHii4bq/T1+phyCV4pnXuBl3PDe+Hzphw==
X-Received: by 2002:ac8:71c4:0:b0:3a7:f3f0:483 with SMTP id
 i4-20020ac871c4000000b003a7f3f00483mr47067097qtp.60.1674748173179; 
 Thu, 26 Jan 2023 07:49:33 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 k8-20020ac80208000000b003b1546ee6absm945771qtg.11.2023.01.26.07.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:49:32 -0800 (PST)
Date: Thu, 26 Jan 2023 10:49:30 -0500
From: Peter Xu <peterx@redhat.com>
To: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9KhCiaNPVdwj+OW@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm> <Y9KbUaMo8DaH0YKv@x1n>
 <fc6084db-b7d8-25fa-49a8-8b1a2745b070@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc6084db-b7d8-25fa-49a8-8b1a2745b070@redhat.com>
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

On Thu, Jan 26, 2023 at 04:29:10PM +0100, Michal Prívozník wrote:
> On 1/26/23 16:25, Peter Xu wrote:
> > On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
> >> * Michal Prívozník (mprivozn@redhat.com) wrote:
> >>> On 1/25/23 23:40, Peter Xu wrote:
> >>>> The new /dev/userfaultfd handle is superior to the system call with a
> >>>> better permission control and also works for a restricted seccomp
> >>>> environment.
> >>>>
> >>>> The new device was only introduced in v6.1 so we need a header update.
> >>>>
> >>>> Please have a look, thanks.
> >>>
> >>> I was wondering whether it would make sense/be possible for mgmt app
> >>> (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> >>> itself. But looking into the code, libvirt would need to do that when
> >>> spawning QEMU because that's when QEMU itself initializes internal state
> >>> and queries userfaultfd caps.
> >>
> >> You also have to be careful about what the userfaultfd semantics are; I
> >> can't remember them - but if you open it in one process and pass it to
> >> another process, which processes address space are you trying to
> >> monitor?
> > 
> > Yes it's a problem.  The kernel always fetches the current mm_struct* which
> > represents the current context of virtual address space when creating the
> > uffd handle (for either the syscall or the ioctl() approach).
> 
> Ah, I did not realize that.
> 
> > 
> > It works only if Libvirt will invoke QEMU as a thread and they'll share the
> > same address space.
> > 
> > Why libvirt would like to do so?
> 
> Well, we tend to pass files as FD more and more, because it allows us to
> give access to "privileged" files to unprivileged process. What I did
> not realize is that userfaultfd is different, not yet another file.

I see.  Yes uffd is special comparing to most of the other fds, IMHO
majorly because it's a resource not being public but closely bound to the
process context of the mm.

There used to have proposals that grant permission to open uffd handle for
other processes, but the security implication was still not fully clear and
that discussion discontinued.

Then the question is whether there is still any scenario that QEMU may not
have privilege to either /dev/userfaultfd or using the syscall.

Thanks,

-- 
Peter Xu


