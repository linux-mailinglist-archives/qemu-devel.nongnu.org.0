Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30196643E9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:01:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEoJ-00056J-Bo; Tue, 10 Jan 2023 08:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFEoG-000556-Q6; Tue, 10 Jan 2023 08:37:00 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFEoE-0005bE-Vs; Tue, 10 Jan 2023 08:37:00 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 03F2676198;
 Tue, 10 Jan 2023 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673357816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FZoGBZyY5QIjarJEBtrX/c/I4Z/CXUzrjP9bsG5GHk=;
 b=SZk7/KsDO9G89/jCCVRArO5jrcBpv5dfuHA3dD0u3FbJbC6p5EoUYUMztW/rm/dhXZgWc7
 Y7hFr+9X6w3ExLd4aEm1lTTMpXIi3B5BZaaRieLRsgWj1/ICPyKSNRG36F+1vIgDmiSytk
 7cIabZm7CrW7gN1hWwJy9RaqWDo7X4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673357816;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FZoGBZyY5QIjarJEBtrX/c/I4Z/CXUzrjP9bsG5GHk=;
 b=xT6pQVAkcKbSsPLhW2MZ/sIc/de5V+2DOiaJP8hdJPm0nfh3WzOxFHvuqGGBGunTIZTobS
 Bwk81jEIbf6ioTDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76F5313338;
 Tue, 10 Jan 2023 13:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8UrnD/dpvWNCQQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 10 Jan 2023 13:36:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
Date: Tue, 10 Jan 2023 10:36:52 -0300
Message-ID: <87sfgia4uj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>> > On 09/01/2023 23.42, Fabiano Rosas wrote:
>> >> From: Claudio Fontana <cfontana@suse.de>
>> >>
>> >> on ARM we currently list and build all machines, even when
>> >> building KVM-only, without TCG.
>> >>
>> >> Until we fix this (and we only list and build machines that are
>> >> compatible with KVM), only test specifically using the "virt"
>> >> machine in this case.
>> >
>> > Why don't you fix it immediately? ...
>>
>> My idea was to have in this series the minimum to unbreak the
>> --disable-tcg build and later bring the rest of the changes
>> incrementally.
>
> This test is basically checking "all the machines should
> work". That's an important invariant to maintain, so
> I don't think we should just skip it for Arm targets.

But what does "all machines" mean in a no-TCG build? The original intent
of the patch was that only 'virt' should be present and therefore the
only one tested.

>
> -- PMM

