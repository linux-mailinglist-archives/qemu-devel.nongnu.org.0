Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B42FD8ED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:59:14 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2IhF-0005nW-7I
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2IgH-0005A6-RQ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:58:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2IgE-0005BS-My
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611169089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZ0AgHvlI40a6eLzhK6w3j+Yu4+OXhi+1PpwkIw99tw=;
 b=Dyk//NCNOMsl1+MoihS1Rp9PcPZeGUccMBygynfDggkaALoFUkLEQRAPMvBhUM+hjuXYPV
 eaYY8SlhYKAJ8tb8BiySonvX3wl+juGij3xw/MODqMpukYrjbanc+bc9728mxeimNVAKEn
 ONsLXNPSlVB81rXYZpOSYaoRCZ6WMW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-X-FhDpcKPM24_8vI663FlQ-1; Wed, 20 Jan 2021 13:58:07 -0500
X-MC-Unique: X-FhDpcKPM24_8vI663FlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 430BA107ACE3;
 Wed, 20 Jan 2021 18:58:06 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D62819CB1;
 Wed, 20 Jan 2021 18:58:05 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120104411.3084801-1-berrange@redhat.com>
 <20210120104411.3084801-12-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v9 11/11] migration: introduce snapshot-{save, load,
 delete} QMP commands
Message-ID: <5226cddb-3b3f-6cb6-c1c9-d943e495df72@redhat.com>
Date: Wed, 20 Jan 2021 12:58:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120104411.3084801-12-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:44 AM, Daniel P. Berrangé wrote:
> savevm, loadvm and delvm are some of the few HMP commands that have never
> been converted to use QMP. The reasons for the lack of conversion are
> that they blocked execution of the event thread, and the semantics
> around choice of disks were ill-defined.
> 
> Despite this downside, however, libvirt and applications using libvirt
> have used these commands for as long as QMP has existed, via the
> "human-monitor-command" passthrough command. IOW, while it is clearly
> desirable to be able to fix the problems, they are not a blocker to
> all real world usage.
> 
> Meanwhile there is a need for other features which involve adding new
> parameters to the commands. This is possible with HMP passthrough, but
> it provides no reliable way for apps to introspect features, so using
> QAPI modelling is highly desirable.
> 
> This patch thus introduces new snapshot-{load,save,delete} commands to
> QMP that are intended to replace the old HMP counterparts. The new
> commands are given different names, because they will be using the new
> QEMU job framework and thus will have diverging behaviour from the HMP
> originals. It would thus be misleading to keep the same name.
> 
> While this design uses the generic job framework, the current impl is
> still blocking. The intention that the blocking problem is fixed later.
> None the less applications using these new commands should assume that
> they are asynchronous and thus wait for the job status change event to
> indicate completion.
> 
> In addition to using the job framework, the new commands require the
> caller to be explicit about all the block device nodes used in the
> snapshot operations, with no built-in default heuristics in use.
> 
> Note that the existing "query-named-block-nodes" can be used to query
> what snapshots currently exist for block nodes.
> 
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---

> +++ b/migration/savevm.c
> @@ -2968,7 +2968,7 @@ bool load_snapshot(const char *name, const char *vmstate,
>      if (ret == 0) {
>          error_setg(errp, "Snapshot '%s' does not exist in one or more devices",
>                     name);
> -        return -1;
> +        return false;

This hunk belongs in 6/11.


> +++ b/qapi/job.json
> @@ -22,10 +22,17 @@
>  #
>  # @amend: image options amend job type, see "x-blockdev-amend" (since 5.1)
>  #
> +# @snapshot-load: snapshot load job type, see "snapshot-load" (since 5.2)
> +#
> +# @snapshot-save: snapshot save job type, see "snapshot-save" (since 5.2)
> +#
> +# @snapshot-delete: snapshot delete job type, see "snapshot-delete" (since 5.2)

s/5.2/6.0/g


> +++ b/qapi/migration.json
> @@ -1843,3 +1843,124 @@
>  # Since: 5.2
>  ##
>  { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
> +
> +##
> +# @snapshot-save:
> +#
> +# Save a VM snapshot
> +#
> +# @job-id: identifier for the newly created job
> +# @tag: name of the snapshot to create
> +# @vmstate: block device node name to save vmstate to
> +# @devices: list of block device node names to save a snapshot to
> +#
> +# Applications should not assume that the snapshot save is complete
> +# when this command returns. The job commands / events must be used
> +# to determine completion and to fetch details of any errors that arise.
> +#
> +# Note that execution of the guest CPUs may be stopped during the
> +# time it takes to save the snapshot. A future version of QEMU
> +# may ensure CPUs are executing continuously.
> +#
> +# It is strongly recommended that @devices contain all writable
> +# block device nodes if a consistent snapshot is required.
> +#
> +# If @tag already exists, an error will be reported
> +#
> +# Returns: nothing
> +#
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
> +#
> +# Since: 6.0

The example would be wise to further show waiting for the job completion
event.

> +##
> +{ 'command': 'snapshot-save',
> +  'data': { 'job-id': 'str',
> +            'tag': 'str',
> +            'vmstate': 'str',
> +            'devices': ['str'] } }
> +
> +##
> +# @snapshot-load:
> +#
> +# Load a VM snapshot
> +#
> +# @job-id: identifier for the newly created job
> +# @tag: name of the snapshot to load.
> +# @vmstate: block device node name to load vmstate from
> +# @devices: list of block device node names to load a snapshot from
> +#
> +# Applications should not assume that the snapshot load is complete
> +# when this command returns. The job commands / events must be used
> +# to determine completion and to fetch details of any errors that arise.
> +#
> +# Note that execution of the guest CPUs will be stopped during the
> +# time it takes to load the snapshot.
> +#
> +# It is strongly recommended that @devices contain all writable
> +# block device nodes that can have changed since the original
> +# @snapshot-save command execution.
> +#
> +# Returns: nothing
> +#
> +# Example:
> +#
> +# -> { "execute": "snapshot-load",
> +#      "data": {
> +#         "job-id": "snapload0",
> +#         "tag": "my-snap",
> +#         "vmstate": "disk0",
> +#         "devices": ["disk0", "disk1"]
> +#      }
> +#    }
> +# <- { "return": { } }
> +#

Here as well.

> +# Since: 6.0
> +##
> +{ 'command': 'snapshot-load',
> +  'data': { 'job-id': 'str',
> +            'tag': 'str',
> +            'vmstate': 'str',
> +            'devices': ['str'] } }
> +
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
> +#
> +# Since: 6.0
> +##
> +{ 'command': 'snapshot-delete',
> +  'data': { 'job-id': 'str',
> +            'tag': 'str',
> +            'devices': ['str'] } }
> diff --git a/slirp b/slirp
> index 8f43a99191..ce94eba204 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275

Oops. This shouldn't be here.

> diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
> new file mode 100755
> index 0000000000..41cec9ea8d
> --- /dev/null
> +++ b/tests/qemu-iotests/310
> @@ -0,0 +1,385 @@
> +#!/usr/bin/env bash
> +#
> +# Test which nodes are involved in internal snapshots
> +#
> +# Copyright (C) 2020 Red Hat, Inc.

Worth also mentioning 2021?


> +    # Next events vary depending on job type and
> +    # whether it succeeds or not.
> +    for evname in $@
> +    do
> +	_wait_event $QEMU_HANDLE $evname

TAB damage throughout this file.


> +echo
> +echo "=====  Snapshot dual qcow2 image ====="
> +echo
> +
> +# We can snapshot multiple  qcow2 disks at the same time

extra space

> +++ b/tests/qemu-iotests/group
> @@ -318,4 +318,5 @@
>  307 rw quick export
>  308 rw
>  309 rw auto quick
> +310 rw quick
>  312 rw quick

Vladimir's work to get rid of the 'group' file will be a trivial merge
conflict, if it lands first.

Nearly there!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


