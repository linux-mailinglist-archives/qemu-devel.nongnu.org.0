Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D226D3B91AF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 14:36:51 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyvw2-0001zN-Db
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 08:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyvuk-0000tl-8d
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyvug-00022M-Ns
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625142926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KZ4ramh02O0RPLnSUAdR3Z293qD4/91XMXEv0iF+1w=;
 b=YWWAvz8Dzpaepf+xePjCAf5oJYCrWV31Ap5LK0fGQxAL6wFqdae4qyPoL58gun2HqGr2ol
 Jzk8cz0fkzbUIez8t+4gin8XgbCOuIdrKksKZdTpag15ymtGgOZenLOE4xRowE4ARbFF/7
 UiHu+9oKdXt8HVpTu9j0htog/pJDaOc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-Y1BA2x7SMJ6JSuXEC-hcfg-1; Thu, 01 Jul 2021 08:35:22 -0400
X-MC-Unique: Y1BA2x7SMJ6JSuXEC-hcfg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so4506423wmj.7
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 05:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1KZ4ramh02O0RPLnSUAdR3Z293qD4/91XMXEv0iF+1w=;
 b=hOPCLRlkGaj6Rc5LayHmZvBmahxF+lUkFPKTGqVtWqByzV7cYgL4fMal8CzQ1Yzpgh
 qr4Krl4pj442ZXdAluKDxZvDGf8+GaflY5jz3of6ex7qNb3SGTolzvO0kqz/gCYRr3VP
 EtjBzhR6X4eiLdhTZ96D4loFUQlOrA9PkXdE0zj88p/atQyYozFdZaCyOkMpoQ3AzcjR
 /a842ci81l971M34JqHXXWw8NhySaLgxQJVvRgQ0k+7h9UWpkSzR6dbesr8PJiKD7gvB
 qUCgf0yufZNcEbWfzSi5LItUsu+W0nj/5bFBykOw33esvPgSlfopnMe+THa7tLh8yH/f
 tEig==
X-Gm-Message-State: AOAM532VzWeKsTzC578ugO43I+/M0e5wg6tLewwi5TRWH0sl0VYOBwZw
 6dl04RLY3scM/3F43W9XdDopf+xcWRI7VM4BkrlEKvwlU67lAsIBIOBoLOzL52jLi0D4ST3Amg0
 bN/n7iAZwKtVXK/o=
X-Received: by 2002:a05:600c:1c03:: with SMTP id
 j3mr16970733wms.130.1625142921863; 
 Thu, 01 Jul 2021 05:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1xPuUh3ckHRMZ1aT+R/3afzXapCtf6OcizWe73dsaubCbU4j/Yi9xFnIVU8KimeeV8v19cw==
X-Received: by 2002:a05:600c:1c03:: with SMTP id
 j3mr16970704wms.130.1625142921687; 
 Thu, 01 Jul 2021 05:35:21 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id a11sm9943105wrt.71.2021.07.01.05.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 05:35:21 -0700 (PDT)
Subject: Re: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-9-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
Date: Thu, 1 Jul 2021 14:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-9-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.com, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> Splitting this functionality also allows us to make helper.c sysemu-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/s390x/cpu-dump.c  | 176 +++++++++++++++++++++++++++++++++++++++

Apart from the dump() function, the other functions here are are used in 
other contexts, too, so maybe the name is not very appropriate here... What 
about naming it "cpu-state.c" instead? Or include the functions in cpu.c 
directly?

  Thomas


