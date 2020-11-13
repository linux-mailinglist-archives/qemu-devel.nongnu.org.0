Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FA2B1BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:37:43 +0100 (CET)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZGo-0002t6-6e
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdZF5-0002N4-Lb
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdZF3-0008WO-B2
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605274552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9iN93joopWtVhYVZkdUyw4MD5pisYyfosIs2CISk+Eo=;
 b=ZShtfY1ocZi8B/+Qp8zHsEAKuCp+fiYC7/S0lbjmNd6YyOsDtEo1qAga/NnRDg2pKdzn95
 nlWEa1hKmkp9XA5J+wE7+zKSv/6doJ4LhKvunfDIBLLuhl3G35YFLddN7qfaLyaIjQZKV+
 rUzlua3oPMaxBT3/jChv8o7UsVFJ1l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-ZvhxjMygMBC6UVv4yavR9w-1; Fri, 13 Nov 2020 08:35:49 -0500
X-MC-Unique: ZvhxjMygMBC6UVv4yavR9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7771108E1A5
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:35:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6506EF48;
 Fri, 13 Nov 2020 13:35:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3296911386A0; Fri, 13 Nov 2020 14:35:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 4/6] migration: Check xbzrle-cache-size more carefully
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-5-armbru@redhat.com>
 <20201113105940.GC3251@work-vm>
Date: Fri, 13 Nov 2020 14:35:47 +0100
In-Reply-To: <20201113105940.GC3251@work-vm> (David Alan Gilbert's message of
 "Fri, 13 Nov 2020 10:59:40 +0000")
Message-ID: <87pn4hfkgc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> migrate-set-parameters passes the size to xbzrle_cache_resize().
>> xbzrle_cache_resize() checks it fits into size_t before it passes it
>> on to cache_init().  cache_init() checks it is a power of two no
>> smaller than @page_size.
>> 
>> cache_init() is also called from xbzrle_init(), bypassing
>> xbzrle_cache_resize()'s check.
>> 
>> Drop xbzrle_cache_resize()'s check, and check more carefully in
>> cache_init().
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  migration/page_cache.c | 15 ++++-----------
>>  migration/ram.c        |  7 -------
>>  2 files changed, 4 insertions(+), 18 deletions(-)
>> 
>> diff --git a/migration/page_cache.c b/migration/page_cache.c
>> index b384f265fb..e07f4ad1dc 100644
>> --- a/migration/page_cache.c
>> +++ b/migration/page_cache.c
>> @@ -41,17 +41,10 @@ struct PageCache {
>>  PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
>>  {
>>      int64_t i;
>> -    size_t num_pages = new_size / page_size;
>> +    uint64_t num_pages = new_size / page_size;
>>      PageCache *cache;
>>  
>> -    if (new_size < page_size) {
>> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
>> -                   "is smaller than one target page size");
>> -        return NULL;
>> -    }
>> -
>> -    /* round down to the nearest power of 2 */
>> -    if (!is_power_of_2(num_pages)) {
>> +    if (num_pages != (size_t)num_pages || !is_power_of_2(num_pages)) {
>>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
>>                     "is not a power of two number of pages");
>
> That error message is now wrong since it includes a whole bunch of
> reasons.

We could argue about "wrong", but I readily concedede it needs
improvement:

    Parameter 'cache size' expects is not a power of two number of pages

is crap.  I fixed similar crap in my "[PATCH 00/10] Chipping away at
qerror.h", but missed this one.

What about

    Parameter 'xbzrle-cache-size' expects a power of two larger than $page_size

?

> Also, the comparison is now on the divided num_pages, it's not that
> obvious to me that checking the num_pages makes sense in acomparison to
> checking the actual cache size.

Would you accept

    if (!is_power_of_2(new_size)
        || !num_pages || num_pages != (size_t)num_pages) {

?

If not, please propose something you like better.

> (Arguably the check should also happen in migrate_params_test_apply)

Feels like one bridge too far for this patch.


