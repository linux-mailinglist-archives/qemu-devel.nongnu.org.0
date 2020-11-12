Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D12B0272
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:01:01 +0100 (CET)
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9PY-0000Ws-6m
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kd9MD-0006nf-W9
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:57:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1kd9MA-0003Ga-6u
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605175047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hy2nEplIvzF9NaD0cPMy30aLxL8qwZcv2joNbOJAHZU=;
 b=hKXiglYGwEtp5DnuTj8OZ11EyZQPqN+kGoYcvqMIpUH1Ie3WN1q7kPScyqQlVh6uiccE5V
 2t7zsJfgDDgjUSGVbLxjJlp5QrCeIPvc/C+tHt1tyBMUvDK+GSNFWSfHQTSMe3fY4taGAK
 jyqExyWSETs5iGnYm1qNvHksLe6eW/c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-mnlIgtCNPBWERr_3sIVr1Q-1; Thu, 12 Nov 2020 04:57:23 -0500
X-MC-Unique: mnlIgtCNPBWERr_3sIVr1Q-1
Received: by mail-qt1-f198.google.com with SMTP id v9so3064613qtw.12
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 01:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hy2nEplIvzF9NaD0cPMy30aLxL8qwZcv2joNbOJAHZU=;
 b=XVIPhE9wkdAvG8RMFxWIpzaadnvBwXlLj/0ygjn/h9OliO3kxNwJrW/uTR1Yd47vHu
 oLNfhcgxRf6hSUNO4H70Yki5+MXnew2BtnrZyyc1WScFCEvAa5/fVwgi7w2MIJ+cH6en
 0piVvZF7BFSa4uijcmn371RnESdznDIWIOv75DwS42g+lk8vDa1i9BBTdvKtX2W2pglg
 tjh3ZwPd6Uv3aquLQqKXu8PrYAes4Suvt89WiZ12ajdG6X705kDptajGa9G+KY+VPYrc
 pPCxgVzJjM2ZDrK59aXIFgEybhlMBeInOamTLviY9pc2m5SJksbRIW2rMkLb4ZL5RLP+
 lYSQ==
X-Gm-Message-State: AOAM532w5t8CjAPQ6ZVGW0WgaY8G7OeeY2tulUBR2DoVXnFhzVNIEA+A
 ZGDiAC8YdgfZVeD3L2nGgEkQ3J5m1cVfIIkWeBvueA1dhVImC2AWV2Gn5T6Ar3EjVAOOkAOeDRr
 eVIZj6mI89BBsGfnbZjoAOQA0k1zhpUM=
X-Received: by 2002:a0c:df08:: with SMTP id g8mr11276960qvl.17.1605175043013; 
 Thu, 12 Nov 2020 01:57:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweRkcLn71ublNn9nigNM5WZ0aOGTSySy9gOHbU91bm62xvqstIRuei9N28lGnNJh6ktwU6+AG6IGfsidvYoic=
X-Received: by 2002:a0c:df08:: with SMTP id g8mr11276943qvl.17.1605175042783; 
 Thu, 12 Nov 2020 01:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
In-Reply-To: <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 12 Nov 2020 10:57:11 +0100
Message-ID: <CAOssrKeyRVSxCCyvPJvjoXgPYd3Dkkwn5fwAzxeyj-h3g8FqqA@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
To: Vivek Goyal <vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0000000000003a764e05b3e5f007"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--0000000000003a764e05b3e5f007
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 10:06 AM Miklos Szeredi <mszeredi@redhat.com> wrote:
>
> On Fri, Nov 6, 2020 at 11:35 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Fri, Nov 06, 2020 at 08:33:50PM +0000, Venegas Munoz, Jose Carlos wrote:
> > > Hi Vivek,
> > >
> > > I have tested with Kata 1.12-apha0, the results seems that are better for the use fio config I am tracking.
> > >
> > > The fio config does  randrw:
> > >
> > > fio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=200M --readwrite=randrw --rwmixread=75
> > >
> >
> > Hi Carlos,
> >
> > Thanks for the testing.
> >
> > So basically two conclusions from your tests.
> >
> > - for virtiofs, --thread-pool-size=0 is performing better as comapred
> >   to --thread-pool-size=1 as well as --thread-pool-size=64. Approximately
> >   35-40% better.
> >
> > - virtio-9p is still approximately 30% better than virtiofs
> >   --thread-pool-size=0.
> >
> > As I had done the analysis that this particular workload (mixed read and
> > write) is bad with virtiofs because after every write we are invalidating
> > attrs and cache so next read ends up fetching attrs again. I had posted
> > patches to gain some of the performance.
> >
> > https://lore.kernel.org/linux-fsdevel/20200929185015.GG220516@redhat.com/
> >
> > But I got the feedback to look into implementing file leases instead.
>
> Hmm, the FUSE_AUTO_INVAL_DATA feature is buggy, how about turning it
> off for now?   9p doesn't have it, so no point in enabling it for
> virtiofs by default.
>
> Also I think some confusion comes from cache=auto being the default
> for virtiofs.    Not sure what the default is for 9p, but comparing
> default to default will definitely not be apples to apples since this
> mode is nonexistent in 9p.
>
> 9p:cache=none  <-> virtiofs:cache=none
> 9p:cache=loose <-> virtiofs:cache=always
>
> "9p:cache=mmap" and "virtiofs:cache=auto" have no match.
>
> Untested patch attached.

Another performance issue with virtiofs could be due to the strict
page writeback rules in fuse that are meant to prevent misuse of
kernel memory by unprivileged processes.   Since virtiofs isn't
subject to that limitation, these could be relaxed.

Attaching a patch that does one half of this.  The other half is
getting rid of the page copying, that's a bit more involved, but
shouldn't be too difficult.  Just need to duplicate the cached
writeback callbacks for virtiofs and do away with the complex temp
page stuff.

Thanks,
Miklos

--0000000000003a764e05b3e5f007
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="virtiofs-relax-writeback-restrictions.patch"
Content-Disposition: attachment; 
	filename="virtiofs-relax-writeback-restrictions.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_khenr3g40>
X-Attachment-Id: f_khenr3g40

ZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvZnVzZV9pLmggYi9mcy9mdXNlL2Z1c2VfaS5oCmluZGV4IGQ0
MTRjNzg3ZTM2Mi4uOTJjOTJjNDgyYzU3IDEwMDY0NAotLS0gYS9mcy9mdXNlL2Z1c2VfaS5oCisr
KyBiL2ZzL2Z1c2UvZnVzZV9pLmgKQEAgLTUwMiw2ICs1MDIsNyBAQCBzdHJ1Y3QgZnVzZV9mc19j
b250ZXh0IHsKIAlib29sIG5vX2ZvcmNlX3Vtb3VudDoxOwogCWJvb2wgbGVnYWN5X29wdHNfc2hv
dzoxOwogCWJvb2wgZGF4OjE7CisJYm9vbCByZWxheF93cml0ZWJhY2s6MTsKIAl1bnNpZ25lZCBp
bnQgbWF4X3JlYWQ7CiAJdW5zaWduZWQgaW50IGJsa3NpemU7CiAJY29uc3QgY2hhciAqc3VidHlw
ZTsKZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvaW5vZGUuYyBiL2ZzL2Z1c2UvaW5vZGUuYwppbmRleCAz
NmFiMDUzMTU4MjguLjAyOTMyNWViZDFiMyAxMDA2NDQKLS0tIGEvZnMvZnVzZS9pbm9kZS5jCisr
KyBiL2ZzL2Z1c2UvaW5vZGUuYwpAQCAtMTEzMCw3ICsxMTMwLDggQEAgdm9pZCBmdXNlX2ZyZWVf
Y29ubihzdHJ1Y3QgZnVzZV9jb25uICpmYykKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGZ1c2VfZnJl
ZV9jb25uKTsKIAotc3RhdGljIGludCBmdXNlX2JkaV9pbml0KHN0cnVjdCBmdXNlX2Nvbm4gKmZj
LCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQorc3RhdGljIGludCBmdXNlX2JkaV9pbml0KHN0cnVj
dCBmdXNlX2Nvbm4gKmZjLCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLAorCQkJIHN0cnVjdCBmdXNl
X2ZzX2NvbnRleHQgKmN0eCkKIHsKIAlpbnQgZXJyOwogCWNoYXIgKnN1ZmZpeCA9ICIiOwpAQCAt
MTE1MSwyMSArMTE1MiwyNCBAQCBzdGF0aWMgaW50IGZ1c2VfYmRpX2luaXQoc3RydWN0IGZ1c2Vf
Y29ubiAqZmMsIHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCiAKIAkvKiBmdXNlIGRvZXMgaXQncyBv
d24gd3JpdGViYWNrIGFjY291bnRpbmcgKi8KIAlzYi0+c19iZGktPmNhcGFiaWxpdGllcyAmPSB+
QkRJX0NBUF9XUklURUJBQ0tfQUNDVDsKLQlzYi0+c19iZGktPmNhcGFiaWxpdGllcyB8PSBCRElf
Q0FQX1NUUklDVExJTUlUOwogCi0JLyoKLQkgKiBGb3IgYSBzaW5nbGUgZnVzZSBmaWxlc3lzdGVt
IHVzZSBtYXggMSUgb2YgZGlydHkgKwotCSAqIHdyaXRlYmFjayB0aHJlc2hvbGQuCi0JICoKLQkg
KiBUaGlzIGdpdmVzIGFib3V0IDFNIG9mIHdyaXRlIGJ1ZmZlciBmb3IgbWVtb3J5IG1hcHMgb24g
YQotCSAqIG1hY2hpbmUgd2l0aCAxRyBhbmQgMTAlIGRpcnR5X3JhdGlvLCB3aGljaCBzaG91bGQg
YmUgbW9yZQotCSAqIHRoYW4gZW5vdWdoLgotCSAqCi0JICogUHJpdmlsZWdlZCB1c2VycyBjYW4g
cmFpc2UgaXQgYnkgd3JpdGluZyB0bwotCSAqCi0JICogICAgL3N5cy9jbGFzcy9iZGkvPGJkaT4v
bWF4X3JhdGlvCi0JICovCi0JYmRpX3NldF9tYXhfcmF0aW8oc2ItPnNfYmRpLCAxKTsKKwlpZiAo
IWN0eC0+cmVsYXhfd3JpdGViYWNrKSB7CisJCXNiLT5zX2JkaS0+Y2FwYWJpbGl0aWVzIHw9IEJE
SV9DQVBfU1RSSUNUTElNSVQ7CisKKwkJLyoKKwkJICogRm9yIGEgc2luZ2xlIGZ1c2UgZmlsZXN5
c3RlbSB1c2UgbWF4IDElIG9mIGRpcnR5ICsKKwkJICogd3JpdGViYWNrIHRocmVzaG9sZC4KKwkJ
ICoKKwkJICogVGhpcyBnaXZlcyBhYm91dCAxTSBvZiB3cml0ZSBidWZmZXIgZm9yIG1lbW9yeSBt
YXBzIG9uIGEKKwkJICogbWFjaGluZSB3aXRoIDFHIGFuZCAxMCUgZGlydHlfcmF0aW8sIHdoaWNo
IHNob3VsZCBiZSBtb3JlCisJCSAqIHRoYW4gZW5vdWdoLgorCQkgKgorCQkgKiBQcml2aWxlZ2Vk
IHVzZXJzIGNhbiByYWlzZSBpdCBieSB3cml0aW5nIHRvCisJCSAqCisJCSAqICAgIC9zeXMvY2xh
c3MvYmRpLzxiZGk+L21heF9yYXRpbworCQkgKi8KKwkJYmRpX3NldF9tYXhfcmF0aW8oc2ItPnNf
YmRpLCAxKTsKKwl9CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTEzNTQsNyArMTM1OCw3IEBAIGludCBm
dXNlX2ZpbGxfc3VwZXJfY29tbW9uKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBmdXNl
X2ZzX2NvbnRleHQgKmN0eCkKIAogCWZjLT5kZXYgPSBzYi0+c19kZXY7CiAJZm0tPnNiID0gc2I7
Ci0JZXJyID0gZnVzZV9iZGlfaW5pdChmYywgc2IpOworCWVyciA9IGZ1c2VfYmRpX2luaXQoZmMs
IHNiLCBjdHgpOwogCWlmIChlcnIpCiAJCWdvdG8gZXJyX2Rldl9mcmVlOwogCmRpZmYgLS1naXQg
YS9mcy9mdXNlL3ZpcnRpb19mcy5jIGIvZnMvZnVzZS92aXJ0aW9fZnMuYwppbmRleCA4ODY4YWMz
MWEzYzAuLmVmYmUxNjk3NjEyZSAxMDA2NDQKLS0tIGEvZnMvZnVzZS92aXJ0aW9fZnMuYworKysg
Yi9mcy9mdXNlL3ZpcnRpb19mcy5jCkBAIC0xMjg4LDYgKzEyODgsNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdmlydGlvX2ZzX2N0eF9zZXRfZGVmYXVsdHMoc3RydWN0IGZ1c2VfZnNfY29udGV4dCAq
Y3R4KQogCWN0eC0+ZGVzdHJveSA9IHRydWU7CiAJY3R4LT5ub19jb250cm9sID0gdHJ1ZTsKIAlj
dHgtPm5vX2ZvcmNlX3Vtb3VudCA9IHRydWU7CisJY3R4LT5yZWxheF93cml0ZWJhY2sgPSB0cnVl
OwogfQogCiBzdGF0aWMgaW50IHZpcnRpb19mc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9j
ayAqc2IsIHN0cnVjdCBmc19jb250ZXh0ICpmc2MpCg==
--0000000000003a764e05b3e5f007--


