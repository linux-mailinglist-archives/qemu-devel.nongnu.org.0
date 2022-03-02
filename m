Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991724CA0F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:39:35 +0100 (CET)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPLSI-0007R2-E0
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:39:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPLQd-0006cc-Vp
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPLQc-00026m-JP
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646213869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAV6CvJKkPFTvzU5vMpXLz2n51qo/EZs9TLPJZYQid4=;
 b=QHpL/adUuwUWDrKEhZ0Hm33JOBm7pkVKt3PkzZWxq0HJ1EcxJTFkiCg06vW1fyZUrnuuEe
 OBqX06W/EHfFH3koV4oATsidfEp3/oFwiXGYDFmD/gxHDs25PAkh24PshsOq/dMxrV6M+c
 KW4uHUDxKdSp4GvSFO8UDrC2JopG9CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-D1Vii4o0O8yYvmhGlMXAvQ-1; Wed, 02 Mar 2022 04:37:47 -0500
X-MC-Unique: D1Vii4o0O8yYvmhGlMXAvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B78951006AA5;
 Wed,  2 Mar 2022 09:37:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A380B104253C;
 Wed,  2 Mar 2022 09:37:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C065B21E6A00; Wed,  2 Mar 2022 10:37:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] Check and report for incomplete 'global' option format
References: <20220216071508.412974-1-rohit.kumar3@nutanix.com>
 <87r182zzj8.fsf@pond.sub.org>
 <65ca72b3-a6c9-f5c8-3652-108c2bc6589d@nutanix.com>
Date: Wed, 02 Mar 2022 10:37:39 +0100
In-Reply-To: <65ca72b3-a6c9-f5c8-3652-108c2bc6589d@nutanix.com> (Rohit Kumar's
 message of "Wed, 2 Mar 2022 14:12:12 +0530")
Message-ID: <87lexsk84c.fsf@pond.sub.org>
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, prachatos.mitra@nutanix.com,
 Rohit Kumar <rohit.kumar3@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rohit Kumar <rohit.kumar3@nutanix.com> writes:

> Hi Markus, thanks for the review. Please let me know if this patch
> needs to be rebased on top of current master or does it looks good to
> merge.
> Thanks !

Paolo, can you take care of this one?


