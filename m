Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1A3A6512
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:33:29 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskqO-0001Cs-BB
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lskon-0000Mq-G4; Mon, 14 Jun 2021 07:31:49 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lskok-0000XZ-Pj; Mon, 14 Jun 2021 07:31:49 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72B1E1FD33;
 Mon, 14 Jun 2021 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623670304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwKWCQ8BIYMKgkFFEJ9DF+k26nFeaAVIOwxEfqqSqho=;
 b=GV9XPI+w5xRDTf7D0o1so7y6WOGSInSYG0YCueDHm5TiJSN/zMMY+gQ3/OrSuWqF5m83f4
 XcbauaUx+Dea7QQN0fopMO11MyXQ9sRncCtsKUuTMiZQP/vDzDoqK6njHoiuHxNFJDx/cJ
 HERYt4ePPLn3VGWlZYshNqQjCR+ZbBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623670304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwKWCQ8BIYMKgkFFEJ9DF+k26nFeaAVIOwxEfqqSqho=;
 b=lyxvOtZfFEgM8OtGQ8WXBu5BBe2s8KWnTrPfxURszkfhkU45EZU+2+QUgi06uu8k6wf3T5
 N8CQDBhsU5M+CKCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C0BC3118DD;
 Mon, 14 Jun 2021 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623670304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwKWCQ8BIYMKgkFFEJ9DF+k26nFeaAVIOwxEfqqSqho=;
 b=GV9XPI+w5xRDTf7D0o1so7y6WOGSInSYG0YCueDHm5TiJSN/zMMY+gQ3/OrSuWqF5m83f4
 XcbauaUx+Dea7QQN0fopMO11MyXQ9sRncCtsKUuTMiZQP/vDzDoqK6njHoiuHxNFJDx/cJ
 HERYt4ePPLn3VGWlZYshNqQjCR+ZbBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623670304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwKWCQ8BIYMKgkFFEJ9DF+k26nFeaAVIOwxEfqqSqho=;
 b=lyxvOtZfFEgM8OtGQ8WXBu5BBe2s8KWnTrPfxURszkfhkU45EZU+2+QUgi06uu8k6wf3T5
 N8CQDBhsU5M+CKCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Wq3wLB8+x2AdFAAALh3uQQ
 (envelope-from <cfontana@suse.de>); Mon, 14 Jun 2021 11:31:43 +0000
Subject: Re: [PATCH v2 00/18] modules: add metadata database
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <dd1c5487-b1bf-9e33-fd42-fc0863e0ddd7@suse.de>
 <20210610095434.iygaxizo5h3745zf@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <a33c7fda-0865-525b-5138-e87b6233f9a2@suse.de>
Date: Mon, 14 Jun 2021 13:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210610095434.iygaxizo5h3745zf@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Lieven <pl@kamp.de>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 11:54 AM, Gerd Hoffmann wrote:
> On Thu, Jun 10, 2021 at 10:32:39AM +0200, Claudio Fontana wrote:
>> On 6/10/21 7:57 AM, Gerd Hoffmann wrote:
>>> This patch series adds support for module metadata.  Here are the pieces
>>> of the puzzle:
>>>
>>>   (1) Macros are added to store metadata in a .modinfo elf section
>>>       (idea stolen from the linux kernel).
>>>   (2) A utility to scan modules, collect metadata from the .modinfo
>>>       sections, store it in a file (modinfo.json) for later consumption
>>>       by qemu.  Can also be easily inspected using 'jq'.
>>>   (3) Adding annotations to the modules we have.
>>>   (4) Drop hard-coded lists from utils/module.c
>>>
>>> take care,
>>>   Gerd
>>
>> The background has disappeared compared with V1.
>>
>> V1 says:
>>
>> "Background is that the hard-coded lists in util/module.c are somewhat
>> ugly and also wouldn't work very well with a large number of modules,
>> so I'm looking for something else."
> 
> Well, it's point (4) now (a bit short indeed ...).
> 
>> Can you write more about what the actual high level goals of this series are?
> 
> Right now we have information about modules hard-coded in various places
> in qemu.  Most obvious ones are module_deps[] and qom_modules[] (both in
> util/module.c), but also qemu_load_module_for_opts() (in softmmu/vl.c)
> and maybe more I missed.

Maybe a good idea to find out.

> 
> So, when you go build some qom object modular today you'll have to go
> add that to the qom_modules[] list.  With this patch series applied
> you'll go add a 'module_obj("typename");' to your source file instead.
> 
> Same goes for other metadata, see the "add $foo module annotations"
> patches for examples.
> 
>> We are in general making QEMU more and more difficult to get into,
>> requiring more and more investment for new contributors to get
>> productive.
>>
>> Is the additional complexity justified? What is the benefit, and is
>> simplification a goal of the series as well?
> 
> IMHO it is a simplification for developers.  Modules are more

So the whole endevour here is to remove the need to update modules in two/three places?

It might simplify life for developers adding a module,
but it is at a cost for the developers trying to keep the plumbing to work in my opinion.

Based on the information you provided, the reason this whole series exists seems to be to remove the need to update modules in multiple places.

Should the design focus be on that and that only?

Is there a real need to copy over the mechanism from the kernel, or are the requirements actually different/simpler here?



> self-contained with this in place.  You just add the annotation macros
> and you are done.  No need to edit manually maintained lists at some
> non-obvious place elsewhere in the tree.  Also no patch conflicts in
> those lists.  We have type_init() + friends for simliar reasons.
> 
> The price for that simplification is the new utility needed which
> collects and stores the metadata.  But that is something you only need
> to worry about when actually working on module support.  The build
> system keeps the database automatically up-to-date and most developers
> shouldn't even notice that it is there.
> 
> take care,
>   Gerd
> 
> 


