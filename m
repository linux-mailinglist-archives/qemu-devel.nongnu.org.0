Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC460577B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 08:40:51 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPEW-0005Xa-EJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:40:48 -0400
Received: from [::1] (port=53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olP1u-0006vj-UA
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olOpI-0002G1-2L
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olOpE-0000vB-VV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666246479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5hu0QML86HkGsrPUnPc//IHgR/2siBH1P80JwNiPuc=;
 b=FguAATtUL0sOvEtN5wAv52Ym9K585Ld/j5v7sbL5DLGpiKxX0EDyme1M/UsLrHFjVFvJ9c
 u0Xo6hjP2TLnYpWmeDTn0Irth64B4tCVfYbFUM75HotyDweLtBdzlZ22D9Jrss/WQzHDGZ
 bAXx1ZIbgn2Fi4PvWEfRnFXU2SnY0Ss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-V93UGp8rPyeFDO4mg14Puw-1; Thu, 20 Oct 2022 02:14:35 -0400
X-MC-Unique: V93UGp8rPyeFDO4mg14Puw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54C94381796F;
 Thu, 20 Oct 2022 06:14:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E149140CA413;
 Thu, 20 Oct 2022 06:14:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D059C21E675B; Thu, 20 Oct 2022 08:14:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org,  Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
References: <20221019191522.1004804-1-lk@c--e.de>
Date: Thu, 20 Oct 2022 08:14:32 +0200
In-Reply-To: <20221019191522.1004804-1-lk@c--e.de> (Christian A. Ehrhardt's
 message of "Wed, 19 Oct 2022 21:15:22 +0200")
Message-ID: <87r0z3dnsn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Christian A. Ehrhardt" <lk@c--e.de> writes:

> Fix memset argument order: The second argument is
> the value, the length goes last.

Impact of the bug?

> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Cc: qemu-stable@nongnu.org
> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> ---
>  hw/acpi/erst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index df856b2669..26391f93ca 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
       exchange_length = memory_region_size(&s->exchange_mr);

This is the size of the exchange buffer.

Aside: it's unsigned int, but memory_region_size() returns uint64_t.
Unclean if it fits, bug if it doesn't.

       /* Validate record_offset */
       if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
           return STATUS_FAILED;
       }

       /* Obtain pointer to record in the exchange buffer */
       exchange = memory_region_get_ram_ptr(&s->exchange_mr);
       exchange += s->record_offset;

       /* Validate CPER record_length */
       memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
           sizeof(uint32_t));

Aside: record_length = *(uint32_t *)exchange[UEFI_CPER_RECORD_LENGTH_OFFSET]
would do, since UEFI_CPER_RECORD_LENGTH_OFFSET is a multiple of 4.

       record_length = le32_to_cpu(record_length);
       if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
           return STATUS_FAILED;
       }
       if ((s->record_offset + record_length) > exchange_length) {
           return STATUS_FAILED;
       }

This ensures there are at least @record_length bytes of space left in
the exchange buffer.  Good.

       [...]
>      if (nvram) {
>          /* Write the record into the slot */
>          memcpy(nvram, exchange, record_length);

This first copies @record_length bytes into the exchange buffer.

> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);

The new code pads it to the full exchange buffer size.

The old code writes 0xFF bytes.

If 0xFF < exchange_length - record_length, the padding doesn't extend to
the end of the buffer.  Impact?

If 0xFF > exchange_length - record_length, we write beyond the end of
the buffer.  Impact?

>          /* If a new record, increment the record_count */
>          if (!record_found) {
>              uint32_t record_count;


