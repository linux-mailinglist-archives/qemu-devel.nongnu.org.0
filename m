Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F1326934
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 22:19:16 +0100 (CET)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFkW3-0004xT-11
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 16:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFkV9-0004S0-LJ
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 16:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFkV6-0001uT-Gm
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 16:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614374294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QGx/PkD7+lm/+QAr+oCHWD+P4+qOrh1ZhC4ZjJ8EaM=;
 b=QE5WQ3tt2hHa2rVCnMcg2sin9XXuoiIt6n4vMHV+nn3e/H2JbRSuLg0lHPYrWULBQyfwGt
 WGQnVEYTai3vBF9lX4f1Kr9a3dQow58EVwe/iMDfhxOCKLr4TivZJgMPeEZ4rv3zFHckcN
 JWPxiUwAlhKOPDgGQb9xwUPZMU2ANaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-BtMa32dsMGOx9bVqCZ461w-1; Fri, 26 Feb 2021 16:18:12 -0500
X-MC-Unique: BtMa32dsMGOx9bVqCZ461w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82091935780;
 Fri, 26 Feb 2021 21:18:11 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DE1860BE2;
 Fri, 26 Feb 2021 21:18:03 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-20-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 19/31] qapi/qom: QAPIfy object-add
Message-ID: <fdeb785f-4eef-e216-c4ab-f86147d03671@redhat.com>
Date: Fri, 26 Feb 2021 15:18:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-20-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This converts object-add from 'gen': false to the ObjectOptions QAPI
> type. As an immediate benefit, clients can now use QAPI schema
> introspection for user creatable QOM objects.
> 
> It is also the first step towards making the QAPI schema the only
> external interface for the creation of user creatable objects. Once all
> other places (HMP and command lines of the system emulator and all
> tools) go through QAPI, too, some object implementations can be
> simplified because some checks (e.g. that mandatory options are set) are
> already performed by QAPI, and in another step, QOM boilerplate code
> could be generated from the schema.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json                        | 11 +----------
>  include/qom/object_interfaces.h      |  7 -------
>  hw/block/xen-block.c                 | 16 ++++++++--------
>  monitor/misc.c                       |  2 --
>  qom/qom-qmp-cmds.c                   | 25 +++++++++++++++++++++++--
>  storage-daemon/qemu-storage-daemon.c |  2 --
>  6 files changed, 32 insertions(+), 31 deletions(-)
> 
> +++ b/qapi/qom.json
> @@ -839,13 +839,6 @@
>  #
>  # Create a QOM object.
>  #
> -# @qom-type: the class name for the object to be created
> -#
> -# @id: the name of the new object
> -#
> -# Additional arguments depend on qom-type and are passed to the backend
> -# unchanged.
> -#
>  # Returns: Nothing on success
>  #          Error if @qom-type is not a valid class name
>  #
> @@ -859,9 +852,7 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'object-add',
> -  'data': {'qom-type': 'str', 'id': 'str'},
> -  'gen': false } # so we can get the additional arguments
> +{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true }

So much more concise ;)  A grep for TYPE_USER_CREATABLE doesn't seem to
turn up any *_class_init() functions that your earlier patches in the
series missed, so I think you captured an accurate 1:1 mapping.  There
is include/chardev/char.h with the comment about "TODO: eventually use
TYPE_USER_CREATABLE" which may point to the next item to be added to
ObjectOptions, but that's not for this series.

> +++ b/qom/qom-qmp-cmds.c

>  
> -void qmp_object_add(QDict *qdict, QObject **ret_data, Error **errp)
> +void qmp_object_add(ObjectOptions *options, Error **errp)
>  {
> -    user_creatable_add_dict(qdict, false, errp);
> +    Visitor *v;
> +    QObject *qobj;
> +    QDict *props;
> +    Object *obj;
> +
> +    v = qobject_output_visitor_new(&qobj);
> +    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
> +    visit_complete(v, &qobj);
> +    visit_free(v);

This part is nice...

> +
> +    props = qobject_to(QDict, qobj);
> +    qdict_del(props, "qom-type");
> +    qdict_del(props, "id");

...while this part makes it seem like we still have more cleanup to come
later.  But hey, progress!

> +
> +    v = qobject_input_visitor_new(QOBJECT(props));
> +    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
> +                                  options->id, props, v, errp);
> +    object_unref(obj);
> +    visit_free(v);
>  }
>  

Once you address Paolo's comment, you can also add

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


