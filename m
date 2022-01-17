Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F2490495
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:06:06 +0100 (CET)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Nxl-0003sx-S5
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Ntl-0002ou-V1
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Nti-0000Ye-Lm
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642410114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xzEsM+o9zYh87d8WusdyQw3hCjHIunfYwGCQ8xDQ1Yo=;
 b=EJiZs0sAII/nYRYVeXHRkRJ7ITiOoiFWOQc9Xp9cefcMM/fgnSMMfB+OKU/OC0A2tzXZHi
 W56zWJNi1Oc+hffUpXEBIAyhgK4QGrYc2zIoVFFs8sPzX8PekFpJCJ7OZWdnH5/ZY7dHJV
 il9XCEF+QAH+5ujaEKvYKJjUynNIR6M=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-AiAhFbiwMA2Xmk34sLUiXg-1; Mon, 17 Jan 2022 04:01:52 -0500
X-MC-Unique: AiAhFbiwMA2Xmk34sLUiXg-1
Received: by mail-pj1-f72.google.com with SMTP id
 e16-20020a17090a119000b001b28f7b2a3bso10525042pja.8
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 01:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xzEsM+o9zYh87d8WusdyQw3hCjHIunfYwGCQ8xDQ1Yo=;
 b=ctdANh3LZoRtxc04Mb+176QceTc0fObgdMFelcJDKH7SEhQlcUDs/Vwziw68i2G0wo
 F9uNS6j4ls5jT6snIE77b0v6U+fkua/4cMMBt+JpBP1FiZPUgSyXfPKFPpGJff+BuqeW
 fdcayoeUrleZtYYJKAU972ZiuHhbeH9putXopfqLeidYbfmK5XNb2y0CRBqaEHNKSVPW
 +n53JE3Il+WdlhcCrF61V73qycw4shb3DKVmy4KE4ArMd4S6xtKwkXhznIG/KpHAH/3i
 g7IXV9wLL7wE0tjAEe4Z10QHesh2PGNvz+PvxQrNt5DdBOYh2WcO2LOe0UOlNasoIPkJ
 8LtQ==
X-Gm-Message-State: AOAM53332WySjionuFVkoTaQ5WH8UZWlCAssbymlVY66Z3DmIdZfyivu
 xdFVjUDHf33WYc/Ee0aGdo9ueb0D7MX4Rd/m/JN3LJse/0Gy8wgJWRtIJJUrS7Crsc3broboqMN
 9cF5ro6XzhhMzocQ=
X-Received: by 2002:a17:903:32c4:b0:14a:67ae:3e03 with SMTP id
 i4-20020a17090332c400b0014a67ae3e03mr21235776plr.111.1642410111356; 
 Mon, 17 Jan 2022 01:01:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA+fJAFRS25O8mmYMgohvpSPmx24Q2AIKQMH4u3mG42lJViDDF5CgBSM2gcr7zL/0uC3/OSQ==
X-Received: by 2002:a17:903:32c4:b0:14a:67ae:3e03 with SMTP id
 i4-20020a17090332c400b0014a67ae3e03mr21235754plr.111.1642410111083; 
 Mon, 17 Jan 2022 01:01:51 -0800 (PST)
Received: from xz-m1.local ([191.101.132.74])
 by smtp.gmail.com with ESMTPSA id h4sm13591327pfi.79.2022.01.17.01.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 01:01:50 -0800 (PST)
Date: Mon, 17 Jan 2022 17:01:44 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <YeUweEjpMmPAYNal@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:14:08AM +0800, huangy81@chinatelecom.cn wrote:
> +uint32_t kvm_dirty_ring_size(void)
> +{
> +    return kvm_state->kvm_dirty_ring_size;
> +}

You may need to touch up stub too to fix build on non-x86:

=============
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5319573e00..1128cb2928 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -152,4 +152,9 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
+
+uint32_t kvm_dirty_ring_size(void)
+{
+    return 0;
+}
 #endif
=============

-- 
Peter Xu


