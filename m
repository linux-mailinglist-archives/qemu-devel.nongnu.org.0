Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3266744DC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:40:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcdt-0001DU-On; Thu, 19 Jan 2023 16:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIcdr-0001CF-KN; Thu, 19 Jan 2023 16:40:15 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIcdp-0002Gm-Lw; Thu, 19 Jan 2023 16:40:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 92CE42199F;
 Thu, 19 Jan 2023 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674164409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoEh7zPScss2YI3wPFjVqkzK4GVROPBcUOeXIx4Ip6Y=;
 b=Qiu65j7WmiA7K0cDkfdRa7tML03klXjRKnIZorYP18nrTBoWU90rH4wZ5GCmfHXhuY9Pg3
 lM1RH0qspaLowM/G3Yi1b+oyzbwM/wjHi2pI9OnAnXqTlePnG+9NzmJTiE9jHkTkh0XoWd
 WlR6UU3xJeAmgmvmz1dNtcXmppNmd8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674164409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoEh7zPScss2YI3wPFjVqkzK4GVROPBcUOeXIx4Ip6Y=;
 b=vqa/3VBW878i5N4gfaKxrY4L3yCwRBLCeU4G8ucUoTq33q6JzYMbOjosqoiBM4Uw4wozwo
 P9JM4Vf35yANUqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C1E2139ED;
 Thu, 19 Jan 2023 21:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WhBzNbi4yWO9eAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 21:40:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING
 when TCG is present
In-Reply-To: <440155ee-4782-c7fa-6860-c39a983aecae@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-15-farosas@suse.de>
 <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
 <440155ee-4782-c7fa-6860-c39a983aecae@linaro.org>
Date: Thu, 19 Jan 2023 18:40:06 -0300
Message-ID: <87y1py2og9.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 19:50, Richard Henderson wrote:
>> On 1/19/23 03:54, Fabiano Rosas wrote:
>>> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
>>> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
>>> default.mak anymore. So reflect the change in a Kconfig.
>>>
>>> Instead of using semihosting/Kconfig, use a target-specific file, so
>>> that the change doesn't affect other architectures which might
>>> implement semihosting in a way compatible with KVM.
>>>
>>> The selection from ARM_v7M needs to be removed to avoid a cycle during
>>> parsing.
>>>
>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>=20
>>> The linux-user build does not use Kconfig. Is it worth it to add
>>> support to it? There's just the semihosting config so far.
>>=20
>> Probably not.
>
> I hit this limitation last week trying to restrict libdecnumber to
> powerpc targets.
>
> Fabiano, do you see how this can be done easily?

If you grep for Kconfig in the top level meson.build, that code there
could be adapted to also include linux-user targets.

I did some experimenting and I could generate linux-user.mak files with
all the configs from the existing Kconfigs. It would be a matter of
adding the proper CONFIG_SOFTMMU, CONFIG_LINUX_USER options to separate
the two and then hooking up the .mak files with the rest of the
build. That last part I'm not sure how to do.


