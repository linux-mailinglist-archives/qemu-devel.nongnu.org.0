Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA904B1600
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:13:02 +0100 (CET)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEsH-0002wZ-D4
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIBwK-0001o9-OI
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:05:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIBwF-0005uv-6c
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644509060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQLbAF5dKl3tzhAMM4JQPIqs8ivEPhqLYEKIHvqkaLw=;
 b=bWR2HGmnCpQ7IdsFLQOEytNNUamy0pi6Kcs5iovflQzq859nqxEfOn7CnVL79tB7ACbgsH
 Ej7nF0+lHApp+vUYI1EkdeT/XTABB39PRRSUFGy54/flZpthFKohHO+OFsXkfp0lDp9TqA
 vNBNTYNiGYNw+jS95p4wvJkEgZXfUp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-jWgrFB2iOE2E_nU6VRZijg-1; Thu, 10 Feb 2022 11:04:17 -0500
X-MC-Unique: jWgrFB2iOE2E_nU6VRZijg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE694107B276;
 Thu, 10 Feb 2022 16:04:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCEC87DE43;
 Thu, 10 Feb 2022 16:04:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69CB521E6A00; Thu, 10 Feb 2022 17:04:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v11 3/8] qmp: add QMP command x-query-virtio
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
 <1642678168-20447-4-git-send-email-jonah.palmer@oracle.com>
Date: Thu, 10 Feb 2022 17:04:13 +0100
In-Reply-To: <1642678168-20447-4-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Thu, 20 Jan 2022 06:29:23 -0500")
Message-ID: <87ee4abtdu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command lists all the instances of VirtIODevices with
> their canonical QOM path and name.
>
> [Jonah: @virtio_list duplicates information that already exists in
>  the QOM composition tree. However, extracting necessary information
>  from this tree seems to be a bit convoluted.
>
>  Instead, we still create our own list of realized virtio devices
>  but use @qmp_qom_get with the device's canonical QOM path to confirm
>  that the device exists and is realized. If the device exists but
>  is actually not realized, then we remove it from our list (for
>  synchronicity to the QOM composition tree).
>
>  Also, the QMP command @x-query-virtio is redundant as @qom-list
>  and @qom-get are sufficient to search '/machine/' for realized
>  virtio devices. However, @x-query-virtio is much more convenient
>  in listing realized virtio devices.]

Thanks for explaining this.  Whether the convenience is worth the extra
code is for the virtio maintainer to decide.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


