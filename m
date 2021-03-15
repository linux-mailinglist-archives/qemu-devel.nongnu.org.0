Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6033B13A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:35:34 +0100 (CET)
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlVV-00049g-Va
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlTV-00034S-Ia
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlTT-0006ot-SA
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVQ+GjfmhiOppx0yxTT/ChqIPXVAecSeN000J7hW7/w=;
 b=UmzjR9yYGVjos8p4rn8ZumobcRLGi4bCKmNMk2kMV8kCFH/0LA5ats9PMQtlgj9DBMCAJu
 y0TKKr1ATpD7xWrGgxCd6DfVlSYKeXshOda0+1dEteIt7FtJhvxhLuLzAxRPheQWKh7bmr
 Q63chZ6h1RPPcmaM7QcXaqzoHFmJuWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-9Zfw0yf0O3uPmpnfqcEpCg-1; Mon, 15 Mar 2021 07:33:22 -0400
X-MC-Unique: 9Zfw0yf0O3uPmpnfqcEpCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F6483DB64;
 Mon, 15 Mar 2021 11:33:21 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 716AB100164C;
 Mon, 15 Mar 2021 11:33:21 +0000 (UTC)
Subject: Re: [PATCH] utils: Reduce chance of rounding inaccuracy in
 qemu_strtosz.
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311200702.1302855-1-eblake@redhat.com>
 <f5648ec4-2a02-2c4e-a865-5c0fcda04436@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d9f498ab-00b8-291d-821b-66c82de90fa2@redhat.com>
Date: Mon, 15 Mar 2021 06:33:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f5648ec4-2a02-2c4e-a865-5c0fcda04436@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 3:48 PM, Richard Henderson wrote:
> On 3/11/21 2:07 PM, Eric Blake wrote:
>> +        /*
>> +         * Add in a fudge-factor (2^53 when double is IEEE format) for
>> +         * all scales less than P (2^50), so that things like
>> +         * 12.345M with unit 1000 produce 12345000 instead of
>> +         * 12344999.
>> +         */
>> +        if (mul > 1e49) {
> 
> The comment says less than, the code says greater than.

Shoot. A demonstration that I did not have an environment that actually
reproduced the bug (and my request for help in figuring out how to kick
off a gitlab CI run that would catch it).

> 
> 
>> An alternative patch might be writing (uint64_t)(fraction * mul + 0.5)
>> (that is, introduce the fudge factor after the multiplication instead
>> of before).  Preferences?
> 
> I think I would prefer this, or for further rounding error reduction,
> fma(fraction, mul, 0.5).

Indeed, fma() sounds a bit nicer at minimizing the chance for double
rounding errors.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


