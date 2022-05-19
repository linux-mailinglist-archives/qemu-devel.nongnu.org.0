Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CDF52D579
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:02:37 +0200 (CEST)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgjc-0002Yj-4X
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrgeb-0007To-2S
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:57:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrgeZ-0001Q5-7g
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652968641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kYE7bQ/SznEZLE/DR/3X+vcGcOxpGcxvNzxv9lrtGcQ=;
 b=cy2LB9foFMaGArGegxs2BDUIrpiN2cxt7NA9koW1VSlTvjUCULXRVrkH706+YQbymA18Px
 G4+wP9P9LbNm8DaJXUhLpXEh3vMKk6p+mlUJfKV8Rsg2eBtZXzgI5sTfkIMjq053BaGKr7
 Rr5+TTWE0a4uv0gkXZkzTCwdHzecgEE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-4cE_nEObNGCHbzcSTC2EpA-1; Thu, 19 May 2022 09:57:19 -0400
X-MC-Unique: 4cE_nEObNGCHbzcSTC2EpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 909E5803D7B;
 Thu, 19 May 2022 13:57:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F1F740CF8ED;
 Thu, 19 May 2022 13:57:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E431521E690D; Thu, 19 May 2022 15:57:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Michael Roth
 <michael.roth@amd.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Daniel
 P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v4] qga: add guest-get-diskstats command for Linux guests
References: <20220519132745.1724-1-luzhipeng@cestc.cn>
Date: Thu, 19 May 2022 15:57:17 +0200
In-Reply-To: <20220519132745.1724-1-luzhipeng@cestc.cn> (luzhipeng@cestc.cn's
 message of "Thu, 19 May 2022 21:27:45 +0800")
Message-ID: <87y1yxd3r6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

luzhipeng <luzhipeng@cestc.cn> writes:

> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be useful for getting io flow or handling
> IO fault, no need to enter guests.
>
> Signed-off-by: luzhipeng <luzhipeng@cestc.cn>

[...]

> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 4d8e506c9e..75d2bddf4b 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1490,3 +1490,89 @@
>  { 'command': 'guest-ssh-remove-authorized-keys',
>    'data': { 'username': 'str', 'keys': ['str'] },
>    'if': 'CONFIG_POSIX' }
> +
> +##
> +# @GuestDiskStats:
> +#
> +# @read-sectors: sectors read
> +#
> +# @write-sectors: sectors written
> +#
> +# @discard-sectors: sectors discarded
> +#
> +# @read-ios: reads completed successfully
> +#
> +# @read-merges: Number of read requests merged
> +#
> +# @write-ios: writes completed
> +#
> +# @write-merges: Number of write requests merged
> +#
> +# @discard-ios: Number of discards completed successfully
> +#
> +# @discard-merges: NUmber of discard requests merged

Typo in "Number".

> +#
> +# @flush-ios: Number of flush requests completed successfully
> +#
> +# @read-ticks: time spent reading(ms)
> +#
> +# @write-ticks: time spent writing(ms)
> +#
> +# @discard-ticks: time spent discarding(ms)
> +#
> +# @flush-ticks: time spent flushing(ms)
> +#
> +# @ios-pgr: Number of I/Os currently in flight
> +#
> +# @total-ticks: time spent doing I/Os (ms)
> +#
> +# @weight-ticks: weighted time spent doing I/Os since the last update of this field(ms)

Some descriptions start with lower case, some with upper case.
Recommend to pick one and stick with it.  Lower case seems to be more
common in this schema.

> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestDiskStats',
> +  'data': {'*read-sectors': 'uint64',
> +           '*write-sectors': 'uint64',
> +           '*discard-sectors': 'uint64',
> +           '*read-ios': 'uint64',
> +           '*read-merges': 'uint64',
> +           '*write-ios': 'uint64',
> +           '*write-merges': 'uint64',
> +           '*discard-ios': 'uint64',
> +           '*discard-merges': 'uint64',
> +           '*flush-ios': 'uint64',
> +           '*read-ticks': 'uint64',
> +           '*write-ticks': 'uint64',
> +           '*discard-ticks': 'uint64',
> +           '*flush-ticks': 'uint64',
> +           '*ios-pgr': 'uint64',
> +           '*total-ticks': 'uint64',
> +           '*weight-ticks': 'uint64'
> +           } }
> +
> +##
> +# @GuestDiskStatsInfo:
> +#
> +# @name disk name
> +#
> +# @major major of disk
> +#
> +# @minor minor of disk

Major and minor *what*?

> +##
> +{ 'struct': 'GuestDiskStatsInfo',
> +  'data': {'name': 'str',
> +           'major': 'uint64',
> +           'minor': 'uint64',
> +           'stats': 'GuestDiskStats' } }
> +
> +##
> +# @guest-get-diskstats:
> +#
> +# Retrieve information about disk stats.
> +# Returns: List of disk stats of guest.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'guest-get-diskstats',
> +  'returns': ['GuestDiskStatsInfo']
> +}


