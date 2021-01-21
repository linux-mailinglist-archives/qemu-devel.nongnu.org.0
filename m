Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23ED2FEE53
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:20:34 +0100 (CET)
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2blB-00064s-LH
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex@alxu.ca>) id 1l2bI3-0004Ye-KY
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:50:27 -0500
Received: from pink.alxu.ca ([2605:6400:10:4b0::1]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex@alxu.ca>) id 1l2bHy-0006US-Uk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:50:27 -0500
Received: from localhost (unknown [IPv6:2605:6400:8181:1::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (Client did not present a certificate)
 by pink.alxu.ca (Postfix) with ESMTPS id BE51328931C;
 Thu, 21 Jan 2021 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alxu.ca; s=default;
 t=1611240617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXvN/2ywSjw/5QngZ1tZzibD8n/j9vdFtF06JkcFtWg=;
 b=WaMwm5GST1tEjJMlVvF4ZFn/mYph472/n0YuHRGpGd7q6SvV5wswfuAHcJ0xuSA5NPoN6G
 43FxgszeydOekOqJRuq1LmukpobnDMDBVqncIhhlX6n+mGENJ+02eUV61Ipn22biLD93HC
 8hILk1fG/6WhZtx0xVv8T/B4f8PdCrGDsQz362NE9MSpgfpNX0uv8Bex9omAAXnzsW4Fj2
 X983JP71Vds4h9UPHe6YoVrRZoyKp+JDbtBmnsAnFM9cJDrU5FrBIJlHGeL33805wSwby7
 ZWH4x3pyO2sOCjG+57vwq3V1zBJx5nJn8rVyskk+yZCwQ2S1HrcfUnbOC+ktog==
Date: Thu, 21 Jan 2021 09:50:15 -0500
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210121144429.58885-1-stefanha@redhat.com>
In-Reply-To: <20210121144429.58885-1-stefanha@redhat.com>
MIME-Version: 1.0
Message-Id: <1611240546.prykd5to6n.none@localhost>
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
X-Mailman-Approved-At: Thu, 21 Jan 2021 10:16:13 -0500
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
 virtio-fs@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alex Xu <alex@alxu.ca>
From: alex--- via <qemu-devel@nongnu.org>

Excerpts from Stefan Hajnoczi's message of January 21, 2021 9:44 am:
> A well-behaved FUSE client does not attempt to open special files with
> FUSE_OPEN because they are handled on the client side (e.g. device nodes
> are handled by client-side device drivers).
>=20
> The check to prevent virtiofsd from opening special files is missing in
> a few cases, most notably FUSE_OPEN. A malicious client can cause
> virtiofsd to open a device node, potentially allowing the guest to
> escape. This can be exploited by a modified guest device driver. It is
> not exploitable from guest userspace since the guest kernel will handle
> special files inside the guest instead of sending FUSE requests.
>=20
> This patch adds the missing checks to virtiofsd. This is a short-term
> solution because it does not prevent a compromised virtiofsd process
> from opening device nodes on the host.
>=20
> Reported-by: Alex Xu <alex@alxu.ca>
> Fixes: CVE-2020-35517
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This issue was diagnosed on public IRC and is therefore already known
> and not embargoed.
>=20
> A stronger fix, and the long-term solution, is for users to mount the
> shared directory and any sub-mounts with nodev, as well as nosuid and
> noexec. Unfortunately virtiofsd cannot do this automatically because
> bind mounts added by the user after virtiofsd has launched would not be
> detected. I suggest the following:
>=20
> 1. Modify libvirt and Kata Containers to explicitly set these mount
>    options.
> 2. Then modify virtiofsd to check that the shared directory has the
>    necessary options at startup. Refuse to start if the options are
>    missing so that the user is aware of the security requirements.
>=20
> As a bonus this also increases the likelihood that other host processes
> besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> malicious guest cannot drop these files in place and then arrange for a
> host process to come across them.
>=20
> Additionally, user namespaces have been discussed. They seem like a
> worthwhile addition as an unprivileged or privilege-separated mode
> although there are limitations with respect to security xattrs and the
> actual uid/gid stored on the host file system not corresponding to the
> guest uid/gid.

I haven't looked too closely at the code, but the commit message seems=20
reasonable to me.

Thanks,
Alex.

