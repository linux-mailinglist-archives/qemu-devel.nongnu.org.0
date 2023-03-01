Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879B6A6C4E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLWo-0004y6-Ly; Wed, 01 Mar 2023 07:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pXLWm-0004x7-9I; Wed, 01 Mar 2023 07:25:48 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pXLWk-0007hd-LM; Wed, 01 Mar 2023 07:25:48 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7217D21A85;
 Wed,  1 Mar 2023 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677673544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05sZX5wgopLhI3s9SVqG68OzYkoj/pSPtQam+WCWZcM=;
 b=VuHcHC0kbrr1bCGnDXyfK+/EkDyDzMks8ikttqIKAlMBkeQg+z4UoZIQiedfBbF06JujdI
 ErYXAXBBjxlMLx7g0dwFaYRVtQiJ+qEFPEVdbJ5QuNsemxlifvxoJ9acH18JLc+0Ffm2fq
 dh49qyXvtq83HYsU+9DnStAD7GlECCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677673544;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05sZX5wgopLhI3s9SVqG68OzYkoj/pSPtQam+WCWZcM=;
 b=hHrpp290+4rcnbudHQmOEidN6GCVPgkSJX6gbAJY7h0Ir7k8GdxNDouFX3iPXX7P9tjVTw
 BFeFNkie1IhmGUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0072E13A63;
 Wed,  1 Mar 2023 12:25:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5W4UL0dE/2PHbgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 12:25:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <87a60wk6st.fsf@secure.mitica>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de> <87a60wk6st.fsf@secure.mitica>
Date: Wed, 01 Mar 2023 09:25:41 -0300
Message-ID: <87zg8wk69m.fsf@suse.de>
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

Juan Quintela <quintela@redhat.com> writes:

> Fabiano Rosas <farosas@suse.de> wrote:
>> It is possible to have a build with both TCG and KVM disabled due to
>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>> host.
>
> Ouch.
>
> Just curious: why are they needed?
>

From https://wiki.xenproject.org/wiki/QEMU_Upstream:

  Why is qemu-system-i386 used even on x86_64 and even non-x86?
  
  QEMU in a Xen system only provides device model (DM) emulation and not
  any CPU instruction emulation, so the nominal arch doesn't actually
  matter and Xen builds i386 everywhere as a basically arbitrary choice.
  
  It happens that the Xen DM part of QEMU is quite closely tied to the x86
  scaffolding for various historical reasons, so we end up using
  qemu-system-i386 even e.g. on ARM!  There is no practical difference
  between qemu-system-i386 and qemu-system-x86_64, they should be
  interchangeable. However only qemu-system-i386 is regularly tested by
  Xen Project (via osstest).

>>
>> If we build with --disable-tcg on the aarch64 host, we will end-up
>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>
>> Fix tests that crash or hang in the above scenario. Do not include any
>> test cases if TCG and KVM are missing.
>>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> This currently affects Arm, but will also affect x86 after the xenpvh
>> series gets merged. This patch fixes both scenarios.
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks!

