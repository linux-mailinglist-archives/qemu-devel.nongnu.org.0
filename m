Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E9167F6B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:58:46 +0100 (CET)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j58pJ-00010V-NK
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j58oQ-0008Pr-Rs
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j58oK-00047N-Nd
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:57:48 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:47165)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j58oK-00046A-4W; Fri, 21 Feb 2020 08:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=pYU73S6+SOgOiQaVf1GGoDmtwanwycFFeeNzWu8q6D8=; 
 b=UcxKK8bbVvve1+ndCEvA8tDCC81yLBWZYW6fvXsVTHWM+YfTC5x/wOaTdf4uAvtgKkPVylb1DeW5z/SN9bj8/p5gEFYkHnSTRBREyq44pQGEJuBHF1locfQs38JPt50qxRSIUbVPJLnNCpQTRAOJUk6luortrCL9KCpjMfA76S2ilVSqPmwuSKY2HcRpfwpvBEjbwsq3u6On/mBSnpG2JlFufZ7PCPMYkxNZawht2Cu8kzx7s529WB04+mV2JY2DKHAL88X9JqubvoGCAyN4tM1sFwzkH8rUzqkQdiT0zruxrrHRns+U5O5tH2h97g82EFUUy+BOQWhZg7M0/cTKow==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j58oH-00050t-85; Fri, 21 Feb 2020 14:57:41 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j58oG-0006cd-Uq; Fri, 21 Feb 2020 14:57:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v3 10/27] qcow2: Update get/set_l2_entry() and add
 get/set_l2_bitmap()
In-Reply-To: <cd7156e2-0400-7c2e-fd5e-65131e214355@redhat.com>
References: <cover.1577014346.git.berto@igalia.com>
 <0229eca3c5199c5383b640f9a041a83ddfcf5b0c.1577014346.git.berto@igalia.com>
 <cd7156e2-0400-7c2e-fd5e-65131e214355@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 21 Feb 2020 14:57:40 +0100
Message-ID: <w518skwqbzf.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 20 Feb 2020 05:27:28 PM CET, Max Reitz wrote:
>> +static inline uint64_t get_l2_bitmap(BDRVQcow2State *s, uint64_t *l2_slice,
>> +                                     int idx)
>> +{
>> +    if (has_subclusters(s)) {
>> +        idx *= l2_entry_size(s) / sizeof(uint64_t);
>> +        return be64_to_cpu(l2_slice[idx + 1]);
>> +    } else {
>> +        /* For convenience only; the caller should ignore this value. */
>> +        return 0;
>
> Is there a reason you decided not to return the first subcluster as
> allocated?  (As you had proposed in v2)

Yeah, I thought that it would not make much sense to return a meaningful
value after a comment saying that the caller should ignore it.

If there was a situation in which something depends on that value then
it would be a bug in QEMU.

Berto

