Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D31F66C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 13:34:42 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjLTl-0005Ad-Bu
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 07:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjLSs-0004ii-Hu
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 07:33:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjLSr-0007h0-Mv
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 07:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=2MrhYnJvZB9ucDVKqxStanDhO5Om5u13tRftOccw93I=;
 b=bll9qjoHMrhmvs5Nm9I+uEQgcW1B+VaXba8ySs2Q6eWKi0k8+06PtBuEAMPY7kItNfFZQu
 NYOokaNJ/t7lWGxjKUZZ1CPJdSk35JmbnYY4XI21Ck9AX01nzDE95hREcQCzb8Smgxx4MR
 euYLLT/FiejIZuWQw6b1uH4DBQ7EzR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-dH_uS4i1MQuFnFRLbwLZMQ-1; Thu, 11 Jun 2020 07:33:40 -0400
X-MC-Unique: dH_uS4i1MQuFnFRLbwLZMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D9548AB5D3;
 Thu, 11 Jun 2020 11:33:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8597E597;
 Thu, 11 Jun 2020 11:33:18 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] s390/sclp: get machine once during read scp/cpu
 info
To: Collin Walling <walling@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20200515222032.18838-1-walling@linux.ibm.com>
 <20200515222032.18838-2-walling@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <bf517581-8892-c823-8037-edbf7441881e@redhat.com>
Date: Thu, 11 Jun 2020 13:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515222032.18838-2-walling@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
 svens@linux.ibm.com, pbonzini@redhat.com, mihajlov@linux.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/05/2020 00.20, Collin Walling wrote:
> Functions within read scp/cpu info will need access to the machine
> state. Let's make a call to retrieve the machine state once and
> pass the appropriate data to the respective functions.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> ---
>  hw/s390x/sclp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index ede056b3ef..61e2e2839c 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -49,9 +49,8 @@ static inline bool sclp_command_code_valid(uint32_t code)
>      return false;
>  }
>  
> -static void prepare_cpu_entries(SCLPDevice *sclp, CPUEntry *entry, int *count)
> +static void prepare_cpu_entries(MachineState *ms, CPUEntry *entry, int *count)
>  {
> -    MachineState *ms = MACHINE(qdev_get_machine());
>      uint8_t features[SCCB_CPU_FEATURE_LEN] = { 0 };
>      int i;
>  
> @@ -77,7 +76,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
>      IplParameterBlock *ipib = s390_ipl_get_iplb();
>  
>      /* CPU information */
> -    prepare_cpu_entries(sclp, read_info->entries, &cpu_count);
> +    prepare_cpu_entries(machine, read_info->entries, &cpu_count);
>      read_info->entries_cpu = cpu_to_be16(cpu_count);
>      read_info->offset_cpu = cpu_to_be16(offsetof(ReadInfo, entries));
>      read_info->highest_cpu = cpu_to_be16(machine->smp.max_cpus - 1);
> @@ -132,10 +131,11 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
>  /* Provide information about the CPU */
>  static void sclp_read_cpu_info(SCLPDevice *sclp, SCCB *sccb)
>  {
> +    MachineState *machine = MACHINE(qdev_get_machine());
>      ReadCpuInfo *cpu_info = (ReadCpuInfo *) sccb;
>      int cpu_count;
>  
> -    prepare_cpu_entries(sclp, cpu_info->entries, &cpu_count);
> +    prepare_cpu_entries(machine, cpu_info->entries, &cpu_count);
>      cpu_info->nr_configured = cpu_to_be16(cpu_count);
>      cpu_info->offset_configured = cpu_to_be16(offsetof(ReadCpuInfo, entries));
>      cpu_info->nr_standby = cpu_to_be16(0);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


