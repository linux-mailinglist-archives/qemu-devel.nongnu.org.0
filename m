Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230D6EDCEC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:42:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDIX-0002NO-FL; Tue, 25 Apr 2023 03:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDIV-0002Hj-N5
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDIU-0005zL-2P
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bBT0AxsNQTzphsHBAEIkoxuxE4e/TRRiDlN38faL9w=;
 b=X71GEoQZ1Of/4nbJmkp67Tb02N9Al40r+sWU8xbucwpvjPMAsGJCcWs01S3P6doavUTyY7
 dvDMq+FOxyrwLKnMSHYru/m/Z56TY0G5rjXXrUbCTwRATeaPzi8+zqiLVfJSXJXjDZa/lt
 d/0iAwKUNzh5DodOjheCS64oBDU2K9Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-KLZdpXGCN1OO7CRRqlxVdw-1; Tue, 25 Apr 2023 03:41:07 -0400
X-MC-Unique: KLZdpXGCN1OO7CRRqlxVdw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f16ef3be6eso32249455e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408466; x=1685000466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2bBT0AxsNQTzphsHBAEIkoxuxE4e/TRRiDlN38faL9w=;
 b=cMgI7aCDXQiQaf/a/BUO5qX0tneeXFp8v9EoTL9KFUs4hNDvpSu+wbtAy6z9drE42B
 cs+1bRxK6Hllj7w94O81EEbGeHigjwA2BArpmlj5d3UVnUcw8dnm82OuCVR6uGiTxtvP
 uo8pGU2ducPHWosMf7sgaJycntYXAz++l0sEBww+vN09kUdPS18qtaSoG653mek304Um
 p5DeKdhY/+s7uEuiKjeILIf8d7OvlHlJOnOvIbQrij2faZ7WWyAXjGomq2hh5ycutnyP
 VzbyFUw8U563uQ+vexbnIEhCbi3es20bA4SM1rwsCgRvzOD1dsKNDnuXxHj3813o2DiJ
 2Fxg==
X-Gm-Message-State: AAQBX9ekTWFw4dglz/58ggWyGmhwvV9h7JmrdOFrZFjQ/awW61ZQrj+a
 IPvqQ/440Nr3O59UK7/b5yMNYOqMLJZaD5GnynVjCSZN49ThBLC4RgziLXMkFOfq/Plf9uUSgad
 /R+lNm2hLSHFcLPQ=
X-Received: by 2002:a05:600c:20c:b0:3f1:91c6:c794 with SMTP id
 12-20020a05600c020c00b003f191c6c794mr10064978wmi.5.1682408466280; 
 Tue, 25 Apr 2023 00:41:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZexJLJuAZS6EBaxE74YYDjiRlNU3BO+WCq093hLj9hBjnnOOiYquzax+DSsaK6lP8mrm3UAQ==
X-Received: by 2002:a05:600c:20c:b0:3f1:91c6:c794 with SMTP id
 12-20020a05600c020c00b003f191c6c794mr10064951wmi.5.1682408465995; 
 Tue, 25 Apr 2023 00:41:05 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b003ee9c8cc631sm17589797wms.23.2023.04.25.00.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:41:05 -0700 (PDT)
Message-ID: <c6c5f756-c226-e091-c30c-97895a0234ed@redhat.com>
Date: Tue, 25 Apr 2023 09:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 5/8] memory: Allow disabling re-entrancy checking per-MR
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <20230421142736.2817601-6-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421142736.2817601-6-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 16.27, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> ---
>   include/exec/memory.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 6c0a5e68d3..4e9531bd8a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -793,6 +793,9 @@ struct MemoryRegion {
>       unsigned ioeventfd_nb;
>       MemoryRegionIoeventfd *ioeventfds;
>       RamDiscardManager *rdm; /* Only for RAM */
> +
> +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> +    bool disable_reentrancy_guard;
>   };
>   
>   struct IOMMUMemoryRegion {

Oh, wait, that check for "!mr->disable_reentrancy_guard" has been squashed 
into the first patch now ... that's bad, I think you should squash this into 
the first patch now, too!

  Thomas


