Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22810304396
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:18:49 +0100 (CET)
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4R3I-0006Cx-8S
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4R1a-0005KA-Ur
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4R1Y-0005cz-04
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611677818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2XqO2IE9er0Vnt1upnepDYuDbwSqa6/W7rjIB2a0Ho=;
 b=dFiJz53m4ATQiJTRgbRtFkhK8utngPilsqTArs823A3oduiH0cwa31qL0AOhHtuc62oB/G
 N+vbdjaQEE2P9Ntt7C++MuG2JMHfZKj3n+7OFwS+c2cfgwb5HU26N56od5B4Cf/pM9Bz2U
 sUS6g3IewFDoklOY6lOlX+y79pyaO9c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-_Ru2ZmWHO4-QT0lKp2J19A-1; Tue, 26 Jan 2021 11:16:54 -0500
X-MC-Unique: _Ru2ZmWHO4-QT0lKp2J19A-1
Received: by mail-ed1-f71.google.com with SMTP id r4so9592623eds.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K2XqO2IE9er0Vnt1upnepDYuDbwSqa6/W7rjIB2a0Ho=;
 b=twdkjWtd4am8QY14th48Icsi93MLFSM/s7ialUehCEO9pKsNXSru2iE5Wbhnp6BLbM
 TRR6bzBccgzavzvGPlnbUHdZXBcXoh2hAEYZnDFhx9me7mIYIlLtld7wr2Jd6UBqQtof
 H03NyLewm+msdyQAI/RRZNHes9YunqJsOcdso++2zVOKY2T1hrXLWvUrCqfe/KjaG5Ks
 EAJ+fMnHg6o2tcK0MAJRdVyzOY6SQG484HxZS/AB0DTt3EcTph2rvQhj4I3bJaC7R/KH
 07NeY3V1W+gvUxc0WGlT/yc5zcpeR2ZMsPubLR62WFlS5pV27WD6y3h6bueVsp1oKd0p
 1kkA==
X-Gm-Message-State: AOAM533jeE9fYZaOG6bi61odL51kVt+j/WySu8UfcsGfjTESldLSfz9v
 Zgv/X2vjzSUrXPRE5J4dMX4lVEQf9iDsajHjCcS2NHFDj9xs3jib4P2F3lNMC0epgT+kuV7t6qJ
 mwOO2Lb3R22goXNI=
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr5088198edp.217.1611677813193; 
 Tue, 26 Jan 2021 08:16:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwUVsa1+h9mV52lborPQq/Yk6OPqXNM0aFL8OSySGRwHH9vH27Wb1FYyZrYpGpuWxXNKwoPw==
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr5088176edp.217.1611677813034; 
 Tue, 26 Jan 2021 08:16:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm12960851edv.33.2021.01.26.08.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 08:16:51 -0800 (PST)
Subject: Re: [PATCH v4 4/6] sev/i386: Don't allow a system reset under an
 SEV-ES guest
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <cover.1601060620.git.thomas.lendacky@amd.com>
 <c40de4c1bf4d14d60942fba86b2827543c19374a.1601060620.git.thomas.lendacky@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <66a57543-a98a-d62e-5213-e203efda5dce@redhat.com>
Date: Tue, 26 Jan 2021 17:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c40de4c1bf4d14d60942fba86b2827543c19374a.1601060620.git.thomas.lendacky@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Slaby <jslaby@suse.cz>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/20 21:03, Tom Lendacky wrote:
> 
>  {
> -    if (no_reboot && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
> +    if (!cpus_are_resettable()) {
> +        error_report("cpus are not resettable, terminating");
> +        shutdown_requested = reason;
> +    } else if (no_reboot && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {

The error should not be emitted if "no_reboot && reason != 
SHUTDOWN_CAUSE_SUBSYSTEM_RESET" (the condition has changed a bit in 
latest QEMU but the idea is the same).

This is because whoever invoked QEMU could already know about this 
SEV-ES limitation, and use -no-reboot (aka -action reset=shutdown in 
6.0) in order to change the forbidden warm reset into a shutdown+restart 
cold reset.

Paolo


