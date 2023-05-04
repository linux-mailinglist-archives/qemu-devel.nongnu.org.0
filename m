Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A66F6AD9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:07:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXjK-0002Ck-Sa; Thu, 04 May 2023 08:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puXjI-0002Bv-2X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:06:36 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puXjF-00016S-OK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:06:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4731520A64;
 Thu,  4 May 2023 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683201992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdgA+ZnHz8tqkpgjfp7M8qbWg+dCQixkEug88Ux2kLs=;
 b=HiX3q12Ls0bttSi6ynbqBKruZJ/vgDd+HGB6PTuZiHF5C9FNTCcw6yJfbzvlXxZq4EWSLs
 qiQOps9qjMtnJ90r+vMz/pLFjz9gNh/yoskkDghQry16NtPtxfbAo3yWnwJdOfFWKqKpXT
 OE6amxdK7FKdSeNe7F63M6BDnxz0Wh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683201992;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdgA+ZnHz8tqkpgjfp7M8qbWg+dCQixkEug88Ux2kLs=;
 b=9JDd328qEny17rFgaSkz0+MkpXoMT25TkCHY879Y0+BFWD8SDB6bF0MKs/nRf0aXoIHrVF
 R1iigHy/S/Rn2FBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA775133F7;
 Thu,  4 May 2023 12:06:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FzR5JMefU2SWMQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 04 May 2023 12:06:31 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 2/2] meson: Deserialize the man pages and html builds
In-Reply-To: <CAFEAcA-QU0qs=P8GLPcngt96TiOHQTaRUnuyfadyut=fo5ymwA@mail.gmail.com>
References: <20230503203947.3417-1-farosas@suse.de>
 <20230503203947.3417-3-farosas@suse.de>
 <CAFEAcA-QU0qs=P8GLPcngt96TiOHQTaRUnuyfadyut=fo5ymwA@mail.gmail.com>
Date: Thu, 04 May 2023 09:06:29 -0300
Message-ID: <87fs8ccncq.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 3 May 2023 at 21:39, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> For the documentation builds (man pages & manual), we let Sphinx
>> decide when to rebuild and use a depfile to know when to trigger the
>> make target.
>>
>> We currently use a trick of having the man pages custom_target take as
>> input the html pages custom_target object, which causes both targets
>> to be executed if one of the dependencies has changed. However, having
>> this at the custom_target level means that the two builds are
>> effectively serialized.
>>
>> We can eliminate the dependency between the targets by adding a second
>> depfile for the man pages build, allowing them to be parallelized by
>> ninja while keeping sphinx in charge of deciding when to rebuild.
>>
>> Since they can now run in parallel, separate the Sphinx cache
>> directory of the two builds. We need this not only for data
>> consistency but also because Sphinx writes builder-dependent
>> environment information to the cache directory (see notes under
>> smartquotes_excludes in sphinx docs [1]).
>
> The sphinx-build manpage disagrees about that last part.
> https://www.sphinx-doc.org/en/master/man/sphinx-build.html
> says about -d:
> "with this option you can select a different cache directory
>  (the doctrees can be shared between all builders)"
>

The issue I had is that sphinx by default uses smart quotes for html
builders, but not for man builders. But whichever builder runs first
gets to set the smartquotes option and that sticks for the next
builder. That causes our man pages to come up with fancy curly quotes
instead of ' which is probably not an issue, but I didn't want to
produce different output from what we already have today.

I ended up conflating the cache directory (-d) with the environment
(-E), so it is possible that we can reuse the cache but not the
environment (where I assume the smartquotes option is stored). Well, I
better go read the sphinx code and figure that out.

> If we don't share the cache directory, presumably Sphinx
> now ends up parsing all the input files twice, once per
> builder, rather than being able to share them?
>

Yes, but having it run in parallel from the ninja level is still
faster. Of course, if we could reuse the cache, this could potentially
be even faster. I'll try to determine if it is really safe to do so.

