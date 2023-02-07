Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C168DD25
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQ0e-00018j-7h; Tue, 07 Feb 2023 10:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPQ0c-00018Y-G6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:35:50 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPQ0a-0004ya-R6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:35:50 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6AF0638DFC;
 Tue,  7 Feb 2023 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675784147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=grXPb38SY1J/ClX8QajUKwmWwbQXZocT/qkraYNEHTo=;
 b=HfQYFjXzyJOjWMpoDw1YR6S8qUmuEvDmWUiFc6Vctkq+WHhxNpdDtGkdF96JpgbJ4FPCf/
 GsOS2425lJJJgYplT8qLoMnBBZ7P9NIDu7iuLVt4vZ3DIM1wNyDLRgGWKQUKgxg41UUCN8
 KbcdP7I7vqjm2K5x64H19LsRUnsQe3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675784147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=grXPb38SY1J/ClX8QajUKwmWwbQXZocT/qkraYNEHTo=;
 b=bTyeOhoQz+1cAMQyPzuH0wZPRuygtfJfewxIgw4xL6u7w+lC5jkUuDODKhgltsUC9iRJXJ
 wVKWc9lIINBVHKDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED7E513467;
 Tue,  7 Feb 2023 15:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJQYLdJv4mNwLQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 15:35:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/12] [NOT FOR MERGE] tests/qtest: Introduce
 qtest_validate_args
In-Reply-To: <8a4b8438-98a4-71fa-cf73-005139b97b95@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-13-farosas@suse.de>
 <8a4b8438-98a4-71fa-cf73-005139b97b95@redhat.com>
Date: Tue, 07 Feb 2023 12:35:44 -0300
Message-ID: <87v8kdmqsv.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Huth <thuth@redhat.com> writes:

> On 06/02/2023 16.04, Fabiano Rosas wrote:
>> The QEMU binary can be built with a varied set of features/devices
>> which are opaque to the tests. Add a centralized point for parsing and
>> validating the command line.
>> 
>> Tests can now be skipped with the following pattern:
>> 
>> qts = qtest_init(args);
>> if (!qts) {
>>      return;
>> }
>> 
>> For now, the only validation is that the -device options all
>> correspond to devices that are actually present in the build.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> Would this be better than checking for missing devices in individual
>> tests?
>
> This is certainly an interesting idea! ... some things still bug me, though:
>
> - We still need to change all the calling sites (to check for
>    !qts) ... so the effort seems to be in a similar ballpark as
>    adding qtest_has_device() to the various problematic tests

Just notice that this series does not cover _all_ -device uses, only the
ones that refer to devices disabled by --without-default-devices. So we
might need to come back to this when some CONFIG changes, new devices
are added, new tests, etc.

> - This will now call qtest_has_device for each and every device
>    in the parameter list, even if it is not necessary. And at
>    least the first call to qtest_has_device() is rather expensive
>    since it has to fire up a separate QEMU to retrieve the list
>    of supported the devices. So adding this to all tests might
>    cause a slow-down to the tests...

Yes, that was my main concern. We could have something like this patch
but as a helper that tests can call. Initially, I had thought of:

if (qtest_validate_args(args)) {
   qts = qtest_init(args);
}

> - It could maybe even hide bugs if you don't look closely, e.g.
>    if you have a typo in the device name in a test, the test then
>    gets skipped automatically instead of failing ... ok, that's
>    unlikely for new tests where you look closely, but still, it
>    gives me slightly bad feeling.

I agree. In fact I have been looking into making the same change (as
this patch) in the avocado tests, which of course all fail
without-default-devices. There it's considerably simpler (because
Python), but I'm still thinking about how to avoid hiding a legitimate
failure.

> So I think I rather tend to go for explicit calls to qtest_has_device() as 
> you did in your first 11 patches.

Ok, I'll send just them for v2, unless anyone else has something to say.

