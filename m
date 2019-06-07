Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DC38990
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 13:58:35 +0200 (CEST)
Received: from localhost ([::1]:49006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZDVz-00058z-41
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 07:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hZD9P-0005bp-EY
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 07:35:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hZD9O-0005yC-4q
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 07:35:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hZD9N-0005uM-HK
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 07:35:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so1797588wre.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 04:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=35L3guB2GocBsSUOvp8WOL/D7/3shmEx+wU39bYNBRE=;
 b=eRLNz04EzH4lQKz7T4P9pi74oe4Qx2pEIRDGFnkghI3tzeOgpmKLX1Humi/Ct/PGVk
 QqIxfgeZDDkmiJ++fl00/eTPyPLEk9q478ZplS/oQOgk3KS2qsPuUdXo/PLhcwvZlSJP
 FzkdjeMeyJXmsrizrCvuUemNEV1/SUDojapy+HeEVcyOC+/GLRuiRckr33NFyQWYZbk1
 r2nNAeOubLxYldgsnp90pZ/BZsiSjKn5nhs4ESHNySnG3m2QDyYBp4FoavqiqFFc3HDJ
 1PChpGykqtP7DDHJ27zA6U7NEyMcrbTk2fhog7FTIewB2s37hptBM2iovEdf68I7ycqy
 XvOg==
X-Gm-Message-State: APjAAAXnvItWtTLiDMpxWqNJvDe6HdytPhp9y5k5nKeQfEfTKm26OvmI
 tY09Z1gD2OMiiZPow1w7F6gIRQ==
X-Google-Smtp-Source: APXvYqzL+YF+633ns7joG9ZveqT8Gz6+r4DIezclUfdVasNPI0lXScXPC7DhUVRV1CxBnzUiaSHWdg==
X-Received: by 2002:adf:f18d:: with SMTP id h13mr2703558wro.120.1559907311114; 
 Fri, 07 Jun 2019 04:35:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d43d:6da3:9364:a775?
 ([2001:b07:6468:f312:d43d:6da3:9364:a775])
 by smtp.gmail.com with ESMTPSA id s10sm884167wmf.8.2019.06.07.04.35.10
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 04:35:10 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>
References: <87woihi1wl.fsf@dusky.pond.sub.org>
 <564efcce-64ac-0a39-8899-f6b6d6d7984e@redhat.com>
 <871s05g5ub.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3a4ce577-0744-6ff7-9f7e-9239fe5d4333@redhat.com>
Date: Fri, 7 Jun 2019 13:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <871s05g5ub.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] qapi/misc.json is too big,
 let's bite off a few chunks
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/06/19 10:25, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 23/05/19 18:14, Markus Armbruster wrote:
>>> * Machine core (Eduardo, Marcel)
>>>
>>>   query-machines, query-current-machine, 
>>>
>>>   ~60 lines.  Hardly worthwhile from a "let's shrink misc.json" point of
>>>   view.  Might be worthwhile from a "let's make get_maintainers.pl
>>>   work".
>>>
>>> * CPUs (Paolo, Richard)
>>>
>>>   query-cpus, query-cpus-fast
>>>
>>>   ~300 lines.  The commands are implemented in cpus.c, which MAINTAINERS
>>>   covers both under "Main loop" and under "Guest CPU cores (TCG) /
>>>   Overall".  Neither feels right to me for these QMP commands.
>>>
>>> * NUMA (Eduardo)
>>>
>>>   query-memdev, set-numa-node
>>>
>>>   ~200 lines.
>>
>> I would move all three of these and add a new entry to MAINTAINERS.
> 
> Double-checking: do you propose to move all three to a single new QAPI
> module, with a new MAINTAINERS entry covering just the new QAPI module?
> If yes, care to propose a QAPI module file name, a MAINTAINERS head
> line, and maintainers?

Just one, qapi/machine.json, with a MAINTAINERS patch based on this one.
 We could probably create a new directory hw/machine too.

diff --git a/MAINTAINERS b/MAINTAINERS
index a96829ea83..9bf3e6b670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1274,8 +1274,12 @@ S: Supported
 F: hw/core/machine.c
 F: hw/core/null-machine.c
 F: hw/cpu/cluster.c
+F: numa.c
+F: qom/cpu.c
 F: include/hw/boards.h
 F: include/hw/cpu/cluster.h
+F: include/qom/cpu.h
+F: include/sysemu/numa.h
 T: git https://github.com/ehabkost/qemu.git machine-next

 Xtensa Machines
@@ -1839,12 +1843,6 @@ M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: scripts/coverity-model.c

-CPU
-L: qemu-devel@nongnu.org
-S: Supported
-F: qom/cpu.c
-F: include/qom/cpu.h
-
 Device Tree
 M: Alistair Francis <alistair.francis@wdc.com>
 R: David Gibson <david@gibson.dropbear.id.au>
@@ -1947,13 +1945,6 @@ W: http://info.iet.unipi.it/~luigi/netmap/
 S: Maintained
 F: net/netmap.c

-NUMA
-M: Eduardo Habkost <ehabkost@redhat.com>
-S: Maintained
-F: numa.c
-F: include/sysemu/numa.h
-T: git https://github.com/ehabkost/qemu.git machine-next
-
 Host Memory Backends
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>


> Or do you propose to create three QAPI modules machine.json, cpus.json,
> numa.json, with machine.json filed in MAINTAINERS under "Machine core",
> numa.json under "NUMA", and cpus.json under a new entry?
> 


