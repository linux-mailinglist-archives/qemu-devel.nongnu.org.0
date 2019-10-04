Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B5CB444
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 07:54:47 +0200 (CEST)
Received: from localhost ([::1]:42438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGGYA-0007vD-BN
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 01:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iGGWo-00070J-Pk
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 01:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iGGWn-0008Eh-MG
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 01:53:22 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:37160)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iGGWn-0008De-Gm
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 01:53:21 -0400
Received: from player746.ha.ovh.net (unknown [10.108.42.196])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 043642513D1
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 07:53:18 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id AB716AA646FE;
 Fri,  4 Oct 2019 05:53:14 +0000 (UTC)
Subject: Re: [PATCH 2/7] spapr, xive: Turn "nr-ends" property into
 "nr-servers" property
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <157010404888.246126.9768030542733152637.stgit@bahia.lan>
 <157010406203.246126.13381271918474281392.stgit@bahia.lan>
 <20191004040725.GB27597@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6313a1ea-f891-d7a0-c5f1-ecf656b58bc3@kaod.org>
Date: Fri, 4 Oct 2019 07:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191004040725.GB27597@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16018740927404084032
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.174.144
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> @@ -283,11 +292,13 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>  
>> -    if (!xive->nr_ends) {
>> -        error_setg(errp, "Number of interrupt needs to be greater 0");
>> +    if (!xive->nr_servers) {
>> +        error_setg(errp, "Number of interrupt servers must be greater than 0");
>>          return;
>>      }
>>  
>> +    xive->nr_ends = spapr_xive_vcpu_id_to_end_idx(xive->nr_servers);
> 
> I'd prefer not to store both nr_servers and nr_servers * 8 in the
> structure.  I think you just want xive->nr_servers, then derive it any
> any places that current look at xive->nr_ends.

Yes I agree. This is a small change.

C. 

