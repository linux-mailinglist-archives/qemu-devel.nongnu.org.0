Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44062191B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osR9K-0000gw-3Y; Tue, 08 Nov 2022 11:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1osR9I-0000gb-Rs
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:08:28 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1osR9H-0001xw-EK
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:08:28 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F5C8227B5;
 Tue,  8 Nov 2022 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667923705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRNbgOtYk/ShDUugpMS/IxlfmRFejfrhGREGGElUSyw=;
 b=yRhtNhZndV++aPbSYnkjlvKBGtiH2fW2AJZtNCinlgzEN1aQxK2OfvvuNGzbx4APibFAjL
 JjvXpeavIdj8j+4uErN494i3vC5fZOwRlZUw3MnKEnLn9jhRg4SPVuqpO2dUkX1sohdAA9
 qhcqkvpjYCjbMVCY4RcuByHYyDKShZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667923705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRNbgOtYk/ShDUugpMS/IxlfmRFejfrhGREGGElUSyw=;
 b=sKmAntBnyiQ1GdF7V27tQSjCBiLFMIMgjUwTk5uiP+YWapUqyhU7/+Ci9eeAMJutKUTXUi
 yYrJwSbmMRc0M0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E4FE139F1;
 Tue,  8 Nov 2022 16:08:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6du/Cfl+amPybgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 08 Nov 2022 16:08:25 +0000
Message-ID: <02087cb2-d22a-26c7-8353-1977c3af9db2@suse.de>
Date: Tue, 8 Nov 2022 17:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: GTK clipboard implementation causing regression, falling through
 the cracks?
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <8fb722cc-ff51-8d51-803b-996072afabe4@suse.de>
 <20221108114240.5qa35yqib6y5lelg@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221108114240.5qa35yqib6y5lelg@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

On 11/8/22 12:42, Gerd Hoffmann wrote:
> On Mon, Oct 24, 2022 at 12:49:19PM +0200, Claudio Fontana wrote:
>> Hi all,
>>
>> the GTK clipboard implementation seems to be causing some stability issues (guest CPUs stuck),
>>
>> Gerd can you take a look?
> 
> Sorry, no.  Just back online from sick leave, no bandwidth for that
> right now.
> 
> Easy way out is adding a config option for clipboard support.  The real
> solution is probably to rewrite the clipboard support to avoid calling
> the blocking clipboard functions as they apparently (from looking at
> reports & stack traces) can block forever at times.
> 
> take care,
>   Gerd
> 
> 

I am following up with a patch to implement the option.

Claudio

