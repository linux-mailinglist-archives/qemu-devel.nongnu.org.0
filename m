Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDC6879E5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:13:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWaN-0001Cc-9b; Thu, 02 Feb 2023 05:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWaL-0001Bp-72
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:12:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWaI-0002MX-An
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675332769;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/ob5Yg8Nu/kIpM4kLiGVwqSfmm4hqhAsqiWp9YSvg8U=;
 b=eFpnA+6D5GtlDI9+CUFkihz6sUJF9k6aTTrAgscmUHD8WX6ZnYdpkh9zQv74CNnxF9B/VM
 26NLn4ECa3e8NmtCeAipsDEN3kI0luLfAqt15SerQTKqigqRWAk57IUOtc86Op1mLAtbvg
 7L6V55F5lnNSCWE5Rkz2ddsaoQwwrDI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-EBw9RkDNPWW3PxEara124g-1; Thu, 02 Feb 2023 05:12:48 -0500
X-MC-Unique: EBw9RkDNPWW3PxEara124g-1
Received: by mail-wm1-f69.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so2583705wmq.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ob5Yg8Nu/kIpM4kLiGVwqSfmm4hqhAsqiWp9YSvg8U=;
 b=Mt62PrSOQcI0cjsg9vcd+gpAwqcbNwaj5DC3jIA9MywjMkHsdWpAALgvlK5p4N/Xsc
 oPYzXcOD/O912q/CnQgOMtrEN0fz4G0tCmIR2tNFdXadDocZmebc8DClkq46vTo2Xten
 Q552bOf2qwYkjQ9eLsJuYfFqJEtjlRBy9Q5DjJjM2SXnj2z8UlcB9r2EWcZU0+iPOdrj
 keHxCkDwECakNQRdI45gvErXOCyvO7VAvo9rK2USKIDgFYSV5mostufNyVAXcvvAfoDF
 J1LBVuNuK4zULa1MPDU2jK5PNuzWGw025jyd0JFFG11pyzA2bnuSsDYbMnqcbz/EGvla
 daHQ==
X-Gm-Message-State: AO0yUKWQG5zm8jQttpqujUcPLK4VgPDxFyI2FM0/Tp9AP8Qro2gtkAfS
 A7xLN/9FzClW2Y9bKnCoOATOOttV2SEY1R9mIyaPG1G2eABwG/6MSevFiq66MSiID+4gxLxm7xG
 QcDe/lfjODItFRy8=
X-Received: by 2002:a05:6000:d2:b0:2bd:bed8:3b0f with SMTP id
 q18-20020a05600000d200b002bdbed83b0fmr5021400wrx.35.1675332766886; 
 Thu, 02 Feb 2023 02:12:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8hTE0q2nUKFRuwuJ2GIorqHYxqiosPrcACOm/pTQ8NgYazLpEOF+fi8rl2OA4QL+05wr2HJA==
X-Received: by 2002:a05:6000:d2:b0:2bd:bed8:3b0f with SMTP id
 q18-20020a05600000d200b002bdbed83b0fmr5021345wrx.35.1675332766597; 
 Thu, 02 Feb 2023 02:12:46 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4c49000000b002bfb7c2430bsm19387797wrt.19.2023.02.02.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:12:46 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org,  Hanna Reitz <hreitz@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Eric Blake <eblake@redhat.com>,  Michael Tokarev
 <mjt@tls.msk.ru>,  Fam Zheng <fam@euphon.net>,  David Hildenbrand
 <david@redhat.com>,  Alex Williamson <alex.williamson@redhat.com>,  John
 Snow <jsnow@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,  Eric Farman
 <farman@linux.ibm.com>,  qemu-s390x@nongnu.org,  Kevin Wolf
 <kwolf@redhat.com>,  qemu-block@nongnu.org,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Laurent Vivier <lvivier@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Mathieu Poirier
 <mathieu.poirier@linaro.org>,  Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  Klaus
 Jensen <its@irrelevant.dk>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  Laurent Vivier <laurent@vivier.eu>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Keith Busch <kbusch@kernel.org>,  Thomas Huth
 <huth@tuxfamily.org>,  Song Gao <gaosong@loongson.cn>,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org,  virtio-fs@redhat.com
Subject: Re: [PATCH v3] migration: Remove res_compatible parameter
In-Reply-To: <f37db85a-b0aa-b34a-7d5a-b1ab650f1683@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 31 Jan 2023 11:33:22 +0300")
References: <20230130080608.2100-1-quintela@redhat.com>
 <f37db85a-b0aa-b34a-7d5a-b1ab650f1683@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:12:45 +0100
Message-ID: <87v8kktlya.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 1/30/23 11:06, Juan Quintela wrote:
>> It was only used for RAM, and in that case, it means that this amount
>> of data was sent for memory.  Just delete the field in all callers.
>
> Could you describe, why it's safe to change the behavior for RAM?

I will start for the change in migration.c

-    uint64_t pend_pre, pend_compat, pend_post;
+    uint64_t pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(&pend_pre, &pend_compat, &pend_post);
-    uint64_t pending_size = pend_pre + pend_compat + pend_post;

Here we add the three to pending_size, so it don't matter.

+    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
+    uint64_t pending_size = pend_pre + pend_post;
 
-    trace_migrate_pending_estimate(pending_size,
-                                   pend_pre, pend_compat, pend_post);
+    trace_migrate_pending_estimate(pending_size, pend_pre, pend_post);

Trace, we don't care again.

-    if (pend_pre + pend_compat <= s->threshold_size) {

We do the test on pend_pre + pend_compat.
So, the only place where we are using pend_compat alone is on trace
messages.

I guess we can agree that changing trace messages don't matter.


-        qemu_savevm_state_pending_exact(&pend_pre, &pend_compat, &pend_post);
-        pending_size = pend_pre + pend_compat + pend_post;
-        trace_migrate_pending_exact(pending_size,
-                                    pend_pre, pend_compat, pend_post);
+    if (pend_pre <= s->threshold_size) {
+        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
+        pending_size = pend_pre + pend_post;
+        trace_migrate_pending_exact(pending_size, pend_pre, pend_post);


Ok, Now go to ram.c changes:

The only change that we do is that if we are on postcopy, we add the

@@ -3448,9 +3444,9 @@ static void ram_state_pending_exact(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_compatible += remaining_size;
+        *res_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *res_precopy += remaining_size;
     }
 }

The only use of res_compatible was when we were on postocpy, nothing
else sets it.

But when we are on postcopy, we can send that pages trough postcopy, so
we add them there and if we are on precopy, res_compatible was already zero.

So I think that is ok, i.e. no behaviour change.

What do you think?

> Also, I think it would be a lot better to split the change for RAM
> (s/res_compatible/res_postcopy) in one patch, and then drop the
> totally unused res_compatible file in the second patch

Ok, will do for next version.

Later, Juan.


