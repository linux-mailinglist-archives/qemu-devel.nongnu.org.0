Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8408303B21
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:08:29 +0100 (CET)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MCy-000746-Jq
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MBw-0006Ri-16
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:07:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MBu-0004t2-L7
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXMyg99ktwYYwgpNOMdTILdL5TmgIyN7xoeaKVjeYh4=;
 b=d3OANj/2oK5YpMnEm7kHH03yGXmMywaFWnbCid1y2mFjHS6mkZRWXnudHcjgIcJHVYZkXN
 ltkwARwejFfDGAKlp4oKLoZ7ZrC+gfPHiSQzJ8c4XoMEQPXUO7aQRNYmxtGNqXRLR1cOWL
 x9zkkgxdoH5PFwCzB7rkOQ93gLb9neA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-ERGGIGUOPOuZ8OMdgRI1nQ-1; Tue, 26 Jan 2021 06:07:18 -0500
X-MC-Unique: ERGGIGUOPOuZ8OMdgRI1nQ-1
Received: by mail-ed1-f70.google.com with SMTP id a24so9179561eda.14
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oXMyg99ktwYYwgpNOMdTILdL5TmgIyN7xoeaKVjeYh4=;
 b=ICxwELlvh5zyz7x7/ELvzeP5gLxFvcsmVbnzvxv5QgPqkXA0xC/HFdae+U0M0MQz2h
 TTwzR8fwWDVKIIu/JMdrfWlKR1sTEbgv6xXgrSgXS+Tz3o3oTN0xJF3hWUzSycdmtN1y
 BGsik/yOVtEdIfQop7rerzdp3zUXA/zKUX9H4C3ZtClXA94fU60wk/jSIk29gXFWX0qe
 GN3MF8chFfbvH9QeQ+eq/92AbIfcQBd3qK1P/fhFWdfQNkn/Ew8hBVKkwCB24bkEpFdA
 0Pzo5bmGGURTFbz/N7CFuWu9gAtwLRk5q3D89BbWY0+it6dHQn8P6ulns9mBvtIJXiUk
 8F5w==
X-Gm-Message-State: AOAM531ARlal8b1CbjS5m/J0zv068B+vAZmvK7KwZLJzgiUX1iSEIAgT
 UK/mIHKD24Gw2DPanIFnM60wQFOrwGudv8zo2nklT4E0qc+8XPpBE/0cgDgzouUm2d6gKtt9NvG
 NKw9WOA8wM4RD4NU=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr4203071edc.164.1611659236881; 
 Tue, 26 Jan 2021 03:07:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVVH7mI21E69vhpGiKwiNF6lKf8Ermz8fauPBl0CKffQdPWmuAKPbztVsBLX8c99msrxR8Lw==
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr4203049edc.164.1611659236553; 
 Tue, 26 Jan 2021 03:07:16 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm1369735edv.32.2021.01.26.03.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 03:07:15 -0800 (PST)
Subject: Re: [PATCH 2/4] tests/qtest: Make fuzz-test generic to all targets
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-3-philmd@redhat.com>
 <54b8deab-5636-5821-4743-edc5375f2d76@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c992cce-b118-9963-0dfc-2619824b4f1b@redhat.com>
Date: Tue, 26 Jan 2021 12:07:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <54b8deab-5636-5821-4743-edc5375f2d76@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 11:21 PM, Thomas Huth wrote:
> On 15/01/2021 16.09, Philippe Mathieu-Daudé wrote:
>> Tests in fuzz-test's main() already check for the supported
>> architecture before adding tests, therefore this test is not
>> specific to the X86 target. Move it to the generic set.
> 
> As long as it does not run any test on non-x86, it does not make sense
> to move it to the generic set, does it? We'd only waste compile cycles
> that way?

OK, I'll resend this patch when the ARM reproducers are posted.


