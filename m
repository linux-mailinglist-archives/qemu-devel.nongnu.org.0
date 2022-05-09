Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B051FE73
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:37:07 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3ZS-0008Jt-EQ
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1no38A-0007t8-6t; Mon, 09 May 2022 09:08:54 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1no387-0005bW-I6; Mon, 09 May 2022 09:08:52 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A33D01FA1C;
 Mon,  9 May 2022 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652101728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BpkyJpf59T+9B12q9IsCoEjw6AXKkMmohsZkrNP6UA=;
 b=YUSKCFFlVbgnlR5CkddiHQcHlHtz6+XP+wL30isF9wWAuW7fyokOciUy9UH0XwAz8TCqJi
 AwOHEho7/T0Cqvv5PT9bFmIwra9mw4ya9sbjOjULon0abGYI4M7I3LCdauW+bYvs3vfDEE
 PrLSrFJwUYZH2swbrElWn9wGCaa6//o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652101728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BpkyJpf59T+9B12q9IsCoEjw6AXKkMmohsZkrNP6UA=;
 b=I3xJJDQxvHl9M+mUUeSV9eRnCyHku89c5fEgwgybMm9V/kjITUIsDKj3mRgI3f8QEWLoKl
 ZUQ+ORSxVzEd+YDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3215C132C0;
 Mon,  9 May 2022 13:08:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b596CmASeWJPVwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 09 May 2022 13:08:48 +0000
Subject: Re: [PATCH v7 00/22] host: Support macOS 12
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Silvio Moioli <moio@suse.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <b0933f87-3a73-fbfb-f3ee-52e7ecde73a0@suse.de>
 <57396d69-1dff-ec35-0c16-b2410c1d30e6@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b87f4909-f11c-5277-01df-3129044502d2@suse.de>
Date: Mon, 9 May 2022 15:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <57396d69-1dff-ec35-0c16-b2410c1d30e6@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/22 2:31 PM, Philippe Mathieu-Daudé wrote:
> On 3/5/22 11:40, Claudio Fontana wrote:
>> On 3/7/22 12:17 AM, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Few patches to be able to build QEMU on macOS 12 (Monterey).
>>>
>>> Missing review:
>>>   0006-hvf-Fix-OOB-write-in-RDTSCP-instruction-decode.patch
>>>   0013-osdep-Avoid-using-Clang-specific-__builtin_available.patch
>>>   0014-meson-Resolve-the-entitlement.sh-script-once-for-goo.patch
>>>   0015-meson-Log-QEMU_CXXFLAGS-content-in-summary.patch
>>>   0016-configure-Pass-filtered-QEMU_OBJCFLAGS-to-meson.patch
>>>   0017-ui-cocoa-Constify-qkeycode-translation-arrays.patch
>>>   0020-ui-cocoa-capture-all-keys-and-combos-when-mouse-is-g.patch
>>>   0021-ui-cocoa-add-option-to-swap-Option-and-Command.patch
>>>   0022-gitlab-ci-Support-macOS-12-via-cirrus-run.patch
>>>
>>> Since v6:
>>> - Dropped merged patches
>>> - Addressed Akihiko Odaki comments (squashed 2 patches, added R/T-b)
>>> - Dropped 'configure: Disable out-of-line atomic operations on Aarch64'
>>> - Add few macos patches on the list pending for 7.0 so tested by CI
>>
>>
>> Hi Philippe, I did not find v6 somehow,
>>
>> and I was looking for patch:
>>
>> "[PATCH v5 06/16] hvf: Enable RDTSCP support"
>>
>> was it dropped / merged with something else? I do not see it in latest git, nor in this respin,
>> maybe it is in your tree somewhere?
> 
> The patch stayed unreviewed during 2 months, so I dropped it.
> 
> Now it got at least a Tested-by tag from Silvio, I'll include it in the
> next PR.
> 
> Regards,
> 
> Phil.
> 

Awesome, thanks for the update!

Claudio


