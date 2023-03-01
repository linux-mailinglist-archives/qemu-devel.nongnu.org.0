Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC66A6D16
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMb4-00043Z-7X; Wed, 01 Mar 2023 08:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pXMb0-000421-JU; Wed, 01 Mar 2023 08:34:14 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pXMay-0005Mt-Tn; Wed, 01 Mar 2023 08:34:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CB3921A92;
 Wed,  1 Mar 2023 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677677651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQToDHtmwapBTDABhT2cShca3Pt9qH7zdZGlVftR1AI=;
 b=fmru5pdbF0jewraO6ffVW0AIaPBBZp3aqYbiSTMu4DpSBJvJW6NFMzgCpK6I5EcveyVw4C
 R5l2TYmMTisCdgsFEhsbyPRM3YWaxF3EsrfGGYcvgwBj2w/GW1RgVYBKb0GB47Nx7nCkCK
 C1Yn6ZxOiDIemzi0DYGRN1NjWIIqDLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677677651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQToDHtmwapBTDABhT2cShca3Pt9qH7zdZGlVftR1AI=;
 b=o+W5hIZMedZas0s+S6NnxbN3hqptpVo2M4mY+i8CtH+f20vs47Rp17CJy3X+WZicnlBI8Q
 yCCwr9FL1v5bmABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A021813A3E;
 Wed,  1 Mar 2023 13:34:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 44Z+GlJU/2NKGAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 13:34:10 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio  Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas
 Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan  Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <87bklcd3x1.fsf@linaro.org>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de> <87a60wk6st.fsf@secure.mitica>
 <87zg8wk69m.fsf@suse.de> <87bklcd3x1.fsf@linaro.org>
Date: Wed, 01 Mar 2023 10:34:08 -0300
Message-ID: <87sfeok33j.fsf@suse.de>
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Fabiano Rosas <farosas@suse.de> writes:
>
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> Fabiano Rosas <farosas@suse.de> wrote:
>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>> host.
>>>
>>> Ouch.
>>>
>>> Just curious: why are they needed?
>>>
>>
>> From https://wiki.xenproject.org/wiki/QEMU_Upstream:
>>
>>   Why is qemu-system-i386 used even on x86_64 and even non-x86?
>>=20=20=20
>>   QEMU in a Xen system only provides device model (DM) emulation and not
>>   any CPU instruction emulation, so the nominal arch doesn't actually
>>   matter and Xen builds i386 everywhere as a basically arbitrary choice.
>>=20=20=20
>>   It happens that the Xen DM part of QEMU is quite closely tied to the x=
86
>>   scaffolding for various historical reasons, so we end up using
>>   qemu-system-i386 even e.g. on ARM!  There is no practical difference
>>   between qemu-system-i386 and qemu-system-x86_64, they should be
>>   interchangeable. However only qemu-system-i386 is regularly tested by
>>   Xen Project (via osstest).
>
> That said with the xenpvh model that was added recently we should be
> able to finally build a Xen only qemu-system-aarch64 which while
> functionally the same will be less head scratching for users.
>

It would be nice if we could eventually restrict the x86 build to the
x86 host and the aarch64 build to the aarch64 host like we do for the
other HW accels.

