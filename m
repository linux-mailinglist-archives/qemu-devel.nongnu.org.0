Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936142FEF82
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:55:05 +0100 (CET)
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cIa-0006kA-5Z
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex@alxu.ca>) id 1l2cFx-0005Qs-QB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:52:21 -0500
Received: from pink.alxu.ca ([2605:6400:10:4b0::1]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex@alxu.ca>) id 1l2cFu-0000vI-3z
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:52:20 -0500
Received: from localhost (unknown [IPv6:2605:6400:8181:1::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (Client did not present a certificate)
 by pink.alxu.ca (Postfix) with ESMTPS id E8B66289309;
 Thu, 21 Jan 2021 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alxu.ca; s=default;
 t=1611244334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwusA5u2Bv03DQWiw/c6bTo7Qi3VBtEU4lc3gAbI9eY=;
 b=oekxjd5dpyKb11J/oyvxyzhVOVLncAKUT52ZZnyiUnl82AxZWrr/L3pDQkAF2Z+9cZMNku
 jYdMCEwqAmvL2/EqzT02kA8PxSik9QYV58fB9pDI0169e0H5JPSgUJgE/LVsVP3y6RMKFY
 G+MXerc/RHRUke+y8pdacfnVgNKZ4ihdk60RoPZsEKoIccTnEhhOZQesdcYwlWFg8ZsvJU
 F+L3dkQSrzqr307ahO/YzZE/njwCaNPGaBMiH4VFthi17RL6Ya4w5SeZUu5Bgnho3/4SGI
 InZ+lreIfLpEPMLraYLYxLcn48x4pnZIWnpM/9i6nRMLhMP/SUk7xLDEgoYihg==
Date: Thu, 21 Jan 2021 10:52:10 -0500
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20210121144429.58885-1-stefanha@redhat.com>
 <f5fc73e5-334e-c1ef-3982-227715efc26b@redhat.com>
In-Reply-To: <f5fc73e5-334e-c1ef-3982-227715efc26b@redhat.com>
MIME-Version: 1.0
Message-Id: <1611243688.4854bsewsj.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2605:6400:10:4b0::1; envelope-from=alex@alxu.ca;
 helo=pink.alxu.ca
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: mszeredi@redhat.com, slp@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, P J P <ppandit@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alex Xu <alex@alxu.ca>
From: alex--- via <qemu-devel@nongnu.org>

Excerpts from Laszlo Ersek's message of January 21, 2021 10:32 am:
> Assuming a benign / trusted guest, is there going to be an override for
> this?
>=20
> Asked differently -- if we don't want to set up a separate block device
> on the host, to contain the filesystem that is mounted as the shared
> directory, can unionfs (?) / overlayfs be used to re-mount an existent
> host-side directory as the shared directory, but with
> "noexec,nosuid,nodev" *bolted-on*?
>=20
> If people have to create separate block devices (on the host side) for
> innocent use cases such as running tests in a trusted guest, that's not
> going to qualify as "usability progress" relative to having a qcow2 (or
> raw) image file.
>=20
> "nodev,nosuid" is kind of a no-brainer for any host-side *data* volume
> anyway (such as the one underlying "/home", even), so I don't see those
> options as a challenge. But "noexec" is different.
>=20
> Thanks,
> Laszlo

On Linux, there are two types of mount options: per-superblock, and=20
per-point. Most filesystem-specific options are per-superblock, and=20
apply to all mounts of that device. noexec, nosuid, and nodev are=20
per-mount options, and apply individually to each mount, bind or=20
otherwise, of a given device. Bind mounts copy the parent per-mount=20
options, but can be individually altered. Note also that it is not=20
required to create a new location for a bind mount.

For example, invoking:

mount --bind -o noexec,nosuid,nodev /var/lib/vms/source1 /var/lib/vms/sourc=
e1

would effectively secure a source directory. This can also be inserted=20
in /etc/fstab, such as:

/var/lib/vms/source1 /var/lib/vms/source1 none bind,noexec,nosuid,nodev 0 0

Note that, as explained in Stefan's initial email, this hides any=20
submounts below source. Each of those must be individually protected,=20
either by initially mounting with the security options or by creating a=20
new bind mount as above. Although these cases should be infrequent, they=20
are common enough that Stefan and I think that they should be supported,=20
or at the very least not silently behave in unexpected or insecure ways.

Additionally, while it's possible to use overlayfs for this purpose,=20
it's overkill, and as far as I understand, doesn't solve the problem of=20
hiding sub-mounts.

Regards,
Alex.

