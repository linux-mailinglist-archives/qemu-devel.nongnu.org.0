Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02463408C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:49:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVVU-0002DR-4H; Tue, 22 Nov 2022 10:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxVVO-0002C1-63
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxVVK-0007ux-Q0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669132089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=asWkXmzeH/74SnpIcWW0P96NTbOPJ+RscIwtFyW4o+w=;
 b=PQAY0MaRgVjEUD/Gc9HDTXWd0LqKnI6I0sJgoOrUBbhJ6fDQ+ou1W/dEaW+MqumqCKO27g
 gMSzNr4EmkMVaJWnPLgsGxmqewY1ycE+E/XU6NBqXhyhuY3T5LnAvEagHXL3l3RvJ7p90n
 wjn1WImfKL+J+kIjAxMLq50jZhC5LOI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-kqIz_0twOHOFQqtlUnT4CA-1; Tue, 22 Nov 2022 10:48:05 -0500
X-MC-Unique: kqIz_0twOHOFQqtlUnT4CA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A25723C0F423;
 Tue, 22 Nov 2022 15:48:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5518F40C835A;
 Tue, 22 Nov 2022 15:48:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A45D21E6921; Tue, 22 Nov 2022 16:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 1/2] cleanup: Tweak and re-run return_directly.cocci
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-2-armbru@redhat.com>
 <8e38e4d1-4b1a-bae7-873b-2ad61489dc77@eik.bme.hu>
Date: Tue, 22 Nov 2022 16:48:02 +0100
In-Reply-To: <8e38e4d1-4b1a-bae7-873b-2ad61489dc77@eik.bme.hu> (BALATON
 Zoltan's message of "Tue, 22 Nov 2022 15:06:14 +0100 (CET)")
Message-ID: <87mt8j9ej1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Tue, 22 Nov 2022, Markus Armbruster wrote:
>> Tweak the semantic patch to drop redundant parenthesis around the
>> return expression.
>>
>> Coccinelle drops a comment in hw/rdma/vmw/pvrdma_cmd.c; restored
>> manually.
>>
>> Coccinelle messes up vmdk_co_create(), not sure why.  Change dropped,
>> will be done manually in the next commit.
>>
>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>> manually.
>>
>> Whitespace in tools/virtiofsd/fuse_lowlevel.c tidied up manually.
>>
>> checkpatch.pl complains "return of an errno should typically be -ve"
>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>> it visible to checkpatch.pl.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

>> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
>> index 8d7137faf3..54bf9a2b44 100644
>> --- a/hw/ppc/ppc4xx_sdram.c
>> +++ b/hw/ppc/ppc4xx_sdram.c
>> @@ -520,13 +520,10 @@ static inline hwaddr sdram_ddr2_base(uint32_t bcr)
>>
>> static hwaddr sdram_ddr2_size(uint32_t bcr)
>> {
>> -    hwaddr size;
>>      int sh;
>>
>>      sh = 1024 - ((bcr >> 6) & 0x3ff);
>> -    size = 8 * MiB * sh;
>> -
>> -    return size;
>> +    return 8 * MiB * sh;
>> }
>>
>> static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
>
> There's also an sdram_ddr_size() that's similar and could be changed to
>
> return sh == 7 ? -1 : (4 * MiB) << sh;
>
> just to keep these two functions simliar but Coccinelle probably does not catch that. Also while you're at it the assigmment of sh could be moved to 
> the declaration to save even more lines. As this then becomes more of a handwritten patch, maybe it should be a separate patch cleaning these two 
> functions before the rest.

I think it needs to be separate to keep me off Peter's naughty list ;)

> Otherwise for this part (or separate patch as above):
>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Thanks!


