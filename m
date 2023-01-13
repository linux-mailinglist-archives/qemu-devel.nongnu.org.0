Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE62669EF1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMp3-0006sK-W9; Fri, 13 Jan 2023 11:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGMoz-0006rg-81; Fri, 13 Jan 2023 11:22:25 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGMox-0005pB-6n; Fri, 13 Jan 2023 11:22:24 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A06A26BBA3;
 Fri, 13 Jan 2023 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673626939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mKs/ggpulP1sYOtSS5Rw57ie3DsUzarayKgqr5ie3Tc=;
 b=UR1U90OJmocxTEYD7nrMARQ/CDib9KcPrabedlM592AEPclaAxIUNy6zOnS1b4Wa8dK1gj
 s9TjqxSG3xQuraHzYlHsbCU05aZpZt/FWWTezVSZaglvVgaUULDQBdzsmnz/1AMAwLJh19
 nEAoAXmy0r1YYiVGcOBQdC9rA/U8I3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673626939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mKs/ggpulP1sYOtSS5Rw57ie3DsUzarayKgqr5ie3Tc=;
 b=3hEfh+aPOrgHtB8GUxooNsQPfubODaXBJo87L9ePiQer/8V4oZnVy4P+l22tT3fNM7yTzz
 cReJ2zi59+9dArDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D9611358A;
 Fri, 13 Jan 2023 16:22:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XHDyOTqFwWN0UwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 16:22:18 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
In-Reply-To: <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de>
Date: Fri, 13 Jan 2023 13:22:16 -0300
Message-ID: <875ydaievb.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Claudio Fontana <cfontana@suse.de> writes:

> On 1/13/23 15:04, Fabiano Rosas wrote:
>> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>> cortex-a57 as default cpu for KVM.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>
> Our recommendation currently for KVM on ARM is to always use CPU="host", as named cpu models generally don't work (yet?) with KVM.
>
> https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html
>
> Should then "host" be the default for KVM if CONFIG_TCG=N or CONFIG_TCG=M and the TCG .so is not loaded?

Yes, "host" seems to make more sense. I was under the impression that
there was a way to use cortex-a57 and cortex-a53 since they have
cpu->kvm_target set.


