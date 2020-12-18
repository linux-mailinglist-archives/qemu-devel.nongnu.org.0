Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A32DDEAF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:42:29 +0100 (CET)
Received: from localhost ([::1]:56678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9T8-0002Fj-7x
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kq8yF-0006J0-9w
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:10:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kq8y8-0005Dc-NL
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608271822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNb4qN/n0+gxlsYYFbbWkHBqCuNXbFFnY8Z2CQsBOOU=;
 b=XN/16Sd8C9SvraopL/8CpbVw6DwiE5mVauAipL12oZuYN16VhBSaC9p13oG1RaELqbT0Dj
 3RH93T3IJXcW68/R/jW8Sa5jIa6JMFSGqkiwnVBaCbdh6EDg/DQCc3BZCejWB3zRFN1NYL
 1/Vyzlnbk8kIL+kmvmZUBARft4ZZB/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-mRpK0E-KNsibUC_pH4E0qg-1; Fri, 18 Dec 2020 01:10:17 -0500
X-MC-Unique: mRpK0E-KNsibUC_pH4E0qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E53800D55;
 Fri, 18 Dec 2020 06:10:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60BF160BE5;
 Fri, 18 Dec 2020 06:10:10 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <592b8049-e3e7-95b3-8de4-db9cdf0231df@redhat.com>
Date: Fri, 18 Dec 2020 07:10:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: pmorel@linux.ibm.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2020 23.16, Matthew Rosato wrote:
> In pcistb_service_handler, a call is made to validate that the memory
> region can be accessed.  However, the call is made using the entire length
> of the pcistb operation, which can be larger than the allowed memory
> access size (8).  Since we already know that the provided buffer is a
> multiple of 8, fix the call to memory_region_access_valid to iterate
> over the memory region in the same way as the subsequent call to
> memory_region_dispatch_write.
> 
> Fixes: 863f6f52b7 ("s390: implement pci instructions")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-inst.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index e230293..76b08a3 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>      mr = s390_get_subregion(mr, offset, len);
>      offset -= mr->addr;
>  
> -    if (!memory_region_access_valid(mr, offset, len, true,
> -                                    MEMTXATTRS_UNSPECIFIED)) {
> -        s390_program_interrupt(env, PGM_OPERAND, ra);
> -        return 0;
> +    for (i = 0; i < len; i += 8) {
> +        if (!memory_region_access_valid(mr, offset + i, 8, true,
> +                                        MEMTXATTRS_UNSPECIFIED)) {
> +            s390_program_interrupt(env, PGM_OPERAND, ra);
> +            return 0;
> +        }
>      }
>  
>      if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


