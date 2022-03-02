Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E014CA0F0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:37:29 +0100 (CET)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPLQG-0005rL-9t
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPLOs-00058k-Qa
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPLOp-0001pN-MM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646213759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SlG8uuIAz64rc6OAoNoiL3m9JkN1PiOkjim5IWJKsW0=;
 b=hQ8OLE54xhIXfwWpKvYwHbLBonrl6dSRCW1POeAu/CR2YAcVuRLe1MIFNg+ZijDofYrYhQ
 I1nJohI5+Q/41lTUFOf8P1W35f+RxBnAJ1d6btLA/WjiSIRev8vVIykNFfElezsMKC/0nm
 tKpmjPXLGFxTU3xYtnQfDXHKVC0MVQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-x8ki86JvPyeloG9p_yw-0w-1; Wed, 02 Mar 2022 04:35:58 -0500
X-MC-Unique: x8ki86JvPyeloG9p_yw-0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11341854E2E;
 Wed,  2 Mar 2022 09:35:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3307C104254C;
 Wed,  2 Mar 2022 09:35:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B54A721E6A00; Wed,  2 Mar 2022 10:35:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 1/2] qapi: Introduce NVMe disk bus type
References: <20220302085410.1302157-1-pizhenwei@bytedance.com>
 <20220302085410.1302157-2-pizhenwei@bytedance.com>
Date: Wed, 02 Mar 2022 10:35:54 +0100
In-Reply-To: <20220302085410.1302157-2-pizhenwei@bytedance.com> (zhenwei pi's
 message of "Wed, 2 Mar 2022 16:54:09 +0800")
Message-ID: <87pmn4k879.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zhenwei pi <pizhenwei@bytedance.com> writes:

> Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
> a NVMe disk get exposed in guest side. Support NVMe disk bus type for
> QAPI.
>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  qga/qapi-schema.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 94e4aacdcc..1b5ea4c5f8 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -827,13 +827,14 @@
>  # @mmc: Win multimedia card (MMC) bus type
>  # @virtual: Win virtual bus type
>  # @file-backed-virtual: Win file-backed bus type
> +# @nvme: NVMe disks
>  #
>  # Since: 2.2; 'Unknown' and all entries below since 2.4
>  ##
>  { 'enum': 'GuestDiskBusType',
>    'data': [ 'ide', 'fdc', 'scsi', 'virtio', 'xen', 'usb', 'uml', 'sata',
>              'sd', 'unknown', 'ieee1394', 'ssa', 'fibre', 'raid', 'iscsi',
> -            'sas', 'mmc', 'virtual', 'file-backed-virtual' ] }
> +            'sas', 'mmc', 'virtual', 'file-backed-virtual', 'nvme' ] }
>  
>  
>  ##

Please change the title to something like

    qga: Introduce NVMe disk bus type

I'd squash the two patches together.


