Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B4E6B4056
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paciy-0006AY-Cb; Fri, 10 Mar 2023 08:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pacii-00067s-DX; Fri, 10 Mar 2023 08:23:40 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pacig-0007cZ-QQ; Fri, 10 Mar 2023 08:23:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B02222ABD;
 Fri, 10 Mar 2023 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678454616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QMlg4L/jhkDbg3C/URkS1zZ4NTHj++tS2mG97UZEmE=;
 b=ROhGunnE+Z00HB5t8hrExDrH3whWmJavPJqDVEFbCRQHGzLE9RBvuEffX2plTowLeexLlZ
 z1cM//E+Zpv0kHp4o3/e51YMKaGM9wuJrwmFKhnKSO7Nso67Okb9QKwtgG8Ztwl56AEFes
 uZO2zPafNW/9tnMKwn5uzTGw7Zk2uI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678454616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QMlg4L/jhkDbg3C/URkS1zZ4NTHj++tS2mG97UZEmE=;
 b=bM+AIP4gIBPu0qBSI4Hs+cpxB1PQaXo8rlrXEf5cLPBfG5FiUKkBFHx+zc/4UCcq1Okj0i
 zXs/HI2GXExW6EAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D285134F7;
 Fri, 10 Mar 2023 13:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E2SwNVcvC2QfPgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 13:23:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <20230310050853-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050853-mutt-send-email-mst@kernel.org>
Date: Fri, 10 Mar 2023 10:23:33 -0300
Message-ID: <87edpweo4q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>> It is possible to have a build with both TCG and KVM disabled due to
>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>> host.
>> 
>> If we build with --disable-tcg on the aarch64 host, we will end-up
>> with a QEMU binary (x86) that does not support TCG nor KVM.
>> 
>> Fix tests that crash or hang in the above scenario. Do not include any
>> test cases if TCG and KVM are missing.
>> 
>> Make sure that calls to qtest_has_accel are placed after g_test_init
>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>> printed before other messages") to avoid TAP parsing errors.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> I don't like it that it's a pass not a skip.
>

Noted. I'm always questioning myself whether to skip or pass.

> Also, if we are not testing acpi should we not
> skip building acpi?
>

Good point. I'll try to do that for the next version.

> Also, a misconfigured qemu would previously be caught,
> now it will seem to pass tests.

Well, we can only call it misconfigured if we have a specific setup in
mind. In the general sense there is never a misconfigured qemu unless
there's a bug in the configuration path (configure, Kconfig, meson,
etc). Then these tests would have nothing to do with it.

So in this particular case, the "bug" perhaps is that we're still trying
to build and run the tests even when the accelerator(s) they require are
not present. I think your suggestion above of not building the test
covers that.

> How about a special make check target that will just test
> xen things?
>

Probably overkill for this particular issue. I don't see any
Xen-specific tests yet. It would run almost the same set of tests.


