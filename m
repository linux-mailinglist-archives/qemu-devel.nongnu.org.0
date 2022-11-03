Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A761860E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdts-0001md-9a; Thu, 03 Nov 2022 13:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oqdtk-0001lZ-Fz
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oqdth-0002BL-Ej
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPecyOBmCPqvAYGUgQ2yHL/Ag/LomTk0MaZbDEVGXO0=;
 b=Y16RlKvMeUxpIkUjIxADTfRq5h/LIN6iwr4/cHyXV6bSmb/gqSdiErzzpTuE6YAL+EjOvo
 989tdUtCg1hrVYEj4dZIYBQPuEoH6h+EMqxKHKcgJ2OMffz9ivzGDOTXGAwuIFyVO6zK9a
 5waPnq72xA8rZ8nY46e7hJ19scSfMGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-cza9Mj7DMWabG0LD0H1cDw-1; Thu, 03 Nov 2022 13:20:54 -0400
X-MC-Unique: cza9Mj7DMWabG0LD0H1cDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30D823C0F448;
 Thu,  3 Nov 2022 17:20:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98E3540C2087;
 Thu,  3 Nov 2022 17:20:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
Subject: Re: [PATCH v11 09/11] s390x/cpu topology: add topology machine
 property
In-Reply-To: <20221103170150.20789-10-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-10-pmorel@linux.ibm.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 03 Nov 2022 18:20:47 +0100
Message-ID: <87bkpox8cw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03 2022, Pierre Morel <pmorel@linux.ibm.com> wrote:

> We keep the possibility to switch on/off the topology on newer
> machines with the property topology=[on|off].
>
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  include/hw/boards.h                |  3 +++
>  include/hw/s390x/cpu-topology.h    |  8 +++-----
>  include/hw/s390x/s390-virtio-ccw.h |  1 +
>  hw/core/machine.c                  |  3 +++
>  hw/s390x/cpu-topology.c            | 19 +++++++++++++++++++
>  hw/s390x/s390-virtio-ccw.c         | 28 ++++++++++++++++++++++++++++
>  util/qemu-config.c                 |  4 ++++
>  qemu-options.hx                    |  6 +++++-
>  8 files changed, 66 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 311ed17e18..67147c47bf 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -379,6 +379,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_7_2[];
> +extern const size_t hw_compat_7_2_len;

This still needs to go into a separate patch that introduces the 8.0
machine types for the relevant machines... I'll probably write that
patch soon (next week or so), you can pick it then into this series.

> +
>  extern GlobalProperty hw_compat_7_1[];
>  extern const size_t hw_compat_7_1_len;
>  


