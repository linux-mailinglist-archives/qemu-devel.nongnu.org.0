Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3630DF34
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:09:11 +0100 (CET)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KiM-0007sE-RP
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7Kgq-0006mg-VL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7Kgl-000740-V4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wu4b8dylyAbllPlXdi+Ay2XikuKe5CRp0d+KsMCLy38=;
 b=UiqCx0vZVc6964zpVNMrC52UWcbPZo8UBUDJ4oNWBXqs+KPwTfznsOg3pnoDicebO2l2Ci
 5x81RiP2SshwbudwzX7cHLPO/fhB9l+Af/4fEnHsbRyJznbFEWqIvEjJqrSfBP3JOJ4dGi
 H6znugi8xTAcrEgQTGusyFg2v5Oprgo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-QULVuEM0PKuX2-0Ce3uw-A-1; Wed, 03 Feb 2021 11:07:27 -0500
X-MC-Unique: QULVuEM0PKuX2-0Ce3uw-A-1
Received: by mail-ej1-f70.google.com with SMTP id k3so12270011ejr.16
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wu4b8dylyAbllPlXdi+Ay2XikuKe5CRp0d+KsMCLy38=;
 b=CtuK2EYZBAxulmewKsE35hfMaB7EGYZVbVIGM4dVVUAbmI/smkp/zg+lDhaFPrd1EN
 cGgrYugh6irlhXZwQ3fIHz9L8mPPvF3J00ONPK2mROfgtXQTpLFRHSBbG8aQwu4GBxk/
 xRkmdNfTlMD0vyjQEilm2RCB8r05/UPnqTNIYfS73HjiThKUWkaRmiBB6KkNs8Yx6RqV
 KBFcM0vVzjMyXtO7t7ozx9czN+zzXXCfjWXwbCYUDe7Asmnj1Hs0x8XjKfsj6oA24NYo
 k3qJ+MT7iZ46eg9hfhPdpWPiT/zUz5nuEukFkZSC4/vWbj7cuUOMRk+5BnnIvgeyGnRd
 fo5Q==
X-Gm-Message-State: AOAM530l3901jaxiz576eb/bJEgyj0IxGq2Z8JUyuQmsphtQynVDvcmd
 gT5siWNF+YT+x2ll8knst8hj9/SwdRfKeYVUfOVcuqjiW3t+dpYlx4sZCY/hpCPconJFXn6KAgj
 u6U83yCORAD2UFOA=
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr3810253ejf.211.1612368446464; 
 Wed, 03 Feb 2021 08:07:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaaZdYfF9D5ch7efbVmriVMi7iMcIEJGZ+ndjzA5pZ2PvDM/QER2lCzFC08OGuAEG7FUEnyA==
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr3810225ejf.211.1612368446327; 
 Wed, 03 Feb 2021 08:07:26 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id p25sm653835eds.55.2021.02.03.08.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:07:25 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2] pc: Don't make die-id mandatory unless
 necessary
To: avocado-devel <avocado-devel@redhat.com>
References: <20190816170750.23910-1-ehabkost@redhat.com>
 <871rx5eq8j.fsf@dusky.pond.sub.org> <20190828143524.GA7642@habkost.net>
 <20190828185718.0e4eced8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0dff8dbb-7fd1-f16f-4528-1bf92db43f35@redhat.com>
Date: Wed, 3 Feb 2021 17:07:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20190828185718.0e4eced8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>,
 Vanderson Martins do Rosario <vandersonmr2@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel for test ideas.

On 8/28/19 6:57 PM, Igor Mammedov wrote:
> On Wed, 28 Aug 2019 11:35:24 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
>> On Wed, Aug 28, 2019 at 08:52:28AM +0200, Markus Armbruster wrote:
...
>>> In addition, I'd like us to either work on making the rule stick in the
>>> future (see my reply to Igor for an idea), or ditch the rule.  But
>>> that's outside the scope of this regression fix.  
>>
>> I'd prefer to ditch the rule, or at least change it to be a
>> suggestion instead of a requirement.
> Perhaps someone reads docs and uses API as designed (libvirt is not the only user)
> 
> I'd prefer to allow implicit die-id in 4.1 and 'stable' as that
> ship has already sailed and make it mandatory since 4.2 as it is
> supposed to be (+opening bug on libvirt - hoping that API would
> be fixed properly this time).
> 
> 
> Another related to die-id series bug:
> We should hide die-id from query-hotpluggable-cpus output
> for 4.0 and older machine types as well, so it won't break
> migration for users that implement interface as documented
> as it won't be possible to start
>  old-qemu-4.0 -device cpufoo,die-id=0,...
> since that "-device cpufoo,die-id=0,..." were used on new-qemu source.
> 
> PS:
> Adding affected targets maintainers to the loop to see if
> we can drop restriction.
> 
> Even though it works fine for die-id and I don't see immediate problems
> with relaxing rule, I reluctant to do it, since instead of simple
>  "add all properties you were told to"
> implicit rules would evolve into mess similar to smp_parse() over time.
> 
> Also if we would need to change implicit values logic down the road
> it would be a pain like with any default parameters in QEMU, which is
> a good reason against relaxing rule.
> 
> 


