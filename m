Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7926BEFF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 10:18:48 +0200 (CEST)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kISeO-0007ME-1m
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 04:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kISdg-0006s3-9L
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 04:18:04 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44965
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kISdc-0004gX-VS
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 04:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600244279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vm76nRdxm+pOHvylVbaDaf8mOTB9EFXZHmcnP43YSbE=;
 b=ZmoNUb8abTAVp5E+YfhSYOQ0LR1hdHTqYp07WiV9EBL48KMQlX9g6Vcg0SJjtXWtmvLBeT
 sxXOZt7vQx+Az5KT/lpsoHRHbdUQJBpo84proMbEYuk/hhdd/Yyqot+ZC2600xURwydGVo
 1CF51RHjS+2Kkf7c23M6/f4pFgtkB+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-o50w5pi8Omq6kGd8Ywpc6g-1; Wed, 16 Sep 2020 04:17:55 -0400
X-MC-Unique: o50w5pi8Omq6kGd8Ywpc6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04EAD186DD24;
 Wed, 16 Sep 2020 08:17:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A051576E16;
 Wed, 16 Sep 2020 08:17:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 317C0113864A; Wed, 16 Sep 2020 10:17:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 9/9] migration: introduce snapshot-{save, load,
 delete} QMP commands
References: <20200915113523.2520317-1-berrange@redhat.com>
 <20200915113523.2520317-10-berrange@redhat.com>
Date: Wed, 16 Sep 2020 10:17:52 +0200
In-Reply-To: <20200915113523.2520317-10-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 15 Sep 2020 12:35:23
 +0100")
Message-ID: <87tuvyt9sf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:41:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

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
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
[...]
> diff --git a/qapi/job.json b/qapi/job.json
> index 280c2f76f1..b2cbb4fead 100644
> --- a/qapi/job.json
> +++ b/qapi/job.json
> @@ -22,10 +22,17 @@
>  #
>  # @amend: image options amend job type, see "x-blockdev-amend" (since 5.=
1)
>  #
> +# @snapshot-load: snapshot load job type, see "snapshot-load" (since 5.2=
)
> +#
> +# @snapshot-save: snapshot save job type, see "snapshot-save" (since 5.2=
)
> +#
> +# @snapshot-delete: snapshot delete job type, see "snapshot-delete" (sin=
ce 5.2)
> +#
>  # Since: 1.7
>  ##
>  { 'enum': 'JobType',
> -  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend'] }
> +  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend',
> +           'snapshot-load', 'snapshot-save', 'snapshot-delete'] }
> =20
>  ##
>  # @JobStatus:
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 675f70bb67..b584c0be31 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1720,3 +1720,123 @@
>  ##
>  { 'event': 'UNPLUG_PRIMARY',
>    'data': { 'device-id': 'str' } }
> +
> +##
> +# @snapshot-save:
> +#
> +# Save a VM snapshot
> +#
> +# @job-id: identifier for the newly created job
> +# @tag: name of the snapshot to create
> +# @devices: list of block device node names to save a snapshot to

Looks like you dropped the idea to also accept drive IDs.  Is that for
good, or would you like to add it later?

> +# @vmstate: block device node name to save vmstate to
> +#
> +# Applications should not assume that the snapshot save is complete
> +# when this command returns. The job commands / events must be used
> +# to determine completion and to fetch details of any errors that arise.
> +#
> +# Note that the VM CPUs will be paused during the time it takes to
> +# save the snapshot

End the sentence with a period, please.

> +#
> +# It is strongly recommended that @devices contain all writable
> +# block device nodes if a consistent snapshot is required.

If it doesn't, the snapshot is partial, and a consistent restore from a
partial snapshot is generally impossible.  The comment is okay as is.

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
> +# Since: 5.2
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
> +# @devices: list of block device node names to load a snapshot from
> +# @vmstate: block device node name to load vmstate from
> +#
> +# Applications should not assume that the snapshot save is complete
> +# when this command returns. The job commands / events must be used
> +# to determine completion and to fetch details of any errors that arise.
> +#
> +# Note that the VM CPUs will be paused during the time it takes to
> +# save the snapshot
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
> +# Since: 5.2
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
> +# Since: 5.2
> +##
> +{ 'command': 'snapshot-delete',
> +  'data': { 'job-id': 'str',
> +            'tag': 'str',
> +            'devices': ['str'] } }
[...]


