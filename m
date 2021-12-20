Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5634447B265
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:54:35 +0100 (CET)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMrq-0004bo-Ek
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKj0-0003VC-AO
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKiy-0006V8-JV
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YNxGmtvgQ+CMFTebfzWGdlnqOaFP5HjHfla9hqGVlG4=;
 b=SAu0YdRsRovKKI/gleJoGKlkOI4uMKBAhNTxD/iIvohL/jVyq9L1vHQn9T8mEmBWhN0BQ9
 B5oxP23WHSdQ7ZXLykPwjGw3AqA46G6V3yC3Ad1XuCYcze+m6QfGN+AAuggrQ+8vMBgJHz
 3cDyizy9m8GDTrHWcYrO2x+rZea4OUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-ks-Od_1kOl6sbD5tC9C_Eg-1; Mon, 20 Dec 2021 05:16:23 -0500
X-MC-Unique: ks-Od_1kOl6sbD5tC9C_Eg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi14-20020a05600c3d8e00b00345787d3177so3150125wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 02:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=YNxGmtvgQ+CMFTebfzWGdlnqOaFP5HjHfla9hqGVlG4=;
 b=ybkm6wxvyU/9jw/xwSs+4B+wgO6v81cgyGoISEcVnEIgE+yOYKtVQKddLFOoE4c4yz
 gsm0CXk4AwMMjLHQOmzW1Cfxwyc1Z6wRE5y3t3R0oGKpMZo4a1+sUNAUlgB1CGVRkClh
 RVLu3tP2LyxfPTYQipYwa52q+Btx/1FsPHS0nWviCNunaKxaxH+4PhXp0GiW8q8LeW2g
 aiXeeoEode56oFQ48jOap3N1e4XPoWDWQHABHbcumdrEWvR7caI4x1SFnRsoZw9mi6kx
 1jpcEtFLae2k557sjhdO4n/97D27Uo50yZILSvyc5nETlH2jHITzGxdqQN9J/TFp3Prz
 MiWQ==
X-Gm-Message-State: AOAM530Mo1iuGLnNUJZc9a+6IHmlIpQaHA7RYH7CY6qXzIibwGTpWmWO
 SfYDS66oYffSF7rRSWFwWuFjjqCUarMk3xUr5yPKL2w/2UQdcBTVH9t3M6PPNxsn5nGABKoGFSu
 wM7VorpM537KWlDc=
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr13345689wmq.64.1639995382447; 
 Mon, 20 Dec 2021 02:16:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3s0kvcMi//ty7N7hoqT5nZW+CJZqawbkausm7jHh0cHtACkysv0t9cxd/BshtgEYcUcSi/w==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr13345670wmq.64.1639995382187; 
 Mon, 20 Dec 2021 02:16:22 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p21sm2673960wmq.20.2021.12.20.02.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 02:16:21 -0800 (PST)
Message-ID: <fcbae7f4-ff58-bb5d-fd5d-8b0145a6ee21@redhat.com>
Date: Mon, 20 Dec 2021 11:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Laurent Vivier <lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Warnings during the virtio-net-failover test
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi Laurent,

today I noticed that there are quite a bunch of warnings during the 
virtio-net-failover test:

$ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/virtio-net-failover
/x86_64/failover-virtio-net/hotplug_1: qemu-system-x86_64: warning: Primary 
device not found
Virtio-net failover will not work. Make sure primary device has parameter 
failover_pair_id=standby0
OK
/x86_64/failover-virtio-net/hotplug_1_reverse: OK
/x86_64/failover-virtio-net/hotplug_2: qemu-system-x86_64: warning: Primary 
device not found
Virtio-net failover will not work. Make sure primary device has parameter 
failover_pair_id=standby0
OK
[...]
/x86_64/failover-virtio-net/migrate/out: qemu-system-x86_64: warning: 
Primary device not found
Virtio-net failover will not work. Make sure primary device has parameter 
failover_pair_id=standby0
OK
/x86_64/failover-virtio-net/migrate/in: OK
/x86_64/failover-virtio-net/migrate/abort/wait-unplug: qemu-system-x86_64: 
warning: Primary device not found
Virtio-net failover will not work. Make sure primary device has parameter 
failover_pair_id=standby0
OK
/x86_64/failover-virtio-net/migrate/abort/active: qemu-system-x86_64: 
warning: Primary device not found
Virtio-net failover will not work. Make sure primary device has parameter 
failover_pair_id=standby0
OK
/x86_64/failover-virtio-net/multi/out: OK
/x86_64/failover-virtio-net/multi/in: OK

I assume they are false positives? If so, could you please come up with a 
patch to silence them, since they are quite confusing...?

  Thanks,
   Thomas


