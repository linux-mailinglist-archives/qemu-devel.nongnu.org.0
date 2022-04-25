Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC42F50DE78
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 13:08:43 +0200 (CEST)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwaA-0000Xy-TP
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 07:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1niwYR-0007mq-JH; Mon, 25 Apr 2022 07:06:55 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1niwYQ-0003Lt-1p; Mon, 25 Apr 2022 07:06:55 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CCAB11F746;
 Mon, 25 Apr 2022 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650884810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5WSKxg8zHamguvgpA5DTLtJKtXH/OnlSXHxlzRuRII=;
 b=wXAtwrumTp2p2jHHTKl2JPSRsRlgOcYkFK4QvnFrR8A7li8o98gAgVYM3SGRl3s3g24nlO
 NYkKd9OzmAq8U6LSjjTCe/tLsqW4y9azdBTSol2SZnOj7P5hhbK36d0glPsEZNb3zsuD+n
 fu77olkkfih3a3dR0TOXgp603GTtPHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650884810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5WSKxg8zHamguvgpA5DTLtJKtXH/OnlSXHxlzRuRII=;
 b=Vz9HL888OoHRqTvQY5t6gbgUfZ1ZGuJ6+/lt2cqi10ozgqBltT1ttsTijT96tg61ap/l5a
 UsuooIjqtq6ZrfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5DBD13AED;
 Mon, 25 Apr 2022 11:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o15JJ8qAZmLTRgAAMHmgww
 (envelope-from <dmueller@suse.de>); Mon, 25 Apr 2022 11:06:50 +0000
From: Dirk =?ISO-8859-1?Q?M=FCller?= <dmueller@suse.de>
To: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] Only advertise aio=io_uring if support is actually
 available
Date: Mon, 25 Apr 2022 13:06:29 +0200
Message-ID: <4399482.LvFx2qVVIh@magnolia>
Organization: SUSE Software Solutions Germany GmbH; GF: Ivo Totev;
 HRB 36809 (AG =?UTF-8?B?TsO8cm5iZXJnKQ==?=
In-Reply-To: <Yl/FYrWfjAOeIl94@redhat.com>
References: <20220419171931.26192-1-dmueller@suse.de>
 <Yl/FYrWfjAOeIl94@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=195.135.220.29; envelope-from=dmueller@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eblake@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 20. April 2022 10:33:38 CEST Daniel P. Berrang=E9 wrote:

Hi Daniel,

> If we're going to conditionalize this, then we really ought to be
> address it fully, because 'native' is also platform specific.

Good point. I can do that as well.=20

> IOW, we would end up needing something more like this:
>=20
>            .help =3D "host AIO implementation (threads"
>  #if defined(WIN32) || defined(CONFIG_LINUX_AIO)
>                    ", native"
>  #endif
>  #if defined(CONFIG_LINUX_IO_URING)
>                    ", io_uring"
>  #else
>                    "),"
>=20
> admittedly pretty ugly


the only other option I came up with so far is something like this:

+#if defined(CONFIG_LINUX_AIO)
+#define IF_CONFIG_LINUX_AIO(X) X
+#else
+#define IF_CONFIG_LINUX_AIO(X)
+#endif
+
+#if defined(CONFIG_LINUX_IO_URING)
+#define IF_CONFIG_LINUX_IO_URING(X) X
+#else
+#define IF_CONFIG_LINUX_IO_URING(X)
+#endif
+


and then use it like


=2D            .help =3D "host AIO implementation (threads"
=2D#ifdef CONFIG_LINUX_AIO
=2D            ", native"
=2D#endif
=2D#ifdef CONFIG_LINUX_IO_URING
=2D            ", io_uring"
=2D#endif
=2D            ")",
+            .help =3D "host AIO implementation (threads" IF_CONFIG_LINUX_A=
IO(",=20
native") IF_CONFIG_LINUX_IO_URING(", io_uring") ")",


WDYT, is that worth it?

Thanks,
Dirk




