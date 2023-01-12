Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AEF66795C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:34:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyu3-00055s-NU; Thu, 12 Jan 2023 09:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFyu1-00054f-Fi; Thu, 12 Jan 2023 09:50:01 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFyu0-00055X-0m; Thu, 12 Jan 2023 09:50:01 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EBC003FF9E;
 Thu, 12 Jan 2023 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673534997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=08hrdMBjSFtZWKMqM4pHo6gTKAlmsb+X47EIQYA/pqU=;
 b=q02d9zxmNDcfbo+USVqRzCqYyN0k0nk+3JjPMRGhWjlPFGpKiCun0Nc/EVQ/TBO0hmQ9Sf
 rj4KNb0a70SyqCs/PUzr9Gn/vBxbJ2LnzVUCmSLvm3O1JhYhw2Fv0vfdzG7BhKVg54Xllk
 t2C2Tg15fE4Mu3Gj+tB/OyaaDWYniFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673534997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=08hrdMBjSFtZWKMqM4pHo6gTKAlmsb+X47EIQYA/pqU=;
 b=0zB3BKa3g4z4GGH9vgCnlAhIOCwY/MofL20DMwErxTmVta+oWzCtu4oQkiH8ugP6Z2c29J
 u2zGSA9Yt/znLBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77D7A13776;
 Thu, 12 Jan 2023 14:49:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Si9AEBUewGNFEgAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 12 Jan 2023 14:49:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, Claudio Fontana
 <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <214f89fc-6e90-7d0b-8555-4bae1d1d0b70@linaro.org>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de> <87fschcko4.fsf@suse.de>
 <214f89fc-6e90-7d0b-8555-4bae1d1d0b70@linaro.org>
Date: Thu, 12 Jan 2023 11:49:55 -0300
Message-ID: <87fscfhkoc.fsf@suse.de>
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/11/23 04:36, Fabiano Rosas wrote:
>> Nowadays for KVM is the 'virt' machine the only one we use?
>
> Also sbsa-ref.

It seems not, sbsa_ref_init has this:

if (kvm_enabled()) {
    error_report("sbsa-ref: KVM is not supported for this machine");
    exit(1);
}


