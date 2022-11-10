Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8362418C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:37:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5qz-0007iK-WB; Thu, 10 Nov 2022 06:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot5qs-0007gT-8i
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot5qo-0007d7-2F
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668080164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E37F5CVP/8wAa3wClBMX20G1Of3v0K6qhN85gH2/zkg=;
 b=DNlIy+XyxIhkVbXYUsRIS4uToE3mJK9GLUJK8Heq/7BsuZ7Vu4IWL6AolKwHBy9JpFRjI0
 rXWs6NyGVoPVdazwrhl5fT2hsY4yvwmK0yTTj9e+/aGOKj/AmOANImWlrB/TsiXnJlnEwQ
 CtBFHtS0UXwDF9m/pLP66Z/k8iRg+ls=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-Jem3PKwMOsu0pncV8wNfQQ-1; Thu, 10 Nov 2022 06:36:03 -0500
X-MC-Unique: Jem3PKwMOsu0pncV8wNfQQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 r9-20020a17090a2e8900b0021409b8020cso3317499pjd.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 03:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E37F5CVP/8wAa3wClBMX20G1Of3v0K6qhN85gH2/zkg=;
 b=kVi3jnuHBQnerg66oHTByX38qD62E/ifswE6lNzBikEVXQ1hFCu7nKlJbTRQdDt9/t
 g7mwOeP3i4NW6MSeGAYVhat2mFsIwGgQgz3MHusZYVhRdu5mw9pKa40K/Qlc9e897meo
 6MsR9YJ8QpoDaAuZik5b6y+Ov18GU7SP14H/VAwzD1CLe50LuIUl0XN8kHSitCOnwZs7
 iyTBlzpyQyxMwcUlTyBERTNnZmJERPelWTeJddr8osJy0OYSKuqofW64WtP5xGnEytGf
 xuTZdkkmrDOfTMED6dJzM1ykgaAuMuU6mlRimvYOTY/OJG6oBULGiTXhUvsgdTtgU+bB
 foyQ==
X-Gm-Message-State: ACrzQf1XXm0gVjQQATIiZyItAPx3gkeR2zobsk+RiDLXQ6oRlnI6q/mH
 QSfDNq9xht2DOteb0R0rSZxpKqNKd+hEBgb/5GvWTrNFduVxEbkNKdJlIMzThoJHqZ+QaLMQBPu
 HELBUKqNd5iuYdUM=
X-Received: by 2002:a63:5a1a:0:b0:456:d859:2145 with SMTP id
 o26-20020a635a1a000000b00456d8592145mr2352267pgb.56.1668080161294; 
 Thu, 10 Nov 2022 03:36:01 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4F0XNd7H2Or6fefWFYUV6VZF9E8UrFpSLQtmYw4xYYRRXT+v21mnx6//pTaBgN8uULbCfjWg==
X-Received: by 2002:a63:5a1a:0:b0:456:d859:2145 with SMTP id
 o26-20020a635a1a000000b00456d8592145mr2352250pgb.56.1668080160932; 
 Thu, 10 Nov 2022 03:36:00 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a974600b0021806f631ccsm222809pjw.30.2022.11.10.03.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 03:36:00 -0800 (PST)
Message-ID: <082435f5-6a91-1418-1d27-9369e439854d@redhat.com>
Date: Thu, 10 Nov 2022 12:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
 <92cea786-0a5d-1ddd-68d5-14ca98143614@suse.de>
 <6d6d0704-de37-db36-223e-f770311c70fd@redhat.com>
 <2cdf742a-b756-e586-229b-a27ceea4dfd8@suse.de>
 <516f943b-b741-3111-39f2-64aa6b69f0f4@redhat.com>
 <b7921236-b9ac-aa43-b1a8-863c8df8b7a5@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
In-Reply-To: <b7921236-b9ac-aa43-b1a8-863c8df8b7a5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08/11/2022 10.43, Claudio Fontana wrote:
> On 11/8/22 09:59, Thomas Huth wrote:
>> On 08/11/2022 09.52, Claudio Fontana wrote:
>>> On 11/8/22 09:42, Thomas Huth wrote:
>>>> On 07/11/2022 13.27, Claudio Fontana wrote:
>>>>> should -net and -netdev be adapted too?
>>>>
>>>> "-netdev help" already works just fine ... and "-net" should IMHO rather be
>>>> removed than improved ;-)
>>>>
>>>>     Thomas
>>>>
>>>
>>> I wonder if it could be done once for all, in net_init_clients,
>>> instead of repeating the is_help_option in net_init_netdev and net_param_nic
>>> (and that would take care of net_init_client too, so we'd get "net" for free)..
>>
>> I don't think that it makes too much sense to have one option for all -
>> since all three CLI options are slightly different anyway. E.g. "-net nic"
>> only exists for "-net", "hubport" cannot be used with "-net", "-nic" can
>> also be used to configure the NIC model, etc.
>>
>>    Thomas
>>
> 
> Hi Thomas, I would not suggest to merge everything together,
> 
> I was considering whether it would make sense to just check the "type" id for is_help_option
> once, since all the options "net", "netdev", "nic" have a "type" implied_opt_name,
> 
> and so it should be possible to make a list of structs that signify what to do for "net", "netdev", "nic", and
> loop on that and check for that help string once,
> 
> and then split off the codepath into the "net", "netdev", "nic" - specific code as it is now,
> either manually or by storing the function that is now in the foreach as a function pointer in the struct, ie moving the is_help_option check one level up.
> 
> However, it might not be worth it since it seems that for "nic" the nic models need to also be printed, so it might make things needlessly verbose.
> 
> Not sure, have not tried to write the code for it.

Sorry, I currently fail to see how that should really work out nicely, so 
I'll continue with my current patch. But feel free to write some patches, 
maybe it's clearer to me if I see the code.

  Thomas


