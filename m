Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9582F4CEF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:17:18 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgxZ-0003Rf-CG
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzgpZ-0004yy-Ln
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:09:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzgpU-0004TJ-1p
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=av73ndF9ZqgRFz9JL84kDGJ7E8+VWXZSI7aB+gN05k8=;
 b=JanlsIrXsUBV8WxnWTHagMIn20AnCz1FiS7GD6FYLyh2ygy/8ua9x8DTFLb78dQW5PfZI9
 24QH4Sv2s9j77vi+QIhgbhbbzDyWOXUgjT0CQFAgHb/MF/rbiZl+jxxIlKo7sOMB3O6wmv
 1/E2o+BLpvtqcSnBQqV0R40nye6wt6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Yyme8VD-PaStOjbTUy2yHg-1; Wed, 13 Jan 2021 09:08:49 -0500
X-MC-Unique: Yyme8VD-PaStOjbTUy2yHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77357193410E;
 Wed, 13 Jan 2021 14:08:48 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3551F5B4C4;
 Wed, 13 Jan 2021 14:08:48 +0000 (UTC)
Subject: Re: [PATCH v3 5/7] qapi: Introduce QAPI_LIST_APPEND
To: Markus Armbruster <armbru@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-6-eblake@redhat.com>
 <877doh0z01.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cbda6c17-ff87-1937-ee11-fb66aa1053af@redhat.com>
Date: Wed, 13 Jan 2021 08:08:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <877doh0z01.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 7:04 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> Similar to the existing QAPI_LIST_PREPEND, but designed for use where
>> we want to preserve insertion order.  Callers will be added in
>> upcoming patches.  Note the difference in signature: PREPEND takes
>> List*, APPEND takes List**.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  include/qapi/util.h | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 6178e98e97a5..8b4967990c0d 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
>>      (list) = _tmp; \
>>  } while (0)
>>
>> +/*
>> + * For any pointer to a GenericList @tail, insert @element at the back and
>> + * update the tail.
>> + *
>> + * Note that this macro evaluates @element exactly once, so it is safe
>> + * to have side-effects with that argument.
>> + */
>> +#define QAPI_LIST_APPEND(tail, element) do { \
>> +    *(tail) = g_malloc0(sizeof(**(tail))); \
>> +    (*(tail))->value = (element); \
>> +    (tail) = &(*tail)->next; \
>> +} while (0)
>> +
>>  #endif
> 
> You mentioned parenthesizing the lone unparenthesized occurence of
> @tail, like
> 
>   +    (tail) = &(*(tail))->next; \
> 
> Did you decide not to?

Hmm; not sure what happened. I still want the () added.  I'll respin
anyways, since my v3 crossed paths with what you already checked in.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


