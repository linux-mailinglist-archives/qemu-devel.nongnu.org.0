Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72EB619321
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqsdz-0006oS-9j; Fri, 04 Nov 2022 05:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oqsdX-0006mK-N5
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:05:19 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oqsdV-0007yz-TR
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:05:15 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9127B21899;
 Fri,  4 Nov 2022 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667552710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYhWamJZ0lvFNW9ISgHUVTxlK+1FyNO7gsU7OWN/2s8=;
 b=ftvadQYNOT8OPW8QXoT8nz/vWeisXcoCg+ZRP6zaJIe8Lpiv9AG4hQQXguLTB9x/J6xlqW
 oYxrbCGRwkp2Jo7etCK+EwAMPQIL6dLT1xigyqEz2Yz3ldMu6qaGe7Ljld40v6tuOwlPkG
 7jJmkiHMLk0XcfFusxWVHmsUwmiLIN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667552710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYhWamJZ0lvFNW9ISgHUVTxlK+1FyNO7gsU7OWN/2s8=;
 b=NfgkG1CQujcplFGjifvhBK2mYDoXtJ2kXLU3yL9I2cxEX+F4mlNqm2O3fWWJSwV5xr4141
 Sx8ihtUiJ5mzs1BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 443AD13216;
 Fri,  4 Nov 2022 09:05:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8wMjD8bVZGNJcwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 04 Nov 2022 09:05:10 +0000
Message-ID: <b3af1867-008c-779a-a53a-5d11721aa4e8@suse.de>
Date: Fri, 4 Nov 2022 10:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v9 0/5] improve error handling for module load
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220929093035.4231-1-cfontana@suse.de>
 <3568bac0-1b64-d096-b78a-29f628a70448@suse.de>
 <b68f4730-be61-b635-057e-270f3f74f63b@suse.de> <Y1rPI2sXcxjbVIbd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Y1rPI2sXcxjbVIbd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 20:34, Kevin Wolf wrote:
> Am 27.10.2022 um 16:52 hat Claudio Fontana geschrieben:
>> A ping on this one, is there anything more that needs to be urgently
>> addressed before it can be queued for inclusion?  This is currently
>> creating problems for upstream kubevirt, due to the error handling not
>> properly reporting permissions errors on module file access.
> 
> What is the right tree to take this one?
> 
> get_maintainers.pl doesn't show anything for module.[ch], which might be
> why nobody feels responsible for merging this.
> 
> Kevin

Ping,

there is no util/* catch-all, so indeed it seems an unmaintained section of QEMU,
Richard and Markus took an interest to review the patches,

but it seems that the project needs a maintainer / queue for the util/module.[ch]..

Peter could you help with this?

Claudio




