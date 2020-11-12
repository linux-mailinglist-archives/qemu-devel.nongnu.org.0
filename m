Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA52B01C0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:08:27 +0100 (CET)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd8ag-0004Z3-Ox
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kd8ZC-0003cR-GY
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kd8ZA-0001eQ-Mv
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605172011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YS7zr2lfSiVRepKauQV1W38IcQZ+8ZaQgejwf8gf/ys=;
 b=jOBh98DI1YWtt0Ee06L8oNhj5Hrg9c/ZdgqkSjf+Xz5dBd03cE8N+/D3QlCmOympwSAR4s
 Nde1wVtpkBHlPnUyxUGe6xaVoTCYeid1vO6P6DHbJgb6NpEF6wNLUmP7DgMU/LHNCRclkQ
 ukvTtZncGXkNlTYoSoOd5DbcvnRE4GI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-MjYkHWRVNyefeHoHlfO7GA-1; Thu, 12 Nov 2020 04:06:48 -0500
X-MC-Unique: MjYkHWRVNyefeHoHlfO7GA-1
Received: by mail-qk1-f197.google.com with SMTP id m76so3797463qke.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 01:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YS7zr2lfSiVRepKauQV1W38IcQZ+8ZaQgejwf8gf/ys=;
 b=YNFiLYznZ06w/59l8wMd9zIOjxeGW98p6MkUY44jkSyFeTWMH2Ctk+am0qlNu0g99u
 DLAGteIeJJi3ZVboFzTa7D3l0oQCs2RZUZOdD7lBW8z9/I3hnZqTZ3Yfrng6096FoheF
 GoMsE185ynwQYlIgeWpcbs1H/EcC+xSChYb+hy16QyfPvAt9es5LESmmKHNugIQHR5Xs
 Ym1OvpY8jcKqjormV1Dq6r8IKPxA2BUEIwYF5dQbhK5WZqE9eA+8FbiTQmK0kxt95koD
 /YbnMvxotqQx/FjS+CwRmvggSFYhCM9dWGYIrHPA/bR0JRUiKHnx/mjNMaZp8ScAT0Ij
 4QwQ==
X-Gm-Message-State: AOAM5336oeGdtrn4zfsqjLYg8s5OMUqcOBIV6NtiL+q2rJMEU5JkYzBY
 r9tdzM1f1HZjExK8+9DWcVjEf6Tf3abYq6PsYUz2B+G8KDqC88Hn4TZVRmPdJziSTsONIOFYvEW
 ddtXaY6zth/8ixbu5lQZx/BNkFuxVBh8=
X-Received: by 2002:a0c:bf05:: with SMTP id m5mr27686382qvi.16.1605172008325; 
 Thu, 12 Nov 2020 01:06:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1BCbH5xnzWxXDI0/iBu+YyOc6hYqINkr8fqiVaOQ8SG/RVbrhbL2YWTU5fQAx9yyF+S+W06t0SAsTHk+Okb4=
X-Received: by 2002:a0c:bf05:: with SMTP id m5mr27686363qvi.16.1605172008050; 
 Thu, 12 Nov 2020 01:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
In-Reply-To: <20201106223524.GG1436035@redhat.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 12 Nov 2020 10:06:37 +0100
Message-ID: <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
To: Vivek Goyal <vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="00000000000058113d05b3e53bc6"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000058113d05b3e53bc6
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 11:35 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Fri, Nov 06, 2020 at 08:33:50PM +0000, Venegas Munoz, Jose Carlos wrote:
> > Hi Vivek,
> >
> > I have tested with Kata 1.12-apha0, the results seems that are better for the use fio config I am tracking.
> >
> > The fio config does  randrw:
> >
> > fio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=200M --readwrite=randrw --rwmixread=75
> >
>
> Hi Carlos,
>
> Thanks for the testing.
>
> So basically two conclusions from your tests.
>
> - for virtiofs, --thread-pool-size=0 is performing better as comapred
>   to --thread-pool-size=1 as well as --thread-pool-size=64. Approximately
>   35-40% better.
>
> - virtio-9p is still approximately 30% better than virtiofs
>   --thread-pool-size=0.
>
> As I had done the analysis that this particular workload (mixed read and
> write) is bad with virtiofs because after every write we are invalidating
> attrs and cache so next read ends up fetching attrs again. I had posted
> patches to gain some of the performance.
>
> https://lore.kernel.org/linux-fsdevel/20200929185015.GG220516@redhat.com/
>
> But I got the feedback to look into implementing file leases instead.

Hmm, the FUSE_AUTO_INVAL_DATA feature is buggy, how about turning it
off for now?   9p doesn't have it, so no point in enabling it for
virtiofs by default.

Also I think some confusion comes from cache=auto being the default
for virtiofs.    Not sure what the default is for 9p, but comparing
default to default will definitely not be apples to apples since this
mode is nonexistent in 9p.

9p:cache=none  <-> virtiofs:cache=none
9p:cache=loose <-> virtiofs:cache=always

"9p:cache=mmap" and "virtiofs:cache=auto" have no match.

Untested patch attached.

Thanks,
Miklos

--00000000000058113d05b3e53bc6
Content-Type: application/x-patch; name="virtiofs-perf-fix.patch"
Content-Disposition: attachment; filename="virtiofs-perf-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kheldrw30>
X-Attachment-Id: f_kheldrw30

ZGlmZiAtLWdpdCBhL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jIGIvdG9vbHMvdmly
dGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMKaW5kZXggZWMxMDA4YmNlYmE4Li5kNDc0YzU1M2JiNWMg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jCisrKyBiL3Rvb2xz
L3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jCkBAIC02MTgsNiArNjE4LDkgQEAgc3RhdGljIHZv
aWQgbG9faW5pdCh2b2lkICp1c2VyZGF0YSwgc3RydWN0IGZ1c2VfY29ubl9pbmZvICpjb25uKQog
ICAgICAgICBsby0+YW5ub3VuY2Vfc3VibW91bnRzID0gZmFsc2U7CiAgICAgfQogI2VuZGlmCisK
KyAgICAvKiBUaGlzIGlzIGN1cnJlbnRseSBidWdneSB3aXRoIG1peGVkIHJlYWQtd3JpdGUgbG9h
ZCwgc28gZGlzYWJsZSAqLworICAgIGNvbm4tPndhbnQgJj0gfkZVU0VfQ0FQX0FVVE9fSU5WQUxf
REFUQTsKIH0KIAogc3RhdGljIHZvaWQgbG9fZ2V0YXR0cihmdXNlX3JlcV90IHJlcSwgZnVzZV9p
bm9fdCBpbm8sCkBAIC0zNDQ0LDcgKzM0NDcsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
YXJndltdKQogICAgIGxvLmlub2RlcyA9IGdfaGFzaF90YWJsZV9uZXcobG9fa2V5X2hhc2gsIGxv
X2tleV9lcXVhbCk7CiAgICAgbG8ucm9vdC5mZCA9IC0xOwogICAgIGxvLnJvb3QuZnVzZV9pbm8g
PSBGVVNFX1JPT1RfSUQ7Ci0gICAgbG8uY2FjaGUgPSBDQUNIRV9BVVRPOworICAgIGxvLmNhY2hl
ID0gQ0FDSEVfQUxXQVlTOwogCiAgICAgLyoKICAgICAgKiBTZXQgdXAgdGhlIGlubyBtYXAgbGlr
ZSB0aGlzOgo=
--00000000000058113d05b3e53bc6--


