Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7E30C9D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:31:02 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70S4-00024f-Tt
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l70CB-0001zV-Mz
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l70C7-00006k-Dd
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612289670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1igSmcgArR5tFj7s1L+gOYKq+dX7NwjoT27cwn3tPU=;
 b=hl/jddZ1l8c07sZsR3RzQ5Cgiuxfrh9EP8tj/RjkRKG/rnCC7gjxGeXT84OzqTgNn9l5XX
 9U5dM/xzXcgnK9Cn2AxkURstj8+F9xgsIny6ZCyv28IaaTq5xFXK6H0YWQxtjWmRA3Aul0
 cLcylcWf5FB7SP806Zm2+6SP/rJLBhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-BIoqvlbTPTiWOB7ms7rgRg-1; Tue, 02 Feb 2021 13:14:26 -0500
X-MC-Unique: BIoqvlbTPTiWOB7ms7rgRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756C9B8103;
 Tue,  2 Feb 2021 18:14:25 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C80A19C71;
 Tue,  2 Feb 2021 18:14:24 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210202154138.246464-1-berrange@redhat.com>
 <20210202154138.246464-13-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v10 12/12] migration: introduce
 snapshot-{save,load,delete} QMP commands
Message-ID: <02126b54-f7eb-5ad7-b7f0-b66e60b26b50@redhat.com>
Date: Tue, 2 Feb 2021 12:14:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202154138.246464-13-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 9:41 AM, Daniel P. Berrangé wrote:
> savevm, loadvm and delvm are some of the few HMP commands that have never
> been converted to use QMP. The reasons for the lack of conversion are
> that they blocked execution of the event thread, and the semantics
> around choice of disks were ill-defined.
> 

> Note that the existing "query-named-block-nodes" can be used to query
> what snapshots currently exist for block nodes.
> 
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c                            | 184 +++++++
>  qapi/job.json                                 |   9 +-
>  qapi/migration.json                           | 157 ++++++
>  .../tests/internal-snapshots-qapi             | 386 +++++++++++++
>  .../tests/internal-snapshots-qapi.out         | 520 ++++++++++++++++++

Not this patch's fault: I find the name tests/qemu-iotests/tests/name to
be rather long and a bit repetitive; maybe we want to rename the
directory structure to something simpler, like:

tests/iotests/name

(that is, move the named tests into a sibling directory of
qemu-iotests/check, rather than a subdirectory).  And maybe rename
qemu-iotests/check to something that requires less typing.  Oh, and
while I'm asking for rainbows and ponies, being able to run check from
the same directory where I run make, instead of having to change
directories, would be nice.  But as I said, that's a wish list for a
separate series.

For _this_ patch,

> +++ b/migration/savevm.c

> +++ b/qapi/migration.json

> +# Example:
> +#
> +# -> { "execute": "snapshot-save",
> +#      "data": {
> +#         "job-id": "snapsave0",
> +#         "tag": "my-snap",
> +#         "vmstate": "disk0",
> +#         "devices": ["disk0", "disk1"]
> +#      }
> +#    }
> +# <- { "return": { } }
> +# <- {"event": "JOB_STATUS_CHANGE",
> +#     "data": {"status": "created", "id": "snapsave0"}}

Nice example here with events...

> +##
> +# @snapshot-delete:
> +#
> +# Delete a VM snapshot
> +#
> +# @job-id: identifier for the newly created job
> +# @tag: name of the snapshot to delete.
> +# @devices: list of block device node names to delete a snapshot from
> +#
> +# Applications should not assume that the snapshot save is complete
> +# when this command returns. The job commands / events must be used
> +# to determine completion and to fetch details of any errors that arise.

...which makes this paragraph feel out of place: there is no snapshot
save going on during snapshot-delete, and...

> +#
> +# Returns: nothing
> +#
> +# Example:
> +#
> +# -> { "execute": "snapshot-delete",
> +#      "data": {
> +#         "job-id": "snapdelete0",
> +#         "tag": "my-snap",
> +#         "devices": ["disk0", "disk1"]
> +#      }
> +#    }
> +# <- { "return": { } }

...the example shows no events.  On the other hand...

> +++ b/tests/qemu-iotests/tests/internal-snapshots-qapi
> @@ -0,0 +1,386 @@
> +#!/usr/bin/env bash
> +# group: rw auto quick snapshot
> +#

> +_cleanup()
> +{
> +    _cleanup_qemu
> +    _cleanup_test_img
> +    TEST_IMG="$TEST_IMG.alt1" _cleanup_test_img
> +    TEST_IMG="$TEST_IMG.alt2" _cleanup_test_img
> +    rm -f "$SOCK_DIR/nbd"

$SOCK_DIR/nbd seems like a rather generic name, liable to collide with
other tests.  Oh right, we still haven't improved './check' to be able
to run tests in parallel each in their own subdirectory, so we aren't
pulling the rug out from any other parallel test because there are no
other parallel tests.


> +run_delete()
> +{
> +    local job=$1
> +    local devices=$2
> +    local fail=$3
> +
> +    _send_qemu_cmd $QEMU_HANDLE "{\"execute\": \"snapshot-delete\",
> +                                  \"arguments\": {
> +                                     \"job-id\": \"$job\",
> +                                     \"tag\": \"snap0\",
> +                                     \"devices\": $devices}}" "return"
> +    if [ $fail = 0 ]; then
> +        # job status: waiting, pending
> +        wait_job $job "JOB_STATUS_CHANGE" "JOB_STATUS_CHANGE"
> +    else
> +        # job status: aborting
> +        wait_job $job "JOB_STATUS_CHANGE"

...you ARE testing that it uses events.  Looks like you have a tweak to
make to the QAPI docs still.


> +echo
> +echo "=====  Snapshot bad error reporting to stderr ====="
> +echo
> +
> +# This demonstrates that we're not capturing vmstate loading failures
> +# into QMP errors, they're ending up in stderr instead. vmstate needs
> +# to report errors via Error object but that is a major piece of work
> +# for the future. This test case's expected output log will need
> +# adjusting when that is done.

At least you documented what to expect down the road ;)

Overall, we're really close.  If you post the necessary tweaks to squash
in to the migration.json file, I could give R-b.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


