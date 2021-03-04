Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4E32CCCB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 07:26:39 +0100 (CET)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHhRW-00038Q-Em
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 01:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhPy-0001yw-TQ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 01:25:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhPx-00066Q-01
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 01:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614839100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOee7X8Kdaszy+K+bsK5PH8LV+4q28xW28VP0oBbsvI=;
 b=Y0DScGD0Znhen9oRRZUsQzVwKxI0HzsT2dpgHP8IoBaM6YxrHxxDITBTjDzQoYke31ofUs
 WUbXw4UJBfgW4IhDnjOSV1B2njGTZi/rnfvr0nCLax0ObVyHJDXayY49aFQnTEgvuylmTn
 UJuPiiUtvFAECIVtlAdz8hVUc5UUvOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-CEFjQCKxMYmCPiVygnz3IA-1; Thu, 04 Mar 2021 01:24:58 -0500
X-MC-Unique: CEFjQCKxMYmCPiVygnz3IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8B191270;
 Thu,  4 Mar 2021 06:24:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D52BC6F447;
 Thu,  4 Mar 2021 06:24:47 +0000 (UTC)
Subject: Re: [PATCH 02/19] target/s390x/kvm: Simplify debug code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <20210303182219.1631042-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c77cfa45-9aa1-5b1a-3dd4-861290b11907@redhat.com>
Date: Thu, 4 Mar 2021 07:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303182219.1631042-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 19.22, Philippe Mathieu-Daudé wrote:
> We already have the 'run' variable holding 'cs->kvm_run' value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/s390x/kvm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index 7a892d663df..73f816a7222 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -1785,8 +1785,7 @@ static int handle_intercept(S390CPU *cpu)
>       int icpt_code = run->s390_sieic.icptcode;
>       int r = 0;
>   
> -    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code,
> -            (long)cs->kvm_run->psw_addr);
> +    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code, (long)run->psw_addr);
>       switch (icpt_code) {
>           case ICPT_INSTRUCTION:
>           case ICPT_PV_INSTR:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


