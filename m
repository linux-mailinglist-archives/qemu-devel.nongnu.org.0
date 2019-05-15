Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E4F1EC20
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 12:31:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQrCX-0007WR-54
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 06:31:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hQr8i-0005IC-Iq
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hQr8h-0007jK-Js
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:28:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hQr8f-0007ei-Vm
	for qemu-devel@nongnu.org; Wed, 15 May 2019 06:27:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4404D81F0F
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 10:27:55 +0000 (UTC)
Received: from redhat.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9CB01001F58;
	Wed, 15 May 2019 10:27:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
In-Reply-To: <20190226114852.GE2721@work-vm> (David Alan Gilbert's message of
	"Tue, 26 Feb 2019 11:48:52 +0000")
References: <20190220125755.3906-1-quintela@redhat.com>
	<20190220125755.3906-2-quintela@redhat.com>
	<20190226114852.GE2721@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 15 May 2019 12:27:52 +0200
Message-ID: <87k1esj9lj.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 15 May 2019 10:27:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] migration: Add multifd-compress
 parameter
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>

>> +    case MIGRATION_PARAMETER_MULTIFD_COMPRESS:
>> +        p->has_multifd_compress = true;
>> +        visit_type_enum(v, param, &compress_type,
>> +                        &MultifdCompress_lookup, &err);
>> +        if (err) {
>> +            break;
>> +        }
>> +        if (compress_type < 0 || compress_type > MULTIFD_COMPRESS__MAX) {
>
> I think that needs to be >= rather than >
> (Actually it surprises me visit_type_enum doesn't turn those cases into
> errors)

You are right.

>> @@ -81,6 +81,7 @@
>>  /* The delay time (in ms) between two COLO checkpoints */
>>  #define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
>>  #define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>> +#define DEFAULT_MIGRATE_MULTIFD_COMPRESS false
>
> Shouldn't that be an enum value?

Fixed

>> +
>> +##
>> +# @MultifdCompress:
>> +#
>> +# An enumeration of multifd compression.
>> +#
>> +# @none: no compression.
>> +#
>> +# @zlib: Compress using zlib.
>> +#
>> +# Since: 3.1
>
> 4.

fixed.

>>  # @max-cpu-throttle: maximum cpu throttle percentage.
>>  #                    Defaults to 99. (Since 3.1)
>> +#
>> +# @multifd-compress: What compression method to use.
>> +#                    Defaults to none. (Since 4.0)
>> +#
>
> I think that should be 'Which' rather than 'What'.

You are the native speaker.

>>  # Since: 2.4
>>  ##
>>  { 'enum': 'MigrationParameter',
>> @@ -568,7 +572,7 @@
>>             'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
>>             'multifd-channels',
>>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>> -           'max-cpu-throttle' ] }
>> +           'max-cpu-throttle', 'multifd-compress' ] }
>>  
>>  ##
>>  # @MigrateSetParameters:
>> @@ -644,7 +648,10 @@
>>  #                     (Since 3.0)
>>  #
>>  # @max-cpu-throttle: maximum cpu throttle percentage.
>> -#                    The default value is 99. (Since 3.1)
>> +#                    The default value is 99. (Since 4.0)
>
> That change is wrong?

Fixed.

Thanks, Juan.

