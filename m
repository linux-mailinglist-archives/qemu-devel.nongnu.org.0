Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B26F59A6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:17:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDHS-00024X-LI; Wed, 03 May 2023 10:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puDHI-00021g-21
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1puDHD-0008H7-Ve
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683123375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evrP5yuS5k7Q9/lFUzQaMM16FXQESiHFug8t2qeSrzY=;
 b=HUK72qGqRO51wn8mGgWXk+WC+Nky3a0EG6ZY5j1AG8uRFw9ew+DVph5aPOefHHAbVVXnmA
 vOOv72URAUWGB3UU5zw6Fk2dTn3Og0GU69Xf5HW4YIpvON2cEXTIN4u9d53j+LreZQVvmX
 WR9JcMEL+iZie3C0eU7B07aYlE5Jty0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-bVOX_puoNNqFOBMX0LKSwQ-1; Wed, 03 May 2023 10:16:13 -0400
X-MC-Unique: bVOX_puoNNqFOBMX0LKSwQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30635d18e55so883573f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683123372; x=1685715372;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=evrP5yuS5k7Q9/lFUzQaMM16FXQESiHFug8t2qeSrzY=;
 b=LGDXWVnqniDDQlPIav8GtNiUMqx7TBX3myBPHjZR4LsH5l6msGK26ULMN9vXhbDihS
 moRblW38U5s24CkQfg+nCkONTAj8YqGsncW4CXD4FQE3uDLeokYPV3f2Gv3FUeKa4l3d
 GaU6xKnANGq1RbdsmAI96aINHwPEeVJ8bSGHK4GJoLLWMJRw94ScYhaiwNROG8LmxUvL
 XV8KAFbkBWyCLBGWFYST0Yq1RlMIO73KwKx7zXwYV3d2TN3QX1/gw83t2p01eOroa8XJ
 WFi/3sh8hADBNtVgU4uie+V+FhKBfnqyKkexMK0j2TJzXNPsCyonZaxpgdbzzXwvLXuS
 pU5Q==
X-Gm-Message-State: AC+VfDyVf7L9qOdNNPtvEr7kwapt7Yj8xrI/MWRQtNvIEj0k6+vQ0kYh
 oRqBKzBHnbdP9caKtJw1fApgcrAWGe/xDgu5fty8zBnV4+0uoiI0o3wu2gndMRjgWmA5fzaAqNo
 kbpXiDMCGYzuRpjo=
X-Received: by 2002:adf:dc04:0:b0:302:1b72:b951 with SMTP id
 t4-20020adfdc04000000b003021b72b951mr157363wri.26.1683123372699; 
 Wed, 03 May 2023 07:16:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7oUb8smz1ERt+gitGdeBct6SSIua7TXzRR/mfbPNY4k3XKoDOi/C5LTWtWxeD0lFy+zveE+g==
X-Received: by 2002:adf:dc04:0:b0:302:1b72:b951 with SMTP id
 t4-20020adfdc04000000b003021b72b951mr157354wri.26.1683123372379; 
 Wed, 03 May 2023 07:16:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:6a00:9109:6424:1804:a441?
 (p200300cbc7116a00910964241804a441.dip0.t-ipconnect.de.
 [2003:cb:c711:6a00:9109:6424:1804:a441])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5942000000b0030647449730sm394020wri.74.2023.05.03.07.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 07:16:11 -0700 (PDT)
Message-ID: <1c4aa62e-c6bb-d564-c272-a96cd1247ed1@redhat.com>
Date: Wed, 3 May 2023 16:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/3] vhost: memslot handling improvements
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230316153658.214487-1-david@redhat.com>
 <20230420162805.6781701b@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230420162805.6781701b@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20.04.23 16:28, Igor Mammedov wrote:
> On Thu, 16 Mar 2023 16:36:55 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Following up on my previous work to make virtio-mem consume multiple
>> memslots dynamically [1] that requires precise accounting between used vs.
>> reserved memslots, I realized that vhost makes this extra hard by
>> filtering out some memory region sections (so they don't consume a
>> memslot) in the vhost-user case, which messes up the whole memslot
>> accounting.
>>
>> This series fixes what I found to be broken and prepares for more work on
>> [1]. Further, it cleanes up the merge checks that I consider unnecessary.
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Thanks Igor!

@MST, do you want to these patches (I can resend in case it's easier to 
fixup the typo in patch #3).

Alternatively, I could send these patches along with another 
memory-backend patch I have queued.

-- 
Thanks,

David / dhildenb


