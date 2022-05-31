Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7AA538E19
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:59:10 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvyec-0005EF-0V
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvybH-0002pV-M2
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:55:43 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvybF-0005Mk-Vt
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:55:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 701261F9A5;
 Tue, 31 May 2022 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653990940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byn6oqF5quB78yfNaWl7+PHD4gFhWklujbU9CU5IaDE=;
 b=fDboDVbjuYNg6hXkLRrD3mdCB7S1IhG4c9Q91nCbWFGAIb8plLqmuxrsGEuPKS74dOsKJ2
 dG2QB7JxX8K7gnQjdAkeuiR4xSJTDAHZ1DECBcoTs+SnuQcVpdaQ42eAsyH5T6B4t6/KSZ
 hKp1g1o67g7xIXO4zh/ei5dEOUquMZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653990940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byn6oqF5quB78yfNaWl7+PHD4gFhWklujbU9CU5IaDE=;
 b=Q1Fm+/1E1+hiQ/4APbXhaAz+BEZNEH2fX/YbxtvKvC+v26Ib4s02knfMJtvpdQyMtFcS5Y
 BzpMHr82JaLCjrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EAC7132F9;
 Tue, 31 May 2022 09:55:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oH+gDRzmlWLmHwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 31 May 2022 09:55:40 +0000
Message-ID: <70a5da8a-4f99-29d1-e9b4-904de095819b@suse.de>
Date: Tue, 31 May 2022 11:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] pci: fix overflow in printf string formatting
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220531092540.10151-1-cfontana@suse.de>
 <20220531092540.10151-2-cfontana@suse.de>
 <CAFEAcA8ENs6P6WU8iaPty7-QfZrBAZrhm4DeegUUjGuL4f3UUQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CAFEAcA8ENs6P6WU8iaPty7-QfZrBAZrhm4DeegUUjGuL4f3UUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 5/31/22 11:47, Peter Maydell wrote:
> On Tue, 31 May 2022 at 10:34, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> It would be helpful to note in the commit message how
> bad the overflow is, in what situations it can happen,
> and how it was detected.
> 
> thanks
> -- PMM

Hi Peter,

sorry I should have linked to this previous message by Dario:

https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05518.html

It was detected when building QEMU with FORTIFY_SOURCE=3.

Thanks,

Claudio


