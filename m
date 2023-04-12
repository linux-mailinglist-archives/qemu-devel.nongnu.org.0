Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152B6DF6E2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:21:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaO0-0001Mm-Jv; Wed, 12 Apr 2023 09:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pmaNy-0001MP-It
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:19:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pmaNw-0000PI-1C
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:19:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96821218FA;
 Wed, 12 Apr 2023 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681305577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnQgldug7U+NIeAhYftaDVy/YRzrSi0DIbP1KUpKmbw=;
 b=AKnMWaq1qCMQA1L1wez2jgyW8rQSLoHi/KNVsAUC1GC9EQcJwLUh86WjwPMLxoYYTDS6eO
 IJwY7kMeRUiNsHVwPkFPYBv2TUm6/X5wRN8x3Qm52/2FjcLCh0QQ8WROAqBQsjcnZoYQ4S
 l6PV/6JRHVzJ5Pt+59KiF1bFhVSveUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681305577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnQgldug7U+NIeAhYftaDVy/YRzrSi0DIbP1KUpKmbw=;
 b=i4w3/kGmJytP7NS46yu7iHK4IZRrRljaV/DXUJFf4JyH0u4i4CyvXrD5aAAxRs1qxj8FU1
 QuSXRK+kKUIhN3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E86F13498;
 Wed, 12 Apr 2023 13:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PSm5NeivNmTLcgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 13:19:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, vikram.garhwal@amd.com,
 stefano.stabellini@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [QEMU][PATCH v6 10/10] meson.build: enable xenpv machine build
 for ARM
In-Reply-To: <20230411224746.16152-11-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
 <20230411224746.16152-11-vikram.garhwal@amd.com>
Date: Wed, 12 Apr 2023 10:19:34 -0300
Message-ID: <87fs95ck61.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add CONFIG_XEN for aarch64 device to support build for ARM targets.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 52c3995c9d..eb5bb305ae 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -135,7 +135,7 @@ endif
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i386 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets +=3D {
> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu',
> 'aarch64-softmmu'],

I'm not familiar with Xen, so pardon my ignorance, but would it (ever)
make sense to do a 1:1 map of host architecture and qemu target? So we
don't have to deal with having a build on x86 pulling aarch64-softmmu
and vice-versa.

Do we expect both x86_64-softmmu and aarch64-softmmu binaries to be used
in the same host?



