Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703A2B1BDA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:26:44 +0100 (CET)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZ6B-0006Mo-7n
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdZ4X-0005cH-PN
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdZ4V-0004Px-4C
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605273898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tpCd8BmYZfcNFXOGb6FWai6J+YxWuBsEaf7TfR4Sy4Y=;
 b=BrVMUwYDcNiqyZX/+Q5iAe61ghaE+zQAbNwJ0SURWQ+sk8kdacDc8BeUcplTeVChFJf+RR
 EcH0pNVE86Fx06eU1CCCfbUbBVDUsVTdcrhsXhWH2KQ39VYPwxSahs6FfllPiE2yjDeas2
 YhuqMDdCFtHialRlrn/wndtv2bgvH8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-pJvcmBN6OiKOn9eYoX6jbw-1; Fri, 13 Nov 2020 08:24:56 -0500
X-MC-Unique: pJvcmBN6OiKOn9eYoX6jbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5CB1186DD47
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:24:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D696EF48;
 Fri, 13 Nov 2020 13:24:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CA3B11386A0; Fri, 13 Nov 2020 14:24:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/6] migration: Fix migrate-set-parameters argument
 validation
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-3-armbru@redhat.com>
 <20201113114926.GF3251@work-vm>
Date: Fri, 13 Nov 2020 14:24:54 +0100
In-Reply-To: <20201113114926.GF3251@work-vm> (David Alan Gilbert's message of
 "Fri, 13 Nov 2020 11:49:26 +0000")
Message-ID: <87tuttfkyh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
>> Commit 741d4086c8 "migration: Use proper types in json" (v2.12.0)
>> switched MigrationParameters to narrower integer types, and removed
>> the simplified qmp_migrate_set_parameters()'s argument checking
>> accordingly.
>> 
>> Good idea, except qmp_migrate_set_parameters() takes
>> MigrateSetParameters, not MigrationParameters.  Its job is updating
>> migrate_get_current()->parameters (which *is* of type
>> MigrationParameters) according to its argument.  The integers now get
>> truncated silently.  Reproducer:
>> 
>>     ---> {'execute': 'query-migrate-parameters'}
>>     <--- {"return": {[...] "compress-threads": 8, [...]}}
>>     ---> {"execute": "migrate-set-parameters", "arguments": {"compress-threads": 257}}
>>     <--- {"return": {}}
>>     ---> {'execute': 'query-migrate-parameters'}
>>     <--- {"return": {[...] "compress-threads": 1, [...]}}
>> 
>> Fix by resynchronizing MigrateSetParameters with MigrationParameters.
>
> Having those two separate types is a pain!

It is!

MigrateSetParameters is the argument of migrate-set-parameters,
MigrationParameters is the result of query-migrate-parameters and part
of the internal migration state.

Differences:

(1) Optional members

    For migrate-set-parameters, we need *all* members to be optional.

    For migration state and query-migrate-parameters, we want only some
    members to be optional (currently only @tls-authz, I think).

(2) Special values

    migrate-set-parameters has a "reset to default, whatever that may
    be" feature for some members (currently only @tls-creds,
    @tls-hostname, @tls-authz, I think).  Doing that cleanly requires an
    additonal value.

The first attempt to fuse the two types (commit de63ab6124 "migrate:
Share common MigrationParameters struct", 2016-10-13) took care of (1).
Introspection of query-migrate-parameters became mildly misleading (it
claims members are optional that aren't), and C code dealing with
migration state had to take care to set the has_FOO = true.  Tolerable.

I had to revert it to address (2) cleanly and in time: commit 01fa559826
"migration: Use JSON null instead of "" to reset parameter to default",
2017-07-24.

A second try needs to take care of (2) as well.  Messes up
query-migrate-parameters some more: introspection claims a few members
can be null that can't.

Is the "reset" feature is worth all that trouble?  Is overloading
migrate-set-parameters a good idea?

>> Fixes: 741d4086c856320807a2575389d7c0505578270b
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!


