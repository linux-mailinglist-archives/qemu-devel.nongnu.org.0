Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB7671ABD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:35:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6hg-00047E-7A; Wed, 18 Jan 2023 06:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1pI6hZ-00042K-BB; Wed, 18 Jan 2023 06:34:00 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1pI6hX-0007Mw-Qd; Wed, 18 Jan 2023 06:33:57 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E024320ED4;
 Wed, 18 Jan 2023 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674041632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiKmrXvaLUOKOhl28VHbquXQKFRjoZ1o/inJ9lYSie0=;
 b=Lf76XRt6U25BDCXTVYl2QqRfTldSmdV2i/KM/FgckjjauQLK1QJvP0lB0tEw1WKORnyNFx
 5RNRZI0Ln6Z4j6M0ID3P803uXYRlZ/GdMqCOGVIUFW4GTnkcp/N5ViWrGf8xBgo0jf9mEy
 eHUFV4rzVnehyaqPevBLOwSQDfFtP9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674041632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiKmrXvaLUOKOhl28VHbquXQKFRjoZ1o/inJ9lYSie0=;
 b=oxDH4ajLBfT+GkqEkjKZwCRF4+jzD8JlN4iGvxq5UcYLnVuByBejYG13fcZe03YDEP4zuJ
 jF25HC2sZ+5NHGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80258139D2;
 Wed, 18 Jan 2023 11:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RpowHSDZx2NTfQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 18 Jan 2023 11:33:52 +0000
Message-ID: <c803c8a5-5788-2935-c1d8-3b62cc9a64d9@suse.de>
Date: Wed, 18 Jan 2023 12:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org> <87bkmx0yux.fsf@suse.de>
 <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 1/18/23 11:45, Philippe Mathieu-Daudé wrote:
> On 17/1/23 20:01, Fabiano Rosas wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> On 13/1/23 15:04, Fabiano Rosas wrote:
>>>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>>>> code that is needed for cpus that also work with KVM into cpu.c.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> ---
>>>>    target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>>>    target/arm/cpu_tcg.c | 77 --------------------------------------------
>>>>    2 files changed, 76 insertions(+), 77 deletions(-)
>>>>
>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> [...]
>>>
>>> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.
>>
>> Hm.. QEMU doesn't start without it. There might be some implicit
>> dependency. I'll check.
> 
> Likely some M-profile code (note this type is a QOM *interface*).
> 
> I checked the uses (git-grep -W IDAU_INTERFACE) and none should be
> reachable in a non-TCG build.

crossing fingers, I remember getting in trouble there, but maybe that is now solved by the KConfig thing..

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02958.html

My understanding is probably obsolete now, if so sorry for the noise.

Claudio


