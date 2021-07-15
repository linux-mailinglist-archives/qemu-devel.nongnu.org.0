Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028B3C98BA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 08:18:10 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3uhG-0003f2-2V
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 02:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3ufs-0002Gm-Q2
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3ufr-00030D-A0
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626329802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IrnMML16yKhXAEotj0wTSfkKE7eGEW+DiNjamQuXv6g=;
 b=FI1pDbX7n8NHrxYsxpbE7Hnv1PWGfMgkRdRirEIyFNME3R4VHx04ciz6xkPXRj+VfMp/EP
 tHn5927j1Pzxs9a3tevMSS99HlzAow6/APhXI9tVUf5xDtFd+o0OZKEV42N9DttmYBnwUT
 u5iwwhQizjUDvSbCkSbLnmrzKeHjEkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-k3DlCi_zPoG0J_Jl76Cnww-1; Thu, 15 Jul 2021 02:16:39 -0400
X-MC-Unique: k3DlCi_zPoG0J_Jl76Cnww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F16C73A0;
 Thu, 15 Jul 2021 06:16:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 430F35D9DD;
 Thu, 15 Jul 2021 06:16:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CCAF0113865F; Thu, 15 Jul 2021 08:16:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
Date: Thu, 15 Jul 2021 08:16:32 +0200
In-Reply-To: <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com> (Pierre
 Morel's message of "Wed, 14 Jul 2021 18:53:09 +0200")
Message-ID: <87y2a8cda7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pierre Morel <pmorel@linux.ibm.com> writes:

> Drawers and Books are levels 4 and 3 of the S390 CPU
> topology.
> We allow the user to define these levels and we will
> store the values inside the S390CcwMachineState.

Double-checking: are these members specific to S390?

>
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---

[...]

> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..98aff804c6 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -883,6 +883,8 @@
   ##
   # @CpuInstanceProperties:
   #
   # List of properties to be used for hotplugging a CPU instance,
   # it should be passed by management with device_add command when
   # a CPU is being hotplugged.
   #
   # @node-id: NUMA node ID the CPU belongs to
   # @socket-id: socket number within node/board the CPU belongs to

Missing: documentation for your new members.

   # @die-id: die number within node/board the CPU belongs to (Since 4.1)
   # @core-id: core number within die the CPU belongs to
   # @thread-id: thread number within core the CPU belongs to
   #
   # Note: currently there are 5 properties that could be present
   #       but management should be prepared to pass through other
   #       properties with device_add command to allow for future
   #       interface extension. This also requires the filed names to be kept in
   #       sync with the properties passed to -device/device_add.
   #
   # Since: 2.7
   ##
   { 'struct': 'CpuInstanceProperties',
>    'data': { '*node-id': 'int',
>              '*socket-id': 'int',
>              '*die-id': 'int',
> +            '*drawer-id': 'int',
> +            '*book-id': 'int',
>              '*core-id': 'int',
>              '*thread-id': 'int'
>    }

[...]


