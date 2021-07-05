Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C43BB904
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:23:01 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Jsa-0005qT-Cm
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m0Jo4-0006N4-KY
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m0Jo2-0005bC-Nr
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:20 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC4BF22716;
 Mon,  5 Jul 2021 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625473096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaSesxY4qkORDGKqhWKo0+z9lgedaJpcbCXjlvD1NHo=;
 b=ZbbBRaloYq95nJf4285foBgv6R1knzJk0AOi3o9YHUgdWU8C/VDLg5CPaAHW/al6ooNgOH
 N+QBtKexlJWQy/WlET7qfIl43T7u0LdfRYpfe28rVEVyiABQpN5ToJDdCf7ma8Ii7B6fy9
 2XB9BWL9diHoPALrmyobXnqU9hMBZ6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625473096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaSesxY4qkORDGKqhWKo0+z9lgedaJpcbCXjlvD1NHo=;
 b=7WaqinrG0OSEA0p4pCsGlou/p4fgEbh6o/IMHb7OgUDIjoowQBnezQMkcq/8TT/o/fdNWp
 Fq9g6ifjj6XP03Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 630BC13790;
 Mon,  5 Jul 2021 08:18:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gN60FUjA4mAmNAAAGKfGzw
 (envelope-from <cfontana@suse.de>); Mon, 05 Jul 2021 08:18:16 +0000
Subject: QEMU modules improvements objective (Was: Re: [RFC 0/3] Improve
 module accelerator error message)
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210630232749.21873-1-jziviani@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2ab57f8e-cb8c-d708-274d-0c2092acfff3@suse.de>
Date: Mon, 5 Jul 2021 10:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210630232749.21873-1-jziviani@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, pbonzini@redhat.com,
 berrange@redhat.com, kraxel@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 1:27 AM, Jose R. Ziviani wrote:
> Hello!
> 
> I'm sending this as RFC because it's based on a patch still on
> review[1], so I'd like to see if it makes sense.
> 
> Tt will improve the error message when an accelerator module could
> not be loaded. Instead of the current assert error, a formated
> message will be displayed.
> 
> [1] https://patchwork.kernel.org/project/qemu-devel/list/?series=506379
> 
> Jose R. Ziviani (3):
>   modules: Add CONFIG_TCG_MODULAR in config_host
>   modules: Implement module_is_loaded function
>   qom: Improve error message in module_object_class_by_name()
> 
>  include/qemu/module.h |  3 +++
>  meson.build           |  3 +++
>  qom/object.c          | 30 ++++++++++++++++++++++++++++++
>  util/module.c         | 28 +++++++++++++++++++++-------
>  4 files changed, 57 insertions(+), 7 deletions(-)
> 

Open question to all,

why don't we have/add the ability to configure

CONFIG_XXX=m

for all potentially modular pieces?

It should be possible to say, I want to build the storage plugins as modules, TCG I would like it built-in, and KVM as a module,
or any combination of these.

The most useful combination I see for virtualization use of qemu is with TCG as a module (M), KVM as built-in (Y), and various other optional pieces as modules (M).

Should this not be the vision? To me it looks that way.

Thanks,

Claudio

