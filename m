Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38844B227
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:47:43 +0100 (CET)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVDh-0006ih-Vb
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVCW-0005Z9-TN
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:46:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVCU-0007YG-BI
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636479984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnJZO305IbBVw2BdDYsNcL7DWbi+uTy+wLkK5S20nss=;
 b=K+7Iz84G531xe1W4D2YFsEKSvADMmc0IwLAtJ2GXgoJ2yNNTN70G4J9aSz5S2bo4FpVkif
 crcVijqZZfeIhVFRrRLuY/LGXPO3llEhNKW0P3HV65lkjqwi/NLnCTRn4fJjQ0JZTkueLK
 xfAb036Sn/Qq6oY6yera1/5IYTN83jU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-5PO62O40OvCwqy4RUbSunQ-1; Tue, 09 Nov 2021 12:46:23 -0500
X-MC-Unique: 5PO62O40OvCwqy4RUbSunQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t20-20020a056402525400b003e2ad6b5ee7so18627208edd.8
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TnJZO305IbBVw2BdDYsNcL7DWbi+uTy+wLkK5S20nss=;
 b=A3lZlqELToZRz/gIDE4qLSjPIDlVsiUr+DSmzqkGmcthgyQa5fOIqNf89qzn9ysonC
 yA87aknEtBp8B71Ufzaod9rMWC6HMywY9Zx097PwHuEuCUez7Xg5Yajpi8KyJo4wOUPg
 RZg7427NP7NO/UjEJ2oZKSGNrF+iy/3tlDLrmLwbDJ9muXKCdL84wq1YgpqbiRX8qp3J
 YY92PX/mpGIVNgMBUD5+DvBGTIb0425vZfr+EuWdSTT8fgXYdG/jNgOE6zm5vyzNsx9g
 GtBvnoIEeSSFzv3Oy5SvP/aN42yM0Wq4kArpoBf28yyn3J8OEQA/of6e3uoLEjJZGfnx
 yl3g==
X-Gm-Message-State: AOAM531kF48ZF11ZGAVE/KD0NTU+YV8zNjNY0eOn9nKn9bicKZPapDXD
 TEKCq+muRS1ZediF7iGepuBfy17Soa1LkE5KNzUzqCQ98yfjAaS5b9btzwirEe8vP2U5EottYyS
 gSyzEKscN0xvgrVY=
X-Received: by 2002:a17:907:6eaa:: with SMTP id
 sh42mr11958280ejc.556.1636479982202; 
 Tue, 09 Nov 2021 09:46:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFcVI3zwoZ7eShtDOnpPLmMxSQzpa9Hx1zCoVAeKR3wNiBLOUT/7Y7wHyL8GDbu4N02Us52Q==
X-Received: by 2002:a17:907:6eaa:: with SMTP id
 sh42mr11958221ejc.556.1636479981829; 
 Tue, 09 Nov 2021 09:46:21 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bf8sm11543823edb.46.2021.11.09.09.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:46:21 -0800 (PST)
Message-ID: <5830d625-de03-7dc7-c662-e434ebeaa651@redhat.com>
Date: Tue, 9 Nov 2021 18:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Ping][PATCH v0] vl: flush all task from rcu queue before exiting
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
 <96bfe630-fb3d-2ac8-60b8-ae23ed7b3742@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <96bfe630-fb3d-2ac8-60b8-ae23ed7b3742@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yc-core@yandex-team.ru, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 08:23, Denis Plotnikov wrote:
> Ping ping!

Looks good, but can you explain why it's okay to call it before 
qemu_chr_cleanup() and user_creatable_cleanup()?

I think a better solution to the ordering problem would be:

   qemu_chr_cleanup();
   user_creatable_cleanup();
   flush_rcu();
   monitor_cleanup();

with something like this:

diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 7789f7be9c..f0c3ea5447 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -195,6 +195,7 @@ bool qemu_chr_fe_init(CharBackend *b,
      int tag = 0;

      if (s) {
+        object_ref(OBJECT(s));
          if (CHARDEV_IS_MUX(s)) {
              MuxChardev *d = MUX_CHARDEV(s);

@@ -241,6 +242,7 @@ void qemu_chr_fe_deinit(CharBackend *b, bool del)
              } else {
                  object_unref(obj);
              }
+            object_unref(obj);
          }
          b->chr = NULL;
      }

to keep the chardev live between qemu_chr_cleanup() and monitor_cleanup().

Paolo


