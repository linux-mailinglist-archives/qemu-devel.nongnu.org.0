Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD849674247
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaGX-0000iO-TB; Thu, 19 Jan 2023 14:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIaGV-0000h6-KM; Thu, 19 Jan 2023 14:07:59 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIaGU-0002sr-4H; Thu, 19 Jan 2023 14:07:59 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B1FA21A09;
 Thu, 19 Jan 2023 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674155276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w7I1W5CWg/LENy6VDuyLGzRAH+xMKRQ96FXlbBo05pU=;
 b=T+1pxWUdpyet95C+SyxNVVEq1hiKdyHeCgdvWIMn/lrwdMIQ49DYWoeENxa7vXynJq2Udy
 f72WUM1i484eHq/yajRPIaZBLQvHSxLHbUSQmELd0GW65EyNWhALs5Jeevtt+YcRp49V3j
 sR0uiTt5FiVU3dSxlXniekXpCR+d/GE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674155276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w7I1W5CWg/LENy6VDuyLGzRAH+xMKRQ96FXlbBo05pU=;
 b=dyMEzC3RjDnxl6JaQgnOwAenmF6hmFhylWEuFWMQwxSz4dSQgIk0qnHaorD7QfzFw7fxrd
 aPsI74hHkWTa5KBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7068139ED;
 Thu, 19 Jan 2023 19:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7JSkHwuVyWOiNQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 19:07:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v4 01/15] target/arm: Move 64-bit TCG CPUs into tcg/
In-Reply-To: <6fb8d60e-4283-1429-fd15-f8b799d277cf@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-2-farosas@suse.de>
 <6fb8d60e-4283-1429-fd15-f8b799d277cf@linaro.org>
Date: Thu, 19 Jan 2023 16:07:53 -0300
Message-ID: <87mt6e4a2e.fsf@suse.de>
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/23 03:54, Fabiano Rosas wrote:
>> Move the 64-bit CPUs that are TCG-only:
>> - cortex-a35
>> - cortex-a55
>> - cortex-a72
>> - cortex-a76
>> - a64fx
>> - neoverse-n1
>> 
>> Keep the CPUs that can be used with KVM:
>> - cortex-a57
>> - cortex-a53
>> - max
>> - host
>
> All of those cpus can be used with kvm, if and only if you have matching hardware.  There 
> is no rationale for considering any of them differently.

But is that allowed by QEMU today? If so I must be missing something. I
see that kvm_arch_init_vcpu looks at cpu->kvm_target, which is only set
at kvm_arm_set_cpu_features_from_host, called from aarch64_host_initfn.

    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
        !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
        error_report("KVM is not supported for this guest CPU type");
        return -EINVAL;
    }

