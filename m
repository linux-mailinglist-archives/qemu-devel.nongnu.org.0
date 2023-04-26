Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363A6EF9B2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:59:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjPJ-0005hk-K8; Wed, 26 Apr 2023 13:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1prjP9-0005hV-E2
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:58:11 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1prjP7-00069M-NC
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:58:11 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C60891FDD8;
 Wed, 26 Apr 2023 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682531886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvSz28YDH/ly/Eh4khUsGziwqUrMKoIpDkZy8TUXvYA=;
 b=1Lu+xLpRucS5yU9rtl/bWfnV+GC9OoyJcmUzjnNy8vYLyYlwI+4l04KoGr1mWD38P45ZiO
 5ZKbmBtkFN0eMjwjrXxQGuP5Ga7KJEEPpcoVfBdpVZxbdu9Xdx4d15QynZBt5tZjmf1QIp
 h0aAsYNeEcjZlSBzxdMxVVDRiK1i4pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682531886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvSz28YDH/ly/Eh4khUsGziwqUrMKoIpDkZy8TUXvYA=;
 b=OBzTIk73FisfR3+51WkXlQ81Rgu5kYulGM0EgebQ4wO9iUhZlSjLTSE2PRS/Ci91GKNGEt
 AFYzAgL4NwkbP+Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46351138F0;
 Wed, 26 Apr 2023 17:58:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZyNXBC5mSWSRVAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 17:58:06 +0000
From: Fabiano Rosas <farosas@suse.de>
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH] multifd: Fix the number of channels ready
In-Reply-To: <87r0s6eecg.fsf@secure.mitica>
References: <20230426162307.11060-1-quintela@redhat.com>
 <87354mmudb.fsf@suse.de> <87r0s6eecg.fsf@secure.mitica>
Date: Wed, 26 Apr 2023 14:58:03 -0300
Message-ID: <87zg6ule50.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Fabiano Rosas <farosas@suse.de> wrote:
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> We don't wait in the sem when we are doing a sync_main.  Make it wait
>>> there.  To make things clearer, we mark the channel ready at the
>>> begining of the thread loop.
>>
>> So in other words we're estabilishing that "channel ready" means ready
>> to send, regardless of having sent the sync packet. Is that it?
>
> Yeap.
>
> There was a bug (from the beggining) that made the counter always get
> up and up.  This fixes it.
>
> It was always supposed to work this way.

Ah, great. I'm proposing a multifd variant without the sync packet in my
fixed-ram series and moving the channels_ready to the top of the loop
means I can stop issuing an extra qemu_sem_post(&p->sem) just to skip
the sync packet.

