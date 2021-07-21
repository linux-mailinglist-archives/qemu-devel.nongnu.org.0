Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5D3D0CA5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:05:51 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6A2w-0003dP-VQ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6A0n-0001Rr-Fv
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:03:38 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:58362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6A0l-0005qt-Uo
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:03:37 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEDD31FE93;
 Wed, 21 Jul 2021 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626865412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kB2zPw6hO34Zkkce0pIxECN/dQZNqVsY5vTHr1P6Z6E=;
 b=sPWfvCthGe67acS0M/Vqu6zirDxQi4kklvy0lRxDhp+J30RBh5AOehS861AoItWYwwRJwS
 odxjiBgQd3i9puM9C8CBMIJP4Y0QqNhWx+OCcded8caWdxTE7+F/Juoxo45uh1vcgrgsmb
 5KDZ7N7Bk57utDT4WIRLCI6m7MPYam0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626865412;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kB2zPw6hO34Zkkce0pIxECN/dQZNqVsY5vTHr1P6Z6E=;
 b=FyXdAYS6+Issp+EJyHZvVdeTjFaPzh0mqKkDgl4Ss9+z9r+EyV1J8dKKSPjKxmSAPKSlm3
 +bYzF9c7VhsQ6ABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 804BD139F8;
 Wed, 21 Jul 2021 11:03:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zLUKHQT/92B8PQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 21 Jul 2021 11:03:32 +0000
Subject: Re: [RFC 1/2] modules: Option to build native TCG with
 --enable-modules
To: Gerd Hoffmann <kraxel@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>
References: <20210629212819.24389-1-jziviani@suse.de>
 <20210629212819.24389-2-jziviani@suse.de>
 <20210721105906.lhosqmzqbh5xdxvi@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c7ef8c34-75b9-60df-c8a5-b4851ea35ef7@suse.de>
Date: Wed, 21 Jul 2021 13:03:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210721105906.lhosqmzqbh5xdxvi@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 12:59 PM, Gerd Hoffmann wrote:
> On Tue, Jun 29, 2021 at 06:28:18PM -0300, Jose R. Ziviani wrote:
>> Adds an option (--enable-tcg-builtin) to build TCG natively when
>> --enable-modules argument is passed to the build system. It gives
>> the opportunity to have the accelerator built-in and still take
>> advantage of the new modular system.
> 
> I think we should not special-case tcg here.  Either allow setting =y
> for all modules with all the consequences this has for maintainance and

agreed;

> testing, or leave things as-is.> 
> See also recent discussions kicked by Claudio Fontana.

maybe this "all-y" for modules vs "all-m" could be a good step in the right direction,
with arbitrary -m , -y configuration being a potential next step if ppl find it a useful extension?

Hmm..

Ciao,

Claudio

> 
> take care,
>   Gerd
> 
> PS: just back from vacation, wading backwards through
>     my mail backlog ...).
> 


