Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451CD664274
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 14:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEFL-0007by-MF; Tue, 10 Jan 2023 08:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFEEp-0007Mt-0q; Tue, 10 Jan 2023 08:00:25 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFEEm-00051X-Ty; Tue, 10 Jan 2023 08:00:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2161275EC9;
 Tue, 10 Jan 2023 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673355618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0wRSUH2PSXvUbTygbwSnIuvFX97Te0qGmgqjD9pbYVE=;
 b=fRXdpu1TpFKZ7wpWhch2c9BMY5cuZr5N8/M6WI5N9IqUhbuBUKuKyboJiHe2fnun9xc9SS
 R4NndP/7kJ2qDeZ4gzSX4LQYUvvtcge25STszTyYMrBjlCMgcWavAw3Iv6HWkv+yAmhFoX
 /HIKT/TLvqYZHhEh/a/slNevWtND5XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673355618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0wRSUH2PSXvUbTygbwSnIuvFX97Te0qGmgqjD9pbYVE=;
 b=5dKz0RbPhCApt7m6iOwcUNtIXX761hfxEqxqdXBIAM7VV3uvKA0O/+NHjr/ZU2kjJvJKyA
 /KlGEbKh5XGfCIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A376713338;
 Tue, 10 Jan 2023 13:00:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ay5tG2FhvWM6LQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 10 Jan 2023 13:00:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com>
Date: Tue, 10 Jan 2023 10:00:15 -0300
Message-ID: <87zgaqa6jk.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Huth <thuth@redhat.com> writes:

> On 09/01/2023 23.42, Fabiano Rosas wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>> 
>> on ARM we currently list and build all machines, even when
>> building KVM-only, without TCG.
>> 
>> Until we fix this (and we only list and build machines that are
>> compatible with KVM), only test specifically using the "virt"
>> machine in this case.
>
> Why don't you fix it immediately? ... 

My idea was to have in this series the minimum to unbreak the
--disable-tcg build and later bring the rest of the changes
incrementally.

(plus the cpregs code movement which conflicts with everything, so I'd
rather merge it sooner)

> it shouldn't be too hard to add some 
> "depends on TCG" statements to the machine entries in hw/arm/Kconfig, should it?

I havent't looked into it yet. If it turns out to be simple I can do it
now.

> Anyway, if that's not possible (yet), I suggest to add your hack to 
> qtest_cb_for_every_machine() instead, so you could change this in one 
> central place instead of adding a hack to each and every test that uses this 
> function.

Good idea.

>
>   Thomas

