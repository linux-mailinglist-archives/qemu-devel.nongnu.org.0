Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECA671C82
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7pl-0000WX-Tc; Wed, 18 Jan 2023 07:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pI7pi-0000V9-9a; Wed, 18 Jan 2023 07:46:26 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pI7pg-0007Yt-Mf; Wed, 18 Jan 2023 07:46:26 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2B483F6B3;
 Wed, 18 Jan 2023 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674045982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CzzW5KC7SS4dxc5epZcneRLL0zjUBBAQSWbpXhTvOxo=;
 b=cR8Bf1I8+gF6myx0UIl0ShbgnVFi/zFalEBUXdf1NOBwrdKwcel0Jzam2N3rKYeBKvfkKF
 /6+RDh+ADjHbSgLhL2iuAXgDH776B2/q32a5iBI0Z14SZuyH+3KOv2etJvusaYY10Sh7OB
 XPUYYkKf6ZRRhwsPR9GIYFV6w8vqVTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674045982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CzzW5KC7SS4dxc5epZcneRLL0zjUBBAQSWbpXhTvOxo=;
 b=Up3iUQcFe7cy5XXLrjUrrMn5rYlLSN6iIJT6K7cJD2hJaKyrrECnARpDwdpXNxZ8bKklRt
 CZlDOMmh6qruxPBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 509A7138FE;
 Wed, 18 Jan 2023 12:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dP7MBh7qx2OAJwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 12:46:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
In-Reply-To: <d1edb6d0-2bb9-4923-ea0f-378b6f944fed@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <d1edb6d0-2bb9-4923-ea0f-378b6f944fed@linaro.org>
Date: Wed, 18 Jan 2023 09:46:19 -0300
Message-ID: <87h6woc8o4.fsf@suse.de>
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/13/23 06:04, Fabiano Rosas wrote:
>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>> code that is needed for cpus that also work with KVM into cpu.c.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>>   2 files changed, 76 insertions(+), 77 deletions(-)
>
> Actually, not true.  This is tcg-only.  As is the bulk of aarch64_max_initfn from which 
> this is called -- note the first 4 lines of that function:
>
>      if (kvm_enabled() || hvf_enabled()) {
>          /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
>          aarch64_host_initfn(obj);
>          return;
>      }
>
> Thus the rest of the function is only reachable for tcg.

Sigh... It seems it's not that simple:

We can currently have a QEMU invocation with "-accel qtest -cpu max" and
no other accelerator. Currently, it falls into this implicit else
branch. So this is actually "else if (tcg_enabled() || qtest_enabled())".

If I move the "TCG-only" code under CONFIG_TCG, the qtests that use -cpu
max will break.

So I have chosen to move the code which depends on aa32_max_features as
you suggest into tcg/ but kept the cortex-a57 as a baseline for
qtest. This has the effect of causing "-cpu max" for the tests to be a
slightly different CPU depending on whether TCG is built in (which
perhaps is ok because if the tests depended on cpu features they should
specify an accel?).

