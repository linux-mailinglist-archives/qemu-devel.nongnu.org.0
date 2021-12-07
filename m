Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6D46C11F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 17:58:11 +0100 (CET)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mudn7-0003ba-SR
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 11:58:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mudhk-0001va-9W
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 11:52:36 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:39144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mudhe-0001Cb-DT
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 11:52:36 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CD79720775;
 Tue,  7 Dec 2021 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638895947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvRK58azeLhZN2IQi4rKd9peqx1S3r1oxFW9TqjPWk0=;
 b=2aKJrgh//zPROo82bYmeQV+oIphe78io7OYWyk+lcvQUoWYY8P1/UqfCSTxaSVsJXtfYDb
 5EkbnmUQ9KDrn66essG4OwDySo5jSdGUBIcilwcvjx5UeaZirqJm4fWjwuG9eMtGd3RWcB
 wnCzUlujqE5+xH/UTkKeBFmiAznjzfk=
Message-ID: <8e032cf7-8aa4-73f9-b978-f2b0d616fff2@greensocs.com>
Date: Tue, 7 Dec 2021 17:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH RFC 00/11] vl: Explore redesign of startup
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211202070450.264743-1-armbru@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, mark.burton@greensocs.com, mirela.grujic@greensocs.com,
 edgar.iglesias@gmail.co, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

It looks promising. I did not think we could so "easily" have a new 
working startup. But I'm not so sure that I understand how we should 
progress from here.

I see 3 main parts in this:
A. introducing new binary (meson, ...)
B. startup api: phase related stuff (maybe more)
C. cli to qmp parser

I think if we want to add a new binary (instead of replace it), there 
will be some common api and every startup will have to support/implement 
it. Probably some part of vl.c will have to go in some common code.
In practice, we probably should introduce/extract this before 
introducing the new binary.

One central part of this api is the phase mechanism (even if legacy 
startup can only support it partially or not-at-all).

I think we have 2 choices:
+ we have to use until_phase explicitly
+ we make qmp commands implicitly advances phases when needed.

I think it's better to go the implicit way as much as possible: it means 
we focus on commands and not on some artificial phases we set up because 
of legacy.

Either way, we probably should put the phase info in qapi so that we 
don't have to hardcode that in every command in order to have common 
error handling. One thing we could do is replace "allow-preconfig" in 
qapi by some phase requirement entry(entries?) and make qmp call 
qemu_until_phase() or some qemu_phase_check() function.

We also maybe need to sort out if we want to merge the phases into the 
runstate.

Thanks for making the effort to do this rfc,
--
Damien

On 12/2/21 08:04, Markus Armbruster wrote:
> These patches are meant to back the memo "Redesign of QEMU startup &
> initial configuration" I just posted.  Read that first, please.
> 
> My running example for initial configuration via QMP is cold plug.  It
> works at the end of the series.
> 
> I'm taking a number of shortcuts:
> 
> * I hack up qemu-system-FOO instead of creating an alternate program.
>    Just so I don't have to mess with Meson.
> 
> * Instead of creating QAPI/CLI infrastructure, I use QMP as CLI: each
>    argument is interpreted as QMP command.  This is certainly bad CLI,
>    but should suffice to demonstrate things.
> 
> * Instead of feeding the CLI's QMP commands to the main loop via a
>    quasi-monitor, I send them directly to the QMP dispatcher.  Simpler,
>    but I'm not sure that's going to work for all QMP commands we want.
> 
> * Phase advance is by explicit command @until-phase only.  Carelessly
>    named.  We may want some other commands to advance the phase
>    automatically.
> 
> * There are no safeguards.  You *can* run QMP commands in phases where
>    they crash.  Data corruption is left as an exercise for the reader.
> 
> * Possibly more I can't remember right now :)
> 
> Markus Armbruster (11):
>    vl: Cut off the CLI with an axe
>    vl: Drop x-exit-preconfig
>    vl: Hardcode a QMP monitor on stdio for now
>    vl: Hardcode a VGA device for now
>    vl: Demonstrate (bad) CLI wrapped around QMP
>    vl: Factor qemu_until_phase() out of qemu_init()
>    vl: Implement qemu_until_phase() running from arbitrary phase
>    vl: Implement qemu_until_phase() running to arbitrary phase
>    vl: New QMP command until-phase
>    vl: Disregard lack of 'allow-preconfig': true
>    vl: Enter main loop in phase @machine-initialized
> 
>   qapi/misc.json             |   27 -
>   qapi/phase.json            |   31 +
>   qapi/qapi-schema.json      |    1 +
>   include/hw/qdev-core.h     |   31 -
>   hw/core/machine-qmp-cmds.c |    1 +
>   hw/core/machine.c          |    1 +
>   hw/core/qdev.c             |    7 +
>   hw/pci/pci.c               |    1 +
>   hw/usb/core.c              |    1 +
>   hw/virtio/virtio-iommu.c   |    1 +
>   monitor/hmp-cmds.c         |    8 -
>   monitor/hmp.c              |    1 +
>   softmmu/qdev-monitor.c     |    3 +
>   softmmu/vl.c               | 2833 ++----------------------------------
>   ui/console.c               |    1 +
>   MAINTAINERS                |    1 +
>   hmp-commands.hx            |   18 -
>   qapi/meson.build           |    1 +
>   18 files changed, 180 insertions(+), 2788 deletions(-)
>   create mode 100644 qapi/phase.json
> 

