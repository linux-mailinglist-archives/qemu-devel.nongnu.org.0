Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC22D14F4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:42:58 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIfB-0004Om-OK
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmId7-0003Iw-VG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmId3-0001H8-GM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607355644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ao3iisthfxOChWnC7zG+hlvuLgPYMSQT53MFeIW84Q=;
 b=gmGA7nHqqC+73kfwchncjeYFRSfqd89+a2dy5mdwDpBfein5P/50hN6aSX0EaG17U/8D/G
 w9P3PBU8N8PGWV4CG9nsV4vU814rwH0u7ErPLwqVL2KJ3bDkEpdIrmqfbZC77Qt+kziFBM
 XmxapOfkgS8tnHMqA2okeD42Be3eP4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-q0WhsF83PQacdvLobrMLBw-1; Mon, 07 Dec 2020 10:40:42 -0500
X-MC-Unique: q0WhsF83PQacdvLobrMLBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB35F802B40
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 15:40:41 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD85D5DA33;
 Mon,  7 Dec 2020 15:40:40 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:40:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 09/15] machine: record whether nvdimm= was set
Message-ID: <20201207164038.557c7874@redhat.com>
In-Reply-To: <20201202081854.4126071-10-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-10-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Dec 2020 03:18:48 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> This is needed for SPAPR which has different defaults than everyone else.
> Right now it looks at the -machine QemuOpts, but those will go away.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/machine.c       | 1 +
>  include/hw/mem/nvdimm.h | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 2c0bc15143..94992fa1c0 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -455,6 +455,7 @@ static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
>  
> +    ms->nvdimms_state->has_is_enabled = true;
naming looks like QAPI style we use for optional fields, it might be confusing.

maybe something like "user_set_is_enabled" would be better?

(sometimes I wish for QOM properties to have 'set' flag, so we can distinguish
if value is a default one or were set later on)

>      ms->nvdimms_state->is_enabled = value;
>  }
>  
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c699842dd0..14c101c180 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -129,7 +129,7 @@ typedef struct NvdimmFitBuffer NvdimmFitBuffer;
>  
>  struct NVDIMMState {
>      /* detect if NVDIMM support is enabled. */
> -    bool is_enabled;
> +    bool has_is_enabled, is_enabled;
>  
>      /* the data of the fw_cfg file NVDIMM_DSM_MEM_FILE. */
>      GArray *dsm_mem;


