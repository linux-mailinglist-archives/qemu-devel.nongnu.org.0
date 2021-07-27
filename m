Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6BA3D7557
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:52:46 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MZh-0000Bw-Gt
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MXM-0005vt-3F
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MXI-0003rV-5S
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1LsIJvSSFTw1m6TPHvHAGf1RSL//LJLN36euyIUmmQ=;
 b=Rwszyzz8xJYxHhv8d9RCw5o7I9HzXd2cdM/iKJO3JHDgGY+ozdEkZR5+gALdeoo863T96j
 i/0V6Htm4gRWhd9kCef0pvEm9lXduwgmhrldMPIkEahT7ZgWictpzMXL8ALxKnWucojimG
 ZHLLlzh6rnlAnH24shhTfB+p4HVlYUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-MpyDMlhUPmSbSpW0KMxPng-1; Tue, 27 Jul 2021 08:50:11 -0400
X-MC-Unique: MpyDMlhUPmSbSpW0KMxPng-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so5942204wri.17
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=B1LsIJvSSFTw1m6TPHvHAGf1RSL//LJLN36euyIUmmQ=;
 b=KP/g5kZcNa6StF8CEPLXrYyHsF6MFEsagKfUFVz8EJIxg1cA+X6XA4v9Mw7NB1ps2a
 o425NXyIpSnIg0KejtsEq6d6UB8mMsNtZyv3or1pUFgI7wNLPrWEXEZimKnD6mi37wcg
 BsQn1DzbGHibZ8nMGWAcV+m2UZY3gSZd9WqXuogQ3uGidPlEP+GJgesNavCO8sXbA18d
 BHenEG9DDXfQAxYlGkXUF2xMRsuJSlGYJU2homS0/8mIUqaS17g3NFJkTwlOkfVKFKP1
 sWjNYwFkftXiFPZOZash5xTOILrKjgMswDAMnZNAJe/0cWEoZyjQPs/P2o9pmY4CmqDu
 gjiQ==
X-Gm-Message-State: AOAM533UqeSXriUe25gwC8imp7ptphU6nuEeqvx+DN5s2LQ7BsCSmOxt
 X9c33piFqKyzRhZ/WVu/lL1l1kE9WwgFnXjOz3euEVhGgYPkppv79bQfk4DUb6dxpAorsI0/PZS
 1mBvVFY930NLBpOE=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr19291363wmr.168.1627390209807; 
 Tue, 27 Jul 2021 05:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzTUSeihFgNTymVP87uiPWQVE6HjvaXth1PkKY45Kd9G6ZFME0Ks8eR1EKdMA/M7FSg6iynQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr19291347wmr.168.1627390209619; 
 Tue, 27 Jul 2021 05:50:09 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 d67sm2969878wmd.9.2021.07.27.05.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 05:50:09 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] cpus: Remove the mutex parameter from
 do_run_on_cpu()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-7-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <1e61bcc4-d907-5409-f85a-448761300b85@redhat.com>
Date: Tue, 27 Jul 2021 14:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-7-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 21:34, Peter Xu wrote:
> We must use the BQL for do_run_on_cpu() without much choice, it means the
> parameter is helpless.  Remove it.  Meanwhile use the newly introduced

s/helpless/useless/ ?

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


