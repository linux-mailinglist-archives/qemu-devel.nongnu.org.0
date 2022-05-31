Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C5538EB3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:19:35 +0200 (CEST)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvyyM-0004W3-Cc
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvyrZ-0002eH-Da
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:12:39 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvyrX-0008Fp-Jh
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:12:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF41421BE9;
 Tue, 31 May 2022 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653991949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28HCyCUizCM47HdQBk8L5NfwU+0o5YsoVCuLH+eS/y4=;
 b=KqyKZ0sMySakviDyV7r5vy8bILdR8bsjex5hYNGhGmFDX9iqXRfx5aaCMMUZ8Mm5wIyzCC
 VZsK0nXeNBXBlOEtXpofqbxJ9XZTW+MuyVtQHYipT1o+YRsEPFCLt16xOkdk2928uopYjk
 D1Medbmjcb1+vae9WdoZ/TFNYNRvuso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653991949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28HCyCUizCM47HdQBk8L5NfwU+0o5YsoVCuLH+eS/y4=;
 b=Wvk2P0ZV8d/cvotE8iDyChuy74OfDqnWHIylm7hFao60fyG5Ls+gMFZ3X6KtD2a6SKDV0r
 UKyckDPBtH+WngBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D86013AA2;
 Tue, 31 May 2022 10:12:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JHvjIA3qlWKRKAAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 31 May 2022 10:12:29 +0000
Message-ID: <6981bab7-f713-264b-f74d-370b53648688@suse.de>
Date: Tue, 31 May 2022 12:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] pci: fix overflow in printf string formatting
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220531092540.10151-1-cfontana@suse.de>
 <20220531092540.10151-2-cfontana@suse.de>
 <CAFEAcA8ENs6P6WU8iaPty7-QfZrBAZrhm4DeegUUjGuL4f3UUQ@mail.gmail.com>
 <70a5da8a-4f99-29d1-e9b4-904de095819b@suse.de>
In-Reply-To: <70a5da8a-4f99-29d1-e9b4-904de095819b@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

On 5/31/22 11:55, Claudio Fontana wrote:
> On 5/31/22 11:47, Peter Maydell wrote:
>> On Tue, 31 May 2022 at 10:34, Claudio Fontana <cfontana@suse.de> wrote:
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>
>> It would be helpful to note in the commit message how
>> bad the overflow is, in what situations it can happen,
>> and how it was detected.
>>
>> thanks
>> -- PMM
> 
> Hi Peter,
> 
> sorry I should have linked to this previous message by Dario:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05518.html
> 
> It was detected when building QEMU with FORTIFY_SOURCE=3.
> 
> Thanks,
> 
> Claudio
> 
> 

Will resend with more explanation in the commit message btw.

