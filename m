Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDD3622BC8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskMv-0003Hr-QW; Wed, 09 Nov 2022 07:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1oskMM-0003AT-Tt; Wed, 09 Nov 2022 07:39:20 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1oskML-0004LP-EO; Wed, 09 Nov 2022 07:39:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C806A1F99B;
 Wed,  9 Nov 2022 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667997549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTOJYFM/vKUm607K9dATTGsZFEuhZfAvWpIjsrdSVqE=;
 b=E6KajPDzmXwmv4uRPIQ8PET6C02rJePTg7i00LslsyGJXkl7iiCZPIM1bm1HB/adDlgDhd
 Q4EaluBePM6LTUei0JTr26KdZBki0BptfdxSgWjJIexkF/Ur+k/NMRGIkRetkvYRTdWIly
 +v/uvMcHbfyJfa+1ByQbwOVbLKTlFMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667997549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTOJYFM/vKUm607K9dATTGsZFEuhZfAvWpIjsrdSVqE=;
 b=YJJBiw7R7TNLxCW3l8QE1piTlnN5evkSDVwJi8j8Yj49tYyYdVt2VQiNSPK3DSEzkdg7Tw
 FiNcKatFko2eueCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 911AA139F1;
 Wed,  9 Nov 2022 12:39:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9ZA1IW2fa2NKZgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 09 Nov 2022 12:39:09 +0000
Message-ID: <38bf7a34-826c-26d3-5978-21da1d37bdef@suse.de>
Date: Wed, 9 Nov 2022 13:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
References: <20221108162324.23010-1-cfontana@suse.de>
 <20221109080452.72nqppvaqj73bakl@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221109080452.72nqppvaqj73bakl@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/9/22 09:04, Gerd Hoffmann wrote:
> On Tue, Nov 08, 2022 at 05:23:24PM +0100, Claudio Fontana wrote:
>> The GTK Clipboard implementation may cause guest hangs.
>>
>> Therefore implement a new configure switch --enable-gtk-clipboard,
>> disabled by default, as a meson option.
> 
> Hmm, I was thinking about a runtime option, add 'clipboard' bool to
> DisplayGTK in qapi/ui.json) and just skip the call to
> gd_clipboard_init() unless the option is explicitly enabled ...
> 
> I don't feel like vetoing a compile time option though, so in case you
> prefer to stick with this:
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> take care,
>   Gerd
> 
> 

Thanks Gerd,

I think at least for our packaging purposes we'd rather have it as a configure time option,
so as to not put functionality in the hands of our users that can potentially lock the guest.

Is someone going to queue this, where?

Thanks,

Claudio

