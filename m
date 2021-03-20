Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F97343057
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 00:38:18 +0100 (CET)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNlAf-0000ga-D1
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 19:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNl9P-00088h-A2
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 19:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNl9N-0008EW-Et
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 19:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616283416;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yve6PgsFt8dWYRD336czqiHpbck1RcdGJ3xR4NW5SIM=;
 b=QO3d3NtImFDibnE2p9L2qED51xbYbXjrxO0qfsz05iSYGs4QrUlsZ/sujgT3NclKCccQch
 Z/AuDBlipFMT/tm5LtjMl145g8ylfaLLWY2+qIxa+77avA51dTf2R880NaJd47Oh5Z7EB0
 yx/AEt0t4RQsA5w99iLjSPW7e4whB18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-psPpqT4nNFahZS06huj-AQ-1; Sat, 20 Mar 2021 19:36:54 -0400
X-MC-Unique: psPpqT4nNFahZS06huj-AQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A74A801817;
 Sat, 20 Mar 2021 23:36:53 +0000 (UTC)
Received: from [10.64.54.40] (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C22360C5A;
 Sat, 20 Mar 2021 23:36:50 +0000 (UTC)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0798e22b-4aed-7f72-5e77-4520d9cc010b@redhat.com>
Date: Sun, 21 Mar 2021 10:36:47 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: thuth@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com, laurent@vivier.eu,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo and Richard,

On 3/21/21 9:33 AM, Richard Henderson wrote:
> On 3/20/21 11:52 AM, Paolo Bonzini wrote:
>>> +int main(void)
>>> +{
>>> +    return read_y();
>>> +}
>>
>> I think this should be "read_y() == 1 ? 0 : 1".
> 
> As a testcase returning 0 on success, yes.
> 

Ok. I will include the changes in v2. Also, I will
wrap the lines, for example:

int main(void) { return (read_y() == 1) ? 0 : 1; }

if compile_prog "" "" && $TMPE >/dev/null 2>/dev/null; then
    attralias=yes
fi

>> I can reproduce it with -flto -O2 but not without -flto, do you agree?
> 
> Agreed.  Replicated with a random recent gcc 11 snapshot.
> This is really annoying of lto.  It's clear something needs to change though.
> 

The command I used is:

gcc -O2 -flto=auto config-temp.c config-temp-b.c -o config-temp.exe.

Removing "-O2" or "-flto=auto" can make the gcc alias attribute workable again.

>> Perhaps we can obtain the same optimization by wrapping reads of the page size in an inline __attribute__((const)) function.  Richard, what do you think?
> 
> I'll give it a shot and see what happens.
> 

Thanks,
Gavin


