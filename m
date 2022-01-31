Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75A4A3F89
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:48:16 +0100 (CET)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETIF-0006sU-0P
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nETFl-0005pw-Mr
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:45:41 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:2311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nETFj-0001QO-GN
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:45:41 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 654D0456E0;
 Mon, 31 Jan 2022 10:45:28 +0100 (CET)
Message-ID: <562b90ea-3cf1-d59f-7fe9-7e4a57e996f6@proxmox.com>
Date: Mon, 31 Jan 2022 10:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87ee4x8cpc.fsf@dusky.pond.sub.org> <YfASE9EieKWM7fEt@redhat.com>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <YfASE9EieKWM7fEt@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.22 um 16:06 schrieb Daniel P. Berrangé:
> On Mon, Jan 24, 2022 at 02:50:39PM +0100, Markus Armbruster wrote:
>> Stefan Reiter <s.reiter@proxmox.com> writes:
>>
>>> Since the removal of the generic 'qmp_change' command, one can no longer replace
>>> the 'default' VNC display listen address at runtime (AFAIK). For our users who
>>> need to set up a secondary VNC access port, this means configuring a second VNC
>>> display (in addition to our standard one for web-access), but it turns out one
>>> cannot set a password on this second display at the moment, as the
>>> 'set_password' call only operates on the 'default' display.
>>>
>>> Additionally, using secret objects, the password is only read once at startup.
>>> This could be considered a bug too, but is not touched in this series and left
>>> for a later date.
>>
>> Related: Vladimir recently posted a patch to add a new command for
>> changing VNC server listening addresses.  Daniel asked him to work it
>> into display-reload instead[1].  Vladimir complied[2].
>>
>> Daniel, what do you think about this one?  Should it also use
>> display-reload?
> 
> I'd ultimately intend to deprecate & remove the direct setting of
> passwords on the CLI, and exclusively rely on the 'secret' object
> for passing in passwords. With this in mind, I'd not be enthusiastic
> about adding new commands for changing passwords in QMP directly,
> rather I think we should have a way to change the 'secret' object
> in use.
> 

How should I proceed with this series then? Does adding the new argument
for the display ID count as "adding new commands"?

If what I should do is switching to only using secret objects, would the
plan be something like the following?

1. Add an option to display-reload for switching the display's
password-secret while adding SPICE as a valid display type.
2. Also include the set password action (i.e. disconnect/fail/keep) and
expiration time as part of that option.
3. Extend display-reload to also take an optional display ID for VNC.
4. Deprecate expire_password and set_password.

> Regards,
> Daniel


