Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B776905DF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4cF-0003hD-RA; Thu, 09 Feb 2023 05:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ4c7-0003gO-JU
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ4c1-00050D-Q6
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675940228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0e+TZG+HQvhSK5upqLtRtbXe16CUD6PZTjWM4goZv+c=;
 b=dfOCc8H6s8pYIbuaQVHPkOjma18B3hgFq6ywZA6pCCo16yJM//gjzGWPXXnbQWAVSCMmCm
 7NvIif3iweHcYUNNMw/9HG93SgCkrhI2H0DswDH3EH+ubmF40Er9usAkAwKywN+CzrOnnX
 ju4PcGq+MyBtled3TIVzhp70RoXKcoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-lz8k5M2ZPQigz2vSATnn5w-1; Thu, 09 Feb 2023 05:57:02 -0500
X-MC-Unique: lz8k5M2ZPQigz2vSATnn5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13F141875044;
 Thu,  9 Feb 2023 10:57:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B092440398A0;
 Thu,  9 Feb 2023 10:57:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F2FB21E6A1F; Thu,  9 Feb 2023 11:57:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Mark Burton <mburton@qti.qualcomm.com>,
 Luc Michel <luc@lmichel.fr>,  Bernhard Beschow <shentey@gmail.com>,  Bin
 Meng <bin.meng@windriver.com>,  Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: Can we unpoison CONFIG_FOO macros?
References: <87lel9o56z.fsf@pond.sub.org>
 <82627608-0daf-e8f6-c4a5-d8217cd538f5@redhat.com>
Date: Thu, 09 Feb 2023 11:57:00 +0100
In-Reply-To: <82627608-0daf-e8f6-c4a5-d8217cd538f5@redhat.com> (Thomas Huth's
 message of "Tue, 7 Feb 2023 21:54:51 +0100")
Message-ID: <87zg9n5coz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Thomas Huth <thuth@redhat.com> writes:

> On 07/02/2023 16.39, Markus Armbruster wrote:
>> We have a boatload of CONFIG_FOO macros that may only be used in
>> target-dependent code.  We use generated config-poison.h to enforce.
>> This is a bit annoying in the QAPI schema.  Let me demonstrate with an
>> example: QMP commands query-rocker, query-rocker-ports, and so forth.
>> These commands are useful only with "rocker" devices.  They are
>> compile-time optional.  hw/net/Kconfig:
>>      config ROCKER
>>          bool
>>          default y if PCI_DEVICES
>>          depends on PCI && MSI_NONBROKEN
>> The rocker device and QMP code is actually target-independent:
>> hw/net/meson.build puts it into softmmu_ss.
>> Disabling the "rocker" device type ideally disables the rocker QMP
>> commands, too.  Should be easy enough: 'if': 'CONFIG_FOO' in the QAPI
>> schema.
>> Except that makes the entire code QAPI generates for rocker.json
>> device-dependent: it now contains #if defined(CONFIG_ROCKER), and
>> CONFIG_ROCKER is poisoned.  The rocker code implementing monitor
>> commands also becomes device-dependent, because it includes generated
>> headers.  We compile all that per target for no sane reason at all.
>
> Well, CONFIG_ROCKER depends on the target config, so that is a sane reason in my eyes. Depending on which target you currently compile, it's either set or not set - there is no reasonable way to compile generic code and still test the CONFIG_ROCKER macro.
>
> So adding such a switch to rocker.json itself just cannot work.
>
> But at the "make" level, we distinguish between config-all-devices.mak and *-softmmu-config-devices.mak , so if you want to disable the rocker QMP code depending on whether CONFIG_ROCKER is set in *any* target binary or not, you would need a similar mechanism to config-all-devices.mak here, e.g. something that would switch the inclusion of rocker.json on or off depending on the switch in config-all-devices.mak ...
> Would it be possible to add such a switch to qapi/meson.build ?
> ... and to qapi/qapi-schema.json, I guess, since the rocker.json gets included from there? Something like that:
>
> diff --git a/qapi/meson.build b/qapi/meson.build
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -59,9 +59,11 @@ if have_system
>      'qdev',
>      'pci',
>      'rdma',
> -    'rocker',
>      'tpm',
>    ]
> +  if config_all_devices.has_key('CONFIG_ROCKER')
> +    qapi_all_modules += [ 'rocker', ]
> +  endif
>  endif
>  if have_system or have_tools
>    qapi_all_modules += [
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -72,7 +72,7 @@
>  { 'include': 'job.json' }
>  { 'include': 'net.json' }
>  { 'include': 'rdma.json' }
> -{ 'include': 'rocker.json' }
> +{ 'include': 'rocker.json', 'if': 'CONFIG_ROCKER' }
>  { 'include': 'tpm.json' }
>  { 'include': 'ui.json' }
>  { 'include': 'authz.json' }
>
> No clue whether the qapi parser could be extended like that, though...

Feels feasible.

I had vague ideas going this direction, too.  Thanks for fleshing them
out for me!

Hmm, we have somewhat hairy code in qapi/meson.build to enumerate the
QAPI modules and generated source files, and to add them to the right
source sets.  Perhaps we could have qapi-gen generate some of that.


