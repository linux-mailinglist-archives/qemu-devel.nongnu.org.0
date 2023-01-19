Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C0673DC0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIX3D-0008UT-OG; Thu, 19 Jan 2023 10:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX38-0008UE-D9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX36-0005rJ-Uu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674142915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8TJC+6KTSfqQFuYTIVlMWRtQxJ3Jh97cuo8zl5mC0g=;
 b=W34Ye8stXcnpa2XHy+0ccqPXmDmAl9W7KrbXplobEBlDcsqEz9OFrqPSJ9H/B+TblwNU5p
 ERo8ZMrqkSaseyHolhqtShUJpIuxY84iqj7BZ9Wfeg4b+nmpupTN1QWqGtCPCjYhNRYbcY
 wxovKZ3cGwYa7kheGORw5f3D7uTeWN4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-MmZrc5DiN7-gpMMSxppEEg-1; Thu, 19 Jan 2023 10:41:52 -0500
X-MC-Unique: MmZrc5DiN7-gpMMSxppEEg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gn31-20020a1709070d1f00b0087024adbba2so1877140ejc.20
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8TJC+6KTSfqQFuYTIVlMWRtQxJ3Jh97cuo8zl5mC0g=;
 b=J5K/6g5aXdDX/V/OvFQGfjG9byeSSdWYqLv4InQNnuoQAKBrbciDWWvIrWeFQWvJbU
 ZT1WvDc31sxGSlUfB6DvbKeOT7Qrwl4M6Ck6Cd/PCpcMivBI7RroMelf3fEtvLeLFMjR
 YoxzqRMrcbU+qrKeJc5ofwj9VUS8f+3jTHUqL4FcnfoZqg4uUI4gloHtIDr3bI0azKIG
 TTWBaKGX8qaGrkeTRLLx2qZ0fOYbi4naMI8eByveuPilgQorFM8mODo4NXnAOLFp40Xq
 04Y6N+1wUCZ3QvXtLVM6w26q0WzSm7f7r83EwxIg4duaH+tpPj2r9qz3fj1SVFItvOu5
 e1rg==
X-Gm-Message-State: AFqh2krfr/TidaB5yfsN57lJsAQ+Ma6nh/DeFQJAl/ZZGVqJ5i1zn8RB
 jpi0dsrFPJ7YGWB//dwgJxP4iTc+sGYx7nqHGgzCf/a7xJN/LVFuwfbJscorho1JH3G++RnyYph
 sr0lUDCQ/2ucIcaEk9YMuP3KzRqAKJA/R23/a2foqAo0q7eXWhqfoSUCqbFLlCfzIgC4=
X-Received: by 2002:a17:907:2b01:b0:877:6e09:468d with SMTP id
 gc1-20020a1709072b0100b008776e09468dmr3048491ejc.7.1674142910747; 
 Thu, 19 Jan 2023 07:41:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtVVddGi8msuvgnfXvpB8tf3bLefyvr3fzwUKK5+PwcVMjnrgtTvc29O0pJvQF6kWWIxGbOFg==
X-Received: by 2002:a17:907:2b01:b0:877:6e09:468d with SMTP id
 gc1-20020a1709072b0100b008776e09468dmr3048477ejc.7.1674142910534; 
 Thu, 19 Jan 2023 07:41:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a170907741300b0085e05b4f815sm11277660ejc.95.2023.01.19.07.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:41:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PATCH 1/5] scripts/ci: remove unnecessary checks from CentOS playbook
Date: Thu, 19 Jan 2023 16:41:41 +0100
Message-Id: <20230119154145.471156-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119154145.471156-1-pbonzini@redhat.com>
References: <20230119154145.471156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The playbook is meant for a CentOS 8 install and is already checking
/etc/redhat-release.  Simplify it by checking only the result of the
"extra check" rather than the Ansible facts dictionary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ci/org.centos/stream/8/build-environment.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 42b0471634c2..fe8807b7b074 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -17,8 +17,6 @@
         option: enabled
         value: "1"
       when:
-        - ansible_facts['distribution'] == 'CentOS'
-        - ansible_facts['distribution_major_version'] == '8'
         - centos_stream_8
 
     - name: Install basic packages to build QEMU on CentOS Stream 8
@@ -46,6 +44,4 @@
           - systemd-devel
         state: present
       when:
-        - ansible_facts['distribution'] == 'CentOS'
-        - ansible_facts['distribution_major_version'] == '8'
         - centos_stream_8
-- 
2.38.1


