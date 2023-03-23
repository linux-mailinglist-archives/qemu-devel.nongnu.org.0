Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F896C6980
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:30:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfL0c-0006rK-OA; Thu, 23 Mar 2023 09:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfL0Y-0006r4-SZ
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfL0W-0007hl-KK
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679578170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bjvn5rXqKrDkGkgRuvPTPBdSPoW5TjyQ9yf3VL3wF7Q=;
 b=Ebzb5SJJtZbb9wezYcA6r0H4fdBY28/7W1IsnZ2ckCyPZXH4dhk+Gkvw9lQ14GJOIhXi31
 r+TFhbjRVOpe+MAMpsV+GvrDfg1/pT4pa3cchs/WXQ40tE+vuW1KZ8yVAgPV2VRIiPkHhE
 1JqGmaV9IP7mGvh78LSxtNLG4hFJzsk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-JSujJETAPaC65tw19MN7JQ-1; Thu, 23 Mar 2023 09:29:27 -0400
X-MC-Unique: JSujJETAPaC65tw19MN7JQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FE423C1023A;
 Thu, 23 Mar 2023 13:29:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC772166B29;
 Thu, 23 Mar 2023 13:29:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D58521E6926; Thu, 23 Mar 2023 14:29:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Daniel Henrique
 Barboza <danielhb413@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  qemu-devel@nongnu.org
Subject: Re: QMP command dumpdtb crash bug
References: <87jzz82d6o.fsf@pond.sub.org>
 <0f671d7f-5862-cf59-2ef2-be347c044a0b@ventanamicro.com>
Date: Thu, 23 Mar 2023 14:29:25 +0100
In-Reply-To: <0f671d7f-5862-cf59-2ef2-be347c044a0b@ventanamicro.com> (Daniel
 Henrique Barboza's message of "Thu, 23 Mar 2023 09:17:54 -0300")
Message-ID: <87355vy4sq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter, Daniel offers two ways to fix this bug (see below).  Got a
preference?

Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:

> On 3/23/23 03:29, Markus Armbruster wrote:
>> Watch this:
>> 
>>      $ gdb --args ../qemu/bld/qemu-system-aarch64 -S -M virt -display none -qmp stdio
>>      [...]
>>      (gdb) r
>>      [...]
>>      {"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 7}, "package": "v7.2.0-2331-gda89f78a7d"}, "capabilities": ["oob"]}}
>>      [New Thread 0x7fffed62c6c0 (LWP 1021967)]
>>      {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
>>      {"return": {}}
>>      {"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
>> 
>>      Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation fault.
>>      qmp_dumpdtb (filename=0x5555581c5170 "fdt.dtb", errp=errp@entry=0x7fffffffdae8)
>>          at ../softmmu/device_tree.c:661
>>      661	    size = fdt_totalsize(current_machine->fdt);
>> 
>> current_machine->fdt is non-null here.  The crash is within
>> fdt_totalsize().
>
>
> Back when I added this command [1] one of the patches of this series was:
>
> [PATCH v8 03/16] hw/arm: do not free machine->fdt in arm_load_dtb()
>
> https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04201.html
>
> The patch aimed to address what you're seeing here. machine->fdt is not NULL,
> but it was freed in arm_load_dtb() without assigning it to NULL and it contains
> junk.
>
> Back then this patch got no acks/reviews and got left behind. If I apply it now
> at current master your example works.
>
>> 
>> I suspect ...
>> 
>>      void qmp_dumpdtb(const char *filename, Error **errp)
>>      {
>>          g_autoptr(GError) err = NULL;
>>          uint32_t size;
>> 
>>          if (!current_machine->fdt) {
>>              error_setg(errp, "This machine doesn't have a FDT");
>>              return;
>>          }
>> 
>> ... we're missing an "FDT isn't ready" guard here.
>
>
> There might be a case where a guard would be needed, but for all ARM machines that
> uses arm_load_dtb() I can say that the dumpdtb is broken regardless of whether you
> attempt it during early boot or not.
>
> One solution is to just apply the patch I mentioned above. Another solution is to
> make a g_free(fdt) in arm_load_dtb and also do a ms->fdt = NULL to tell dumpdtb()
> that there is no fdt available.
>
> I don't see any particular reason why arm machines can't support this command, so
> let me know and I can re-send that patch.
>
>
>
> Thanks,
>
>
> Daniel
>
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04190.html
>
>> 
>>          size = fdt_totalsize(current_machine->fdt);
>> 
>>          g_assert(size > 0);
>> 
>>          if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
>>              error_setg(errp, "Error saving FDT to file %s: %s",
>>                         filename, err->message);
>>          }
>>      }
>> 
>> Also, I think the error message "does not have a FDT" should say "an
>> FDT".
>> 


