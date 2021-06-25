Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4A3B4111
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:01:50 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiej-0004RG-LX
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwi8e-0008I3-B3
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwi8c-0005LM-5o
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624613316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmhXbesrM50GvBWWCnUtyozWYL7gwYHuxCDuVr6fqGs=;
 b=YA0wUmnnBUJ/YzCW61XYowTQamZd32B5ODKSoXznvjMH3ZB0L+dMIYtVz57CFWQ1Cmd2gS
 uLZ+cbOWts9NLPsCvUTpn6hKbVKdOAP50llNciMlRaiJBGuGDkdzbjcI6xFLc4xBurMOsB
 WWGhUUk7k+ZNrCpnyY8uft56tRm03dQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-FQ1m_vgOPg2pUqH5Ff97Kg-1; Fri, 25 Jun 2021 05:28:35 -0400
X-MC-Unique: FQ1m_vgOPg2pUqH5Ff97Kg-1
Received: by mail-ed1-f70.google.com with SMTP id
 p23-20020aa7cc970000b02903948bc39fd5so4850102edt.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SmhXbesrM50GvBWWCnUtyozWYL7gwYHuxCDuVr6fqGs=;
 b=Dy16wqlg8fBiL6dRBjXWBzW8C8L3qB4WV2a3dkcKX/5L1lodqQfV87Pn8lJcqXjRjk
 0DaiQ/WOERgD75bztKseTJMrrBQWhCDo1GzFr8oDDLGDSpfeQODm2hYfdjriWDlH1sj8
 0ez3L9aBJLBTfqihUP/CjVDcmw1oitngNkzQx1zKNF8RP/358yZwt/kTm705KT2/jIGx
 +XLZMVbRFW+WxnblsH2xqV84qn8jqYx4fMg1Tc5U10p9GAoeKUnZ9DW0FsruzxoJe5K+
 qSd6gOJ8OgajKoDZbgMI6GBcb3e5osOX0MkzJNI8MjBC0+oc5J3V7AhCMj/uwku3kPos
 hGQw==
X-Gm-Message-State: AOAM533AKgzNQs0fyB8mKDE+1t4LHJhYeQmkWAjuVrqm/AB6mn/8l9rc
 BNXg+ShXUQ6rqrN7nJAQF5BlGhT54hRD3xIgy1YIWjH73jdmGPtd8YhVoA9dt/cT5eWLDpw0h0U
 9iOq6l50609eJj/k=
X-Received: by 2002:aa7:ce0c:: with SMTP id d12mr13284258edv.49.1624613314398; 
 Fri, 25 Jun 2021 02:28:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0e7AY4GL8p9kvn8cevIbH7/9cDZVcEHZTZVVA2aA+Cyy+o5TlGywaR7PSyDmO1W8vLjTiRw==
X-Received: by 2002:aa7:ce0c:: with SMTP id d12mr13284236edv.49.1624613314165; 
 Fri, 25 Jun 2021 02:28:34 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 u4sm3292427edy.60.2021.06.25.02.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 02:28:33 -0700 (PDT)
Subject: Re: [PATCH v5 00/11] block: file-posix queue
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <176597b0-f42c-601d-a401-e47fd0b60a3c@redhat.com>
 <ec71bd52-4b08-bb01-8a48-dab20c97b3ed@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <912916c0-12a9-2dc8-be62-e061372581bc@redhat.com>
Date: Fri, 25 Jun 2021 11:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ec71bd52-4b08-bb01-8a48-dab20c97b3ed@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.06.21 10:52, Paolo Bonzini wrote:
> On 25/06/21 10:37, Max Reitz wrote:
>> Thanks, looks good to me, though I’m afraid I’ll be on PTO the next 
>> two weeks so I can’t take this series through my tree... (I don’t 
>> really want to send a pull request today when I probably wouldn’t be 
>> able to deal with potential problems)
>
> I can take it too, if it's okay for you.

Sure!


