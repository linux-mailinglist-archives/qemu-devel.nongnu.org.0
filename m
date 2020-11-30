Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33212C8752
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:00:38 +0100 (CET)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjkfM-0002pv-Qe
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjkda-0002CT-L5
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 09:58:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjkdL-0001qs-DN
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 09:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606748309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbo8OGMxQjeQSYDp5vxc4DTWyCa6X6eDW1Mrx9WMFm8=;
 b=SLR+t6UXMHxixlsSmuIN2l7QTciR6c7b5oIuTY4O9r2D9q7cxwAvFJLLW89VV94zTupeUC
 yF2fsL8SOxcRvCyDqaydcJG5zM8rP4xyRC2lVHUqa9+eKRp5G3Sxdvp59eTmWe7sJf65Q/
 uaPQgDMCvIaSIj4vepytD3s4uxW2kEA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-qXOi7FbbMXWaAALgcNny1g-1; Mon, 30 Nov 2020 09:58:27 -0500
X-MC-Unique: qXOi7FbbMXWaAALgcNny1g-1
Received: by mail-ed1-f70.google.com with SMTP id dc6so4699588edb.14
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 06:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dbo8OGMxQjeQSYDp5vxc4DTWyCa6X6eDW1Mrx9WMFm8=;
 b=hi+41x+huSloKwSlSO5Lxrbz9ewbLr/hGgaOh+adPw1+6HCAVMm2JKZuKbEElMBCjF
 kjEO8BRBpuwZz4pgssQ2CXzEu0X24xRMITJ302/FiRQQkVbtT1LX4ssUhs6kWfe4MBn6
 U+DboKXP94Rd7HTIPYFRSyDg/IDBvQIiiYPrP1eOhroOoXhd5/h1i2g1Pf0ly6/6Xw/6
 l/FcyINWVi21bXyrbkTlRNZtm3Akyz6bVwKY17TMxOPJxPPbKjfRP8cTMZiQVtfrgJIj
 GrT2BmsaqNBx/BuSmGJHUYoTtn0wEXY2ZocAc9o90QsgDw2GdKvP4aziW+BMWDcsz23J
 jovA==
X-Gm-Message-State: AOAM533pKggpBCyoF807P3HCeAMDnHu4Ck00ftS4F2WlHbe8beoxSZFS
 lqgS5YDquYH/D6dr/nOrxkHIhzfLoBpdJlIbVEprdYvmPQYZu4G2QxTubBqXjYM8HLjSu4YsOhI
 ur4eTrMF4SgFaDwk=
X-Received: by 2002:a50:fd88:: with SMTP id o8mr1044680edt.386.1606748306249; 
 Mon, 30 Nov 2020 06:58:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5gItl99Bj3j3I4/KuA2rdsEZH7tD4eV2Bqj3xAG0mo4lrGA6xDJEhhFo7Wo6R0qdoFEsvvg==
X-Received: by 2002:a50:fd88:: with SMTP id o8mr1044661edt.386.1606748306061; 
 Mon, 30 Nov 2020 06:58:26 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i13sm8513028ejc.57.2020.11.30.06.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 06:58:24 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201130122538.27674-1-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
Date: Mon, 30 Nov 2020 15:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/20 13:25, Kevin Wolf wrote:
> This series adds a QAPI type for the properties of all user creatable
> QOM types and finally makes QMP object-add use the new ObjectOptions
> union so that QAPI introspection can be used for user creatable objects.
> 
> After this series, there is least one obvious next step that needs to be
> done: Change HMP and all of the command line parser to use
> ObjectOptions, too, so that the QAPI schema is consistently enforced in
> all external interfaces. I am planning to send another series to address
> this.
> 
> In a third step, we can try to start deduplicating and integrating things
> better between QAPI and the QOM implementation, e.g. by generating parts
> of the QOM boilerplate from the QAPI schema.

With this series it's basically pointless to have QOM properties at all. 
  Instead, you are basically having half of QEMU's backend data model 
into a single struct.

So the question is, are we okay with shoveling half of QEMU's backend 
data model into a single struct?  If so, there are important consequences.

1) QOM basically does not need properties anymore except for devices and 
machines (accelerators could be converted to QAPI as well). All 
user-creatable objects can be changed to something like chardev's "get a 
struct and use it fill in the fields", and only leave properties to 
devices and machines.

2) User-creatable objects can have a much more flexible schema.  This 
means there's no reason to have block device creation as its own command 
and struct for example.

The problem with this series is that you are fine with deduplicating 
things as a third step, but you cannot be sure that such deduplication 
is possible at all.  So while I don't have any problems in principle 
with the ObjectOptions concept, I don't think it should be committed 
without a clear idea of how to do the third step.

In the meanwhile, of course I have no problem with deprecating the 
opened and loaded properties.

Paolo


