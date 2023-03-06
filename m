Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B26AD220
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:58:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJkx-0002Ki-33; Mon, 06 Mar 2023 17:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJku-0002KU-F5
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJkt-0007vo-2z
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678143390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxA5+OstVIMzN8ud6DgozRSr2XsB71P4rZVWNhustMo=;
 b=JFRHqIS1KspJMdbNPLnBZUNSw5qVg7Ql/sqRa9praA8V2heJ+3AhlMdU3oUYyzHN7nNFoX
 8xv9PMGFuXrx7kWPkR6q+mHriyVzOzIho/jYWaB7xFgd4RzXvgdRliRnqbyR7q+8YttNkn
 F21aY9Kl5WMXOlHMa6RzZerl9yw23g8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-4Ee3yyrmP1u1Nm_6JUmnag-1; Mon, 06 Mar 2023 17:56:28 -0500
X-MC-Unique: 4Ee3yyrmP1u1Nm_6JUmnag-1
Received: by mail-ed1-f70.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so13172170edc.20
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678143387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxA5+OstVIMzN8ud6DgozRSr2XsB71P4rZVWNhustMo=;
 b=uZhqsBPv9tw8ptuNmPcmOP78qLlkMAcDF9Z5zwut4ywzTKS8QgIqouTnqQ8P3TViVC
 BwXU2htD0lMtpYEJVglKKfR2lOL8AU3y48wONDRUj3oamG2MD74MWsu/P6w5Q90kQQgm
 AcmcgW2EoOd+LUr7CMy2zayriQGZwHNhFfwyEtBTrsjU1IGOjIxpCi3P/p/U13kMo3ig
 ZyOOZ37wG7zRFiUkWjCbztVZYKkNMZchuxq+Qz6ODwoZ7dWDOI21HiLMfCqTr9iu6yCQ
 Ntoz5zWR4YejHy5Wm2dxPetlBVYJb5tTAPyxMxYM3tziDLXYAQn8ww7dvi+y7Mg0SqAv
 i2Kw==
X-Gm-Message-State: AO0yUKWsnlCjjSH1t6qrLuBSadSjekJYFbwi7pGFev9pzIvebM8DNagf
 CEVwTakdXJpDDdL6/eiffgy5eutVVCvKvmmdV5O3rYvGe2l8pIZYsxzDw3U30awDCcxz8h+oP/S
 dhlPGonX7VuB+yYk=
X-Received: by 2002:a17:907:7e9c:b0:8b2:e6f6:c20a with SMTP id
 qb28-20020a1709077e9c00b008b2e6f6c20amr18573521ejc.11.1678143387704; 
 Mon, 06 Mar 2023 14:56:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/9sazACpneSw8hsOc4LC2cjGOI4ynEZ6jXyNg/908bkzEOnh0njFUkY8TkR98FX0FQ2uU5Bw==
X-Received: by 2002:a17:907:7e9c:b0:8b2:e6f6:c20a with SMTP id
 qb28-20020a1709077e9c00b008b2e6f6c20amr18573502ejc.11.1678143387397; 
 Mon, 06 Mar 2023 14:56:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 y4-20020a170906524400b008d71e08c78dsm5081867ejm.81.2023.03.06.14.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 14:56:26 -0800 (PST)
Message-ID: <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
Date: Mon, 6 Mar 2023 23:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 2/21/23 13:55, BALATON Zoltan wrote:
> 
> To get that menu with Shut Down, first Quit the installer then again 
> right click or click on background first to get the menu of the Ambient 
> desktop. I also see an error from the firmware at the beginning:
> Initializing KBD...00000012    FAILED.
> when it's broken and it says Done without the hex number when it works. 
> (Two other FAILED messages about clock chip is normal as we don't 
> emulate that but all others should be green.)

Ok, I've reproduced it.  The mouse is a bit flaky but using the keyboard 
for everything except right clicking works better.

Paolo


