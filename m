Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E075BA195
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 21:48:05 +0200 (CEST)
Received: from localhost ([::1]:46118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYuqA-0004gv-Uz
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 15:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oYumr-0002y4-FN
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 15:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oYumn-0001Fe-NJ
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 15:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663271070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+jjdmky72/WZS8k2muEsEvG3U8Wlav1aAqg6XbQlnw=;
 b=a5nklnyHUxiSnjpp2Lp9y6UPt4K6u1M5GTrQUJ4YkTdoChfkcUpUSHWwwMolNWlkZLNlg0
 mEBquurt0V/VyNWkmfCpqSPs2HsV8ze9AALEPoj4mrLoiMLxOFT9R94eP4Um5/ioz83Byg
 k/x7gmGodzV0lUWxpkp3OugGHwsVwcc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-B-MDNqKqO4Chi2eP5IIdcg-1; Thu, 15 Sep 2022 15:44:28 -0400
X-MC-Unique: B-MDNqKqO4Chi2eP5IIdcg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bm38-20020a05620a19a600b006ce9b8892b8so4100839qkb.17
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 12:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=p+jjdmky72/WZS8k2muEsEvG3U8Wlav1aAqg6XbQlnw=;
 b=GnDH37qo4p3fR2KCCH1VhILS5AyhyKbw4lbw14SYPUI9RTHO5nZst0Mngt5ur+8Ns4
 qImpgInBxFEN/bleDNOmYQHg+jmv+NuaijIvCWuv4wsRRfJN6njURXMKuLnNP4OEWj3M
 kvldiFQn6g/6fu9gU56iA2Bfm8bIa1bcM2/V5EMllTDZKwuahfEdRTaK44gR6YhbjLB0
 B+KKkjaQ3uMv3/UmKuMUwbXkzp6dOpw4Lzl/q0KhkRhn/HC6L0mhDDk3uLUgY9/b4qmY
 uJPOt7Jn1385HMhgRiQZmGv7N7yNpnmqRnh8e64pJ8G8lF5YDDoMHha7/Ee8g66C2iCD
 pAAA==
X-Gm-Message-State: ACrzQf1jlKbCj2mLaxVRkPYal4mmkc1N8Nz19nke+ZdGR58hhVYkUf3B
 Aa6d80hGH2nTiKm7375F9gqDoeAnZuSbHpMjC2YPBCIr2ENTZUOQxGEwrXn6FVc0UdxqTTSY+4v
 4iJDkv2GDw8mwdok=
X-Received: by 2002:a05:620a:d8c:b0:6a7:91a2:c827 with SMTP id
 q12-20020a05620a0d8c00b006a791a2c827mr1349357qkl.407.1663271068338; 
 Thu, 15 Sep 2022 12:44:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67rgxC8oNfKwmhN3PReqmo1poO+T01h4i6VzNfAbbIZkKrj0m9FIW4CBYY0NkzoCtvt59jQA==
X-Received: by 2002:a05:620a:d8c:b0:6a7:91a2:c827 with SMTP id
 q12-20020a05620a0d8c00b006a791a2c827mr1349341qkl.407.1663271068116; 
 Thu, 15 Sep 2022 12:44:28 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-182.dsl.bell.ca. [70.27.3.182])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05620a40ca00b006c91ca45b1bsm4830254qko.55.2022.09.15.12.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 12:44:27 -0700 (PDT)
Date: Thu, 15 Sep 2022 15:44:26 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 01/13] migration: Use non-atomic ops for clear log
 bitmap
Message-ID: <YyOAmtQ0s+t0sJfx@xz-m1.local>
References: <20220829165659.96046-1-peterx@redhat.com>
 <20220829165659.96046-2-peterx@redhat.com>
 <YyNz1Z2etCS/NtlT@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyNz1Z2etCS/NtlT@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 07:49:57PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Since we already have bitmap_mutex to protect either the dirty bitmap or
> > the clear log bitmap, we don't need atomic operations to set/clear/test on
> > the clear log bitmap.  Switching all ops from atomic to non-atomic
> > versions, meanwhile touch up the comments to show which lock is in charge.
> > 
> > Introduced non-atomic version of bitmap_test_and_clear_atomic(), mostly the
> > same as the atomic version but simplified a few places, e.g. dropped the
> > "old_bits" variable, and also the explicit memory barriers.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Can you update the comment in ramblock.h above clear_bmap to say it's
> always updated under that lock.

I'll squash below into the same patch:

---8<---
diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 6cbedf9e0c..adc03df59c 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -53,6 +53,9 @@ struct RAMBlock {
      * and split clearing of dirty bitmap on the remote node (e.g.,
      * KVM).  The bitmap will be set only when doing global sync.
      *
+     * It is only used during src side of ram migration, and it is
+     * protected by the global ram_state.bitmap_mutex.
+     *
      * NOTE: this bitmap is different comparing to the other bitmaps
      * in that one bit can represent multiple guest pages (which is
      * decided by the `clear_bmap_shift' variable below).  On
---8<---

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


