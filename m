Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCF4CD149
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 10:38:00 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ4Nq-00078W-Ig
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 04:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nQ4Ip-0004Ht-EM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 04:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nQ4If-0002Ag-KY
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 04:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646386356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64i1wxDZKAk+TlHAePdDF6PDVJhxRqecOR5GdP2KWfQ=;
 b=ELDJF/USPFaZmYXHATjKOpCAq2Zd4vRWQEn93mWpImblj19LOKqW9il5hgZwqerG/6UZ9e
 47vb2iDAjiZH3tl19mghEGQ7XH+qiQnZUA+usVaHn087zNp328GWu7aqN6ISpG93xQpuyk
 go52a+UuyCScuG9e0UgGhQngN/andX0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-7Jku3pxMMjm0vMcmHAYs6w-1; Fri, 04 Mar 2022 04:32:34 -0500
X-MC-Unique: 7Jku3pxMMjm0vMcmHAYs6w-1
Received: by mail-wr1-f70.google.com with SMTP id
 o1-20020adfe801000000b001f023455317so3165585wrm.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 01:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=64i1wxDZKAk+TlHAePdDF6PDVJhxRqecOR5GdP2KWfQ=;
 b=F7st47Zhj6xmhfemRVNOP8HKvTtXhvM0IzhNbjjY0TumFZNC+LEWuG82xT422oU6AI
 g8BCTXDD5svEW+T1vmppqqL6rdJXWcixSaZnd8UNuWqPqc+34ls3rxxWZ9BHF6Xad7ud
 0T3GjbNGsXJl92FQODuviMWbGzhhyXAnSYCYMDHkoy917Xcbnpgr9scQQJbOgaIgsWhJ
 WuXmDGUhiF+ABLYwAp7q6JVW8MFwbR48IJgUPI/NbxawUBrPRYBjmEIL1NWCIF453HPe
 8keYmEVqltihuvkuph37e+JDeUhw+7HO+3jwWYdmG+vArchtOoKxcJ5uqaIFdvlb3WWW
 EHVg==
X-Gm-Message-State: AOAM532Qr76+N5GHtA8jxHCrC2D5hjfiDaqWinEC7QNutME2Fj8sFfNM
 w89/EtEderT3iv/arsOUDDT7aTG5a5qEMoLhY2m23uDmGvFAl7RVNibmCfS2OL0WxRjBfHt243e
 jAiP1ApYfkdElXpM=
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr28207320wru.426.1646386353201; 
 Fri, 04 Mar 2022 01:32:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyODYNdyydjen3XF9LUFopr+U8WGmbE/rvw+NJzV0fB/bX0FvRiYefNBW25lc42PDv8q6lQWQ==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr28207298wru.426.1646386352964; 
 Fri, 04 Mar 2022 01:32:32 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056000038700b001f1d71334a2sm29856wrf.12.2022.03.04.01.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 01:32:32 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <310e3bd1-0ca8-ddc6-4500-dd1bea589fad@linux.ibm.com>
 <b39a5fd1-15a5-7461-0849-4b4478f1aef5@redhat.com>
 <b475d44e-3e25-7db2-7cde-6f6061f1610d@redhat.com>
 <CAJ+F1C+_u53t-n2MLfxxgdr8tbmVxNYNjGTN00-TLsM1Juy9GQ@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <2c78e8cb-962d-6edc-85b0-cd11c9a536a7@redhat.com>
Date: Fri, 4 Mar 2022 10:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+_u53t-n2MLfxxgdr8tbmVxNYNjGTN00-TLsM1Juy9GQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Juan Quintela <quintela@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-André,
On 3/3/22 5:16 PM, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Mar 3, 2022 at 6:41 PM Eric Auger <eauger@redhat.com
> <mailto:eauger@redhat.com>> wrote:
> 
>     Hi Stefan,
> 
>     On 2/8/22 6:58 PM, Eric Auger wrote:
>     > Hi Stefan,
>     >
>     > On 2/8/22 6:16 PM, Stefan Berger wrote:
>     >>
>     >> On 2/8/22 08:38, Eric Auger wrote:
>     >>> Representing the CRB cmd/response buffer as a standard
>     >>> RAM region causes some trouble when the device is used
>     >>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>     >>> as usual RAM but this latter does not have a valid page
>     >>> size alignment causing such an error report:
>     >>> "vfio_listener_region_add received unaligned region".
>     >>> To allow VFIO to detect that failing dma mapping
>     >>> this region is not an issue, let's use a ram_device
>     >>> memory region type instead.
>     >>>
>     >>> Signed-off-by: Eric Auger <eric.auger@redhat.com
>     <mailto:eric.auger@redhat.com>>
>     >>> Tested-by: Stefan Berger <stefanb@linux.ibm.com
>     <mailto:stefanb@linux.ibm.com>>
>     >>> Acked-by: Stefan Berger <stefanb@linux.ibm.com
>     <mailto:stefanb@linux.ibm.com>>
>     >>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
>     >>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     >>
>     >>
>     >> v4 doesn't build for me:
>     >>
>     >> ../hw/tpm/tpm_crb.c: In function ?tpm_crb_realize?:
>     >> ../hw/tpm/tpm_crb.c:297:33: error: implicit declaration of function
>     >> ?HOST_PAGE_ALIGN? [-Werror=implicit-function-declaration]
>     >>   297 | HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>     >>       |                                 ^~~~~~~~~~~~~~~
>     >> ../hw/tpm/tpm_crb.c:297:33: error: nested extern declaration of
>     >> ?HOST_PAGE_ALIGN? [-Werror=nested-externs]
>     >> cc1: all warnings being treated as errors
>     >
>     > Do you have
>     > b269a70810a  exec/cpu: Make host pages variables / macros 'target
>     > agnostic' in your tree?
>     I may have missed your reply. Did you have that dependency? Were you
>     able to compile eventually?
> 
>     Besides, do you have any opinion overall about the relevance of
>     transforming the CRB ctrl cmd region into a RAM device wrt the TPM spec?
> 
>     Again spec says:
> 
>     "
>     Including the control structure, the three memory areas comprise the
>     entirety of the CRB. There are no constraints on how those three memory
>     areas are provided. They can all be in system RAM, or all be in device
>     memory, or any combination.
>     "
>     (https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
>     <https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf>)
> 
>     What was the rationale behind using RAM device for the PPI region?
> 
> 
> Is this the rationale you are looking for?
> https://gitlab.com/qemu-project/qemu/-/commit/3b97c01e9ccdfbd517a0fd631838d6252dbfa692
> <https://gitlab.com/qemu-project/qemu/-/commit/3b97c01e9ccdfbd517a0fd631838d6252dbfa692>
> 
>     Note: bios_linker cannot be used to allocate the PPI memory region,
>     since the reserved memory should stay stable across reboots, and might
>     be needed before the ACPI tables are installed.
And did this mandate to use "ram_device" memory type instead of standard
system RAM.

As I understand the spec (statement above), the CRB areas can be
implemented as system RAM or device memory. So I want to understand why
using RAM device for the CRB is not a reasonable choice. By the way I
understand my motivation behind that change is a bit far-fetched and
aiming at fixing another issue, but well ;-)

Thanks

Eric
>  
> 
> 
>     There are some spurious warnings when using CRB with VFIO and that would
>     be nice to remove them one way or the other.
> 
>     Thanks
> 
>     Eric
>     >
>     > Thanks
>     >
>     > Eric
>     >>
>     >>
>     >>
>     >
> 
> 
> 
> 
> -- 
> Marc-André Lureau


