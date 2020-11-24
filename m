Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE82C312B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:47:56 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kheI7-0007er-FD
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kheEW-0005qT-5v
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kheEU-0005Sy-4A
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606247048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8VqjTIFIpwUS69e+eTqi9cBRM+wGpC5yDXdhIlqCS8=;
 b=T7W0RJBA78ANSvd9OwIxGhJRtvY4z+Y7y2eDV6ASjiMx5NNfAzN5sk4pZzI5Vn/v0MzA+K
 RV/fZp6bto4Q98VY/1FnxlkjNIHei9N6/ifTIeuSYt7cBGF/IxyXzVVLxHjbCvRhlZUIZb
 QpAmdJ6J0DS6a7JrVRh8vmN5oe0/HaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-nq5x9snDPp6ZKQhS5ilenQ-1; Tue, 24 Nov 2020 14:44:06 -0500
X-MC-Unique: nq5x9snDPp6ZKQhS5ilenQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B66107AFC8;
 Tue, 24 Nov 2020 19:44:04 +0000 (UTC)
Received: from starship (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 892395C1A1;
 Tue, 24 Nov 2020 19:44:01 +0000 (UTC)
Message-ID: <35b073136cba9987a6cbfc59549dbe8633e0e803.camel@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>
Date: Tue, 24 Nov 2020 21:44:00 +0200
In-Reply-To: <f6df1eedb9785b907807e0581be12c790112d939.camel@redhat.com>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123173853.GE5317@merkur.fritz.box>
 <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
 <20201124091723.GA22385@merkur.fritz.box>
 <w51lfeqzimf.fsf@maestria.local.igalia.com>
 <f6df1eedb9785b907807e0581be12c790112d939.camel@redhat.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-U9b/Itrdmbfhn610Owe2"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, zhang_youjia@126.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-U9b/Itrdmbfhn610Owe2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-24 at 20:59 +0200, Maxim Levitsky wrote:
> On Tue, 2020-11-24 at 19:59 +0100, Alberto Garcia wrote:
> > On Tue 24 Nov 2020 10:17:23 AM CET, Kevin Wolf wrote:
> > > We can then continue work to find a minimal reproducer and merge the
> > > test case in the early 6.0 cycle.
> > 
> > I haven't been able to reproduce the problem yet, do you have any
> > findings?
> > 
> > Berto
> > 
> 
> I have a working reproducer script. I'll send it in a hour or so.
> Best regards,
> 	Maxim Levitsky

I have attached a minimal reproducer for this issue.
I can convert this to an iotest if you think that this is worth it.


So these are the exact conditions for the corruption to happen:

1. Image must have at least 5 refcount tables 
(1 more that default refcount table cache size, which is 4 by default)


2. IO pattern that populates the 4 entry refcount table cache fully:

 Easiest way to do it is to have 4 L2 entries populated in the base image,
 such as each entry references a physical cluster that is served by different
 refcount table.
 
 Then discard these entries in the snapshot, triggering discard in the
 base file during the commit, which will populate the refcount table cache.


4. A discard of a cluster that belongs to 5th refcount table (done in the
   exact same way as above discards).
   It should be done soon, before L2 cache flushed due to some unrelated
   IO.

   This triggers the corruption:

The call stack is:

2. qcow2_free_any_cluster->
	qcow2_free_clusters->
		update_refcount:

			//This sets dependency between flushing the refcount cache and l2 cache.
    			if (decrease)
        			qcow2_cache_set_dependency(bs, s->refcount_block_cache,s->l2_table_cache);


			ret = alloc_refcount_block(bs, cluster_index, &refcount_block);
				return load_refcount_block(bs, refcount_block_offset, refcount_block);
					return qcow2_cache_get(...
						qcow2_cache_do_get
							/* because of a cache miss, we have to evict an entry*/
							ret = qcow2_cache_entry_flush(bs, c, i);
							if (c->depends) {
								/* this flushes the L2 cache */
        							ret = qcow2_cache_flush_dependency(bs, c);
							}


I had attached a reproducer that works with almost any cluster size and refcount block size.
Cluster sizes below 4K don't work because commit which is done by the mirror job which works on 4K granularity,
and that results in it not doing any discards due to various alignment restrictions.

If I patch qemu to make mirror job work on 512B granularity, test reproduces for small clusters as well.

The reproducer creates a qcow2 image in the current directory and it needs about 11G for default parameters.
(64K cluster size, 16 bit refcounts).
For 4K cluster size and 64 bit refcounts, it needs only 11M.
(This can be changed by editing the script)

Best regards,
	Maxim Levitsky

--=-U9b/Itrdmbfhn610Owe2
Content-Type: application/x-shellscript; name="reproducer.sh"
Content-Disposition: attachment; filename="reproducer.sh"
Content-Transfer-Encoding: base64

IyEgL2Jpbi9iYXNoCgojIHRlc3QgcGFyYW1ldGVycwpjbHVzdGVyX3NpemU9JCgoNjQqMTAyNCkp
CnJlZmNvdW50X2JpdHM9MTYKcmVmY291bnRfdGVzdF90YWJsZXM9NQoKIz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KcmVmY291bnRfdGFibGVfY292ZXI9JCgoIGNsdXN0ZXJfc2l6ZSAqIGNs
dXN0ZXJfc2l6ZSAqIDggLyByZWZjb3VudF9iaXRzICApKQplY2hvICJhIHJlZmNvdW50IHRhYmxl
IGNvdmVycyAkKCggcmVmY291bnRfdGFibGVfY292ZXIgLyAoMTAyNCoxMDI0KSApKSBNQiIKCk9Q
VElPTlM9ImNsdXN0ZXJfc2l6ZT0kY2x1c3Rlcl9zaXplLHJlZmNvdW50X2JpdHM9JHJlZmNvdW50
X2JpdHMiCgplY2hvICJjcmVhdGluZyBiYXNlIGltYWdlIgpxZW11LWltZyBjcmVhdGUgLWYgcWNv
dzIgLW8gJE9QVElPTlMgZGlza19zMC5xY293MiAkKChyZWZjb3VudF90YWJsZV9jb3ZlcipyZWZj
b3VudF90ZXN0X3RhYmxlcyAgKyBjbHVzdGVyX3NpemUgKiByZWZjb3VudF90ZXN0X3RhYmxlcyAp
KQoKIyBwb3B1bGF0ZSAxc3QgTDIgdGFibGUgd2l0aCBibG9ja3MgdGhhdCB1c2UgZGlmZmVyZW50
IHJlZmNvdW50IHRhYmxlcwpmdW5jdGlvbiBjcmVhdGVfYmFzZV9maWxlKCkKewoJZWNobyAib3Bl
biAuL2Rpc2tfczAucWNvdzIiCgogICAgZmlsbF9vZmZzZXQ9JCgoY2x1c3Rlcl9zaXplICogcmVm
Y291bnRfdGVzdF90YWJsZXMpKQogICAgYmFzZV9vZmZzZXQ9MAoKCWZvciAoKCBpPTA7IGk8cmVm
Y291bnRfdGVzdF90YWJsZXM7IGkrKyApKSA7IGRvCgkKCSAgICAjIGNyZWF0ZSBhIGwyIGVudHJ5
IHRoYXQgd2lsbCByZWZlcmVuY2UgcmVmY291bnQgdGFibGUgJGkgCgkJZWNobyAid3JpdGUgLVAg
MHhBQSAweCQocHJpbnRmICcleCcgJGJhc2Vfb2Zmc2V0KSAweDEiCgogICAgICAgICMgYWxsb2Nh
dGUgZHVtbXkgc3BhY2Ugc28gdGhhdCBuZXh0IGFsbG9jYXRlZCBjbHVzdGVyIHdpbGwgcmVmZXJl
bmNlIG5leHQgcmVmY291bnQgdGFibGUKCQlzaXplPSQoKHJlZmNvdW50X3RhYmxlX2NvdmVyKSkK
CQl3aGlsZSAoKHNpemUgPiAwKSkgOyBkbwoJCQljaHVuaz0kc2l6ZQoJCQlpZiAoKCAkY2h1bmsg
PiAxMDI0KjEwMjQqMTAyNCApKSA7IHRoZW4KCQkJCWNodW5rPSQoKDEwMjQqMTAyNCoxMDI0KSkK
CQkJZmkKCgkJCWVjaG8gIndyaXRlIC1QIDB4QUEgMHgkKHByaW50ZiAnJXgnICRmaWxsX29mZnNl
dCkgMHgkKHByaW50ZiAnJXgnICRjaHVuaykiCgkJCSgoZmlsbF9vZmZzZXQgKz0gY2h1bmspKQoJ
CQkoKHNpemUgLT0gY2h1bmspKQoJCWRvbmUKCQkoKGJhc2Vfb2Zmc2V0ICs9IGNsdXN0ZXJfc2l6
ZSkpCglkb25lCgllY2hvICJjbG9zZSIKfQoKZWNobyAicG9wdWxhdGluZyBiYXNlIGltYWdlIgpj
cmVhdGVfYmFzZV9maWxlIHwgcWVtdS1pbwoKCiMgbm93IGNyZWF0ZSBhIHNuYXBzaG90IGFuZCBk
aXNjYXJkIHRoZSBmaXJzdCBsMiB0YWJsZSByYW5nZQplY2hvICJjcmVhdGluZyBzbmFwc2hvdCIK
cWVtdS1pbWcgY3JlYXRlIC1mIHFjb3cyIC1GIHFjb3cyIC1iIC4vZGlza19zMC5xY293MiAtbyAk
T1BUSU9OUyAuL2Rpc2tfczEucWNvdzIKCgpmdW5jdGlvbiBkb19kaXNjYXJkKCkKewoJZWNobyAi
b3BlbiAuL2Rpc2tfczEucWNvdzIiCglzaXplPSQoKChyZWZjb3VudF90ZXN0X3RhYmxlcykqY2x1
c3Rlcl9zaXplKSkKCWVjaG8gIndyaXRlIC16ICAweDAgMHgkKHByaW50ZiAnJXgnICRzaXplKSIK
CWVjaG8gImZsdXNoIgoJZWNobyAiY2xvc2UiCn0KCmVjaG8gImFkZGluZyBkaXNjYXJkcyB0byB0
aGUgc25hcHNob3QuLi4iCmRvX2Rpc2NhcmQgfCBxZW11LWlvCgoKZWNobyAiZG9pbmcgdGhlIGNv
bW1pdC4uLiIKI1FFTVVfSU1HPS9ob21lL21sZXZpdHNrL1FlbXUvZGVza3RvcC9idWlsZC1maXgt
Y29ycnVwdGlvbi9vdXRwdXQvYmluL3FlbXUtaW1nClFFTVVfSU1HPXFlbXUtaW1nCgokUUVNVV9J
TUcgY29tbWl0IC4vZGlza19zMS5xY293MgoKZWNobyAiY2hlY2tpbmcgdGhlIGJhc2UgaW1hZ2Uu
Li4iCiRRRU1VX0lNRyBjaGVjayAuL2Rpc2tfczAucWNvdzIK
--=-U9b/Itrdmbfhn610Owe2--


