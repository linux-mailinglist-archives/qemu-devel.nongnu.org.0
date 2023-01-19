Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76467453C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIclk-0005pg-J1; Thu, 19 Jan 2023 16:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIcku-0005j9-Go; Thu, 19 Jan 2023 16:47:32 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIcks-0003uH-IT; Thu, 19 Jan 2023 16:47:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CCAC05D356;
 Thu, 19 Jan 2023 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674164847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXfsJQS/vLNCxRKxsuQYc9ooKEWHaLf6F7JzyNJQYUU=;
 b=LHUeRo2K1IRCY+WFx/S90Q0bGkZQW+zvr14hSsRMfXGYPDPeVziSqguSE4K+AHki13IQ4E
 yXAPuDPaRv8XhVYhAJHvwDzonxroGIK3+i+UMj31t82lxQfhvovUBlZC9e5tzAlbCYZMDS
 yhLokNDOesZrkUD74s4aMQAZ4foAbc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674164847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXfsJQS/vLNCxRKxsuQYc9ooKEWHaLf6F7JzyNJQYUU=;
 b=upB2fhqm0Kb6oiK9jNgU/a+irnv7dcD532MsLMMiU/JPD+WMEKZ8I35Nvc4dkDalGgS9xT
 zmf59xN0JgmPg+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B3E4139ED;
 Thu, 19 Jan 2023 21:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FGyNCW+6yWMafAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 21:47:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v4 15/15] arm/Kconfig: Do not build TCG-only boards
 on a KVM-only build
In-Reply-To: <0e4e2776-c44e-343b-1142-e236e38f35cc@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-16-farosas@suse.de>
 <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
 <0e4e2776-c44e-343b-1142-e236e38f35cc@linaro.org>
Date: Thu, 19 Jan 2023 18:47:24 -0300
Message-ID: <87v8l22o43.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 19:50, Richard Henderson wrote:
>> On 1/19/23 03:54, Fabiano Rosas wrote:
>>> Move all the CONFIG_FOO=3Dy from default.mak into "default y if TCG"
>>> statements in Kconfig. That way they won't be selected when
>>> CONFIG_TCG=3Dn.
>>>
>>> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
>>> keep the two default.mak files not empty and keep aarch64-default.mak
>>> including arm-default.mak. That way we don't surprise anyone that's
>>> used to altering these files.
>>>
>>> With this change we can start building with --disable-tcg.
>>>
>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>> ---
>>> sbsa-ref has an explicit check to avoid running with KVM
>>> xlnx-versal-virt has avocado tests tagged with tcg
>>> ---
>>> =C2=A0 configs/devices/aarch64-softmmu/default.mak |=C2=A0 4 --
>>> =C2=A0 configs/devices/arm-softmmu/default.mak=C2=A0=C2=A0=C2=A0=C2=A0 =
| 37 ------------------
>>> =C2=A0 hw/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 42 ++++++++++++++++++=
++-
>>> =C2=A0 3 files changed, 41 insertions(+), 42 deletions(-)
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> The previous version was cleaner IMHO, not restricting only the
> machines but also the cores:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777724.html

I'm not able to apply that thread, there's missing emails in lore. =3D/

What do you suggest here? I like that you added detailed descriptions of
what was being removed and why. But it seems there's a lot left to be
restricted still, compared to this patch.

I also don't really understand what you mean by "also the cores". This
series already moved all cpus under CONFIG_TCG and what's left is only
the machines. If there's extra refinement to the configs, we should
definitely look into doing it, but I think that could come as a
follow-up series.


