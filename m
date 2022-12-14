Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C303A64CD2A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 16:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ToP-0005qY-IX; Wed, 14 Dec 2022 10:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1p5ToG-0005nO-Ob
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:36:41 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1p5ToE-000528-J1
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:36:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A07341FF2D;
 Wed, 14 Dec 2022 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1671032194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJrPUzO6ZTj8bu/yWobgMMwRgJ/XBe5HXAPdMwLCcRs=;
 b=Eq9CrUcFy0KXMfrGvOYrshFpLc3JGQ773mCdOiQNtr2lXndfDIUnD670MXOT8JNTtX/p7g
 NKFWp1BxlcSzmm8l9vcZqGD+h5DPj6DDqW7BUrhOt2fBqnCAjxtYu8xXdr7aSJg2iKRifI
 6JgRqLUFDKO7Wi4yviaXC8BXfvXVbHQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6119A138F6;
 Wed, 14 Dec 2022 15:36:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RftDFoLtmWNWTgAAMHmgww
 (envelope-from <mwilck@suse.com>); Wed, 14 Dec 2022 15:36:34 +0000
Message-ID: <300a721254a21d01e8e408870e7b3db770b0d225.camel@suse.com>
Subject: Re: [PATCH v3] virtio-rng: return available data with O_NONBLOCK
From: Martin Wilck <mwilck@suse.com>
To: Claudio Fontana <cfontana@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org, 
 virtualization@lists.linux-foundation.org
Date: Wed, 14 Dec 2022 16:36:33 +0100
In-Reply-To: <daf7de5f-2a5d-8b1b-4bcb-04991a4afac0@suse.de>
References: <20200811142821.12323-1-mwilck@suse.com>
 <4ae4f348-c186-f7e4-f7e3-b1f1e4a4b408@redhat.com>
 <20200826082613-mutt-send-email-mst@kernel.org>
 <519e0296a7d61d5e9e8d258a855eb42a57c641c5.camel@suse.com>
 <a5d4bcd3-e468-e818-3bd2-3a1b0fa172d8@redhat.com>
 <20200908101413-mutt-send-email-mst@kernel.org>
 <0a5fcbc9bb6eef521c627035687de4654a1dd740.camel@suse.com>
 <20201125043726-mutt-send-email-mst@kernel.org>
 <7417f1fd-d5c0-4906-4663-d85141bc97d7@redhat.com>
 <daf7de5f-2a5d-8b1b-4bcb-04991a4afac0@suse.de>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=mwilck@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Wed, 2022-12-14 at 14:41 +0100, Claudio Fontana wrote:
> On 11/26/20 11:49, Laurent Vivier wrote:
>=20
>=20
> Hi Laurent, Martin,
>=20
> is this resolved now?
>=20
> I wonder if this is covered by Laurent's kernel commit:
>=20
> commit 5c8e933050044d6dd2a000f9a5756ae73cbe7c44
> Author: Laurent Vivier <lvivier@redhat.com>
> Date:=A0=A0 Thu Oct 28 12:11:10 2021 +0200
>=20
> =A0=A0=A0 hwrng: virtio - don't waste entropy
> =A0=A0=A0=20
> =A0=A0=A0 if we don't use all the entropy available in the buffer, keep i=
t
> =A0=A0=A0 and use it later.
> =A0=A0=A0=20
> =A0=A0=A0 Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> =A0=A0=A0 Link:
> https://lore.kernel.org/r/20211028101111.128049-4-lvivier@redhat.com
> =A0=A0=A0 Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>=20
>=20

Hi Claudio,

sorry, I haven't had the time to look into this in more depth.
I don't know what the current situation is.

Martin



