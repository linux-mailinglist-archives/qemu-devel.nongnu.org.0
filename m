Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE05671B99
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:11:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7Gn-0001HH-Pc; Wed, 18 Jan 2023 07:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pI7Gl-0001Gf-Dx; Wed, 18 Jan 2023 07:10:19 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pI7Gj-0008RQ-Q3; Wed, 18 Jan 2023 07:10:19 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D26E55BD1F;
 Wed, 18 Jan 2023 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674043815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iezqUoQZ0T8WdkdK3O1eID2PN+qDN3tTwL6s1/Uwj00=;
 b=WFuq2a8ckItURTp1RJ+8V9QuTW9c3MQlgwBe9pRkdrh3k8IY6CDAmtHSfpteJaO+teX5k2
 0rLl57rhr1loZp+UAUngMFHG/mM+hS6/c2D2qULwEsnhnWWEaCryTMk+3DanDSFAMEzMgP
 5e5eUotAGi8SmDw3xt9MsxU96vPNP14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674043815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iezqUoQZ0T8WdkdK3O1eID2PN+qDN3tTwL6s1/Uwj00=;
 b=zIrWOUvroalQ+Y0JmOZN8ieRLEBGdsJ5wUuhyCq2jTlIVjMnDU3ASoM8M7chk2UTIl5oxU
 6BTvWydaerEbOnBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5CC9A138FE;
 Wed, 18 Jan 2023 12:10:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u0RJCafhx2OWEwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 12:10:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
In-Reply-To: <c803c8a5-5788-2935-c1d8-3b62cc9a64d9@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org> <87bkmx0yux.fsf@suse.de>
 <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
 <c803c8a5-5788-2935-c1d8-3b62cc9a64d9@suse.de>
Date: Wed, 18 Jan 2023 09:10:12 -0300
Message-ID: <87edrs6o2j.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

Claudio Fontana <cfontana@suse.de> writes:

> On 1/18/23 11:45, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 17/1/23 20:01, Fabiano Rosas wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>>
>>>> On 13/1/23 15:04, Fabiano Rosas wrote:
>>>>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>>>>> code that is needed for cpus that also work with KVM into cpu.c.
>>>>>
>>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>>> ---
>>>>>    target/arm/cpu.c     | 76 ++++++++++++++++++++++++++++++++++++++++=
+++
>>>>>    target/arm/cpu_tcg.c | 77 ----------------------------------------=
----
>>>>>    2 files changed, 76 insertions(+), 77 deletions(-)
>>>>>
>>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>> [...]
>>>>
>>>> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.
>>>
>>> Hm.. QEMU doesn't start without it. There might be some implicit
>>> dependency. I'll check.
>>=20
>> Likely some M-profile code (note this type is a QOM *interface*).
>>=20
>> I checked the uses (git-grep -W IDAU_INTERFACE) and none should be
>> reachable in a non-TCG build.
>
> crossing fingers, I remember getting in trouble there, but maybe that is =
now solved by the KConfig thing..
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02958.html
>
> My understanding is probably obsolete now, if so sorry for the noise.

I guess this is what I was remembering. But after the Kconfig and qtest
changes everything looks good.

