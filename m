Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F69D5BA82F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:25:58 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6fd-0000FJ-E2
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oZ6Ww-0004Gp-Ap
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:16:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oZ6Wt-0004cu-Nu
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:16:58 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E15E3389A;
 Fri, 16 Sep 2022 08:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663316212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbO55fbW346ob7HQieT6tKSBJj7QKIjVbMebDrZEMtU=;
 b=g47nLDetZbk6n8dPlDOZ6pl4zn04jaIiwkK20gKc/ZMB7Rh/+EpDy3IipWEcHWa7FymgAY
 hol5n1yJxvWb2mlrU2W2b9WEREE9F7GS7j4zoOoA9USBxAdTPpm4jSfdOMd3NIxGE6tBvT
 Ol7GzqnFg9HwmDzz3BcLFnl7+CEYo80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663316212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbO55fbW346ob7HQieT6tKSBJj7QKIjVbMebDrZEMtU=;
 b=cNlkMM/WBSkaAgnTEwBeIo0ZD9A+pdu+6m5bon0D2SsqJ0Mtfm1MypyYWnHNMKx7iMgUcE
 iePh1VEMYS4ExTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 390B11346B;
 Fri, 16 Sep 2022 08:16:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NabfC/QwJGOrPQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 16 Sep 2022 08:16:52 +0000
Message-ID: <69eea2bc-3934-510b-49d5-8337a1b0e4ff@suse.de>
Date: Fri, 16 Sep 2022 10:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <f1f4688f-4f4c-34ef-8c02-0d01cb811025@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <f1f4688f-4f4c-34ef-8c02-0d01cb811025@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/22 10:13, Richard Henderson wrote:
> On 9/8/22 20:30, Claudio Fontana wrote:
>> improve error handling during module load, by changing:
>>
>> bool module_load_one(const char *prefix, const char *lib_name);
>> void module_load_qom_one(const char *type);
>>
>> to:
>>
>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>> bool module_load_qom_one(const char *type, Error **errp);
>>
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   audio/audio.c         |   9 ++-
>>   block.c               |  15 ++++-
>>   block/dmg.c           |  18 +++++-
>>   hw/core/qdev.c        |  10 ++-
>>   include/qemu/module.h |  38 ++++++++++--
>>   qom/object.c          |  18 +++++-
>>   softmmu/qtest.c       |   6 +-
>>   ui/console.c          |  18 +++++-
>>   util/module.c         | 140 ++++++++++++++++++++++++------------------
>>   9 files changed, 194 insertions(+), 78 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~

Thanks for your review Richard.

Whose queue can I expect this series to get into?

Thanks again,

Claudio

