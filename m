Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5EF300AC7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:12:36 +0100 (CET)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30vD-0005aW-2i
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l30tZ-0004TM-3R
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l30tU-00043f-Vb
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611339046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdBTMjRfbsJeYSVLLk6LJ0bD1y9t7njnYwx5nX5P8kA=;
 b=TZbQtQpCWsFuOc1diCrwe3go7C0nDeOgHE3t/8mYRpypwgp5BlQoxbg/g2ykSmpl9qElIC
 myD8CtTVOwb14wfPgqt4MChKKiH6xff9kcQZ0O0wDS5JsQL2w5LKNYPCCU3WyFhCxWxp1X
 mDK2Oe23UZL+Bk9UjW+NcFyacth5VMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-tNhqzPXWOkKvsHafd_KYig-1; Fri, 22 Jan 2021 13:10:42 -0500
X-MC-Unique: tNhqzPXWOkKvsHafd_KYig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E84178030A1;
 Fri, 22 Jan 2021 18:10:40 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2285D960;
 Fri, 22 Jan 2021 18:10:39 +0000 (UTC)
Subject: Re: [PATCH v7 14/35] Hexagon (target/hexagon) instruction printing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-15-git-send-email-tsimpson@quicinc.com>
 <4d5081d9-3b7b-4a9c-5007-04f0b5da3f73@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <63d4f82c-1e1a-7986-9a5b-c0609e430d53@redhat.com>
Date: Fri, 22 Jan 2021 12:10:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4d5081d9-3b7b-4a9c-5007-04f0b5da3f73@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 11:58 AM, Philippe Mathieu-Daudé wrote:

>> +#include "qemu/osdep.h"
>> +#include "insn.h"
>> +
>> +extern void snprint_a_pkt_disas(GString *buf, Packet *pkt, uint32_t *words,
>> +                                target_ulong pc);
>> +extern void snprint_a_pkt_debug(GString *buf, Packet *pkt);
> 
> No need to declare prototypes in header with 'extern'...
> (also noticed in other patches).

Using the extern on function declarations is not wrong (in fact, some
projects prefer to use extern for everything in a header, regardless of
whether it is function or data, rather than just limiting it to data).
But you do have a point that it's not common practice in qemu, and local
consistency is better than any habits you've picked up in other projects.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


