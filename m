Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0A6AE1D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZY0b-00069F-Nk; Tue, 07 Mar 2023 09:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1pZToA-0001Sp-TN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:40:34 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:13b:3ad0:1::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1pZTo8-0005Ds-HI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pond.sub.org; s=mail;
 t=1678182059; bh=6oar/pWaarIG2nIrpCil7hFeHfH8RuDk5IWtT1fGz1k=;
 h=From:To:Cc:Subject:References:Date:From;
 b=MuAIEXKApgXT3Ynv9Vh0y3dbPkqLwq2wkfLZTadi529H0F6L0FA7y0aYi7dJhRUos
 IsRs53n+oZVjPm5gH42rVlnQgPXIpPTXQg0aKTv4AvXPafRJ0Ki/5rJ4R0ys5AuSLZ
 g/l0loUeM3sJ0wyndRaAf/oSdA1zBFh+K84Zh1Qc=
Received: from blackfin.pond.sub.org
 (p200300d36f462c000d9fccd0dfde6180.dip0.t-ipconnect.de
 [IPv6:2003:d3:6f46:2c00:d9f:ccd0:dfde:6180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id 7633825014
 for <qemu-devel@nongnu.org>; Tue,  7 Mar 2023 10:40:59 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECE8721E6A1F; Tue,  7 Mar 2023 10:40:23 +0100 (CET)
From: Markus Armbruster <armbru@pond.sub.org>
To: libvir-list@redhat.com
Cc: Andrea Bolognani <abologna@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: query-command-line-options (was: [PATCH 1/7] qemu: capabilities:
 Introduce QEMU_CAPS_MACHINE_ACPI)
References: <cover.1677511354.git.pkrempa@redhat.com>
 <8718b22eda052662087087b4ce659b054974c9e0.1677511354.git.pkrempa@redhat.com>
 <CABJz62PHsQHiyo06PtfcDeS1LddYyDw2pC_seObtZcLR5cPQyQ@mail.gmail.com>
 <Y/zng8+7s05O0tRd@angien.pipo.sk>
 <CABJz62OMWXAx_ExYqvvg1DvcHkiP+SkwNMQZ+56QwoHpsNBqGA@mail.gmail.com>
Date: Tue, 07 Mar 2023 10:40:23 +0100
Message-ID: <87jzzsc320.fsf_-_@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a01:4f8:13b:3ad0:1::3;
 envelope-from=armbru@pond.sub.org; helo=oxygen.pond.sub.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Mar 2023 09:09:29 -0500
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

[Resent with cc: qemu-devel and adjusted subject, sorry for the noise]

abologna at redhat.com (Andrea Bolognani) writes:

> On Mon, Feb 27, 2023 at 06:25:23PM +0100, Peter Krempa wrote:
>> On Mon, Feb 27, 2023 at 08:44:57 -0800, Andrea Bolognani wrote:
>> > This looks like you're checking whether -acpi itself exists as a
>> > top-level option. Which it doesn't, but -no-acpi does and yet it
>> > doesn't seem to be advertised in the output of
>> > query-command-line-options?
>>
>> Well, it actually does exist in the output of
>> query-command-line-options, but I have no idea what it means:
>>
>> virsh qemu-monitor-command --pretty cd query-command-line-options | jq .return[].option
>>
>> One of the options is "acpi".
>
> Right, I've seen that. What I wanted to say if that passing it to
> QEMU results in an error:
>
>   $ qemu-system-x86_64 -acpi
>   qemu-system-x86_64: -acpi: invalid option
>
> So it's not really an option, despite being advertised as such. And
> on the opposite end of the spectrum we have -no-acpi, which *does*
> work when passed to QEMU but is nowhere to be found in the JSON
> document returned by query-command-line-options.
>
>> > Basically it looks like there are some serious introspection
>> > shenanigans going on, and I'm not sure we can actually reliably
>> > detect whether -machine acpi can be used until your QEMU patch has
>> > been merged.
>> >
>> > Or I might just have missed something obvious! In which case, please
>> > let me know what it is :)
>>
>> I have no idea what the 'acpi' option does but it certainly mislead me.
>
> I'm not entirely sure, but I think it might be connected to this
> bit of code in vl.c:
>
>   case QEMU_OPTION_acpitable:
>       opts = qemu_opts_parse_noisily(qemu_find_opts("acpi"),
>                                      optarg, true);
>
> This is the handling for the -acpitable option, but notice how "acpi"
> is mentioned as well, to perform some sort of lookup. I think this
> might be the reason why "acpi" gets included in the JSON, while
> "acpitable" doesn't.
>
> Another example I've found is "smp-opts", which seems to be used to
> implement the -smp option. Once again, in the JSON we find "smp-opts"
> instead of "smp".
>
> I think it would be worthwile to check with the QEMU developers and
> make sure that they're aware of this behavior. Is it intended? Is it
> documented anywhere? It certainly seems extremely confusing to me.

query-command-line-options has... issues.

First, it's generally[*] limited to options that use QemuOpts.

Second, it reports configuration group names, which are often, but not
always the same as the option name.  The exceptions you just have to
know.  Group name "acpi" vs. option name "acpitable" is one.

Third, information on option parameters can be incomplete, or missing
entirely.

Fourth, even when it's there, it's often insufficiently detailed.

These are design issues.  I believe the command cannot be fixed, only
replaced.

See my talk "QEMU interface introspection: From hacks to
solutions", KVM Forum 2015.
Video at https://www.youtube.com/watch?v=IEa8Ao8_B9o
Slides at http://www.linux-kvm.org/images/7/7a/02x05-Aspen-Markus_Armbruster-QEMU_interface_introspection.pdf

Questions?


[*] "Generally", because we hacked in a special case to keep "machine"
in its output when we weaned it off QemuOpts.  QEMU commit 40e07370f21.

