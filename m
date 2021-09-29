Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349141C2B1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:27:28 +0200 (CEST)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWoA-00034U-Kk
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWl7-00029n-AH
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWl4-0001XI-7R
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632911052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odBWmiqTjrZIdzgsI95menDQpO4el1QuzAlfUoSVQNI=;
 b=DwrFFNSkB4X4eSVzW8rRMd2S7ed5hNuZHMPmieX10C76Z/fIyHu6w13DSv4AtUcDIcvucI
 b5gBQopggtJKCwZqWJUkl+8J/Vavx0i7ednR8q/Swphu6Eh7sHHzMax9EwKRocRr+hMYYI
 0Jbrpoe0W6SBd5i5uld0PggWlyNQJI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-p1OFWmpvMGKuSy3ncIdoew-1; Wed, 29 Sep 2021 06:24:09 -0400
X-MC-Unique: p1OFWmpvMGKuSy3ncIdoew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55A5D8145E5;
 Wed, 29 Sep 2021 10:24:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FE255D9C6;
 Wed, 29 Sep 2021 10:24:02 +0000 (UTC)
Date: Wed, 29 Sep 2021 11:24:02 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210929102402.GI3361@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929094638.GF3361@redhat.com> <YVQ64pAP0iy1HbNn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVQ64pAP0iy1HbNn@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 11:07:30AM +0100, Daniel P. Berrangé wrote:
> I'm not sure if we actually need the full driver or not for testing
> purposes. The the GenID is just in memory somewhere, and the somewhere
> is reported via ACPI table entry. For QEMU its easy as the data is
> exposed via fw_cfg which can be read from sysfs directly without
> even needing to look at ACPI entries to find it. Not sure how we
> find it with VMWare/HyperV though.

This still has the problem that qemu is mangling the vmgenid.
Nevertheless, on qemu-6.1.0-5.fc36.x86_64 I added this to a Linux
guest:

  <genid>11223344-5566-7788-99aa-bbccddeeff00</genid>

which turned into:

  -device vmgenid,guid=11223344-5566-7788-99aa-bbccddeeff00,id=vmgenid0

Inside the guest:

# ls /sys/firmware/qemu_fw_cfg/by_name/etc/vmgenid_guid/ -l
total 0
-r--------. 1 root root 4096 Sep 29 11:16 key
-r--------. 1 root root 4096 Sep 29 11:16 name
-r--------. 1 root root    0 Sep 29 11:16 raw
-r--------. 1 root root 4096 Sep 29 11:16 size
# hexdump -C /sys/firmware/qemu_fw_cfg/by_name/etc/vmgenid_guid/raw 
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000020  00 00 00 00 00 00 00 00  44 33 22 11 66 55 88 77  |........D3".fU.w|
00000030  99 aa bb cc dd ee ff 00  00 00 00 00 00 00 00 00  |................|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000


But I think what I really need to do is look at the raw physical
address:

# hexdump -C /sys/firmware/qemu_fw_cfg/by_name/etc/vmgenid_addr/raw 
00000000  28 f0 ff 7f 00 00 00 00                           |(.......|
00000008

# dd if=/dev/mem bs=1 skip=$(( 0x7ffff028 )) count=16 | hexdump -C
16+0 records in
16+0 records out
16 bytes copied, 6.0392e-05 s, 265 kB/s
00000000  44 33 22 11 66 55 88 77  99 aa bb cc dd ee ff 00  |D3".fU.w........|
00000010


I think for VMware I'm really going to need the kernel driver, unless
there's some way that iasl can be used to extract the information?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


