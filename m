Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7835AE824
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:30:48 +0200 (CEST)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXj5-0005Nn-3c
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVXEZ-0007nx-A3
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:59:15 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:51772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVXEU-0007G3-FO
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:59:15 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 18D5B1F86A;
 Tue,  6 Sep 2022 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662465549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLsVTwxrsG+myD2oXkof0iwGcakkF8mbN4qXeFdFlXA=;
 b=HkNCW0cVr4+B8w3U71v7ylRC4WCmtZYyC7DCUkaiRu10vsaGa9R8HYC1+TfMC/OMwmjiPJ
 DPvPmp8reb3fimC6ZA6mNKOUI+iq794/UWfRWZtU/shZbJ00itWd6YcjOUamqONZBanwD7
 T0/9vhNL6jYuZMIlRyvPwL84l2Xf5F8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662465549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLsVTwxrsG+myD2oXkof0iwGcakkF8mbN4qXeFdFlXA=;
 b=pPoknedCUpsYOqIYQsxyOx7Z5KemVwNg+y3cFbZUri/ZegjJDVZcGHzBxh0169XGNwch8i
 2huwlnXUARPPO+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC77713A7A;
 Tue,  6 Sep 2022 11:59:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tLqNMAw2F2MoNQAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 06 Sep 2022 11:59:08 +0000
Message-ID: <aef3408d-6b48-424b-e539-6230ee38b90e@suse.de>
Date: Tue, 6 Sep 2022 13:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 dinechin@redhat.com
References: <20220905101332.1986-1-cfontana@suse.de>
 <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
 <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
 <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
 <20220906095325.5rhnqjyvckjebnmp@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220906095325.5rhnqjyvckjebnmp@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.752, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/22 11:53, Gerd Hoffmann wrote:
>> In any case, the only thing that "mayfail" seems to control, is in module_load_file, and is a single printf:
>>
>>     g_module = g_module_open(fname, flags);
>>     if (!g_module) {
>>         if (!mayfail) {
>>             fprintf(stderr, "Failed to open module: %s\n",
>>                     g_module_error());
>>         }
>>         ret = -EINVAL;
>>         goto out;
>>     }
>>
>>
>> Weird.. Is someone building proprietary modules on top of QEMU?
> 
> Nope.
> 
> But modules have dependencies to stuff like pci bus, usb bus, vga which
> might not be satisfied by some system emulators, and trying to load
> those modules will fail then because of unresolved symbols.  If you drop
> that 'make check' will log a pile of errors ...
> 
> Dropping mayfail and return an 'Error' instead makes sense, then it is
> up to the caller to report or not report the failure.  When calling down
> from module_load_qom_all() you might want ignore errors for the reasons
> outlined above, in most other caes it probably makes sense to report
> them.
> 
> take care,
>   Gerd
> 
> 

Ah I noticed only now... I just sent a series, the module_load_qom_all() then is maybe something to discuss further.

Thanks,

Claudio



