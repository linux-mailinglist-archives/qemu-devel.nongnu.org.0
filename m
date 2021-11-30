Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0FC46393B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:05:30 +0100 (CET)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms4hE-0008Cy-Px
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:05:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms4fI-00078i-IV
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms4fB-0007Rw-RO
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638284595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbxkYgzO+zBRTCuBpIDVZB9a1SzMOby+Uuxn0ODNfso=;
 b=bzs2qk/MUW5oCI0aQEsApXv0CXLhT53AnLKThItLLQlN7UIOmqpZ/+Rxkxs31b1fye5sym
 I/rQD/zpeiyzf+ELUjGzWIeX+KPjiGsPMkTcMClyhOxyeOKzRv/3Go91IJ0mitO+yupgIX
 Z54HQU2VJTbfYhnEQDCqtsEXKESvVKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-3QoUBH7MOvi-1AyGhhPRzg-1; Tue, 30 Nov 2021 10:03:13 -0500
X-MC-Unique: 3QoUBH7MOvi-1AyGhhPRzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso10594910wme.0
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 07:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TbxkYgzO+zBRTCuBpIDVZB9a1SzMOby+Uuxn0ODNfso=;
 b=imenniJR5siZ8deMzL3/nHbemlboZAr7X+V61Sfqe3HOudxScR4ij4GoE9CtLXBN8h
 O2yV+Q6hpmkHNP9x696vN/3wN34WGC8yvF/grc9h0H5FDt7vFZr/8xLUgDDrCaBG6eyR
 V31NfTecM6Vbr2BAb4dvYjvuHS8NXKHLRNagfZNNK9P7EN07/tEUDEtUjjZ+lbrBcsgX
 2e5mzM/K475wHDp8F3uT/0AbV2+qFlvup5UzJ7LLJsFEDrcUpb67fklE9nVgmoC+J4nz
 TtZUFDSLM3o9G3pvEBIHpnvmbmbuZd1pVYmMn4RlAWvwHsUadQd/ijpacMxjfIjz10+M
 NtdQ==
X-Gm-Message-State: AOAM533q//XoKz79ircyOJmeWZ5b1t4v1VKSRe6YVtqKJ0Rqxvcc9QKQ
 3IkqNBX1Z8IHraHWIa7Ep7Y122w4yX9Cf5XKLCKaQ1EBI2PYpuctnQyENuWoasflPraszwA02u4
 h40aNuYmWySnZny4=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr5645825wmg.67.1638284591819; 
 Tue, 30 Nov 2021 07:03:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2/TgfSGeheIwfQ3ppkYCFx7i5cx+GNBrNIC+tFIP/4S0znTaCE+OyMgewIfNlz0k7Xy41Ag==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr5645799wmg.67.1638284591669; 
 Tue, 30 Nov 2021 07:03:11 -0800 (PST)
Received: from [192.168.3.132] (p5b0c68ec.dip0.t-ipconnect.de. [91.12.104.236])
 by smtp.gmail.com with ESMTPSA id s63sm2848024wme.22.2021.11.30.07.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 07:03:11 -0800 (PST)
Message-ID: <922e64a8-a26d-6643-1ae7-c89282392038@redhat.com>
Date: Tue, 30 Nov 2021 16:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] memory: Fix incorrect calls of log_global_start/stop
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211130080028.6474-1-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211130080028.6474-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.11.21 09:00, Peter Xu wrote:
> We should only call the log_global_start/stop when the global dirty track
> bitmask changes from zero<->non-zero.
> 
> No real issue reported for this yet probably because no immediate user to
> enable both dirty rate measurement and migration at the same time.  However
> it'll be good to be prepared for it.
> 
> Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
> Cc: Hyman Huang <huangy81@chinatelecom.cn>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


