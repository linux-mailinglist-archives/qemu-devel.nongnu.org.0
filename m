Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B633A9A1C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:24:17 +0200 (CEST)
Received: from localhost ([::1]:54726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUae-0003q9-6G
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltUZn-00039J-Vf
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:23:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:34998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltUZm-0007cY-4I
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:23:23 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A913321A58;
 Wed, 16 Jun 2021 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623846198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqR2Zy3vKcxnYRvZodDZ9jnXunMrUoc+lSBnyaYRTbk=;
 b=HYSdTxRGZtX0Kf6k3DRpFvobGVsSfWRXzEdpTsPq/yu81nxBUTi9o51+7c3L59SvYvyAow
 XqREF2ry06mJGb9hFCC9RzmfXlV9WdRDeC3Pe99bAcd2YpfQe7xa/0jodFspTPv+Xh2FUc
 WkuGwXVQ5qQbiB9Zd1UquIYlj6NKxLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623846198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqR2Zy3vKcxnYRvZodDZ9jnXunMrUoc+lSBnyaYRTbk=;
 b=Efi/Or0ppxQMGyTHZ1yLutxsr0yp4KVZOvZs+bMOmTwjCjomsMr81KyaEL3Mmh5Po90W8P
 PUYSauzOx/bzhBAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 532F2118DD;
 Wed, 16 Jun 2021 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623846198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqR2Zy3vKcxnYRvZodDZ9jnXunMrUoc+lSBnyaYRTbk=;
 b=HYSdTxRGZtX0Kf6k3DRpFvobGVsSfWRXzEdpTsPq/yu81nxBUTi9o51+7c3L59SvYvyAow
 XqREF2ry06mJGb9hFCC9RzmfXlV9WdRDeC3Pe99bAcd2YpfQe7xa/0jodFspTPv+Xh2FUc
 WkuGwXVQ5qQbiB9Zd1UquIYlj6NKxLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623846198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqR2Zy3vKcxnYRvZodDZ9jnXunMrUoc+lSBnyaYRTbk=;
 b=Efi/Or0ppxQMGyTHZ1yLutxsr0yp4KVZOvZs+bMOmTwjCjomsMr81KyaEL3Mmh5Po90W8P
 PUYSauzOx/bzhBAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 6AJIEjbtyWBdEQAALh3uQQ
 (envelope-from <cfontana@suse.de>); Wed, 16 Jun 2021 12:23:18 +0000
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
 <2963309.4TrVdrBa0x@pizza>
 <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <bdf9b356-87ee-0749-c977-f48989fa8e26@suse.de>
Date: Wed, 16 Jun 2021 14:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 11:28 AM, Gerd Hoffmann wrote:
>>> Hmm, what would be the use case?  Right now qemu has the all-or-nothing
>>> approach for modules, i.e. if modules are enabled everything we can
>>> build as module will be built as module, and I havn't seen any drawbacks
>>> so far.  So, why would one compile parts of qemu as module and other
>>> parts not?
>>
>> From my point of view, as a QEMU package maintainer, the all-or-nothing module 
>> approach is great - specially for accelerators - because we can create a set 
>> of officially supported packages and another set of optional modules, that 
>> users may get them if they want to.
> 
> Same here ;)
> 
>> However, please correct me if I'm wrong, I understand that an accelerator as a 
>> module will add an overhead that some user won't be willing to pay. So, give 
>> them the option to have built-in accelerators seems a good idea.
> 
> Modules add some overhead, yes, and there are surely use-cases where you

Where do we expect the overhead to be, and of which nature?

Do we already know about such an impact?

Thanks,

CLaudio

> don't want accel modules.  I would just expect people don't want the
> other modules either then, but maybe I'm wrong.
> 
> take care,
>   Gerd
> 


