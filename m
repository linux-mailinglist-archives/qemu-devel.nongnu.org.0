Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C85B0509
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:19:24 +0200 (CEST)
Received: from localhost ([::1]:55874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVuxe-000727-JZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oVutU-0005AU-DN
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:15:04 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:33792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oVutS-0003Sz-Iv
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:15:03 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5269433D7C
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1662556499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDILOAftdGSkgH7K+H3j4uhJpKN2AvCDYWW944FbBcM=;
 b=SU1m8azn0VRlbJxVNwyiGj1/qI7id/5w4+53qUBMJqvXgKgNjXlQiRmlDoHe8NDsG1j7v6
 hY6q7x+1SyyhyuRzV4zsYEV7SHBR+GVGxvDgdO/6rWjjhnM+Q8KecTC1pgrBUMVOoOtnGf
 TnYEKu16MwFo8DI6wWh1D8YhzT3ykhE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 370BA13486
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 13:14:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mO25ClOZGGMuFwAAMHmgww
 (envelope-from <nborisov@suse.com>)
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 13:14:59 +0000
Message-ID: <186ad67d-fb2c-6fc7-e212-71cc209bdcf7@suse.com>
Date: Wed, 7 Sep 2022 16:14:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] migration/multifd: Remove redundant copy of page offsets
 during send
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220810103942.580784-1-nborisov@suse.com>
From: Nikolay Borisov <nborisov@suse.com>
In-Reply-To: <20220810103942.580784-1-nborisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=nborisov@suse.com; helo=smtp-out1.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 10.08.22 г. 13:39 ч., Nikolay Borisov wrote:
> All pages which are going to be migrated are first added to
> MultiFDSendParams::MultiFDPages_t::offset array by the main migration
> thread and are subsequently copied to MultiFDSendParams::normal by the
> multifd thread. This is really unnecessary as the MultiFDPages_t is
> guaranteed to be stable since its mutex is being held. Additionally,
> this somewhat simplifies the code as the migration pages are now kept
> in only 1 place during send, also the name 'offset' coupled with the
> context it's being used - usually added to the host pages makes it
> obvious that this is an offset.
> 
> With this change normal/normal_num are no longer used in the multifd
> send path.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>


Ping

