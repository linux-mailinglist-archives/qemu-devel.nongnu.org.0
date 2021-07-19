Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F203CD577
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:07:00 +0200 (CEST)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Sz3-0005fL-Qu
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5Svc-0002DS-2L
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5SvZ-0002jp-GL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626699800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAf6DPiEhNPDtOySCdWfdbuQuK+jDCp2OcykxiXBR7o=;
 b=QHSmVJi3WSlJlANKZapy2D3bGWXBjTZ9cbFcJOlqiAddNPS0PLvjBmGIBhMp3xlRjCoVDT
 a0NPEhNqPfzcfEdrpaRY7cQDZihp/k8FzQ4rC+Curc8xGrFwzKuk06XoUTLAYr+Pcb1JMN
 XSGwafRNGqPeR6F+2BDbbSQm+Kg48c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-nw_0p7tjOzmc6ayjX6Bj1g-1; Mon, 19 Jul 2021 09:03:16 -0400
X-MC-Unique: nw_0p7tjOzmc6ayjX6Bj1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C667804302;
 Mon, 19 Jul 2021 13:03:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B21560CA0;
 Mon, 19 Jul 2021 13:03:14 +0000 (UTC)
Date: Mon, 19 Jul 2021 15:03:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: Initialize RAM from a file and save it to the file
Message-ID: <20210719150313.382a0b01@redhat.com>
In-Reply-To: <a3af9417-d743-bb3e-2e46-597b728d1574@amsat.org>
References: <CACproumcn8Dba=Mt7ww-uFtb2kHpLsF36j0DiKEKQSVDtMPpcg@mail.gmail.com>
 <a3af9417-d743-bb3e-2e46-597b728d1574@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Hiroko Shimizu <hiroko07168@gmail.com>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 12:01:10 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi Hiroko,
>=20
> On 7/19/21 11:34 AM, Hiroko Shimizu wrote:
> > Hello,=C2=A0
> > I'd like to initialize RAM from a specific file when RAM is created.
> > Then,=C2=A0 I tried using memory_region_init_ram_from_file().  =20
...
> > Could you tell me what I need to do or another way to initialize RAM
> > from a file?
> >=20
> > Also, is it possible to save RAM's value to the file when a value is
> > written to RAM which is initialized memory_region_init_ram_from_file()?=
 =20
>=20
> 2 years ago I was using -mem-path /dev/shm/ (and maybe -mem-prealloc) to
> keep the ram sync on a file, pause the VM and analyse the memory, but it
> stopped working after the global memdev refactor. I don't think my use

-mem-path should still work as it's aliased to default memdev,
(see: create_default_memdev), that's assumes legacy CLI and that
board uses MachineState::ram as RAM.
(it certainly worked on mainstream boards, if you share your CLI
I can look if it's expected or a bug).=20

For new CLI:
it's recommended to use '-machine memory-backend=3D' which points to previo=
usly
specified file backend, ex:

  -object memory-backend-file,id=3Dmyram,share=3Dyes,size=3D1G,mem-path=3D/=
ram-image-file \
  -machine memory-backend=3Dmyram

Above will create memory region and assign it to MachineState::ram,
so one should use that instead of manually calling memory_region_init_ram_f=
rom_file().


> case was the expected one. Maybe I simply need to adapt to a new command
> line format :)
>=20
> Now I use 'pmemsave' from the monitor:
>=20
> pmemsave addr size file -- save to disk physical memory dump starting at
> 'addr' of size 'size'
>=20
> If attached from GDB:
>=20
> (gdb) monitor pmemsave 0x20000000 0x1000000 /tmp/ram.dump
>=20
> There are other commands and probably a clever way to do that.
>=20
> See also the VM snapshot feature, described here, which might be
> what you are looking for:
> https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu=
-savevm-snapshots/
>=20
> Regards,
>=20
> Phil.
>=20


