Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7565EA17
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOeG-0008Rm-0w; Thu, 05 Jan 2023 06:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDOeD-0008R4-L5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:43:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDOeC-0007hG-5a
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672918979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adAFVZhOL+kAFw4tCbf891nCMgFf+yR2OTW9p3yXWLY=;
 b=KwewBiv/xpeJ8jfgoC3WiD4EQ8w2RdYn1HIK67BRyG1Z4tbXajqJnVakOeBl34yCZCvR0W
 xrotljTL/0zfaLinFLrmySf+SRXmEADRJimxyHTuWi6ECHJwmzTWymruOFpNTHa77SD9Iu
 9krwE+eovZ/nGL3Hnh7XdIFJMe8/m5M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94--8V15Q67PzqKFAYqK7ChHQ-1; Thu, 05 Jan 2023 06:42:58 -0500
X-MC-Unique: -8V15Q67PzqKFAYqK7ChHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j18-20020adfb312000000b00293def622d1so2175895wrd.17
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=adAFVZhOL+kAFw4tCbf891nCMgFf+yR2OTW9p3yXWLY=;
 b=f9pl6WT/c+UNznKmrylNUNxHvQiSbiITh3p5bSK1uBXcGdxDppDmoHwMNnSTfvImYl
 UAdhNhY273zckt0Ek5MpVToDUHDnr3D2yC7GZTwJWbWV6mM1z3uQJJgzmUWKfJGUArnu
 yMNgZNF0a8GMn6b12KiAgr1wuXpnn1+/RyGJpFM7VAPBIuu9xLeqvbEZU8oQCmuRNaoX
 kOFUwqIlI1ZWB/A5RDIM0F+gcQ31og/asYZ0gUYnD4sz1X/rN8Ma0yuJmNlGxx7fEmrJ
 8O+yKpIoCChRfsGfuShJePgB8xVYAbZFEZ5GrpqPbUgFjVX2RHLYibfqnvy5UAxH+501
 PrHQ==
X-Gm-Message-State: AFqh2kr26KI+FmVjG5yjaeXfziSDaeO+ixlWnlJejTdCPn/vuxjRzG4s
 dHOW2ItAR0fvik8L81VGIXO3tBoNLJK9efdH1KBJlkBOP8EyIRsQo3rLbmmakWZrNFK3a9C2CvH
 v2c1K48Ubd0aO7Is=
X-Received: by 2002:a5d:4601:0:b0:242:63a3:2f20 with SMTP id
 t1-20020a5d4601000000b0024263a32f20mr39946111wrq.11.1672918977088; 
 Thu, 05 Jan 2023 03:42:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3yYdRS/mEu2Fe4m5sJ8M+s+/XNS/VZHcp3CtwQbX/Aad284NKBOS4SilU97nU17ObJMxfSg==
X-Received: by 2002:a5d:4601:0:b0:242:63a3:2f20 with SMTP id
 t1-20020a5d4601000000b0024263a32f20mr39946095wrq.11.1672918976839; 
 Thu, 05 Jan 2023 03:42:56 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b002362f6fcaf5sm36267352wrj.48.2023.01.05.03.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 03:42:56 -0800 (PST)
Message-ID: <61d70e15-770b-7f62-54aa-3cc0ac3b3a35@redhat.com>
Date: Thu, 5 Jan 2023 12:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-3-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/5] s390x/pv: Implement CGS check handler
In-Reply-To: <20230104115111.3240594-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04/01/2023 12.51, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> When a protected VM is started with the maximum number of CPUs (248),
> the service call providing information on the CPUs requires more
> buffer space than allocated and QEMU disgracefully aborts :
> 
>      LOADPARM=[........]
>      Using virtio-blk.
>      Using SCSI scheme.
>      ...................................................................................
>      qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
> 
> Implement a test for this limitation in the ConfidentialGuestSupportClass
> check handler and provide some valid information to the user before the
> machine starts.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/s390x/pv.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 8dfe92d8df..3a7ec70634 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -266,6 +266,26 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>       return 0;
>   }
>   
> +static bool s390_pv_check_cpus(Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    uint32_t pv_max_cpus = mc->max_cpus - 1;

Not sure whether "mc->max_cpus - 1" is the right approach here. I think it 
would be better to calculate the amount of CPUs that we can support.

So AFAIK the problem is that SCLP information that is gathered during 
read_SCP_info() in hw/s390x/sclp.c. If protected virtualization is enabled, 
everything has to fit in one page (i.e. 4096 bytes) there.

So we have space for

  (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry)

CPUs.

With S390_FEAT_EXTENDED_LENGTH_SCCB enabled, offset_cpu is 144 (see struct 
ReadInfo in sclp.h), otherwise it is 128.

That means, with S390_FEAT_EXTENDED_LENGTH_SCCB we can have a maximum of:

  (4096 - 144) / 16 = 247 CPUs

which is what you were trying to check with the mc->max_cpus - 1 here.

But with "-cpu els=off", it sounds like we could fit all 248 also with 
protected VMs? Could you please give it a try?

Anyway, instead of using "pv_max_cpus = mc->max_cpus - 1" I'd suggest to use 
something like this instead:

  int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
                      offsetof(ReadInfo, entries) :
                      SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
  pv_max_cpus = (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);

   Thomas


